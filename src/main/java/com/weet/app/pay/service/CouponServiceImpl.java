package com.weet.app.pay.service;

import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weet.app.exception.DAOException;
import com.weet.app.exception.ServiceException;
import com.weet.app.pay.domain.CouponVO;
import com.weet.app.pay.mapper.CouponMapper;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@Service("couponService")
public class CouponServiceImpl
	implements CouponService, InitializingBean {
	
	@Setter(onMethod_= @Autowired)
	private CouponMapper mapper;

	// ==== 전처리 메소드 ====
	@Override
	public void afterPropertiesSet() throws Exception {
		log.trace("afterPropertiesSet() invoked.");
		
		Objects.requireNonNull(this.mapper);
		log.info("\t+ this.mapper: {}", this.mapper);
	} // afterPropertiesSet

	// 공개설정된 전체 쿠폰목록 조회
	@Override
	public List<CouponVO> getCoupons() throws ServiceException {
		log.trace("getCoupons() invoked.");
		
		try { return this.mapper.selectCouponList(); } 
		catch(DAOException e) { throw new ServiceException(e); } // try-catch
	} // getCoupons

	// 내 쿠폰목록 조회
	@Override
	public List<CouponVO> getMyCoupons(String userId) throws ServiceException {
		log.trace("getMyCoupons() invoked.");
		
		try { return this.mapper.selectMyCouponList(userId); }
		catch(DAOException e) { throw new ServiceException(e); } // try-catch
	} // getMyCoupons

	// 쿠폰 직접 등록(사용자가 등록)
	@Override
	public boolean createMyCoupon(String couponId, String userId) throws ServiceException {
		log.trace("createMyCoupon() invoked.");

		try { return this.mapper.insertMyCoupon(couponId, userId) == 1; }
		catch(Exception e) { throw new ServiceException(e); } // try-catch
	} // createMyCoupon

} // end class
