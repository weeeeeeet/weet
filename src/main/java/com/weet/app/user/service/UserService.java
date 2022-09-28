package com.weet.app.user.service;

import java.util.Date;
import java.util.HashMap;

import com.weet.app.exception.ServiceException;
import com.weet.app.user.domain.LoginDTO;
import com.weet.app.user.domain.MemberDTO;
import com.weet.app.user.domain.TrainerDTO;
import com.weet.app.user.domain.TrainerVO;
import com.weet.app.user.domain.UserDTO;
import com.weet.app.user.domain.UserVO;

public interface UserService {
	
	// 회원가입 : 회원 등록
	public abstract boolean trJoin(UserDTO userDTO, TrainerDTO trainerDTO) throws ServiceException;
	
	// 아이디 중복체크 : 기존아이디와 입력아이디 비교. 일치여부 cnt로 리턴
	public abstract int idCheck(String id) throws ServiceException;

	// 로그인 창에서 입력한 아이디와 암호에 매칭되는 회원이 있는지 확인
	//Boolean 으로 하지 않고, UserVO로 하는 이유: 객체를 바로 '로그인 성공 정보'로 Session Scope에 바인딩 시키기 위해.
	public abstract TrainerVO login(LoginDTO dto) throws ServiceException;

	// 자동로그인 쿠키값으로 사용자를 조회하여 인증정보(TrainerVO)를 생성
	public abstract TrainerVO findUserByRememberMe(String rememberMe) throws ServiceException;

	/// 아이디로 사용자를 조회하여 인증정보(TrainerVO) 변경
	public abstract boolean modifyUserWithRememberMe(String userid, String rememberMe, Date rememberAge) throws ServiceException;

	// =============== Kakao Join&Login ================= // 
	// 카카오 로그인 토큰 발급
	public String getKaKaoAccessToken(String code) throws ServiceException;

	// 카카오 사용자 로그인 처리
	public void createKakaoUser(String token) throws ServiceException;

	public UserVO getUserInfo (String access_Token) throws ServiceException;
	
	// =============== Naver Join&Login ================= // 
	// 회원가입 : 일반유저 등록
	public abstract boolean userJoin(UserDTO userDTO, MemberDTO memberDTO) throws ServiceException;
	
	// 로그인 토큰 업데이트
	public abstract void userTokenUpdate(MemberDTO memberDTO) throws ServiceException;
	
	// 유저 프로필 조회
	public abstract UserVO getUserProfile(String userId) throws ServiceException;
	
} // end interface
