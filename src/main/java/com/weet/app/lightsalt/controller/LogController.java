package com.weet.app.lightsalt.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.weet.app.common.SharedScopeKeys;
import com.weet.app.exception.ControllerException;
import com.weet.app.user.domain.LoginDTO;
import com.weet.app.user.domain.UserVO;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@RequestMapping("/lightsalt/")
@Controller
public class LogController {

	// 1. Admin Login
	@GetMapping("/login")
	public String loginPage(LoginDTO loginVO, Model model, HttpServletRequest req) throws Exception {
		log.trace("login() invoked.");
		
		Map<String, ?> inputFlashMap = RequestContextUtils.getInputFlashMap(req);
		if(null != inputFlashMap) {
			model.addAttribute("msg",(String) inputFlashMap.get("msg"));
		}
		
		return "/lightsalt/adminLogin";
	} // login
	
	// 2. Admin Login 처리
//	@PostMapping("loginPost")
//	public String loginPost(LoginDTO dto, RedirectAttributes rttrs, Model model)
//		throws ControllerException {
//		log.trace("loginPost({}, {}) invoked.", dto, rttrs);
//		
//		try {
//			UserVO vo = this.service.login(dto);
//			log.info("\t+ vo: {}", vo);
//			
//			if(vo != null) {	// if sign-in succeed,				
//				// If redirected, model not transfered due to the 307 redirect response.
//				model.addAttribute(SharedScopeKeys.LOGIN_KEY, vo);
//				
//				return "user/loginPost";
//			} else {			// if sign-in failed,
//				// Request Scope Binding
//				rttrs.addFlashAttribute(SharedScopeKeys.RESULT_KEY, "Login Failed");
//				
//				return "redirect:/user/login";
//			} // if-else
//		} catch(Exception e) {
//			throw new ControllerException(e);
//		} // try-catch
//	} // loginPost


	// 2. Admin Logout
	@GetMapping("/logout")
	public String logout() {
		log.trace("Logout() invoked.");
		
		return "redirect:/lightsalt/adminLogin";
	} // returnString

	
	// 3. Admin dashboard
	@GetMapping("/dashboard")
	public String dashboard() {
		log.trace("dashboard() invoked.");
		
		return "/lightsalt/adminDash";
	} // dashboard	
}
