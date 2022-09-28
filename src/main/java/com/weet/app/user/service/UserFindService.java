package com.weet.app.user.service;

import com.weet.app.exception.ServiceException;
import com.weet.app.user.domain.TrainerDTO;
import com.weet.app.user.domain.UserVO;

public interface UserFindService {

	// 아이디 찾기
	public abstract UserVO findId(String userName, String userPhone) throws ServiceException;

	// 비밀번호 변경
	public abstract boolean updatePwd(TrainerDTO trainerDTO) throws ServiceException;
	
} // end interface