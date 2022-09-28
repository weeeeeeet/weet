package com.weet.app.user.mapper;

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

import com.weet.app.exception.DAOException;
import com.weet.app.user.domain.UserVO;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor


// For JUnit v4
//@RunWith(SpringRunner.class)
//@RunWith(SpringJUnit4ClassRunner.class)

// For JUnit Jupyter v5
@ExtendWith(SpringExtension.class)

@ContextConfiguration(locations = "file:src/main/webapp/**/spring/**/*-context.xml")

@WebAppConfiguration
@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class UserFindMapperTests {

	@Setter(onMethod_= {@Autowired})
	private UserFindMapper findmapper;


	@BeforeAll
	void beforeAll() {	// 1회성 전처리 작업: 필드 주입이 잘 되었는지 확인용
		log.trace("beforeAll() invoked.");

		assertNotNull(this.findmapper);
		log.info("\t+ 1. this.mapper: {}", this.findmapper);
		log.info("\t+ 2. type: {}", this.findmapper.getClass().getName());
	} // beforeAll


//  아이디 찾기
//	@Disabled
	@Test
	@Order(1)
	@DisplayName("1. UserMapper.testSelectMatchId() test.")
	@Timeout(value=5, unit=TimeUnit.SECONDS)
	void testSelectMatchId() throws DAOException {
		log.trace("testSelectMatchId() invoked.");

		String userId = "testName2";
		String userPhone = "01087761226";

		UserVO vo = this.findmapper.selectMatchId(userId, userPhone);

		Objects.requireNonNull(vo);
		log.info("\t+ vo: {}", vo);

	} // testSelectId
	
//  아이디 찾기
//	@Disabled
	@Test
	@Order(2)
	@DisplayName("2. UserMapper.testSelectMatchUser() test.")
	@Timeout(value=5, unit=TimeUnit.SECONDS)
	void testSelectMatchUser() throws DAOException {
		log.trace("testSelectMatchId() invoked.");
		
		String userId = "testId";
		String userName = "testName";
		String userPhone = "01012344321";
		
		UserVO vo = this.findmapper.selectMatchUser(userId, userName, userPhone);

		Objects.requireNonNull(vo);
		log.info("\t+ vo: {}", vo);

	} // testSelectMatchUser


//  아이디 찾기
//	@Disabled
	@Test
	@Order(3)
	@DisplayName("3. UserMapper.testUpdatePwd() test.")
	@Timeout(value=5, unit=TimeUnit.SECONDS)
	void testUpdatePwd() throws DAOException {
		log.trace("testSelectMatchId() invoked.");
		
		String userId = "testId";
		String userPwd = "ChangePwd";
		
		int affectedLines = this.findmapper.updatePwd(userId, userPwd);

		log.info("\t+ affectedLines: {}", affectedLines);
		
		assert affectedLines == 1;

	} // testUpdatePwd
} // end class