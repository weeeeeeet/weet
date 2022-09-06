package com.weet.app.service;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.MethodOrderer;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.junit.jupiter.api.TestInstance.Lifecycle;
import org.junit.jupiter.api.TestMethodOrder;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.weet.app.exception.ServiceException;
import com.weet.app.pay.domain.CouponVO;
import com.weet.app.pay.service.CouponService;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@ExtendWith(SpringExtension.class)
@ContextConfiguration(
	locations = "file:src/main/webapp/WEB-INF/spring/**/*-context.xml")

@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class CouponServiceTests {
	
	@Setter(onMethod_= @Autowired)
	private CouponService service;
	
	@BeforeAll
	void beforeAll() {
		log.trace("beforeAll() invoked.");
		
		assertNotNull(this.service);
		log.info("\t+ 1. this.service: {}", this.service);
		log.info("\t+ 2. type: {}", this.service.getClass().getName());
	} // beforeAll
	
//	@Disabled
	@Test
	@Order(1)
	@DisplayName("1. 전체쿠폰 조회 테스트")
	void 전체쿠폰조회() throws ServiceException {
		log.trace("전체쿠폰조회() invoked.");
		
		List<CouponVO> list = this.service.getCoupons();
		list.forEach(log::info);
	} // 전체쿠폰조회
	
//	@Disabled
	@Test
	@Order(2)
	@DisplayName("2. 내쿠폰 조회 테스트")
	void 내쿠폰조회() throws ServiceException {
		log.trace("내쿠폰조회() invoked.");
		String userId = "user1";
		
		List<CouponVO> list = this.service.getMyCoupons(userId);
		list.forEach(log::info);
	} // 내쿠폰조회
	
//	@Disabled
	@Test
	@Order(3)
	@DisplayName("3. 내쿠폰 등록 테스트")
	void 내쿠폰등록() throws ServiceException {
		log.trace("내쿠폰등록() invoked.");
		String couponId = "WEETWITHINSTAGRAM";
		String userId = "user1";
		
		if(this.service.createMyCoupon(couponId, userId)) log.info("쿠폰등록완료");
		else log.info("쿠폰등록실패");
	} // 내쿠폰조회

} // end class
