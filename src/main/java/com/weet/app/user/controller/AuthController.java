package com.weet.app.user.controller;

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
	
	
	// 5. 구글 로그인
	@PostMapping("/googlelogin")
	public String googleLog() {
		log.trace("googleLog() invoked.");
		
		return "redirect:..api/";
	} // googleLog
}