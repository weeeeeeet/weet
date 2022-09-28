package com.weet.app.mypage.controller;

import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.weet.app.exception.ControllerException;
import com.weet.app.mypage.domain.Criteria;
import com.weet.app.mypage.domain.MypageBoardVO;
import com.weet.app.mypage.domain.PageDTO;
import com.weet.app.mypage.service.MypageTService;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@RequestMapping("/mypageT/")	// Base URI
@Controller
public class MyPageTController implements InitializingBean {
	
	// =======================================================
	// + 의존성 주입
	// =======================================================
	@Setter(onMethod_= {@Autowired})
	private MypageTService service;
	
	// =======================================================
	// + 의존성 확인
	// =======================================================
	@Override
	public void afterPropertiesSet() throws Exception {
		
		log.trace("afterPropertiesSet() invoked.");
		
		Objects.requireNonNull(this.service);
		log.info("\t + this.service : {}", this.service);
		
	} // afterPropertiesSet
	
	// =======================================================
		// 1. 일반회원 - 마이페이지 - 내활동 페이지 - TR게시판
	// =======================================================
	
	@GetMapping("/activity/boardlist")
	public String myBoardList(Criteria cri, MypageBoardVO vo,Model model) throws ControllerException {
		log.trace("myBoardList({}, {}, {}) invoked.", cri, vo, model);
		
		try {
			
			// + uservo를 세션으로 등록하면 꺼내쓰면 된다.
			
			//1. 게시물 출력
			List<MypageBoardVO> list = this.service.getListPerPage(cri, vo);
			list.forEach(log::info);
			
			// 2. 페이징 처리
			PageDTO pageDTO = new PageDTO( cri, this.service.getTotal(vo) );
			model.addAttribute("__PAGENATION__", pageDTO);
			
			// + value가 NULL이면 공유속성에 추가가 안되기에, NULL인지 아닌지 파악하지 않아도 OK!
			model.addAttribute("__LIST__",list);
			
			return "mypageT/activity/boardlist";
			
		} catch(Exception e) {
			throw new ControllerException(e);
		} // try - catch : ServiceException을 ControllerException으로
		
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
