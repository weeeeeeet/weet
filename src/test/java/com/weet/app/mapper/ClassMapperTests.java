package com.weet.app.mapper;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.concurrent.TimeUnit;

import org.junit.jupiter.api.Disabled;
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

import com.weet.app.classes.mapper.ClassMapper;
import com.weet.app.common.domain.Criteria;
import com.weet.app.exception.DAOException;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/**/*-context.xml")

@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class ClassMapperTests {
	
	@Setter(onMethod_= @Autowired)
	private ClassMapper mapper;
	
	@Disabled
	@Test
	@Order(1)
	@DisplayName("1. 클래스 상세 조회")
	@Timeout(value = 3, unit = TimeUnit.SECONDS)
	void 클래스상세조회() throws DAOException {
		String classId = "class1";
		
		this.mapper.selectDetail(classId);
	} // 클래스상세조회
	
//	@Disabled
	@Test
	@Order(2)
	@DisplayName("2. 리뷰 보기")
	@Timeout(value = 3, unit = TimeUnit.SECONDS)
	void 리뷰보기() throws DAOException {
		String classId = "class1";
		Criteria cri = new Criteria();
		cri.setAmount(5);
		cri.setCurrPage(1);
		cri.setSort("recent");
		
		this.mapper.selectReviews(classId, cri);
	} // 리뷰보기
	
//	@Disabled
	@Test
	@Order(3)
	@DisplayName("3. 전체리뷰 정보보기")
	@Timeout(value = 3, unit = TimeUnit.SECONDS)
	void 전체리뷰정보보기() throws DAOException {
		String classId = "class1";
		
		this.mapper.selectTotalReviewInfo(classId);
	} // 리뷰보기
	
//	@Disabled
	@Test
	@Order(4)
	@DisplayName("4. 총 좋아요갯수 카운트")
	@Timeout(value = 3, unit = TimeUnit.SECONDS)
	void 총좋아요갯수() throws DAOException {
		String classId = "class1";
		
		int count = this.mapper.selectLikes(classId);
		assertEquals(0, count);
	} // 리뷰보기
	
//	@Disabled
	@Test
	@Order(5)
	@DisplayName("5. 좋아요 테스트")
	@Timeout(value = 3, unit = TimeUnit.SECONDS)
	void 좋아요하기() throws DAOException {
		String classId = "class1";
		String userId = "user1";
		
		int affectedLines = this.mapper.insertMyLike(classId, userId);
		assertEquals(1, affectedLines);
	} // 리뷰보기
	
} // end class
