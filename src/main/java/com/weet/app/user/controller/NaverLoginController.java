package com.weet.app.user.controller;

import java.math.BigInteger;
import java.security.SecureRandom;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.reactive.function.client.WebClient;

import com.weet.app.common.SharedScopeKeys;
import com.weet.app.exception.ControllerException;
import com.weet.app.user.domain.MemberVO;
import com.weet.app.user.domain.UserDTO;
import com.weet.app.user.service.UserService;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@RequestMapping("/api/naver")
@Controller
public class NaverLoginController {
	
	private static final String CLIENT_ID = "PLyelPT7z3J8x6YB1Vx6";		//애플리케이션 클라이언트 아이디값"
	private static final String CLIENT_SECRET = "cgBejgC5EG";		//애플리케이션 클라이언트 아이디값"
	
	@Setter(onMethod_= @Autowired)
	private UserService userService;
	
	// 인가코드 받기	
	@GetMapping("/oauth")
	public String naverLogin() throws ControllerException {
		log.trace("naverLogin() invoked.");
		
		SecureRandom random = new SecureRandom();
		String state = new BigInteger(130, random).toString();
		
		String apiURL = new StringBuffer()
				.append("https://nid.naver.com/oauth2.0/authorize?response_type=code")
				.append("&client_id=")
				.append(CLIENT_ID)
				.append("&redirect_uri=http://localhost:8080/api/naver/callback")
				.append("&state=")
				.append(state)
				.toString();
		
		return "redirect:" + apiURL;
	} // naverLogin
	
	//네이버 로그인 성공시 callback호출 메소드
	@GetMapping("/callback")
	public String naverLoginCallback(
		@RequestParam String code, 
		@RequestParam String state, 
		HttpSession session) throws Exception {
		
		log.trace("naverLoginCallback({}, {}) invoked.", code, state);
		
		WebClient webClient = WebClient.builder()
			.baseUrl("https://nid.naver.com")
			.defaultHeader(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE)
			.build();
		
		JSONObject response = webClient.post()
			.uri(uriBuilder -> uriBuilder
				.path("/oauth2.0/token")
				.queryParam("client_id", CLIENT_ID)
				.queryParam("client_secret", CLIENT_SECRET)
				.queryParam("grant_type", "authorization_code")
				.queryParam("state", state)
				.queryParam("code", code)
				.build())
			.retrieve().bodyToMono(JSONObject.class).block();
		
		String token = (String) response.get("access_token");
		
		Map<String, String> res =  getUserProfile(token);
		
		// 회원정보 세팅
		UserDTO userDTO = new UserDTO();
		
		userDTO.setUserEmail(res.get("email"));
		userDTO.setUserId(res.get("id"));
		userDTO.setUserName(res.get("name"));
		userDTO.setUserNickname(res.get("nickname"));
		userDTO.setUserPhone(res.get("mobile").replaceAll("-", ""));
		userDTO.setUserProfile(res.get("profile_image"));
		userDTO.setUserType('N');
		userDTO.setUserReceiveEmailAgmtYN('N');
		userDTO.setUserReceiveSMSAgmtYN('N');
		userDTO.setUserSvcPCYAgmtYN('Y');
		userDTO.setUserSvcUseAgmtYN('Y');
		
		// 제공성별에 따라 dtogender세팅 F : 여성, M: 남성, U: 확인불가(여성으로처리)
		if(res.get("gender") == "M") userDTO.setUserGender('M');
		else userDTO.setUserGender('W');
		
		MemberVO memverVO = new MemberVO();
		memverVO.setUserId(res.get("id"));	// 아이디
		memverVO.setUserIdToken(token);		// 토큰
		memverVO.setUserPlatform("N");		// 플랫폼(N : 네이버)
		
		log.info("\t 세팅된 유저 DTO: {}, {}", userDTO, memverVO);
		
		// DB에 없으면 등록, 있으면 토큰 업데이트
		if( this.userService.idCheck(userDTO.getUserId()) == 0 ) {
			this.userService.userJoin(userDTO, memverVO);
		} else {
			this.userService.userTokenUpdate(memverVO);
		} // if-else
		
		// 세션 scope에 등록
		session.setAttribute(SharedScopeKeys.LOGIN_KEY, userDTO);
		
		return "redirect:/";
	} // naverLoginCallback
	
	// 사용자 프로필정보 조회
	@SuppressWarnings("unchecked")
	public Map<String, String> getUserProfile(String token) {
		
		WebClient webClient = WebClient.builder()
				.baseUrl("https://openapi.naver.com")
				.defaultHeader(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE)
				.build();
		
		JSONObject response = webClient.get()
				.uri(uriBuilder -> uriBuilder
						.path("/v1/nid/me")
						.build())
				.header("Authorization", "Bearer " + token)
				.retrieve()
				.bodyToMono(JSONObject.class).block();
		
		return (Map<String, String>) response.get("response");
	} // getUserProfile

} // end class
