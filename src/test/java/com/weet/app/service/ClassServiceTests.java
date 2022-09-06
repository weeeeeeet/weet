package com.weet.app.service;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import java.util.List;
import java.util.concurrent.TimeUnit;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.MethodOrderer;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.junit.jupiter.api.TestInstance.Lifecycle;
import org.junit.jupiter.api.TestMethodOrder;
import org.junit.jupiter.api.Timeout;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.weet.app.classes.domain.ReviewVO;
import com.weet.app.classes.service.ClassService;
import com.weet.app.common.domain.Criteria;
import com.weet.app.exception.ServiceException;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/**/*-context.xml")

@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class ClassServiceTests {
	
	@Setter(onMethod_= @Autowired)
	private ClassService service;
	
//	@Disabled
	@Test
	@Order(1)
	@DisplayName("1. 리뷰조회")
	@Timeout(value = 3, unit = TimeUnit.SECONDS)
	void 리뷰조회() throws ServiceException {
		String classId = "class1";
		Criteria cri = new Criteria();
		cri.setCurrPage(1);
		cri.setAmount(5);
		cri.setSort("starASC");
		
		List<ReviewVO> vo = this.service.getReviews(classId, cri);
		vo.forEach(log::info);
	} // 리뷰조회
	
//	@Disabled
	@Test
	@Order(2)
	@DisplayName("2. 좋아요 여부 체크")
	@Timeout(value = 3, unit = TimeUnit.SECONDS)
	void 좋아요여부체크() throws ServiceException {
		String classId = "class1";
		String userId = "user1";
		
		boolean isChecked = this.service.checkMyLike(classId, userId);
		assertFalse(isChecked);
	} // 리뷰조회
	
//	@Disabled
	@Test
	@Order(3)
	@DisplayName("3. 좋아요 취소")
	@Timeout(value = 3, unit = TimeUnit.SECONDS)
	void 좋아요취소하기() throws ServiceException {
		String classId = "class1";
		String userId = "user1";
		
		boolean isChecked = this.service.cancelClassLike(classId, userId);
		assertTrue(isChecked);
	} // 리뷰조회

} // end class
