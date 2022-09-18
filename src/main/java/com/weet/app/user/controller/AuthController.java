package com.weet.app.user.controller;

import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.weet.app.exception.ServiceException;
import com.weet.app.user.service.AuthService;

import lombok.Cleanup;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@RequestMapping("/auth")
@Controller
public class AuthController {


	@Setter(onMethod_= {@Autowired})
	private AuthService service;
	
	// 1. 본인 인증
	@GetMapping("/phoneCheck")
	@ResponseBody
	public String sendSMS(@RequestParam("user_phone") String userPhone) { // 휴대폰 문자보내기
		int randomNumber = (int)((Math.random()* (9999 - 1000 + 1)) + 1000);//난수 생성
		log.info("\t + randomNumber:{}",randomNumber);
		
		try {
			service.certifiedPhoneNumber(userPhone,randomNumber);
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		
		return Integer.toString(randomNumber);
	}

	// 2. 사업자 인증
	@PostMapping("/business")
	public String business() {
		log.trace("business() invoked.");

		return "redirect:..api/";
		
	} // business

	// 3. 카카오 로그인
//	@ResponseBody
//	@GetMapping("/kakao")
//	public BaseResponse<PostLoginRes> kakaoLogin(@RequestParam(required = false) String code) {
//	    try {
//	        // URL에 포함된 code를 이용하여 액세스 토큰 발급
//	        String accessToken = loginService.getKakaoAccessToken(code);
//	        System.out.println(accessToken);
//
//	        // 액세스 토큰을 이용하여 카카오 서버에서 유저 정보(닉네임, 이메일) 받아오기
//	        HashMap<String, Object> userInfo = loginService.getUserInfo(accessToken);
//	        System.out.println("login Controller : " + userInfo);
//
//	        PostLoginRes postLoginRes = null;
//
//	        // 만일, DB에 해당 email을 가지는 유저가 없으면 회원가입 시키고 유저 식별자와 JWT 반환
//	        // 현재 카카오 유저의 전화번호를 받아올 권한이 없어서 테스트를 하지 못함.
//	        if(loginProvider.checkEmail(String.valueOf(userInfo.get("email"))) == 0) {
//	            //PostLoginRes postLoginRes = 해당 서비스;
//	            return new BaseResponse<>(postLoginRes);
//	        } else {
//	            // 아니면 기존 유저의 로그인으로 판단하고 유저 식별자와 JWT 반환
//	            postLoginRes = loginProvider.getUserInfo(String.valueOf(userInfo.get("email")));
//	            return new BaseResponse<>(postLoginRes);
//	        }
//	    } catch (BaseException exception) {
//	        return new BaseResponse<>((exception.getStatus()));
//	    }
//	}
	
	
	@PostMapping("/kakaologin")
	public String kakaoLog() {
		log.trace("kakaoLog() invoked.");
		
		return "redirect:..api/";
	} // kakaoLog

	// 4. 네이버 로그인
//	@GetMapping("/naver")
//	public ModelAndView logion(String code,HttpServletRequest request)throws Exception{
//		HttpSession session = request.getSession();
//		
//		RestTemplate restTemplate = new RestTemplate();
//		ObjectMapper mapper = new ObjectMapper();
//		
//		//Access Token받기
//		HttpHeaders headersAccess = new HttpHeaders();
//		headersAccess.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
//		
//		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
//		params.add("grant_type", "authorization_code");
//		params.add("client_id","발급받은 REST API 키");
//		params.add("redirect_uri","리다이렉트할 url");
//		params.add("code", code);
//		
//		HttpEntity<MultiValueMap<String, String>> kakaoRequest = new HttpEntity<>(params, headersAccess);
//		
//		ResponseEntity<String> response = restTemplate.exchange("https://kauth.kakao.com/oauth/token"
//		, HttpMethod.POST, kakaoRequest, String.class);
//		NaverLoginVO naverVO = mapper.readValue(response.getBody(), NaverLoginVO.class);
//		
//		//사용자정보 가져오기
//		HttpHeaders headersInfo = new HttpHeaders();
//		headersInfo.add("Authorization", "Bearer " + naverVO.getAccess_token());
//		headersInfo.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
//		
//		HttpEntity<HttpHeaders> kakaoInfo = new HttpEntity<>(headersInfo);
//		
//		ResponseEntity<String> infoResponse = restTemplate.exchange("https://kapi.kakao.com/v2/user/me", 
//				HttpMethod.POST, kakaoInfo , String.class);
//		NaverInfoVO infoVO = mapper.readValue(infoResponse.getBody(), NaverInfoVO.class);
//		String nickname = String.valueOf(infoVO.getProperties().get("nickname"));
//		String id = String.valueOf(infoVO.getId());
//		
//		Member member = new Member();
//		member.setId(id);
//		if(memberService.idCheck(member) == 0) {
//			member.setName(nickname);
//			memberService.joinInsert(member);
//			Member login = memberService.naverLogin(member);
//			session.setAttribute("member", login);
//		}else {
//			Member login = memberService.naverLogin(member);
//			session.setAttribute("member", login);
//		}
//		
//		ModelAndView modelAndView = new ModelAndView();
//		modelAndView.setViewName("redirect:/social/social-view");
//		return modelAndView;
//		
//	}
	@PostMapping("/naverlogin")
	public String naverLog() {
		log.trace("naverLog() invoked.");
		
		return "redirect:/https://nid.naver.com/oauth2.0/authorize";
	} // naverLog
	
	// 5. 구글 로그인
	@PostMapping("/googlelogin")
	public String googleLog() {
		log.trace("googleLog() invoked.");
		
		return "redirect:..api/";
	} // googleLog
}
