package com.weet.app.user.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.weet.app.exception.ControllerException;
import com.weet.app.user.domain.UserVO;
import com.weet.app.user.service.UserFindService;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@RequestMapping("/user/find")
@Controller
public class UserFindController {
	
	@Setter(onMethod_= {@Autowired})
	private UserFindService findservice;
	
	// 1. 아이디 찾기 창
	@GetMapping("/id")
	public String findIdPage() {
		log.trace("findIdPage() invoked.");
		
		return "/user/findId1";
	} // findIdPage	
	
	
	// 2. 아이디 찾기 
	@PostMapping("/id")
	@ResponseBody
	public String findId(String userId, String userPhone, Model model, RedirectAttributes rttrs) throws ControllerException {
		log.trace("findId() invoked.");
		
		try {
			
			UserVO vo = this.findservice.findId(userId, userPhone);
			log.info("\t + vo: {}", vo);
			
			model.addAttribute("_USER_", vo);
			
		} catch(Exception e) {
			throw new ControllerException(e);
		}
		return "redirect:/user/find/findId2";
		
	} // findId
	
	// 3. 아이디 확인
	@GetMapping("/findingid")
	public String findingIdPage() {
		log.trace("findIdCheckPage() invoked.");
			
		return "/user/findId2";
	} // findIdCheckPage
	
	// 4. 비밀번호 찾기 창
	@GetMapping("/pwd")
	public String findPwdPage() {
		log.trace("findPwdPage() invoked.");
		
		return "/user/findPwd1";
	} // findPwdPage
	
	// 5. 비밀번호 찾기(아이디입력)
	@PostMapping("/pwd")
	public String findPwd(Model model) {
		log.trace("findPwd() invoked.");
		
		return "/user/findPwd1";
	} // findPwd
	
	// 6. 비밀번호 찾기 창(번호인증)
	@GetMapping("/pwdmb")
	public String findPwdMobilePage(Model model) {
		log.trace("findPwdMobilePage() invoked.");
		
		return "/user/findPwd2";
	} // findPwdMobilePage	
	
	// 7. 비밀번호 찾기(번호인증)
	@PostMapping("/pwdmb")
	public String findPwdMobile(Model model) {
		log.trace("findPwdMobile() invoked.");
		
		return "/user/findPwd2";
	} // findPwdMobile	
		
	// 8. 비밀번호 찾기 창(비밀번호변경)
	@GetMapping("/pwdch")
	public String findPwdChangePage(Model model) {
		log.trace("findPwdChangePage() invoked.");
		
		return "/user/findPwd3";
	} // findPwdChangePage
	
	// 9. 비밀번호 찾기(비밀번호변경)
	@PostMapping("/pwdch")
	public String findPwdChange(Model model) {
		log.trace("findPwdChange() invoked.");
		
		return "redirect:/user/find/findPwd4";
	} // findPwdChange

	// 10. 비밀번호 찾기 완료
	@GetMapping("/pwddone")
	public String findPwdDone() {
		log.trace("findPwdDone() invoked.");
		
		return "/user/findPwd4";
	} // findPwdDone
}
