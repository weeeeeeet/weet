package com.weet.app.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.weet.app.common.SharedScopeKeys;
import com.weet.app.user.service.UserService;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@RequestMapping("/api/kakao")
@Controller
public class KakaoLoginController {
	
	
	@Setter(onMethod_= @Autowired)
	private UserService userService;
	
	// 카카오 로그인 - 인가코드받기
	@GetMapping("/oauth")
	public String kakaoCallback(
			@RequestParam String code, 
			HttpSession session) throws Exception {

        String access_Token = userService.getKaKaoAccessToken(code);
        log.info("\t + access_Token:{}",access_Token);

        session.setAttribute(SharedScopeKeys.LOGIN_KEY, this.userService.getUserInfo(access_Token));
        
		return "redirect:/ ";
	} // kakaoCallback

} // end class
