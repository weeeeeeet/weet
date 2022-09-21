package com.weet.app.dash.controller;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.aspectj.lang.annotation.Before;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MockMvcBuilder;
import org.springframework.test.web.servlet.RequestBuilder;
import org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.ui.ModelMap;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

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
public class userDashboardControllerTests {
	
	// Controller 를 테스트 하려면, Spring Beans Container를 주입받아야 합니다.!!!! (***)
	@Autowired
	private WebApplicationContext ctx;
	
	
	@Before(value = "")
	public void setup() {
		log.trace("setup() invoked.");
		
		assertNotNull(this.ctx);
		log.info("\t+ this.ctx: {}", this.ctx);
	} // setup
	
	
	@Test
	public void testList() throws Exception {
		log.trace("testList() invoked.");
		
		MockMvcBuilder mockMvcBuilder = MockMvcBuilders.webAppContextSetup(ctx);
		MockMvc mockMvc = mockMvcBuilder.build();
		
//		----

		RequestBuilder reqBuilder = MockMvcRequestBuilders.get("/dashboard/userDashboard");
		
//		----
				
		ModelMap modelMap = // ModelMap => LinkedHashMap<String, ArrayList>
//		String viewName =
			mockMvc.
				perform(reqBuilder).
				andReturn().				// MvcResult
				getModelAndView().			// ModelAndView
				getModelMap();				// ModelMap
//				getViewName();				// viewName
		
//		----
		
		// 자원해제 : Map객체 clear + Map객체저장 참조변수값을 null로 지정 => 빠른 GC가 가능해짐
		modelMap.clear();
		modelMap = null;
		
	} // testGetList
	
	
	@Test
	public void testGet() throws Exception {
		log.trace("testGet() invoked.");
		
		MockMvcBuilder mockMvcBuilder = MockMvcBuilders.webAppContextSetup(ctx);
		MockMvc mockMvc = mockMvcBuilder.build();
		
//		----

		MockHttpServletRequestBuilder reqBuilder = MockMvcRequestBuilders.get("/board/get");
		reqBuilder.param("bno", "88");
		
//		----
				
		ModelAndView modelAndView =
			mockMvc.
				perform(reqBuilder).
				andReturn().				// MvcResult
				getModelAndView();			// ModelAndView
				
		log.info("\t+ modelAndView: {}", modelAndView);
	} // testGet
	
	
	@Test
	public void testRegister() throws Exception {
		log.trace("testGetList() invoked.");
		
		MockMvcBuilder builder = MockMvcBuilders.webAppContextSetup(ctx);
		MockMvc mockMvc = builder.build();
		
//		----
		
		MockHttpServletRequestBuilder reqBuilder = MockMvcRequestBuilders.post("/board/register");
		reqBuilder.param("title", "TITLE_NEW");
		reqBuilder.param("content", "CONTENT_NEW");
		reqBuilder.param("writer", "WRITER_NEW");
		
//		----

		ModelAndView modelAndView =
			mockMvc.
				perform(reqBuilder).
				andReturn().
				getModelAndView();
		
		log.info("\t+ modelAndView: {}", modelAndView);
	} // testRegister
	
	
	@Test
	public void testModify() throws Exception {
		log.trace("testModify() invoked.");
		
		MockMvcBuilder builder = MockMvcBuilders.webAppContextSetup(ctx);
		MockMvc mockMvc = builder.build();
		
//		----
		
		MockHttpServletRequestBuilder reqBuilder = MockMvcRequestBuilders.post("/board/modify");
		reqBuilder.param("bno", "111");
		reqBuilder.param("title", "title_modified");
		reqBuilder.param("content", "content_modified");
		reqBuilder.param("writer", "writer_modified");
		
//		----

		ModelAndView modelAndView =
			mockMvc.
				perform(reqBuilder).
				andReturn().
				getModelAndView();
		
		log.info("\t+ modelAndView: {}", modelAndView);
	} // testModify
	
	
	@Test
	public void testRemove() throws Exception {
		log.trace("testRemove() invoked.");
		
		MockMvcBuilder builder = MockMvcBuilders.webAppContextSetup(ctx);
		MockMvc mockMvc = builder.build();
		
//		----
		
		MockHttpServletRequestBuilder reqBuilder = MockMvcRequestBuilders.post("/board/remove");
		reqBuilder.param("bno", "68");
		
//		----

		ModelAndView modelAndView =
			mockMvc.
				perform(reqBuilder).
				andReturn().
				getModelAndView();
		
		log.info("\t+ modelAndView: {}", modelAndView);
	} // testRemove
	
	
	
//	--------------------------------------------------
	
	
	@Test
	public void testListPerPage() throws Exception {
		log.trace("testListPerPage() invoked.");
		
		MockMvcBuilder mockMvcBuilder = MockMvcBuilders.webAppContextSetup(ctx);
		MockMvc mockMvc = mockMvcBuilder.build();
		
//		----

		MockHttpServletRequestBuilder reqBuilder = MockMvcRequestBuilders.get("/board/list");
		reqBuilder.param("currPage", "6"); // 6 페이지
		reqBuilder.param("amount", "5"); // 5개씩
		reqBuilder.param("pagesPerPage", "5");
		
//		----
		// WAS 구동없이 하기 위해서 mockMvc 필요함
		
		ModelAndView modelAndView = // ModelMap => LinkedHashMap<String, ArrayList>
			mockMvc.
				perform(reqBuilder).
				andReturn().				// MvcResult
				getModelAndView();			// ModelAndView

		log.info("\t+ modelAndView: {}", modelAndView);

	} // testListPerPage

} // end class
