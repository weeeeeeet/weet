package com.weet.app.pay.service;

import com.siot.IamportRestClient.response.Payment;
import com.weet.app.exception.ServiceException;
import com.weet.app.pay.domain.PaymentVO;

public interface PayService {
	
	public abstract String savePayment(Payment payment, String classId, String userId, String couponId) throws ServiceException;

	public abstract PaymentVO getPayInfo(String orderNum) throws ServiceException;

} // end interface
