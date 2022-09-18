package com.weet.app.mapper;

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

import com.weet.app.exception.DAOException;
import com.weet.app.help.domain.HelpDTO;
import com.weet.app.help.mapper.HelpMapper;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

// for JUnit v4
// @Runwith(SpringRunner.class)
// @Runwith(SpringJUnit4Class.Runner)

// for JUnit v5
@ExtendWith(SpringExtension.class)

@ContextConfiguration(locations = {
		"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})

@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class HelpMapperTests {
	
//	@Resource(type=BoardMapper.class)
//	@Resource
//	@Inject
//	@Autowired
	@Setter(onMethod_ = {@Autowired})
	private HelpMapper mapper;

	
//	@Disabled
	@Test
	@Order(6)
	@DisplayName("6. BoardMapper.update(BoardVO) test.")
	@Timeout(value=5, unit=TimeUnit.SECONDS)
	void testUpdate() throws DAOException {
		log.trace("testUpdate() invoked.");
		
		// 1. BoardDTO 객체 생성 -> SQL의 바인드변수들에 넘겨줄 파라미터
		HelpDTO dto = new HelpDTO();
		log.info("\t+ 1. dto: {}", dto);
		
		// 2. Mapper Interface의 추상메소드 호출 with BoardVO 파라미터 전달
		int affectedLines = this.mapper.updateInquiry(dto);
		log.info("\t+ 2. affectedLines: {}", affectedLines);
		
		// 3. 입력 검증
		assert affectedLines == 1;
	} // testUpdate
	
//	@Disabled
	@Test
	@Order(6)
	@DisplayName("6. BoardMapper.update(BoardVO) test.")
	@Timeout(value=5, unit=TimeUnit.SECONDS)
	void testDelete() throws DAOException {
		log.trace("testDelete() invoked.");
		
		
		int affectedLines = this.mapper.deleteInquiry(26);
		log.info("\t+ 2. affectedLines: {}", affectedLines);
		
	} // testUpdate
} // end class
