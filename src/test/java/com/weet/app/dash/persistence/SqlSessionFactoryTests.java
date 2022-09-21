package com.weet.app.dash.persistence;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Disabled;
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
import com.weet.app.dash.mapper.TimeMapper;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})

@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class SqlSessionFactoryTests {
	
//	@Resource(type=SqlSessionFactory.class) 비추
//	@Resource	비추
//	@Inject		비추
//	@Autowired	비추
	@Setter(onMethod_= {@Autowired}) // 추천
	private SqlSessionFactory sqlSessionFactory;
	
	@BeforeAll
	void beforeAll() {
		log.trace("beforeAll() invoked.");
		
		assertNotNull(this.sqlSessionFactory);
		log.trace("\t+ this.sqlSessionFacory: {}", this.sqlSessionFactory);
	} // beforeAll
	
	@Disabled
	@Test
	@Order(1)
	@DisplayName("1. testSQLMapper1")
	@Timeout(value = 1000, unit = TimeUnit.MILLISECONDS)
	void testSQLMapper1() {
		log.trace("testSQLMapper1() invoked.");
		
		SqlSession sqlSession = this.sqlSessionFactory.openSession();
		
		try(sqlSession;) {
			String namespace = "sql1mapper";
			String sqlId = "DQL1";
			
			String mappedStatement = new StringBuffer().
										append(namespace).
										append(".").
										append(sqlId).
										toString();
			
			List<NoticeVO> list = sqlSession.<NoticeVO>selectList(mappedStatement, 100);
			
			list.forEach(log::info);
		} // try-with-resources
	} // testSQLMapper1
	
	@Disabled
	@Test
	@Order(2)
	@DisplayName("2. testSQLMapper2")
	@Timeout(value = 1000, unit = TimeUnit.MILLISECONDS)
	void testSQLMapper2() {
		log.trace("testSQLMapper2() invoked.");
		
		SqlSession sqlSession = this.sqlSessionFactory.openSession();
		
		try(sqlSession;) {
			String namespace = "sql2mapper";
			String sqlId = "DQL2";
			
			String sql = new StringBuffer().
							append(namespace).
							append(".").
							append(sqlId).
							toString();
			
			Map<String, Object> map = new HashMap<>();
			map.put("email", "A%");
			map.put("salary", 3000);
			
			List<NoticeVO> list = sqlSession.<NoticeVO>selectList(sql, map);
			list.forEach(log::info);
		} // try-with-resources
	} // testSQLMapper2
	
//	@Disabled
	@Test
	@Order(3)
	@DisplayName("3. testGetCurrentTime1")
	@Timeout(value = 1000, unit = TimeUnit.MILLISECONDS)
	void testGetCurrentTime1() {
		log.trace("testGetCurrentTime1() invoked.");
		
		SqlSession sqlSession = this.sqlSessionFactory.openSession();
		
		try(sqlSession;) {
			
			TimeMapper mapper = sqlSession.getMapper(TimeMapper.class);
			assert mapper != null;
			
			log.info("\t+ mapper: {}", mapper);
			
			String currentTime = mapper.getCurrentTime1();
			log.info("\t+ currentTIme: {}", currentTime);
			
		} // try-with-resources
	} // testGetCurrentTime1
	
} // end class
