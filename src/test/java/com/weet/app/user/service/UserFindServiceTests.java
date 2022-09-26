package com.weet.app.user.service;

import static org.junit.jupiter.api.Assertions.assertNotNull;

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
import org.springframework.test.context.web.WebAppConfiguration;

import com.weet.app.exception.ServiceException;
import com.weet.app.user.domain.UserVO;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

// JUnit 4
// @RunWith(SpringRunner.class)
// @RunWith(SpringJunit4ClassRunner.class)

// JUnit 5
@WebAppConfiguration
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/**/spring/**/*-context.xml")

@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class UserFindServiceTests {

	@Setter(onMethod_=@Autowired)
	private UserFindService findservice;
	
	
	@BeforeAll
	void beforeAll() {
		log.trace("beforeAll() invoked.");
		
		Objects.requireNonNull(this.findservice);
		assert this.findservice != null;
		assertNotNull(this.findservice);
		
		log.info("\t+ this.service:{}", this.findservice);
		
	}
	

//  아이디 찾기 테스트
//	@Disabled
	@Test
	@Order(1)
	@DisplayName("1. UserMapper.testFindId() test.")
	@Timeout(value=5, unit=TimeUnit.SECONDS)
	void testFindId() throws ServiceException {
		log.trace("testFindId() invoked.");
		
		String userName = "testName";
		String userPhone = "01012344321"; 
		
		UserVO vo = this.findservice.findId(userName, userPhone);
		log.info("\t+ vo: {}", vo);

	} // testSelectId

	
} // BoardServiceTests
