package com.weet.app.dash.service;

import static org.junit.jupiter.api.Assertions.assertNotNull;

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

import com.weet.app.exception.ServiceException;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

// For JUnit 4
//@RunWith(SpringRunner.class)
//@RunWith(SpringJUnit4ClassRunner.class)

// For JUnit 5
@ExtendWith(SpringExtension.class)

@ContextConfiguration(locations= "file:src/main/webapp/**/spring/**/*-context.xml")

@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class NoticeServiceTests {
	
	// 의존성 주입
	@Setter(onMethod_= @Autowired)
	private NoticeService service;
	
	@BeforeAll
	void beforeAll() {
		log.trace("beforeAll() invoked.");
		
//		Objects.requireNonNull(this.service);
//		assert this.service != null;
		assertNotNull(this.service);
		
		log.info("\t+ this.service: {}", this.service);
	} // beforeAll
	
	//==================================================
	// 1. 공지사항 목록
	//==================================================
//	@Disabled
	@Test
	@Order(1)
	@DisplayName("1. NoticeService.getAllNoticeList() test.")
	@Timeout(value=3, unit=TimeUnit.SECONDS)
	void testgetAllNoticeList() throws ServiceException {
		log.trace("testgetAllNoticeList() invoked.");
		
		this.service.getAllNoticeList().forEach(log::info);
	} // testgetAllNoticeList
	

} // end class
