package com.weet.app.user.controller;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.aspectj.lang.annotation.Before;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.web.context.WebApplicationContext;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

// For JUnit 5
@ExtendWith(SpringExtension.class)


@ContextConfiguration(locations= {
	"file:src/main/webapp/**/*-context.xml"
})

// Spring MVC 의 Controller 를 테스트 하려면,
// 반드시 아래의 어노테이션을 하나 더 붙여줘야 합니다. (***)
@WebAppConfiguration
public class UserFindControllerTests {
	
	// Controller 를 테스트 하려면, Spring Beans Container를 주입받아야 합니다.!!!! (***)
	@Autowired
	private WebApplicationContext ctx;
	
	
	@Before(value = "")
	public void setup() {
		log.trace("setup() invoked.");
		
		assertNotNull(this.ctx);
		log.info("\t+ this.ctx: {}", this.ctx);
	} // setup
	
	
	

} // end class
