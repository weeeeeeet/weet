package com.weet.app.user.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.weet.app.exception.ControllerException;
import com.weet.app.user.service.AuthService;

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
	public String sendSMS(@RequestParam("user_phone") String userPhone) throws ControllerException { // 휴대폰 문자보내기
		int randomNumber = (int)((Math.random()* (9999 - 1000 + 1)) + 1000);//난수 생성
		log.info("\t + randomNumber:{}",randomNumber);

		try {
			service.certifiedPhoneNumber(userPhone,randomNumber);
		} catch(Exception e) {
			throw new ControllerException(e);
		} // try-catch
		
		return Integer.toString(randomNumber);
	} // sendSMS
	
	
//	 2. 카카오 로그인 - 인가코드받기
	@GetMapping("/kakao")
	public String kakaoCallback(@RequestParam String code, HttpServletRequest req) throws Exception {
		
//		HttpSession session = req.getSession();

        String access_Token = service.getKaKaoAccessToken(code);
        log.info("\t + access_Token:{}",access_Token);

        HashMap<String, Object> userInfo = service.getUserInfo(access_Token);
        log.info("\t+ access_Token : {}" + access_Token);
        log.info("\t+ userInfo : {}", userInfo.get("email"));
        log.info("\t+ nickname : {}", userInfo.get("nickname"));
        log.info("\t+ profile_image : {}", userInfo.get("profile_image"));
        log.info("\t+ name : {}", userInfo.get("name"));
        log.info("\t+ gender : {}", userInfo.get("gender"));
        log.info("\t+ phone : {}", userInfo.get("phone"));

		return "redirect:/user/tr/joindone";

	} // kakaoCallback

	@PostMapping("/kakaologin")
	public String kakaoLog() {
		log.trace("kakaoLog() invoked.");
		
		return "redirect:..api/";
	} // kakaoLog
	
	// 5. 구글 로그인
	@PostMapping("/googlelogin")
	public String googleLog() {
		log.trace("googleLog() invoked.");
		
		return "redirect:..api/";
	} // googleLog
}