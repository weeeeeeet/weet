package com.weet.app.lightsalt.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@RequestMapping("/lightsalt/class")
@Controller
public class LsClassController {

	// 1. 등록클래스
	@GetMapping("/reglist")
	public String regClassList() {
		log.trace("regClassList() invoked.");
		
		return "/lightsalt/adminClass1";
	} // regClassList
	
	// 2. 클래스신청
	@GetMapping("/reqlist")
	public String classRequest() {
		log.trace("classRequest() invoked.");
		
		return "/lightsalt/adminClass2";
	} // classRequest	
	
	// 2. 반려클래스
	@GetMapping("/refuselist")
	public String rejectClassList() {
		log.trace("rejectClassList() invoked.");
		
		return "/lightsalt/adminClass3";
	} // rejectClassList	

	
	// 3. 클래스신청 반려
	@PostMapping("/rejectclass")
	public String classReject() {
		log.trace("classReject() invoked.");
		
		return "/lightsalt/adminClass2";
	} // classReject	
	
	
	// 4. 클래스신청 승인
	@PostMapping("/acceptclass")
	public String classAccept() {
		log.trace("classAccept() invoked.");
		
		return "/lightsalt/adminClass3";
	} // classAccept	
	
	
	// 5. 등록 클래스 삭제
	@PostMapping("/regdelete")
	public String regClassDelete() {
		log.trace("regClassDelete() invoked.");
		
		return "redirect:/lightsalt/class/regClassList";
	} // regClassDelete	
	
	// 6. 반려 클래스 삭제
	@PostMapping("/rejdelete")
	public String regectClassDelete() {
		log.trace("regectClassDelete() invoked.");
		
		return "redirect:/lightsalt/class/rejectClassList";
	} // regectClassDelete	
	

}
