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
import com.weet.app.user.domain.UserVO;
import com.weet.app.user.service.UserService;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;



@Log4j2
@NoArgsConstructor

@Component
public class LoginInterceptor implements HandlerInterceptor {
	
	@Setter(onMethod_= {@Autowired})
	private UserService service;
	
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler) throws Exception {
		log.trace("1. preHandle(req, res, handler) invoked.");
		
		HttpSession session = req.getSession();
		log.info("\t+ Current Session: {}", session.getId());
		
		UserVO vo = (UserVO) session.getAttribute(SharedScopeKeys.LOGIN_KEY);
		log.info("\t+ 2. TrainerVO: {}", vo);
		
		log.info("");
		
		if(vo != null) { 
			session.removeAttribute(SharedScopeKeys.LOGIN_KEY);
			log.info("\t+ Removed UserVO: {}", vo);
		} else {
			log.info("\t+ No UserVO found in the Session Scope.");
		} // if-else

		return true;
	} // preHandle
	
	@Override
	public void postHandle(HttpServletRequest req, HttpServletResponse res, Object handler, ModelAndView modelAndView) throws Exception {
		log.trace("2. postHandle(req, res, handler, {}) invoked.", modelAndView);
		
		ModelMap modelMap = modelAndView.getModelMap();
		UserVO trainerVO = (UserVO) modelMap.get(SharedScopeKeys.LOGIN_KEY);
		
		if(trainerVO != null) {
			HttpSession session = req.getSession();
	
			session.setAttribute(SharedScopeKeys.LOGIN_KEY, trainerVO);
	
			boolean isRememberMeOption = checkRememberMeOption(req);
			log.info("\t+ isRememberMeOption: {}", isRememberMeOption);
				
			if(isRememberMeOption) {				
				String sessionId = session.getId();
						
				final int maxAge = 1*60*60*24*7;	// in seconds
		
				Cookie rememberMeCookie = new Cookie(SharedScopeKeys.REMEMBER_ME_KEY, sessionId);				
				rememberMeCookie.setMaxAge(maxAge);	// 유효기간: 1주일
				rememberMeCookie.setPath("/");
	
				res.addCookie(rememberMeCookie);
	
				long currTime = System.currentTimeMillis();						
				long expireTime = currTime + (maxAge * 1000L);	
	
				Timestamp expireTS = new Timestamp(expireTime);
	
				boolean isUpdated = this.service.modifyUserWithRememberMe(trainerVO.getUserId(), rememberMeCookie.getValue(), expireTS);
				log.info("\t+ isUpdated: {}", isUpdated);				
			} // if : 자동로그인 기능적용
			
			res.sendRedirect("/");
		} // if : 로그인 성공시
	} // postHandle
			
	// Remember Me 여부 체크
	private boolean checkRememberMeOption(HttpServletRequest req) {
		log.trace("checkRememberMeOption(req) invoked.");

		String rememberMe = req.getParameter("rememberMe");	
		log.info("\t+ rememberMe: {}", rememberMe);

		return rememberMe != null;
	} // checkRememberMeOption

} // end class
	
