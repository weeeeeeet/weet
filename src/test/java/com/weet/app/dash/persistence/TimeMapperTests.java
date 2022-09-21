package com.weet.app.dash.persistence;

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
public class TimeMapperTests {
	
	@Setter(onMethod_= { @Autowired })
	private TimeMapper timeMapper;

	
	@BeforeAll
	void beforeAll() {
		log.trace("beforeAll() invoked.");
		
		assertNotNull(this.timeMapper);
		log.info("\t+ this.timeMapper: {}", this.timeMapper);
	} // beforeAll
	
	@Test
	@Order(1)
	@DisplayName("1. testGetCurrentTime1")
	@Timeout(value = 3, unit = TimeUnit.SECONDS)
	void testGetCurrentTime1() {
		log.trace("testGetCurrentTime1() invoked.");
		
		String now = this.timeMapper.getCurrentTime1();
		log.info("\t+ now : {}", now);
	} // testGetCurrentTime1
	
	@Test
	@Order(2)
	@DisplayName("2. testGetCurrentTime2")
	@Timeout(value = 3, unit = TimeUnit.SECONDS)
	void testGetCurrentTime2() {
		log.trace("testGetCurrentTime2() invoked.");
		
		String now = this.timeMapper.getCurrentTime2();
		log.info("\t+ now : {}", now);
	} // testGetCurrentTime2
} // end class
