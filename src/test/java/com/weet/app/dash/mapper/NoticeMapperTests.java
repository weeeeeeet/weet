package com.weet.app.dash.mapper;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.List;
import java.util.Objects;
import java.util.concurrent.TimeUnit;

import org.junit.jupiter.api.BeforeAll;
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

import com.weet.app.dash.domain.NoticeVO;
import com.weet.app.exception.DAOException;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

// for junit jupyter 5
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = {
		"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})

@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class NoticeMapperTests {

	@Setter(onMethod_= {@Autowired})
	private NoticeMapper mapper;
	
	@BeforeAll
	void beforeAll() {	// 1회성 전처리 작업: 필드 주입이 잘 되었는지 확인용
		log.trace("beforeAll() invoked.");
		
		assertNotNull(this.mapper);
		log.info("\t+ 1. this.mapper: {}", this.mapper);
		log.info("\t+ 2. type: {}", this.mapper.getClass().getName());
	} // beforeAll
	
	//==================================================
	// 1. 공지사항 목록
	//==================================================
//	@Disabled
	@Test
	@Order(1)
	@DisplayName("1. NoticeMapper.selectAllNoticeList() test.")
	@Timeout(value=5, unit=TimeUnit.SECONDS)
	void testselectAllNoticeList() throws DAOException {
		log.trace("testselectAllNoticeList() invoked.");

		List<NoticeVO> list = this.mapper.selectAllNoticeList();
		log.info("\t+ >>>>>>>>>>>>>>>>>>> type: {}", list.getClass().getName());
		Objects.requireNonNull(list);
		log.info("\t+ >>>>>>>>>>>>>>>>>>> type: {}", list.getClass().getName());
		list.forEach(log::info);
	} // testselectAllNoticeList
	
	//==================================================
	// 2. 코칭계획 목록
	//==================================================
////	@Disabled
//	@Test
//	@Order(2)
//	@DisplayName("2. NoticeMapper.selectAllCoachingList() test.")
//	@Timeout(value=5, unit=TimeUnit.SECONDS)
//	void testselectAllCoachingList() throws DAOException {
//		log.trace("testselectAllCoachingList() invoked.");
//		
//		List<NoticeVO> list = this.mapper.selectAllCoachingList();
//		
//		Objects.requireNonNull(list);
//		list.forEach(log::info);
//	} // testselectAllCoachingList
	
	//==================================================
	// 3. 공지사항 상세 컨텐츠
	//==================================================
	
//	@Disabled
	@Test
	@Order(3)
	@DisplayName("3. NoticeMapper.SelectContent(n_num) test.")
	@Timeout(value=5, unit=TimeUnit.SECONDS)
	void testSelectContent() throws DAOException {
		log.trace("testSelectContent() invoked.");
		
		String n_numToBeRead = "notice1";
		
		NoticeVO vo = this.mapper.selectNoticeContents(n_numToBeRead);
		
		Objects.requireNonNull(vo);
		log.info("\t+ vo: {}", vo);
	} // testSelectContent
	
} // end class
