package com.weet.app.user.service;

import com.weet.app.exception.ServiceException;

public interface AuthService {

	// 핸드폰 인증
	public void certifiedPhoneNumber(String userPhone, int randomNumber) throws ServiceException;

}
