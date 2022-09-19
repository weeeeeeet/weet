package com.weet.app.pay.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.siot.IamportRestClient.response.Payment;
import com.weet.app.exception.DAOException;
import com.weet.app.exception.ServiceException;
import com.weet.app.pay.domain.PaymentDTO;
import com.weet.app.pay.mapper.CouponMapper;
import com.weet.app.pay.mapper.PayMapper;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@Service
public class PayServiceImpl implements PayService {
	
	@Setter(onMethod_= @Autowired)
	private CouponMapper couponMapper;
	
	@Setter(onMethod_= @Autowired)
	private PayMapper payMapper;

	@Override
	@Transactional
	public String savePayment(
		Payment payment, 
		String classId, 
		String userId, 
		String couponId) throws ServiceException {
		
		log.trace("savePayment({}, {}, {}, {}) invoked.", payment, classId, userId, couponId);
		
		// dto 세팅
		PaymentDTO dto = new PaymentDTO();
		
		dto.setClassId(classId);
		dto.setPayAgmtYn("Y");
		dto.setPayAmount(payment.getAmount().intValue());
		dto.setPayCardName(payment.getCardName());
		dto.setPayEmail(payment.getBuyerEmail());
		dto.setPayMethod(payment.getPayMethod());
		dto.setPayNum(payment.getMerchantUid());
		dto.setPayUid(payment.getImpUid());
		dto.setUserId(userId);
		
		try {
			// 실패한 메소드 종류에 따라 오류코드 반환
			if(this.payMapper.insertPayInfo(dto) != 1) 						return "FAIL:01";
			if(this.payMapper.insertClassListener(classId, userId) != 1) 	return "FAIL:02";
			if(this.couponMapper.updateCouponUsage(couponId, userId) != 1) 	return "FAIL:03";
			
			// 모두 성공시 success 반환
			return "SUCCESS";
		} catch (DAOException e) {
			throw new ServiceException(e);
		} // try-catch
	} // goPayment

} // end class
