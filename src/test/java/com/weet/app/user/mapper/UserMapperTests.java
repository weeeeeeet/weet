package com.weet.app.user.mapper;

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

import com.weet.app.exception.DAOException;
import com.weet.app.user.domain.JoinDTO;
import com.weet.app.user.domain.TrainerDTO;
import com.weet.app.user.domain.UserDTO;

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

@ContextConfiguration(locations= {
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})


@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class UserMapperTests {
	
	@Setter(onMethod_= {@Autowired})
	private UserMapper usermapper;
	
	
	@BeforeAll
	void beforeAll() {	// 1회성 전처리 작업: 필드 주입이 잘 되었는지 확인용
		log.trace("beforeAll() invoked.");
		
		assertNotNull(this.usermapper);
		log.info("\t+ 1. this.mapper: {}", this.usermapper);
		log.info("\t+ 2. type: {}", this.usermapper.getClass().getName());
	} // beforeAll
	
//  회원가입 테스트
//	@Disabled
	@Test
	@Order(1)
	@DisplayName("1. UserMapper.testInsertUser() test.")
	@Timeout(value=5, unit=TimeUnit.SECONDS)
	void testInsertUser() throws DAOException {
		log.trace("testInsertUser() invoked.");
		

		// 1. UserTr 객체 생성 => SQL의 바인드변수들에 넘겨줄 파라미터
		UserDTO userDTO = new UserDTO("testId", "testName",'T',"testNick","01012344321","test@test.com","testProfile",'F','Y','Y','Y','Y');
		log.info("\t+ 1-2. userDTO: {}", userDTO);
		
		// 2. Mapper Interface 의 추상메소드 호출 파라미터 전달
		int affectedLines = this.usermapper.insertUser(userDTO);
		log.info("\t+ 2. affectedLines: {}", affectedLines);
		
		// 3. 입력 검증
		assert affectedLines == 1;
	} // testInsertUser
	
//	@Disabled
	@Test
	@Order(2)
	@DisplayName("2. UserMapper.testInsertTr() test.")
	@Timeout(value=5, unit=TimeUnit.SECONDS)
	void testInsertTr() throws DAOException {
		log.trace("testInsertTr() invoked.");
		

		// 1. UserTr 객체 생성 => SQL의 바인드변수들에 넘겨줄 파라미터
		TrainerDTO trainerDTO = new TrainerDTO("testPwd!","testCareer","testIntro",1234567890);
		log.info("\t+ 1-1. trainerDTO: {}", trainerDTO);
	
		// 2. Mapper Interface 의 추상메소드 호출 with BoardVO 파라미터 전달
		int affectedLines = this.usermapper.insertTr(trainerDTO);
		log.info("\t+ 2. affectedLines: {}", affectedLines);
		
		// 3. 입력 검증
		assert affectedLines == 1;
	} // testInsertTr
	
//  아이디 중복 테스트
//	@Disabled
	@Test
	@Order(3)
	@DisplayName("2. UserMapper.testSelectId() test.")
	@Timeout(value=5, unit=TimeUnit.SECONDS)
	void testSelectId() throws DAOException {
		log.trace("testSelectId() invoked.");
		
		String findId = "tr1";
		int cnt;
		cnt = this.usermapper.selectId(findId);

		log.trace("\t+ cnt: {}", cnt);
	} // testSelectId

	
} // end class
