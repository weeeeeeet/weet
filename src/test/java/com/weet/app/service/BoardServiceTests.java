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

} // end class
