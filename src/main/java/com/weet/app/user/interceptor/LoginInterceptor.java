package com.weet.app.user.interceptor;


import java.sql.Timestamp;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.weet.app.common.SharedScopeKeys;
import com.weet.app.user.domain.TrainerVO;
import com.weet.app.user.service.UserService;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;



@Log4j2
@NoArgsConstructor

// Session Tracking 을 위한 Spring Interceptor
@Component
public class LoginInterceptor implements HandlerInterceptor {
	
	@Setter(onMethod_= {@Autowired})
	private UserService service;
		
	// Incoming Request 가 Controller's Handler Method로 위임되기 직전에 가로채는 부분
	// Session Scope 에 저장되어 있던 모든 정보 파괴 수행
	// (*주의*) 명시적으로 "로그아웃" 요청을 보내지 않는 한, 세션 자체를 파괴해서는 안됨
	// 뒤의 컨트롤러의 메소드가 호출되기 전에 수행.
	
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler) throws Exception {
		log.trace("================================================================");
		log.trace("1. preHandle(req, res, handler) invoked.");
		log.trace("================================================================");
		
		// 이전에 정상 로그인으로 인해서, Session Scope에 공유했었던 로그인 속성(여기서는 TrainerVO객체) 제거.
		// Step.1 Session Scope에 접근할 수 있는 HttpSession 객체 획득
		HttpSession session = req.getSession();
		log.info("\t+ Current Session: {}", session.getId());
		
		// Step.2 Session Scope에 TrainerVO 객체가 공유되어 있다면 삭제처리
		TrainerVO vo = (TrainerVO) session.getAttribute(SharedScopeKeys.USER_KEY);
		log.info("\t+ 2. TrainerVO: {}", vo);
		
		log.info("");
		
		if(vo != null) { // Session Scope에 UserVO 객체가 있다 => 이미 로그인 되어있는 상태
			session.removeAttribute(SharedScopeKeys.USER_KEY);
			log.info("\t+ Removed UserVO: {}", vo);
		} else {
			log.info("\t+ No UserVO found in the Session Scope.");
		} // if-else

		return true;
	} // preHandle
	
	
	// 컨트롤러 핸들러에서 예외가 발생하면, 아래 callback 메소드는 호출되지 않음 (***)
	@Override
	public void postHandle(HttpServletRequest req, HttpServletResponse res, Object handler, ModelAndView modelAndView) throws Exception {
		log.trace("================================================================");
		log.trace("2. postHandle(req, res, handler, {}) invoked.", modelAndView);
		log.trace("================================================================");
		
		// 매개변수인 ModelAndView 에, Model 상자 안에 UserVO객체가 있는지 확인해 보고(즉, 로그인 성공결과)
		// 있다면(로그인 성공했다면), 이 UserVO객체를 Session Scope에 로그인 성공증빙으로 올려 놓기로 하였다!!!

		// Step.1 ModelAndView 객체 안에, TrainerVO 가 있는지 확인
		ModelMap modelMap = modelAndView.getModelMap();
		TrainerVO trainerVO = (TrainerVO) modelMap.get(SharedScopeKeys.LOGIN_KEY);
		
		// Step.2 TrainerVO 가 있다면(로그인 성공했다면..), 
		//        Session Scope에 UserVO를 올려 놓자!!!(로그인 성공 증빙)
		if(trainerVO != null) {	// 로그인 성공했다면...
			HttpSession session = req.getSession();
	
			// =============================================================== //
			// (1) Session Scope 에 인증정보로 UserVO 객체 바인딩
			// =============================================================== //
			session.setAttribute(SharedScopeKeys.USER_KEY, trainerVO);
	
			// =============================================================== //
			// (2) ** 자동로그인(Remember-Me) 기능 구현 **
			// =============================================================== //			
			// Step.1 자동로그인(Remember-Me) 옵션의 on/off 여부 Check
			boolean isRememberMeOption = checkRememberMeOption(req);
			log.info("\t+ isRememberMeOption: {}", isRememberMeOption);
				
			if(isRememberMeOption) {	// 자동로그인 기능 on 해 놓았다면...				
				// Step.2 자동로그인 쿠키 생성
				// Response Message's Header(`Set-Cookie`)에 쿠키를 저장해서 보냄
				// 이때 쿠키값으로는 현재 브라우저의 이름인 세션ID를 저장하자!!
				// (*주의*) 세션ID는 GUID(or UUID) 이다!!!
				String sessionId = session.getId();
						
				// Step.3 쿠키의 유효기간(즉, 자동로그인 유효설정기간 의미) 설정
				final int maxAge = 1*60*60*24*7;	// in seconds
		
				Cookie rememberMeCookie = new Cookie(SharedScopeKeys.REMEMBER_ME_KEY, sessionId);				
				rememberMeCookie.setMaxAge(maxAge);	// 유효기간: 1주일
				rememberMeCookie.setPath("/");
	
				// Step.4 응답메시지의 `Set-Cookie` 헤더에 자동설정됨
				res.addCookie(rememberMeCookie);
	
				// Step.5 tbl_user 테이블에 자동로그인 쿠키정보 기록
				long currTime = System.currentTimeMillis();	// in milliseconds				
				long expireTime = currTime + (maxAge * 1000L);	// in milliseconds
	
				Timestamp expireTS = new Timestamp(expireTime);
	
				boolean isUpdated = this.service.modifyUserWithRememberMe(trainerVO.getUserId(), rememberMeCookie.getValue(), expireTS);
				log.info("\t+ isUpdated: {}", isUpdated);				
			} // if : 자동로그인 기능적용
		} // if : 로그인 성공했다면...
	} // postHandle
			
	private boolean checkRememberMeOption(HttpServletRequest req) {
		log.trace("checkRememberMeOption(req) invoked.");

		String rememberMe = req.getParameter("rememberMe");	// if on, return "on"
		log.info("\t+ rememberMe: {}", rememberMe);

		return rememberMe != null;
	} // checkRememberMeOption

} // end class
	
