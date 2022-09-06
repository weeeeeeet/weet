package com.weet.app.user.controller;

import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.weet.app.user.controller.Constant.SocialLoginType;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@RequestMapping("/auth")
@Controller
public class AuthController {

	// 1. 본인 인증
	@PostMapping("/certification")
	public String identityVerification() {
		log.trace("identityVerification() invoked.");
		
		return "redirect:..api/";
	} // identityVerification	

	// 2. 사업자 인증
	@PostMapping("/business")
	public String business() {
		log.trace("business() invoked.");
		
		return "redirect:..api/";
	} // business

	// 3. 카카오 로그인
	@PostMapping("/kakaologin")
	public String kakaoLog() {
		log.trace("kakaoLog() invoked.");
		
		return "redirect:..api/";
	} // kakaoLog

	// 4. 네이버 로그인
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
