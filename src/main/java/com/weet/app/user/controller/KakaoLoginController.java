package com.weet.app.user.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String kakaoCallback(@RequestParam String code, HttpServletRequest req) throws Exception {
		
//		HttpSession session = req.getSession();

        String access_Token = userService.getKaKaoAccessToken(code);
        log.info("\t + access_Token:{}",access_Token);

        HashMap<String, Object> userInfo = userService.getUserInfo(access_Token);
        log.info("\t+ access_Token : {}" + access_Token);
        log.info("\t+ userInfo : {}", userInfo.get("email"));
        log.info("\t+ nickname : {}", userInfo.get("nickname"));
        log.info("\t+ profile_image : {}", userInfo.get("profile_image"));
        log.info("\t+ name : {}", userInfo.get("name"));
        log.info("\t+ gender : {}", userInfo.get("gender"));
        log.info("\t+ phone : {}", userInfo.get("phone"));

		return "redirect:/ ";

	} // kakaoCallback

} // end class
