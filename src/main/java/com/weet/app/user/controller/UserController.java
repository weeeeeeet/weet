package com.weet.app.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.weet.app.common.SharedScopeKeys;
import com.weet.app.exception.ControllerException;
import com.weet.app.exception.ServiceException;
import com.weet.app.user.domain.LoginDTO;
import com.weet.app.user.domain.TrainerDTO;
import com.weet.app.user.domain.TrainerVO;
import com.weet.app.user.domain.UserDTO;
import com.weet.app.user.service.UserService;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

@RequestMapping("/user")
@Controller
public class UserController {

	private static final String loginKey = "__LOGIN__";
	private static final String rememberMeKey = "__REMEMBER_ME__";		// Original Remember-Me Cookie name

	
	@Setter(onMethod_= {@Autowired})
	private UserService service;
	
	// 1. user Login	
	@GetMapping("/login")
	public String loginPage() {
		log.trace("loginPage() invoked.");
		
		return "/user/login";
	} // loginPage

	// 2. TR 로그인화면
	@GetMapping("/tr/login")
	public String trainerLoginPage() {
		log.trace("trainerLoginPage() invoked.");
		
		return "/user/loginTr";
	} // trainerLoginPage

	
	// 3. TR 로그인처리
	@PostMapping("/loginPost")
	public String loginPost(LoginDTO dto, RedirectAttributes rttrs, Model model)
			throws ControllerException {

		log.trace("loginPost({}, {}) invoked.", dto, rttrs);
		
		try {
			TrainerVO vo = this.service.login(dto);
			log.info("\t+ vo: {}", vo);
			
			if(vo != null) {	// if sign-in succeed,				
				// If redirected, model not transfered due to the 307 redirect response.
				model.addAttribute(SharedScopeKeys.LOGIN_KEY, vo);
				
				return "user/loginPost";
			} else {			// if sign-in failed,
				// Request Scope Binding
				rttrs.addFlashAttribute(SharedScopeKeys.RESULT_KEY, "Login Failed");
				
				return "redirect:/user/login";
			} // if-else
		} catch(Exception e) {
			throw new ControllerException(e);
		} // try-catch
	} // loginPost

		
	
	// 4. TR 회원가입 화면
	@GetMapping("/tr/join")
	public String trainerJoinPage() {
		log.trace("trainerJoinPage() invoked.");
		
		return "/user/join";
	} // trainerJoinPage

	
	
	// TR 회원가입 처리 -> DB 등록 후 완료 view로 redirect
	@PostMapping("/tr/join")
	public String trainerJoin(
			UserDTO userDTO, TrainerDTO trainerDTO, 
			RedirectAttributes rttrs
			) throws ControllerException {
		
		log.trace("trainerLogin({},{}) invoked.",userDTO, trainerDTO);
		
		try {
			if(this.service.trJoin(userDTO, trainerDTO)) {
				rttrs.addFlashAttribute("_RESULT_", "SUCCEED");	
			} else {
				rttrs.addFlashAttribute("_RESULT_", "FAILED");	
			}
			return "redirect:/user/tr/joindone";
		} catch(Exception e) {
			throw new ControllerException(e);
		}
		
	} // trainerLogin
	
	
	// 회원가입 아이디 중복확인
	@PostMapping(path="/tr/idCheck",
			produces= {MediaType.APPLICATION_JSON_VALUE+"; charset=utf8"})
	@ResponseBody
	public int idCheck(@RequestParam("user_id") String id) throws ControllerException {
		
		Integer cnt = null;
		try {
			cnt = service.idCheck(id);
			return cnt;
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		return cnt;
		
	}

	
	
	// TR 회원가입 완료
	@GetMapping("/tr/joindone")
	public String trainerJoinDonePage() {
		log.trace("trainerJoinDonePage() invoked.");
			
		return "/user/joinDone";
	} // trainerJoinPage	

	
	
	// 아이디 중복체크
	@PostMapping("/checkid")
	public String checkId() {
		log.trace("trainerJoinPage() invoked.");
		
		return "redirect:/user/tr/checkid";
	} // checkId	

	
	
	// Logout 처리 - 목적: LogoutInterceptor를 설정하기 위한 용도로만 사용될 뿐, 진짜 호출되지는 못한다!!
	// 실제 로그아웃을 위한 모든 처리는 LogoutInterceptor에서 처리 (***)
	@GetMapping("/logout")
	public void logout() throws ControllerException {
		log.trace("logout(req, res, session) invoked.");
	} // logout

}

