package com.weet.app.mapper;

import static org.junit.Assert.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.List;

import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.MethodOrderer;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.junit.jupiter.api.TestInstance.Lifecycle;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.weet.app.exception.DAOException;
import com.weet.app.pay.domain.CouponVO;
import com.weet.app.pay.mapper.CouponMapper;

import org.junit.jupiter.api.TestMethodOrder;

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
public class CouponMapperTests {
	
	@Setter(onMethod_= @Autowired)
	private CouponMapper mapper;
	
	@BeforeAll
	void beforeAll() {
		log.trace("beforeAll() invoked.");
		
		assertNotNull(this.mapper);
		log.info("\t+ 1. this.mapper: {}", this.mapper);
		log.info("\t+ 2. type: {}", this.mapper.getClass().getName());
	} // beforeAll
	
//	@Disabled
	@Test
	@Order(1)
	@DisplayName("1. 전체쿠폰 조회 테스트")
	void 전체쿠폰조회() throws DAOException {
		log.trace("전체쿠폰조회() invoked.");
		
		List<CouponVO> list = this.mapper.selectCouponList();
		
		assertNotNull(list);
		list.forEach(log::info);
	} // 전체쿠폰조회
	
//	@Disabled
	@Test
	@Order(2)
	@DisplayName("2. 내쿠폰 조회 테스트")
	void 내쿠폰조회() throws DAOException {
		log.trace("내쿠폰조회() invoked.");
		String userId = "user1";
		
		List<CouponVO> list = this.mapper.selectMyCouponList(userId);
		
		assertNotNull(list);
		list.forEach(log::info);
	} // 전체쿠폰조회
	
//	@Disabled
	@Test
	@Order(3)
	@DisplayName("3. 쿠폰직접 등록 테스트")
	void 쿠폰등록() throws DAOException {
		log.trace("쿠폰등록() invoked.");
		String couponId = "WEETWITHINSTAGRAM";
		String userId = "user1";
		
		int affectedLines = this.mapper.insertMyCoupon(couponId, userId);
		
		assertEquals(1, affectedLines);
	} // 전체쿠폰조회

} // end class
