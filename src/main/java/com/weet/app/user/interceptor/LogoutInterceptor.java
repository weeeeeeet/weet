package com.weet.app.user.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.util.WebUtils;

import com.weet.app.common.SharedScopeKeys;
import com.weet.app.user.domain.UserVO;
import com.weet.app.user.service.UserService;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

@Component
public class LogoutInterceptor implements HandlerInterceptor {

	@Setter(onMethod_= {@Autowired})
	private UserService service;
	
	
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler) throws Exception {
		log.trace("1. preHandle(req, res, handler) invoked.");

		HttpSession session = req.getSession();

		String sessionId = session.getId();
		UserVO trainerVO = (UserVO) session.getAttribute(SharedScopeKeys.LOGIN_KEY);

		session.invalidate();

		log.info("\t+ 1. Current Session Scope Destroyed.(ID: {})", sessionId);

		Cookie rememberMeCookieTobeDestroyed = WebUtils.getCookie(req, SharedScopeKeys.REMEMBER_ME_KEY);
		if(rememberMeCookieTobeDestroyed != null) {	
			rememberMeCookieTobeDestroyed.setMaxAge(0);
			rememberMeCookieTobeDestroyed.setPath("/");

			res.addCookie(rememberMeCookieTobeDestroyed);

			log.info("\t+ 2. rememberMeCookie destroyed.");
		} // if

		boolean isModified = this.service.modifyUserWithRememberMe(trainerVO.getUserId(), null, null);
		log.info("\t+ 3. isModified: {}", isModified);

		req.getSession().setAttribute(SharedScopeKeys.RESULT_KEY, "Signed Out Successfully");
		res.sendRedirect("/user/login");

		return false;	
	} // preHandle

} // end class