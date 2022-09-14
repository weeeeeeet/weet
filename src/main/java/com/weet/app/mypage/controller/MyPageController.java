package com.weet.app.mypage.controller;

import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.weet.app.exception.ControllerException;
import com.weet.app.mypage.domain.Criteria;
import com.weet.app.mypage.domain.MypageBoardVO;
import com.weet.app.mypage.domain.MypageBodyDTO;
import com.weet.app.mypage.domain.MypageClassVO;
import com.weet.app.mypage.domain.MypageReplyVO;
import com.weet.app.mypage.domain.MypageReviewDTO;
import com.weet.app.mypage.domain.PageDTO;
import com.weet.app.mypage.service.MypageService;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@RequestMapping("/mypage/")	// Base URI
@Controller
public class MyPageController implements InitializingBean {
	
	// =======================================================
	// + 의존성 주입
	// =======================================================
	@Setter(onMethod_= {@Autowired})
	private MypageService service;
	
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
			
			return "mypage/activity/boardlist";
			
		} catch(Exception e) {
			throw new ControllerException(e);
		} // try - catch : ServiceException을 ControllerException으로
		
	} // myBoardList
	
	// =======================================================
		// 2. 일반회원 - 마이페이지 - 내활동 페이지 - 좋아요
	// =======================================================
	
	@GetMapping("/activity/boardlike")
	public String myBoardLike(Criteria cri, MypageBoardVO vo,Model model) throws ControllerException {
		log.trace("myBoardLike({}, {}, {}) invoked.", cri, vo, model);
		
		try {
			
			// + uservo를 세션으로 등록하면 꺼내쓰면 된다.
			
			//1. 게시물 출력
			List<MypageBoardVO> list = this.service.getListLike(cri, vo);
			list.forEach(log::info);
			
			// 2. 페이징 처리
			PageDTO pageDTO = new PageDTO( cri, this.service.getTotalLike(vo) );
			model.addAttribute("__PAGENATION__", pageDTO);
			
			// + value가 NULL이면 공유속성에 추가가 안되기에, NULL인지 아닌지 파악하지 않아도 OK!
			model.addAttribute("__LIST__",list);
			
			return "mypage/activity/boardlike";
			
		} catch(Exception e) {
			throw new ControllerException(e);
		} // try - catch : ServiceException을 ControllerException으로
		
	} // myBoardLike
	
	// =======================================================
		// 3. 일반회원 - 마이페이지 - 내활동 페이지 - 댓글
	// =======================================================
	
	@GetMapping("/activity/boardreplye")
	public String myBoardReplye( Criteria cri, MypageReplyVO vo,Model model ) throws ControllerException {
		log.trace("myBoardReplye({}, {}, {}) invoked.", cri, vo, model);
		
		try {
			
			// + uservo를 세션으로 등록하면 꺼내쓰면 된다.
			
			//1. 게시물 출력
			List<MypageReplyVO> list = this.service.getListReply(cri, vo);
			list.forEach(log::info);
			
			// 2. 페이징 처리
			PageDTO pageDTO = new PageDTO( cri, this.service.getTotalReplies(vo) );
			model.addAttribute("__PAGENATION__", pageDTO);
			
			// + value가 NULL이면 공유속성에 추가가 안되기에, NULL인지 아닌지 파악하지 않아도 OK!
			model.addAttribute("__LIST__",list);
			
			return "mypage/activity/boardreplye";
			
		} catch(Exception e) {
			throw new ControllerException(e);
		} // try - catch : ServiceException을 ControllerException으로
		
	} // myBoardReply
	
	// =======================================================
		// 3. 일반회원 - 마이페이지 - 내활동 페이지 - TR게시판 - 답변완료
	// =======================================================
	
	@GetMapping("/activity/boardreplydone")
	public String myBoardReplyDone(Criteria cri, MypageBoardVO vo,Model model ) throws ControllerException {
		log.trace("myBoardReplyDone({}, {}, {}) invoked.", cri, vo, model);
		
		try {
			
			//1. 게시물 출력
			List<MypageBoardVO> list = this.service.getListReplyDone(cri, vo);
			list.forEach(log::info);
			
			// 2. 페이징 처리
			PageDTO pageDTO = new PageDTO( cri, this.service.getTotalReply(vo) );
			model.addAttribute("__PAGENATION__", pageDTO);
			
			// + value가 NULL이면 공유속성에 추가가 안되기에, NULL인지 아닌지 파악하지 않아도 OK!
			model.addAttribute("__LIST__",list);
			
			return "mypage/activity/boardreplydone";
			
		} catch(Exception e) {
			throw new ControllerException(e);
		} // try - catch : ServiceException을 ControllerException으로
		
	} // myBoardReplyDone
	
	// =======================================================
		// 4. 일반회원 - 마이페이지 - 내클래스룸 - 내클래스룸
	// =======================================================
	
	@GetMapping("/class/my")
	public String myClass(Criteria cri, MypageClassVO vo,Model model) throws ControllerException {
		log.trace("myClass() invoked.");
		
		try {
			
			//1. 게시물 출력
			List<MypageClassVO> list = this.service.getListClass(cri, vo);
			list.forEach(log::info);
			
			// 2. 페이징 처리
			cri.setAmount(3);
			PageDTO pageDTO = new PageDTO( cri, this.service.getTotalClass(vo) );
			model.addAttribute("__PAGENATION__", pageDTO);
			
			// + value가 NULL이면 공유속성에 추가가 안되기에, NULL인지 아닌지 파악하지 않아도 OK!
			model.addAttribute("__LIST__",list);
			
			return "mypage/class/my";
			
		} catch(Exception e) {
			throw new ControllerException(e);
		} // try - catch : ServiceException을 ControllerException으로
		
	} // myClass
	
	// =======================================================
		// 5. 일반회원 - 마이페이지 - 내클래스룸 - 수강 종료 클래스룸 (***)
	// =======================================================
	
	@GetMapping("/class/expired") // 페이지 확인용
	public String expiredClass(Criteria cri, MypageClassVO vo,Model model) throws ControllerException {
		log.trace("expiredClass() invoked.");
		
		try {
			
			//1. 게시물 출력
			List<MypageClassVO> list = this.service.getListDoneClass(cri, vo);
			list.forEach(log::info);
			
			// 2. 페이징 처리
			cri.setAmount(3);
			PageDTO pageDTO = new PageDTO( cri, this.service.getTotalDoneClass(vo) );
			model.addAttribute("__PAGENATION__", pageDTO);
			
			// + value가 NULL이면 공유속성에 추가가 안되기에, NULL인지 아닌지 파악하지 않아도 OK!
			model.addAttribute("__LIST__",list);
			
			return "mypage/class/expired";
			
		} catch(Exception e) {
			throw new ControllerException(e);
		} // try - catch : ServiceException을 ControllerException으로
		
	} // expiredClass
	
	// =======================================================
		// + 후기 등록
	// =======================================================
	// + MultipartFile에는 파일만 들어가게 된다.
	// =======================================================
	
	@PostMapping("/class/expired/register")
	public String ClassReplyregister (MypageReviewDTO dto, RedirectAttributes rttrs) throws ControllerException {
		
		log.trace("\t + ClassReplyregister({}, {}) invoked.", dto, rttrs);
		
		try {
			
			// + 필드에 주입받은 서비스 객체의 메소드 호출 -> 핵심 메소드 호출
			if ( this.service.addReview(dto) ) {
				
				rttrs.addAttribute("__RESULT__", "success");
				
			} else {
				rttrs.addAttribute("__RESULT__", "failed");
			} // if - else
			
			// + 업데이트 한 후에는 전체 목록 조회 페이지로 이동해야 한다. (***)
			return "redirect:/mypage/activity/boardlist?userId=user2";
			
		} catch(Exception e) { 
			throw new ControllerException (e);
		} // try - catch
		
	} // ClassReplyregister
	
	// =======================================================
		// + 파일 업로드
	// =======================================================
	
	// =======================================================
		// 6. 일반회원 - 마이페이지 - 내클래스룸 - 예약 클래스룸
	// =======================================================
	
	@GetMapping("/class/before")
	public String beforeClass(MypageClassVO vo,Model model) throws ControllerException {
		log.trace("beforeClass() invoked.");
		
		try {
			
			//1. 게시물 출력
			List<MypageClassVO> list = this.service.getListPreClass(vo);
			list.forEach(log::info);
						
			// + value가 NULL이면 공유속성에 추가가 안되기에, NULL인지 아닌지 파악하지 않아도 OK!
			model.addAttribute("__LIST__",list);
			
			return "mypage/class/before";
			
		} catch(Exception e) {
			throw new ControllerException(e);
		} // try - catch : ServiceException을 ControllerException으로
		
	} // beforeClass
	
	// =======================================================
		// 7. 일반회원 - 마이페이지 - 내클래스룸 - 찜 한 클래스룸
	// =======================================================
	
	@GetMapping("/class/like")
	public String likeClass(MypageClassVO vo,Model model) throws ControllerException {
		log.trace("likeClass() invoked.");
		
		try {
			
			//1. 게시물 출력
			List<MypageClassVO> list = this.service.getListLikeClass(vo);
			list.forEach(log::info);
						
			// + value가 NULL이면 공유속성에 추가가 안되기에, NULL인지 아닌지 파악하지 않아도 OK!
			model.addAttribute("__LIST__",list);
			
			return "mypage/class/like";
			
		} catch(Exception e) {
			throw new ControllerException(e);
		} // try - catch : ServiceException을 ControllerException으로
		
	} // likeClass
	
	// =======================================================
		// 8. 일반회원 - 마이페이지 - 마이바디
	// =======================================================
	
	@GetMapping("/mybody")
	public String myBody(MypageBodyDTO vo,Model model) throws ControllerException {
		log.trace("myBody() invoked.");
		
		try {
			
			// 1. 게시물 출력
			List<MypageBodyDTO> list = this.service.getListMybody(vo);
			list.forEach(log::info);
			
			// 2. 오늘의 날짜 구하기
			Date now = new Date();	
			
			// 3. 데이터 별 JS 배열 생성
			Date [] dateArr = list.stream().map( e -> e.getBodyDate()).toArray(Date[]::new);
			log.info("\t + >>>>>>>>>>>> dateArr : {}", Arrays.toString(dateArr));
			
			double [] weightArr = list.stream().mapToDouble( e -> e.getBodyWeight()).toArray();
			log.info("\t + >>>>>>>>>>>> weightArr : {}", Arrays.toString(weightArr));
			
			double [] fatPctArr = list.stream().mapToDouble( e -> e.getBodyFatPct()).toArray();
			log.info("\t + >>>>>>>>>>>> fatPctArr : {}", Arrays.toString(fatPctArr));
			
			// + value가 NULL이면 공유속성에 추가가 안되기에, NULL인지 아닌지 파악하지 않아도 OK!
			model.addAttribute("__DATE__", now);
			model.addAttribute("__LIST__",list);
			
			model.addAttribute("weightArr", weightArr);
			model.addAttribute("dateArr",dateArr);
			model.addAttribute("fatPctArr", fatPctArr);
			
			return "mypage/mybody";
			
		} catch(Exception e) {
			throw new ControllerException(e);
		} // try - catch : ServiceException을 ControllerException으로
		
	} // myBody
	
	// =======================================================
		// 9. 일반회원 - 마이페이지 - 구매내역
	// =======================================================
	
	@GetMapping("/pay/paylist")
	public String payList() {
		log.trace("payList() invoked.");
		
		return "mypage/pay/paylist";
	} // paylist
	
	// =======================================================
		// 10. 일반회원 - 마이페이지 - 구매내역 - 구매 상세 내역
	// =======================================================
	
	@GetMapping("/pay/detail")
	public String detailPay() {
		log.trace("detailPay() invoked.");
		
		return "mypage/pay/detail";
	} // detailPay
	
	// =======================================================
		// 11. 일반회원 - 마이페이지 - 내정보 - 프로필 조회
	// =======================================================
	
	@GetMapping("/profile/myprofile")
	public String profile() {
		log.trace("profile() invoked.");
		
		return "mypage/profile/myprofile";
	} // profile
	
	// =======================================================
		// 12. 일반회원 - 마이페이지 - 내정보 - 프로필 수정
	// =======================================================
	
	@GetMapping("/profile/editprofile")
	public String editProfile() {
		log.trace("editProfile() invoked.");
		
		return "mypage/profile/editprofile";
	} // editProfile
	
	// =======================================================
		// 13. 일반회원 - 마이페이지 - 내정보 - 알림
	// =======================================================
	
	@GetMapping("/profile/settings") // 페이지 확인용
	// @PostMapping("/profile/settings")
	public String settings() {
		log.trace("settings() invoked.");
		
		return "mypage/profile/settings";
	} // settings
	
	// =======================================================
		// 14. 일반회원 - 마이페이지 - 내정보 - 탈퇴
	// =======================================================
	
	@GetMapping("/profile/quit")
	public String quit() {
		log.trace("quit() invoked.");
		
		return "mypage/profile/quit";
	} // quit

} // end class
