package com.weet.app.user.service;

import com.weet.app.exception.ServiceException;

public interface AuthService {

	public void certifiedPhoneNumber(String userPhone, int randomNumber) throws ServiceException;

	// 카카오 로그인 토큰 발급
	public String getKaKaoAccessToken(String code);
	
	// 카카오 사용자 로그인 처리
	public void createKakaoUser(String token) throws ServiceException;
	
	
}
