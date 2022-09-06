package com.weet.app.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@RequestMapping("/")
@Controller
public class MainController {
	
	@GetMapping("/")
	public String goMain() {
		log.trace("goMain() invoked.");
		
		
		return "index";
	} // goMain
	
}