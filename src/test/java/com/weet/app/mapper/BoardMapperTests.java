package com.weet.app.mapper;

import static org.junit.jupiter.api.Assertions.assertEquals;

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

import com.weet.app.board.domain.CommunityDTO;
import com.weet.app.board.domain.CommunityVO;
import com.weet.app.board.domain.ReplyDTO;
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
		
		List<CommunityVO> vo = this.mapper.selectListTop10();
		vo.forEach(log::info);
	} // 인기글조회
	
//	@Disabled
	@Test
	@Order(2)
	@DisplayName("2. 댓글 목록 조회")
	@Timeout(value = 3, unit = TimeUnit.SECONDS)
	void 댓글조회() throws DAOException {
		
		List<ReplyVO> vo = this.mapper.selectReplyList(10, true);
		
		log.info("\t+ vo: {}", vo);
		log.info("\t+ vo.size: {}", vo.size());
	} // 인기글조회
	
//	@Disabled
	@Test
	@Order(3)
	@DisplayName("3. 게시글 작성")
	@Timeout(value = 3, unit = TimeUnit.SECONDS)
	void 글작성() throws DAOException {
		
		CommunityDTO dto = new CommunityDTO();
		dto.setUserId("user4");
		dto.setCommPostTitle("하루 1분 스트레칭법!!");
		dto.setCommPostContents("의자에 앉아서 고개를 이렇게저렇게 돌리면 거북목예방에 도움이 된대요!!");
		dto.setCommTempsave('0');
		
		int affectedLine = this.mapper.insertBoard(dto);
		
		log.info("\t+ dto: {}", dto);
		assertEquals(1, affectedLine);
	} // 인기글조회
	
//	@Disabled
	@Test
	@Order(4)
	@DisplayName("4. 댓글 작성")
	@Timeout(value = 3, unit = TimeUnit.SECONDS)
	void 댓글작성() throws DAOException {
		
		ReplyDTO dto = new ReplyDTO();
		dto.setUserId("tr4");
		dto.setReplyContents("댓글 테스트");
		dto.setCommId(10);
		
		int affectedLine = this.mapper.insertReply(dto);
		this.mapper.updateReplyGroup(dto);
			
		log.info("\t+ dto: {}", dto);
		assertEquals(1, affectedLine);
	} // 인기글조회
	
//	@Disabled
	@Test
	@Order(5)
	@DisplayName("5. 대댓글 조회")
	@Timeout(value = 3, unit = TimeUnit.SECONDS)
	void 대댓글조회() throws DAOException {
		
		List<ReplyVO> vo = this.mapper.selectReReplyList(4, 253);
		
		vo.forEach(log::info);
	} // 인기글조회

} // end class
