package com.weet.app.user.service;

import java.util.Date;

import com.weet.app.exception.ServiceException;
import com.weet.app.user.domain.JoinDTO;
import com.weet.app.user.domain.LoginDTO;
import com.weet.app.user.domain.UserVO;

public interface UserService {
	
	// 회원가입 : 회원 등록
	public abstract boolean trJoin(JoinDTO joinDTO) throws ServiceException;
	
	// 아이디 중복체크 : 기존아이디와 입력아이디 비교. 일치여부 cnt로 리턴
	public abstract int idCheck(String id) throws ServiceException;

	// -------------------------------------------------------------------- //
	// 1. 로그인 창에서 입력한 아이디와 암호에 매칭되는 회원이 있는지 확인
	// -------------------------------------------------------------------- //
	// Return type을 Boolean 으로 하지 않고, UserVO로 하는 이유는, 
	// 이 객체를 바로 로그인 성공 정보로 Session Scope에 바인딩 시키기 위해서임.
	public UserVO login(LoginDTO dto) throws Exception;

	// -------------------------------------------------------------------- //
	// 2. 자동로그인 쿠키값으로 사용자를 조회하여 인증정보(UserVO)를 생성
	// -------------------------------------------------------------------- //
	public UserVO findUserByRememberMe(String rememberMe) throws Exception;
	
	// -------------------------------------------------------------------- //
	// 3. 자동로그인 쿠키값으로 사용자를 조회하여 인증정보(UserVO)를 생성
	// -------------------------------------------------------------------- //
	public void modifyUserWithRememberMe(String userid, String rememberMe, Date rememberAge) throws Exception;
	

} // end interface
