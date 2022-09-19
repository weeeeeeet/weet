package com.weet.app.pay.service;

import com.siot.IamportRestClient.response.Payment;
import com.weet.app.exception.ServiceException;

public interface PayService {
	
	public abstract String savePayment(Payment payment, String classId, String userId, String couponId) throws ServiceException;

} // end interface
