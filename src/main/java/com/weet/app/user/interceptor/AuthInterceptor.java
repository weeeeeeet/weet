package com.weet.app.user.interceptor;

import java.util.Objects;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.weet.app.user.domain.TrainerVO;
import com.weet.app.user.service.UserService;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

@Component("authInterceptor")
public class AuthInterceptor implements HandlerInterceptor {
	
	private static final String loginKey = "__LOGIN__";
	
	private static final String requestURIKey = "__REQUEST_URI__";		// Original destination key
	private static final String queryStringKey = "__QUERYSTRING__";		// Original query string key
	private static final String rememberMeKey = "__REMEMBER_ME__";		// Original Remember-Me Cookie name
	
	
	@Setter(onMethod_= {@Autowired})
	private UserService service;
	
	
	
	// 뒤의 컨트롤러의 메소드가 호출되기 전에 수행.
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler) throws Exception {
		log.debug("=============================================================");
		log.debug("1. preHandle(req, res, handler) invoked.");
		log.debug("=============================================================");
		
		// 현재 이 요청을 보낸 브라우저가 인증된 상태인지 체크 수행.
		HttpSession session = req.getSession();
		TrainerVO trainer = (TrainerVO) session.getAttribute(loginKey);
		
		if(trainer == null) {	// NOT logged in.
			log.info("& Current browser is ** NOT ** authenticated...");

			//----------------------------------------------------------//
			// 1. To save original request URI and query string.
			//----------------------------------------------------------//
			this.saveDestination(req);
			log.info("\t+ Saved Original Request URI And Query String.");

			//----------------------------------------------------------//
			// 2. To authenticate through Remember-Me option.
			//----------------------------------------------------------//
			Objects.requireNonNull(this.service);
			log.info("\t+ service: " + this.service);
			
			Cookie rememberMeCookie = WebUtils.getCookie(req, rememberMeKey);
			log.info("\t+ rememberMeCookie: " + rememberMeCookie);
			
			if(rememberMeCookie != null) {	// If Rememebr-Me Cookie exists, ....
				String rememberMe = rememberMeCookie.getValue();
				log.info("\t+ rememberMe: " + rememberMe);
				
				trainer = this.service.findUserByRememberMe(rememberMe);
				log.info("\t+ trainer: " + trainer);
				
				if(trainer != null) {
					session.setAttribute(loginKey, trainer);
					
					return true;
				} // inner-if
			} // outer-if

			//----------------------------------------------------------//
			// 3. To redirect to login form (/user/login).
			//----------------------------------------------------------//
			res.sendRedirect("/user/tr/login");
			log.info("\t+ Move to /user/tr/login");
			
			return false;		// *** //
		} // if - NOT logged in.

		// If logged In.
		log.info("& Current browser ** ALREADY ** authenticated...");
		log.info("\t+ trainer: " + trainer);
		
		return true;
	} // preHandle
	
	
	private void saveDestination(HttpServletRequest req) {
		log.debug("saveDestination(req) invoked.");
		
		String uri = req.getRequestURI();
		String queryString = req.getQueryString();
		
		HttpSession session = req.getSession();
		
		session.setAttribute(requestURIKey, uri);
		session.setAttribute(queryStringKey, queryString);
	} // saveDestination
	

	// 뒤의 컨트롤러 메소드 호출이 완료된 후, 그리고 View 가 호출되기 전에 수행.
	// 단, 컨트롤러 메소드 수행에서 예외가 발생되지 말아야 함.
	//    컨트롤러 메소드 수행에서 에외가 발생되면, 이 메소드는 수행되지 않음.
	@Override
	public void postHandle(HttpServletRequest req, HttpServletResponse res, Object handler, ModelAndView modelAndView) throws Exception {
		log.debug("=============================================================");
		log.debug("2. postHandle(req, res, handler, modelAndView) invoked.");
		log.debug("=============================================================");

		
	} // postHandle
	

	// 뒤의 컨트롤러 메소드 수행시, 예외의 발생여부와 상관없이, View 까지 호출된 후에 수행.
	@Override
	public void afterCompletion(HttpServletRequest req, HttpServletResponse res, Object handler, Exception e) throws Exception {
		log.debug("=============================================================");
		log.debug("3. afterCompletion(req, res, handler, e) invoked.");
		log.debug("=============================================================");
		

	} // afterCompletion

} // end class
