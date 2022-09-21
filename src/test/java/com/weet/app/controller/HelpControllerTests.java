package com.weet.app.controller;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.concurrent.TimeUnit;

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
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MockMvcBuilder;
import org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@ExtendWith(SpringExtension.class)

@ContextConfiguration(locations = {
		"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})

@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class HelpControllerTests {
	
	@Autowired
	private WebApplicationContext ctx;
	
	@BeforeAll
	public void setUp() {
		log.trace("setUp() invoked.");
		
		assertNotNull(this.ctx);
		log.info("\t+ this.ctx: {}", this.ctx);
	} // setUp
	
	
	@Disabled
	@Test
	@Order(1)
	@DisplayName("1. HelpMapper.Register() test")
	@Timeout(value=5, unit=TimeUnit.SECONDS)
	public void testRegister() throws Exception {
		log.trace("testRegister() invoked.");
		
		MockMvcBuilder builder = MockMvcBuilders.webAppContextSetup(ctx);
		MockMvc mockMvc = builder.build();
		
		MockHttpServletRequestBuilder reqBuilder = MockMvcRequestBuilders.post("/help/inquiry/register");
		reqBuilder.param("cs_title", "TITLE_NEW");
		reqBuilder.param("cs_content", "CONTENT_NEW");
		reqBuilder.param("qna_type", "2");
		reqBuilder.param("qna_phone", "01012345678");
		reqBuilder.param("qna_agmt_yn", "Y");
		
		String viewName = 
			mockMvc.
				perform(reqBuilder).
				andReturn().
				getModelAndView().
				getViewName();
		log.info("\t+ viewName: {}", viewName);
	} // testRegister
} // end class
