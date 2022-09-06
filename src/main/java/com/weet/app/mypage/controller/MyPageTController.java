package com.weet.app.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@RequestMapping("/mypageT/")	// Base URI
@Controller
public class MyPageTController {
	
	// =======================================================
		// 1. 트레이너회원 - 마이페이지 - 내활동 페이지 - TR게시판
	// =======================================================
	
	@GetMapping("/activity/boardlist")
	public String myBoardList() {
		log.trace("myBoardList() invoked.");
		
		return "mypageT/activity/boardlist";
	} // myBoardList
	
	// =======================================================
		// 2. 트레이너회원 - 마이페이지 - 내활동 페이지 - 좋아요
	// =======================================================
	
	@GetMapping("/activity/boardlike")
	public String myBoardLike() {
		log.trace("myBoardLike() invoked.");
		
		return "mypageT/activity/boardlike";
	} // myBoardLike
	
	// =======================================================
		// 3. 트레이너회원 - 마이페이지 - 내활동 페이지 - 댓글
	// =======================================================
	
	@GetMapping("/activity/boardreplye")
	public String myBoardReplye() {
		log.trace("myBoardReplye() invoked.");
		
		return "mypageT/activity/boardreplye";
	} // myBoardReply
	
	// =======================================================
		// 3. 트레이너회원 - 마이페이지 - 내활동 페이지 - TR게시판 - 답변완료
	// =======================================================
	
	@GetMapping("/activity/boardreplydone")
	public String myBoardReplyDone() {
		log.trace("myBoardReplyDone() invoked.");
		
		return "mypageT/activity/boardreplydone";
	} // myBoardReplyDone
	
	// =======================================================
		// 4. 트레이너회원 - 마이페이지 - 내클래스룸 - 내클래스룸
	// =======================================================
	
	@GetMapping("/class/my")
	public String myClass() {
		log.trace("myClass() invoked.");
		
		return "mypageT/class/my";
	} // myClass
	
	// =======================================================
		// 5. 트레이너회원 - 마이페이지 - 내클래스룸 - 수강 종료 클래스룸 (***)
	// =======================================================
	
	@GetMapping("/class/expired")
	public String expiredClass() {
		log.trace("expiredClass() invoked.");
		
		return "mypageT/class/expired";
	} // expiredClass
	
	// =======================================================
		// 5. 트레이너회원 - 마이페이지 - 내클래스룸 - 클래스 검수
	// =======================================================
	
	@GetMapping("/class/progress")
	public String classProgress() {
		log.trace("classProgress() invoked.");
		
		return "mypageT/class/progress";
	} // classProgress
	
	// =======================================================
		// 6. 트레이너회원 - 마이페이지 - 마이바디
	// =======================================================
	
	@GetMapping("/mybody")
	public String myBody() {
		log.trace("myBody() invoked.");
		
		return "mypageT/mybody";
	} // myBody
	
	// =======================================================
		// 7. 트레이너회원 - 마이페이지 - 내정보 - 프로필 조회
	// =======================================================
	
	@GetMapping("/profile/myprofile")
	public String profile() {
		log.trace("profile() invoked.");
		
		return "mypageT/profile/myprofile";
	} // profile
	
	// =======================================================
		// 8. 트레이너회원 - 마이페이지 - 내정보 - 프로필 수정
	// =======================================================
	
	@GetMapping("/profile/editprofile")
	public String editProfile() {
		log.trace("editProfile() invoked.");
		
		return "mypageT/profile/editprofile";
	} // editProfile
	
	// =======================================================
		// 9. 트레이너회원 - 마이페이지 - 내정보 - 프로필 수정전 비번 확인
	// =======================================================
	
	@GetMapping("/profile/checkProfile")
	public String checkProfile() {
		log.trace("checkProfile() invoked.");
		
		return "redirect:/mypageT/profile/editprofile";
	} // editProfile
	
	// =======================================================
		// 10. 트레이너회원 - 마이페이지 - 내정보 - 알림
	// =======================================================
	
	@GetMapping("/profile/settings") // 페이지 확인용
	// @PostMapping("/profile/settings")
	public String settings() {
		log.trace("settings() invoked.");
		
		return "mypageT/profile/settings";
	} // settings
	
	// =======================================================
		// 11. 트레이너회원 - 마이페이지 - 내정보 - 탈퇴
	// =======================================================
	
	@GetMapping("/profile/quit")
	public String quit() {
		log.trace("quit() invoked.");
		
		return "mypageT/profile/quit";
	} // quit

} // end class
