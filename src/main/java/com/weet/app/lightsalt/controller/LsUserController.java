package com.weet.app.lightsalt.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@RequestMapping("/lightsalt/user")
@Controller
public class LsUserController {

	// 1. 회원 목록
	@GetMapping("/userlist")
	public String UserList() {
		log.trace("UserList() invoked.");
		
		return "/lightsalt/adminUserList";
	} // inactiveUserList


	// 2. 휴면/탈퇴회원 목록
	@GetMapping("/inactive")
	public String inactiveUserList() {
		log.trace("inactiveUserList() invoked.");
		
		return "/lightsalt/adminInactiveUser";
	} // inactiveUserList
	
	
	// 3. 회원 검색
	@GetMapping("/search")
	public String userSearch() {
		log.trace("userSearch() invoked.");
		
		return "/lightsalt/adminUserList";
	} // userSearch
	
	
	// 4.휴면/탈퇴회원 검색
	@GetMapping("/inactive/search")
	public String inactiveUserSearch() {
		log.trace("inactiveUserSearch() invoked.");
		
		return "/lightsalt/adminInactiveUser";
	} // inactiveUserSearch
	

	// 5.휴면/탈퇴회원 삭제
	@PostMapping("/inactive/delete")
	public String inactiveUserDelete() {
		log.trace("inactiveUserDelete() invoked.");
		
		return "redirect:/lightsalt/user/inactive";
	} // inactiveUserDelete
	
}
