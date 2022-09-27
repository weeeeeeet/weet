package com.weet.app.user.controller;

import java.util.Date;
import java.util.Objects;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import com.weet.app.exception.ControllerException;
import com.weet.app.exception.ServiceException;
import com.weet.app.user.domain.LoginDTO;
import com.weet.app.user.domain.TrainerDTO;
import com.weet.app.user.domain.TrainerVO;
import com.weet.app.user.domain.UserDTO;
import com.weet.app.user.domain.UserVO;
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
	public void loginPost(
			/* @ModelAttribute("loginDTO") */ LoginDTO dto,
			Model model,
			HttpSession session ) throws Exception {
		
		log.debug("loginPost(dto, model) invoked.");
		
		log.info("\t+ dto: " + dto);
		
		Objects.requireNonNull(this.service);
		log.info("\t+ service: " + this.service);
		
		// 1. To check the user.
		TrainerVO trainer = this.service.login(dto);	// To check the user.
		
		if(trainer != null) {							// if the check succeeded.
			model.addAttribute(loginKey, trainer);		// To bind login attribute to the request scope.
			
			// 2. If rememberMe on, process Remember-Me option.
			if(dto.isRememberMe()) {
				int timeAmount = 1000 * 60 * 60 * 24 * 7;	// 7 days.
				
				String userId = dto.getUserId();
				String rememberMe = session.getId();
				Date rememberAge = new Date(System.currentTimeMillis() + timeAmount);
				
				this.service.modifyUserWithRememberMe(userId, rememberMe, rememberAge);
			} // if
			
		} // if
		
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
	@ResponseStatus(HttpStatus.OK)
	@GetMapping("/logout")
	public String logout(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws Exception {
		log.debug("logout(req, res, session) invoked.");
		
		// 1. To get login info from http session.
		UserVO user = (UserVO) session.getAttribute(loginKey);
		log.info("\t+ user: " + user);
		
		// 2. To destroy current http session.
		session.invalidate();
		log.info("\t+ session destroyed("+session.getId()+")");
		
		// 3. To destroy Remember-Me cookie.
		Cookie destroyRememberMeCookie = WebUtils.getCookie(req, rememberMeKey);
			if(destroyRememberMeCookie != null) {
			destroyRememberMeCookie.setPath("/");
			destroyRememberMeCookie.setMaxAge(0);
			
			res.addCookie(destroyRememberMeCookie);
		} // if
		
		// 4. To update tbl_user.
		if(user != null) {
			String userId = user.getUserId();
			
			this.service.modifyUserWithRememberMe(userId, null, null);
		} // if
		
		// 5. To redirect into the login form.
		return "redirect:/user/login";
	} // logout

}