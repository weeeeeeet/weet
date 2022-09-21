package com.weet.app.dash.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.weet.app.dash.domain.FeedbackVO;
import com.weet.app.dash.domain.NoticeContentDTO;
import com.weet.app.dash.domain.NoticeVO;
import com.weet.app.dash.service.FoodFeedbackService;
import com.weet.app.dash.service.NoticeService;
import com.weet.app.exception.ControllerException;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@RequestMapping("/dashboard/user/")	// Base URI
@Controller
public class UserDashboardController{
	
	// 비지니스계층의 빈(bean) 주입
	@Setter(onMethod_= {@Autowired})
	private NoticeService noticeService;
	
	@Setter(onMethod_= {@Autowired})
	private FoodFeedbackService foodfeedbackService;
	
	// invoked. 로그가 찍히지 않음 => log4j 파일 수정 해결
	
	//-----------------------------------------------------------------------//
	//	userDashboard : 회원 대시보드 (클래스 공지사항, 이번주 코칭계획 목록조회 요청 처리 핸들러 메소드)
	//-----------------------------------------------------------------------//
	@GetMapping("/noticeplan") // http://localhost:8080/dashboard/user/noticeplan
	public String userDashboard(Model model) throws ControllerException {
		log.trace("userDashboard({}) invoked.",model);
		
		try {
			List<NoticeVO> list = this.noticeService.getAllNoticeList();
			List<NoticeVO> coachinglist = this.noticeService.getAllCoachingList();
			list.forEach(log::info);
			
			// null이 아니면 model 상자에 넣어주고, null이면 안들어감
			// value가 NULL 이면, 공유속성으로 추가안됨(***) => if문 필요없음

			model.addAttribute("__NOTICELIST__", list);	// 클래스 공지사항
			model.addAttribute("__COACHINGLIST__", coachinglist);	// 이번주 코칭계획

			return "/dashboard/userDashboard"; //=> /WEB-INF/views/ + dashboard/userDashboard + .jsp
			
		} catch(Exception e) {
			throw new ControllerException(e);
		} // try-catch

	} // userDashboard

	
	//-----------------------------------------------------------------------------//
	//	userDashboard : 회원 대시보드 (클래스 공지사항, 이번주 코칭계획 내용 조회)
	//-----------------------------------------------------------------------------//
	// http://localhost:8080/dashboard/user/noticeplan/detail?n_num=notice9
	@GetMapping("/noticeplan/detail") // http://localhost:8080/dashboard/user/noticeplan/detail
	public String userDashboardContents(NoticeContentDTO dto, Model  model) throws ControllerException {
		log.trace("userDashboardContents({}, {}) invoked.", dto, model);
		
		// 특정 n_num 값에 해당하는 게시글 하나 읽어서 vo 객체로 만들어, __NOTICECONTENTS__ key로 모델에 넣어둠
		// request scope에 공유속성으로 추가
		
		try {
			NoticeVO noticeVo = this.noticeService.getNoticeContents(dto);
			NoticeVO coachingVo = this.noticeService.getCoachingContents(dto);
			
			log.info("\t+ vo: " + noticeVo);
			log.info("\t+ vo: " + coachingVo);
			
			// value가 NULL 이면, 공유속성으로 추가안됨(***) => if문 필요없음
			model.addAttribute("__NOTICECONTENTS__", noticeVo);	
			model.addAttribute("__COACHINGCONTENTS__", coachingVo);	
			
			// 회원 컨텐츠 페이지
			return "/dashboard/userDashboardContents"; //=> /WEB-INF/views/ + dashboard/userDashboardContents + .jsp
			
		} catch(Exception e) {
			throw new ControllerException(e);
		} // try-catch
		
	} // userDashboardContents
	
	//----------------------------------------------------------------------------//
	//	userFoodFeedback : 회원 식단 목록 대시보드 (내 식단 조회 리스트)
	//----------------------------------------------------------------------------//
	// 한페이지에 작성, 조회가 둘다 있는데 post 방식 같이 하는게 좋을지 분리하는게 좋을지?
	// get방식이던 post던 다 나눠놔야함! url은 동일하게!
	
	@GetMapping("/food") // http://localhost:8080/dashboard/user/food
	public String userFoodFeedback(Model model) throws ControllerException {
		log.trace("userFoodFeedback({}) invoked.", model);
		
		try {
			List<FeedbackVO> list = this.foodfeedbackService.getAllFoodList();
			List<FeedbackVO> coachinglist = this.foodfeedbackService.getAllFoodList();
			list.forEach(log::info);
			
			// null이 아니면 model 상자에 넣어주고, null이면 안들어감
			// value가 NULL 이면, 공유속성으로 추가안됨(***) => if문 필요없음

			model.addAttribute("__FOODLIST__", list);	// 식단 리스트
	
//			log.trace("\t+ ===============================list: {}", list);
			
			//식단을 올리면 바로 식단목록에 반영된다
			return "/dashboard/userFoodFeedback"; //=> /WEB-INF/views/ + dashboard/userFoodFeedback + .jsp
			
		} catch(Exception e) {
			throw new ControllerException(e);
		} // try-catch
		
		
	} // userFoodFeedback
	
	//----------------------------------------------------------------------------//
	//	userFoodFeedback : 회원 식단 피드백 대시보드 (오늘의 식단 작성)
	//----------------------------------------------------------------------------//
	
	@PostMapping("/food")// http://localhost:8080/dashboard/user/food
	public String userFoodWrite() {
		log.trace("userFoodWrite() invoked.");
		
		
		
		//식단 올린후 식단 목록 페이지로 리다이렉트 (페이지 이동x)
		return "redirect:/dashboard/user/food"; //=> /WEB-INF/views/ + dashboard/userFoodFeedback + .jsp
	} // userFoodWrite
	
	
	
	//----------------------------------------------------------------------------//
	//	userFoodFeedback : 회원 식단 피드백 대시보드 (오늘의 식단 수정)
	//----------------------------------------------------------------------------//
	
	@PostMapping("/food/update")// http://localhost:8080/dashboard/user/food/update
	public String userfoodUpdate(Model model) throws ControllerException {
		log.trace("userfoodUpdate({}) invoked.", model);
		
		//수정 후 식단 상세 페이지로 리다이렉트, (트레이너가 피드백 댓글을 작성하면 수정 x)
		return "redirect:/dashboard/user/food/detail"; //=> /WEB-INF/views/ + dashboard/userDashboardContents + .jsp
			
	} // userFoodFeedbackWrite

	//----------------------------------------------------------------------------//
	//	userFoodFeedback : 회원 식단 피드백 대시보드 (오늘의 식단 삭제)
	//----------------------------------------------------------------------------//
	@ResponseBody
	@PostMapping("/food/delete")// http://localhost:8080/dashboard/user/food/delete
	public int userfoodDelete() {
		log.trace("userfoodUpdate() invoked.");
		
		//삭제하면 모달창으로 한번 더 확인후 삭제가 성공하면 1을 리턴, 실패하면 0으로 리턴
		return 1;
	} // userFoodFeedbackWrite

	
	//-----------------------------------------------------------------//
	//	userFeedbackContents : 회원 식단 피드백 내용
	//-----------------------------------------------------------------//
	@GetMapping("/food/detail") // http://localhost:8080/dashboard/user/food/detail
	public String userFeedbackContents() {
		log.trace("userFeedbackContents() invoked.");
		
		return "/dashboard/userFeedbackContents"; //=> /WEB-INF/views/ + dashboard/userFeedbackContents + .jsp
	} // userFeedbackContents
	
	
	//-----------------------------------------------------------------//
	//	userScheduleCheck : 회원 스케쥴 확인 
	//-----------------------------------------------------------------//
	@GetMapping("/schedule") // http://localhost:8080/dashboard/user/schedule
	public String userScheduleCheck() {
		log.trace("userScheduleCheck() invoked.");
		
		return "/dashboard/userScheduleCheck"; //=> /WEB-INF/views/ + dashboard/userScheduleCheck + .jsp
	}// userScheduleCheck

	
//	=============================================


} // end class
