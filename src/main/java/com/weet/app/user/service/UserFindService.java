package com.weet.app.user.service;

import com.weet.app.exception.ServiceException;
import com.weet.app.user.domain.UserVO;

public interface UserFindService {

	// 아이디 찾기
	public abstract UserVO findId(String userName, String userPhone) throws ServiceException;

	// 사용자 정보 얻기
	public abstract UserVO getMatchUser(String userId, String userName, String userPhone) throws ServiceException;
	
	// 비밀번호 변경
	public abstract boolean updatePwd(String userId, String userPwd) throws ServiceException;
	
} // end interface