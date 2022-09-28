package com.weet.app.user.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.weet.app.exception.ControllerException;
import com.weet.app.user.domain.TrainerDTO;
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
	
	// 아이디 찾기 창
	@GetMapping("/id")
	public String findIdPage() {
		log.trace("findIdPage() invoked.");
		
		return "/user/findId1";
	} // findIdPage	
	
	
	// 아이디 찾기 
	@PostMapping("/id")
	public String findId(String userName, String userPhone, RedirectAttributes rttrs) throws ControllerException {
		log.trace("findId({},{},{}) invoked.", userName, userPhone, rttrs);
		
		try {

			UserVO vo = this.findservice.findId(userName, userPhone);
			log.info("\t + vo: {}", vo);

			rttrs.addAttribute("_USERID_", vo.getUserId());
			rttrs.addAttribute("_USERJOINTS_", vo.getUserJoinTs());

		} catch(Exception e) {
			throw new ControllerException(e);
		}
		return "redirect:/user/find/findingid";

	} // findId
	
	// 아이디 확인
	@GetMapping("/findingid")
	public String findingIdPage() {
		log.trace("findIdCheckPage() invoked.");
			
		return "/user/findId2";
	} // findIdCheckPage
	
	// 비밀번호 찾기 창
	@GetMapping("/pwd")
	public String findPwdPage() {
		log.trace("findPwdPage() invoked.");
		
		return "/user/findPwd1";
	} // findPwdPage
	
	// 비밀번호 찾기(정보입력)
	@PostMapping("/pwd")
	public String findPwd(TrainerDTO trainerDTO, RedirectAttributes rttrs) {
		log.trace("findPwd({}, {}) invoked.", trainerDTO, rttrs);
		
		return "redirect:/user/find/pwdch";
	} // findPwd
		
	// 비밀번호 찾기 창(비밀번호변경)
	@GetMapping("/pwdch")
	public String findPwdChangePage(Model model) {
		log.trace("findPwdChangePage() invoked.");
		
		return "/user/findPwd2";
	} // findPwdChangePage
	
	// 비밀번호 찾기(비밀번호변경)
	@PostMapping("/pwdch")
	public String findPwdChange(Model model) {
		log.trace("findPwdChange() invoked.");
		
		return "redirect:/user/find/pwddone";
	} // findPwdChange

	// 비밀번호 찾기 완료
	@GetMapping("/pwddone")
	public String findPwdDone() {
		log.trace("findPwdDone() invoked.");
		
		return "/user/findPwd3";
	} // findPwdDone
}
