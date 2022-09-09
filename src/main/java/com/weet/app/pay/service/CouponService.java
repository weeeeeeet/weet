package com.weet.app.pay.service;

import java.util.List;

import com.weet.app.exception.ServiceException;
import com.weet.app.pay.domain.CouponVO;

public interface CouponService {
	
	// 전체 쿠폰목록 반환
	public abstract List<CouponVO> getCoupons() throws ServiceException;
	
	// 내 쿠폰 반환
	public abstract List<CouponVO> getMyCoupons(String userId) throws ServiceException;

	// 쿠폰 직접 등록(사용자가)
	public abstract boolean createMyCoupon(String couponId, String userId) throws ServiceException;
	
} // end interface
