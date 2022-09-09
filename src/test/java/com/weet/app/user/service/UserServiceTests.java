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

import com.weet.app.exception.DAOException;
import com.weet.app.exception.ServiceException;
import com.weet.app.user.domain.TrainerDTO;
import com.weet.app.user.domain.UserDTO;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

// JUnit 4
// @RunWith(SpringRunner.class)
// @RunWith(SpringJunit4ClassRunner.class)

// JUnit 5
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/**/spring/**/*-context.xml")


@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class UserServiceTests {

	@Setter(onMethod_=@Autowired)
	private UserService service;
	
	@BeforeAll
	void beforeAll() {
		log.trace("beforeAll() invoked.");
		
		Objects.requireNonNull(this.service);
		assert this.service != null;
		assertNotNull(this.service);
		
		log.info("\t+ this.service:{}", this.service);
		
	}
	
//  회원가입 테스트
//	@Disabled
	@Test
	@Order(1)
	@DisplayName("1. UserMapper.testTrJoin() test.")
	@Timeout(value=5, unit=TimeUnit.SECONDS)
	void testTrJoin() throws DAOException, ServiceException {
		log.trace("testTrJoin() invoked.");
		
		// 1. UserTr 객체 생성 => SQL의 바인드변수들에 넘겨줄 파라미터
		UserDTO userDTO = new UserDTO("testId3", "testName3",'T',"testNick3","01098225432","test3@test.com","testProfile3",'W','Y','Y','Y','Y');
		TrainerDTO trainerDTO = new TrainerDTO("testId3","testPwd!3","testCareer3","testIntro3", 1876543211);
		
		
		this.service.trJoin(userDTO, trainerDTO);
		log.info("\t+ 1-1.newUser:{} ", userDTO);
		log.info("\t+ 1-2.newUser: {} ", trainerDTO);
		
	} // testInsertTr
	
//  아이디 중복 테스트
//	@Disabled
	@Test
	@Order(2)
	@DisplayName("2. UserMapper.testSelectId() test.")
	@Timeout(value=5, unit=TimeUnit.SECONDS)
	void testSelectId() throws ServiceException {
		log.trace("testSelectId() invoked.");
		
		String findId = "tr1";
		int cnt;
		cnt = this.service.idCheck(findId);

		log.trace("\t+ cnt: {}", cnt);
	} // testSelectId
	
} // BoardServiceTests
