package com.weet.app.user.interceptor;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.util.WebUtils;

import com.weet.app.common.SharedScopeKeys;
import com.weet.app.user.domain.TrainerVO;
import com.weet.app.user.service.UserService;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

@Component("authInterceptor")
public class AuthInterceptor implements HandlerInterceptor {
	
	@Setter(onMethod_= {@Inject})
	private UserService service;
	
	// --- Interceptor 가 해야할 일:
	// (1) 게시판과 관련된 모든 요청에 대해서, 인증된 사용자(즉, 브라우저)인지를 가장 먼처 체크해야 하고
	//     만일 인증되지 않은 사용자(웹브라우저)라면, 로그인을 하도록, 로그인 창으로 리다이렉트 시켜야 함
	//     위의 로직은 모든 인증 기능에서 가장 먼저 수행해야 할 "공통보안로직" 임
	// (2) 자동로그인(Remember-Me) 기능이 on되어 있는 경우, 특수한 처리가 필요
	//     (해당하는 경우: 인증정보는 없는데 => 자동로그인 쿠키가 요청으로 날라오는 경우)
	
	// 뒤의 컨트롤러의 메소드가 호출되기 전에 수행.
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler) throws Exception {
		log.debug("=============================================================");
		log.debug("1. preHandle(req, res, handler) invoked.");
		log.debug("=============================================================");
		
		// Step.1 현재 요청 URI을 전송한 사용자(웹브라우저)의 인증여부 확인
		HttpSession session = req.getSession();
		TrainerVO trainer = (TrainerVO) session.getAttribute(SharedScopeKeys.LOGIN_KEY);
		
		if(trainer == null) {	// NOT logged in.
			// Step.2
			log.info("\t+ 3. Already Authenticated: {}", trainer);

			return true;	// 요청을 컨트롤러의 핸들러로 넘김
		} else {			// If 인증된 사용자(웹브라우저)가 아니라면... (*****)				
				// ========================================== //	
				// *** 자동로그인(Remember-Me) 처리 ***
				// ========================================== //
				// 필요한 처리는 2가지임:
				//   (1) 현재 웹브라우저에 할당된 Session Scope에,
				//		 웹브라우저를 종료시키기 전에 인증되었던 UserVO (인증정보)를 구해서 복구해줘야 함 (*** 이게 가장 중요한 처리)
				//   (2) (1) 조치를 해놓은 상태에서 무사통과 시켜야 함
			
			Cookie rememberMeCookie = WebUtils.getCookie(req, SharedScopeKeys.REMEMBER_ME_KEY);
			
			if(rememberMeCookie != null) { // 자동로그인 처리 수행 => 즉, 무사통과!!!
				// Step.1 자동로그인 쿠키를 이용하여, Session Scope 에 인증정보(UserVO) 복원
				String cookieName = rememberMeCookie.getName();
				String cookieValue = rememberMeCookie.getValue();
				
				log.info("\t+ 3. RememberMe Cookie Found - name: {}, value: {}", cookieName, cookieValue);

				TrainerVO trainerVO = this.service.findUserByRememberMe(cookieValue);
				log.info("\t+ 4. Found userVO: {}", trainerVO);

				session.setAttribute(SharedScopeKeys.USER_KEY, trainerVO);		// 인증정보 복구완료				

				// Step.2 무사통과(로그인 창으로 이동시키지 않고, 요청 처리)
				return true;	// 무사통과: 컨트롤러의 핸들러로 요청을 넘긴다!!!
			} // if
		
			log.info("\t+ No Authenticated User");

			res.sendRedirect("/user/login");			
				return false;	// 요청을 컨트롤러의 핸들러로 넘기지 않음
			} // if-else
		} // preHandle

} // end class
