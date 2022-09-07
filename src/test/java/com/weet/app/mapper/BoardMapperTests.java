package com.weet.app.mapper;

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
import org.springframework.test.context.web.WebAppConfiguration;

import com.weet.app.board.domain.BoardVO;
import com.weet.app.board.domain.ReplyVO;
import com.weet.app.board.mapper.BoardMapper;
import com.weet.app.exception.DAOException;

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

public class BoardMapperTests {
	
	@Setter(onMethod_= @Autowired)
	private BoardMapper mapper;
	
//	@Disabled
	@Test
	@Order(1)
	@DisplayName("1. 인기게시글 Top10 조회")
	@Timeout(value = 3, unit = TimeUnit.SECONDS)
	void 인기글조회() throws DAOException {
		
		List<BoardVO> vo = this.mapper.selectListTop10();
		vo.forEach(log::info);
	} // 인기글조회
	
//	@Disabled
	@Test
	@Order(2)
	@DisplayName("2. 댓글 목록 조회")
	@Timeout(value = 3, unit = TimeUnit.SECONDS)
	void 댓글조회() throws DAOException {
		
		List<ReplyVO> vo = this.mapper.selectReplyList(52, true);
		
		log.info("\t+ vo: {}", vo);
		log.info("\t+ vo.size: {}", vo.size());
	} // 인기글조회

} // end class
