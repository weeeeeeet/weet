package com.weet.app.pay.service;

import com.siot.IamportRestClient.response.Payment;
import com.weet.app.exception.ServiceException;
import com.weet.app.pay.domain.PaymentVO;
import com.weet.app.user.domain.UserVO;

public interface PayService {
	
	// 결제정보 저장
	public abstract String savePayment(Payment payment, String classId, String userId, String couponId) throws ServiceException;

	// 결제정보 조회
	public abstract PaymentVO getPayInfo(String orderNum) throws ServiceException;
	
	// 결제 유저정보 조회
	public abstract UserVO getPayUserInfo(String userId) throws ServiceException;
} // end interface
