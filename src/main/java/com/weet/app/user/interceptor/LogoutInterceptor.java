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
import com.weet.app.user.domain.TrainerVO;
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
	
	
	// Incoming Request 가 Controller's Handler Method로 위임되기 직전에 가로채는 부분
	// Session Scope 에 저장되어 있던 모든 정보 파괴 수행
	// (*주의*) 명시적으로 "로그아웃" 요청을 보내지 않는 한, 세션 자체를 파괴해서는 안됨
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler) throws Exception {
		log.trace("================================================================");
		log.trace("1. preHandle(req, res, handler) invoked.");
		log.trace("================================================================");

		// Step.1 현재 브라우저에 할당된 Session Scope을 모두 파괴하고(즉, 로그인 성공증빙도 파괴되고)
		// 		  웹 브라우저에 할당된 이름(즉, 세션ID)도 무효화시킴
		
		HttpSession session = req.getSession();
		
		String sessionId = session.getId();
		TrainerVO trainerVO = (TrainerVO) session.getAttribute(SharedScopeKeys.USER_KEY);
		
		session.invalidate();
		
		log.info("\t+ 1. Current Session Scope Destroyed.(ID: {})", sessionId);
		
		// Step.2 로그인 성공시, 자동로그인 옵션도 on시켜 놓은 웹브라우저가 로그아웃을 명시적으로 
		//        수행하는 경우로, 이 때에는 위 Step.1도 필요하지만, 자동로그인쿠키(remembermeCookie)의
		//        삭제도 해줘야 함 (***)
		Cookie rememberMeCookieTobeDestroyed = WebUtils.getCookie(req, SharedScopeKeys.REMEMBER_ME_KEY);
		if(rememberMeCookieTobeDestroyed != null) {	// 쿠키가 파괴되도록 유효기간 재설정
			rememberMeCookieTobeDestroyed.setMaxAge(0);	// 유효기간이 0이란 의미 => 그 즉시 파괴하라! (*****)
			rememberMeCookieTobeDestroyed.setPath("/");
			
			res.addCookie(rememberMeCookieTobeDestroyed);
			
			log.info("\t+ 2. rememberMeCookie destroyed.");
		} // if
		
		// Step.3 명시적으로 로그아웃 하는 것이므로, t_tr 테이블에 있는 자동로그인쿠키컬럼(rememberme)과
		//        expire 일시를 기록한 rememberage 컬럼의 값을 모두 NULL로 제거해줘야 함.
		//		  그래야, 명시적 로그아웃 이후에는, 더이상 자동로그인도 작동하지 못하게 됨.			
		boolean isModified = this.service.modifyUserWithRememberMe(trainerVO.getUserId(), null, null);
		log.info("\t+ 3. isModified: {}", isModified);
	
		// Step.4 최종적으로 로그인 화면 창으로 리다이렉트 수행
		// 지금 Request Scope에 처리결과 메시지를 공유속성으로 넣어도, 307 리다이렉트가 응답으로 나가면서
		// Request Scope이 자동파괴되기 때문에, 로그인 창에서는 아래의 메시지를 얻어낼 수가 없습니다.
		// 그럼, Session Scope에 넣어서 보내볼까요!?(그런데, 이미 Session은 위에서 파괴되었답니다!)
		// 그래도 한번 해볼가요!?
//		req.setAttribute(SharedScopeKeys.RESULT_KEY, "Signed Out Successfully"); // 무의미함
		
		req.getSession().setAttribute(SharedScopeKeys.RESULT_KEY, "Signed Out Successfully");
		res.sendRedirect("/user/login");
		
		return false;		// 로그아웃 요청을 컨트롤러의 핸들러로 전달하지 않음(핸들러도 없으니..)
	} // preHandle
	

} // end class
