package com.weet.app.user.interceptor;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.weet.app.user.domain.TrainerVO;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;



@Log4j2
@NoArgsConstructor

// Session Tracking 을 위한 Spring Interceptor
@Component
public class LoginInterceptor implements HandlerInterceptor {
	
	private static final String loginKey = "__LOGIN__";
	
	private static final String requestURIKey = "__REQUEST_URI__";		// Original destination key
	private static final String queryStringKey = "__QUERYSTRING__";		// Original query string key
	private static final String rememberMeKey = "__REMEMBER_ME__";		// Original Remember-Me Cookie name

	
	
	// Incoming Request 가 Controller's Handler Method로 위임되기 직전에 가로채는 부분
	// Session Scope 에 저장되어 있던 모든 정보 파괴 수행
	// (*주의*) 명시적으로 "로그아웃" 요청을 보내지 않는 한, 세션 자체를 파괴해서는 안됨
	// 뒤의 컨트롤러의 메소드가 호출되기 전에 수행.
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler) throws Exception {
		log.debug("=============================================================");
		log.debug("1. preHandle(req, res, handler) invoked.");
		log.debug("=============================================================");
		
		// 이전에 정상 로그인으로 인해서, Session Scope에 공유했었던 로그인 속성(여기서는 TrainerVO객체) 제거.
		HttpSession session = req.getSession();
		
		TrainerVO trainer = (TrainerVO) session.getAttribute(loginKey);
		log.info("\t+ user: " + trainer);
		
		if(trainer != null) {
			session.removeAttribute(loginKey);
			
			log.info("\t+ ** Removed The Previous Login Key **");
		} // if
		
		log.info("");
		
		return true;
	} // preHandle
	
	
	// 컨트롤러 핸들러에서 예외가 발생하면, 아래 callback 메소드는 호출되지 않음 (***)
	@Override
	public void postHandle(HttpServletRequest req, HttpServletResponse res, Object handler, ModelAndView modelAndView) throws Exception {
		log.trace("================================================================");
		log.trace("2. postHandle(req, res, handler, {}) invoked.", modelAndView);
		log.trace("================================================================");
		
		HttpSession session = req.getSession();
		
		ModelMap modelMap = modelAndView.getModelMap();
		TrainerVO trainer = (TrainerVO) modelMap.get(loginKey);
		
		if(trainer != null) {	// If login succeeded, ...
			log.info("** 로그인에 성공하였다면 ...");
			
			//-----------------------------------------------------//
			// 1. Session Scope 에 로그인한 정보로 UserVO 객체를 속성 바인딩
			//-----------------------------------------------------//
			session.setAttribute(loginKey, trainer);
			log.info("\t1. Session Scope에 로그인 정보(TrainerVO) 속성 바인딩 완료.");

			//-----------------------------------------------------//
			// 2. Remember-Me 처리
			//-----------------------------------------------------//
			String rememberMe = req.getParameter("rememberMe");
			
			if(rememberMe != null) {	// if Remember-Me on.
				log.info("\t2. if Remember-Me on, ....");
				
				// Remember-Me 용 쿠키 생성하여, 응답문서 헤더에 설정.
				String sessionId = session.getId();
				
				Cookie rememberMeCookie = new Cookie(rememberMeKey, sessionId);
				rememberMeCookie.setMaxAge(60*60*24*7);		// 1 Week
				rememberMeCookie.setPath("/");
				
				res.addCookie(rememberMeCookie);

				log.info("\t\t+ rememberMeCookie: " + rememberMeCookie);
				log.info("\t\t+ 응답문서 헤더에 rememberMe 쿠키설정 완료.");
			} // if

			//-----------------------------------------------------//
			// 3. 원래의 요청 URI 복구하여, 이 URI로 이동시킴
			//-----------------------------------------------------//
			
			// 3-1. 원래의 요청 URI가 있었다면, 그 URI로 이동시킴.
			// 3-2. 원래의 요청 URI가 없었다면, /메인페이지로 이동시킴
			
			String originalRequestURI = (String) session.getAttribute(requestURIKey);
			String originalQueryString = (String) session.getAttribute(queryStringKey);
					
			if(originalRequestURI != null) {
				res.sendRedirect(
					originalRequestURI+
					( (originalQueryString != null && !"".equals(originalQueryString))? "?"+originalQueryString : "" )
				);										// Redirect to original request page.
				
				log.info("\t3. 원래의 요청 URI로 이동시킴.");
			} else {
				res.sendRedirect("/");		// Redirect to / main page.
				
				log.info("\t4. /index 로 이동시킴.");
			} // if-else
			
			log.info("");
			
			return;
		} // if

		res.sendRedirect("/user/tr/login");			// Redirect to Login Form.
		
		log.info("** 로그인에 실패하였다면... 다시 로그인 창으로 이동시킴.");
		
		log.info("");
	} // postHandle
	

	// 뒤의 컨트롤러 메소드 수행시, 예외의 발생여부와 상관없이, View 까지 호출된 후에 수행.
	@Override
	public void afterCompletion(HttpServletRequest req, HttpServletResponse res, Object handler, Exception e) throws Exception {
		log.debug("=============================================================");
		log.debug("3. afterCompletion(req, res, handler, e) invoked.");
		log.debug("=============================================================");
		
		log.info("");

	} // afterCompletion
	

} // end class
