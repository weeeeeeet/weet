package com.weet.app.service;

import java.util.List;
import java.util.Map;
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
import org.springframework.test.context.web.WebAppConfiguration;

import com.weet.app.board.domain.BoardVO;
import com.weet.app.board.domain.ReplyVO;
import com.weet.app.board.service.BoardService;
import com.weet.app.common.domain.Criteria;
import com.weet.app.exception.ServiceException;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@ExtendWith(SpringExtension.class)
@WebAppConfiguration
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/**/*-context.xml")

@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class BoardServiceTests {
	
	@Setter(onMethod_= @Autowired)
	private BoardService service;
	
//	@Disabled
	@Test
	@Order(1)
	@DisplayName("1. 인기게시글, 댓글프리뷰 조회")
	@Timeout(value = 3, unit = TimeUnit.SECONDS)
	void 인기게시글_댓글프리뷰() throws ServiceException {
		
		List<Object> list = this.service.getListTop10();
		
		list.forEach(log::info);
	} // 리뷰조회
	
//	@Disabled
	@Test
	@Order(2)
	@DisplayName("2. 전체게시글, 댓글프리뷰 조회")
	@Timeout(value = 3, unit = TimeUnit.SECONDS)
	void 전체게시글_댓글프리뷰() throws ServiceException {
		
		String keyword = "뉴비";
		Criteria cri = new Criteria();
		cri.setAmount(5);
		cri.setCurrPage(0);
		cri.setSort("like");
		
		List<Object> list = this.service.getAllList(keyword, cri);
		
		list.forEach(log::info);
	} // 전체게시글_댓글프리뷰
	
//	@Disabled
	@Test
	@Order(3)
	@DisplayName("3. 게시글갯수 조회")
	@Timeout(value = 3, unit = TimeUnit.SECONDS)
	void 게시글갯수() throws ServiceException {
		
		String keyword = "뉴비";
		int count = this.service.getListCount(keyword);
		
		log.info("\t+ 총 {} 건", count);
	} // 게시글갯수조회
	
//	@Disabled
	@Test
	@Order(4)
	@DisplayName("4. 게시글상세 조회")
	@Timeout(value = 3, unit = TimeUnit.SECONDS)
	void 게시글상세() throws ServiceException {
		
		Map<String, Object> map = this.service.getOneBoard(1);
		
		log.info("\t+ 조회결과: {}", map);
	} // 게시글상세

} // end class
