package com.weet.app.lightsalt.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@RequestMapping("/lightsalt/connect/")
@Controller
public class ConnectController {

	// 1. 공지사항 / FAQ 목록
	@GetMapping("/list")
	public String faqList() {
		log.trace("faqList() invoked.");
		
		return "/lightsalt/adminNotiFaq";
	} // faqList
	
	// 2. 공지사항 / FAQ 등록페이지
	@GetMapping("/reg")
	public String faqRegPage() {
		log.trace("faqRegPage() invoked.");
			
		return "/lightsalt/adminNotiFaqReg";
	} // faqRegPage
	
	// 2. 공지사항 / FAQ 등록
	@PostMapping("/reg")
	public String faqReg() {
		log.trace("faqReg() invoked.");
		
		return "redirect:/lightsalt/connect/list";
	} // faqReg
	
	
	// 3. 공지사항 / FAQ 삭제
	@PostMapping("/delete")
	public String faqDelete() {
		log.trace("faqDelete() invoked.");
		
		return "redirect:/lightsalt/connect/help";
	} // faqDelete
	
	// 4. 1:1 문의 목록
	@GetMapping("/qa")
	public String qaList() {
		log.trace("qaList() invoked.");
		
		return "/lightsalt/adminQna";
	} // qaList
	
	// 5. 1:1 문의 상세
	@GetMapping("/qa/detail")
	public String qaDetail() {
		log.trace("qaDetail() invoked.");
		
		return "/lightsalt/adminQna";
	} // qaDetail
	
	// 6. 1:1 문의 답변 작성
	@PostMapping("/qa/reg")
	public String qaRegist() {
		log.trace("qaRegist() invoked.");
		
		return "/lightsalt/adminQna";
	} // qaRegist
	
	// 7. 1:1 문의 삭제
	@PostMapping("/qa/delete")
	public String qaDelete() {
		log.trace("qaDelete() invoked.");
		
		return "redirect:/lightsalt/connect/qa";
	} // qaDelete
}
