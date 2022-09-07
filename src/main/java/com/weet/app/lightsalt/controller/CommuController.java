package com.weet.app.lightsalt.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@RequestMapping("/lightsalt/commu")
@Controller
public class CommuController {

	// 1. 게시글 목록
	@GetMapping("/board")
	public String boardList() {
		log.trace("boardList() invoked.");
		
		return "/lightsalt/adminCommuBoard";
	} // boardList
	

	// 2. 게시글 검색
	@GetMapping("/board/search")
	public String boardSearch() {
		log.trace("boardSearch() invoked.");
		
		return "/lightsalt/adminCommuBoard";
	} // boardSearch
	
	// 3. 게시글 삭제
	@PostMapping("/board/delete")
	public String boardDelete() {
		log.trace("boardDelete() invoked.");
		
		return "redirect:/lightsalt/commu/board";
	} // boardDelete
	
	// 4. 댓글 목록
	@GetMapping("/reply")
	public String replyList() {
		log.trace("replyList() invoked.");
		
		return "/lightsalt/adminCommuReply";
	} // replyList
	
	// 5. 댓글 검색
	@GetMapping("/reply/search")
	public String replySearch() {
		log.trace("replySearch() invoked.");
		
		return "/lightsalt/adminCommuReply";
	} // replySearch
	
	// 6. 댓글 삭제
	@PostMapping("/reply/delete")
	public String replyDelete() {
		log.trace("replyDelete() invoked.");
		
		return "redirect:/lightsalt/manage/replyList";
	} // replyDelete
	
	// 7. 클래스리뷰 목록
	@GetMapping("/review")
	public String reviewList() {
		log.trace("reviewList() invoked.");
		
		return "/lightsalt/adminCommuReview";
	} // reviewList
	
	// 8. 클래스리뷰 검색
	@GetMapping("/review/search")
	public String reviewSearch() {
		log.trace("reviewSearch() invoked.");
		
		return "/lightsalt/adminCommuReview";
	} // reviewSearch
	
	// 9. 클래스리뷰 삭제
	@PostMapping("/review/delete")
	public String reviewDelete() {
		log.trace("reviewDelete() invoked.");
		
		return "redirect:/lightsalt/manage/reviewList";
	} // reviewDelete
	
	
}
