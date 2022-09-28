package com.weet.app.dash.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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

@RequestMapping("/dashboard/tr")	// Base URI
@Controller
public class TrainerDashboardController {
	
	// 비지니스계층의 빈(bean) 주입_
		@Setter(onMethod_= {@Autowired})
		private NoticeService noticeService;
		
		@Setter(onMethod_= {@Autowired})
		private FoodFeedbackService foodfeedbackService;
	
//	동일한 url에 get방식 post 방식 두개를 만들어야한다
//	등록, 변경, 삭제는 redirect ***
	
	//----------------------------------------------------------------------------------//
	//	trDashboard : 트레이너 대시보드 (클래스 공지사항 , 이번주 코칭계획)
	//----------------------------------------------------------------------------------//
	@GetMapping("/noticeplan") // http://localhost:8080/dashboard/tr/noticeplan
	public String trDashboard(Model model) throws ControllerException {
		log.trace("trDashboard({}) invoked.", model);
		
		try {
			List<NoticeVO> list = this.noticeService.getAllNoticeList();
			List<NoticeVO> coachinglist = this.noticeService.getAllCoachingList();
			list.forEach(log::info);
			
			// null이 아니면 model 상자에 넣어주고, null이면 안들어감
			// value가 NULL 이면, 공유속성으로 추가안됨(***) => if문 필요없음

			model.addAttribute("__NOTICELIST__", list);	// 클래스 공지사항
			model.addAttribute("__COACHINGLIST__", coachinglist);	// 이번주 코칭계획

			return "/dashboard/trDashboard"; //=> /WEB-INF/views/ + dashboard/trDashboard + .jsp
			
		} catch(Exception e) {
			throw new ControllerException(e);
		} // try-catch
		
	} // trDashboard
	
	//----------------------------------------------------------------------------------//
	//	trDashboardContents : 트레이너 대시보드 (클래스 공지사항 , 이번주 코칭계획 조회)
	//----------------------------------------------------------------------------------//
	@GetMapping("/noticeplan/detail") // http://localhost:8080/dashboard/tr/noticeplan/detail
	public String trDashboardContents(NoticeContentDTO dto, Model model) throws ControllerException {
		log.trace("trDashboardContents({}, {}) invoked.", dto, model);
		
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
			return "/dashboard/trDashboardContents"; //=> /WEB-INF/views/ + dashboard/trDashboard + .jsp
			
		} catch(Exception e) {
			throw new ControllerException(e);
		} // try-catch
		
	} // trDashboardContents
	
	//----------------------------------------------------------------------------------//
	//	trDashboardContentsWrite : 트레이너 대시보드 (클래스 공지사항 , 이번주 코칭계획 작성 창)
	//----------------------------------------------------------------------------------//
	@GetMapping("/noticeplan/write") // http://localhost:8080/dashboard/tr/noticeplan/write
	public String trDashboardContentsWrite() {
		log.trace("trDashboardContentsWrite() invoked.");
		
		//작성 창 요청
		return "/dashboard/trDashboardContentsWrite"; //=> /WEB-INF/views/ + dashboard/trDashboardContents + .jsp
	} // trDashboardContentsWrite
	
	//----------------------------------------------------------------------------------//
	//	trNoticePlanWrite : 트레이너 대시보드 (클래스 공지사항 , 이번주 코칭계획 작성 )
	//----------------------------------------------------------------------------------//
	@PostMapping("/noticeplan/write") // http://localhost:8080/dashboard/tr/noticeplan/write
	public String trNoticePlanWrite(NoticeContentDTO dto, RedirectAttributes rttrs) throws ControllerException {
		log.trace("trNoticePlanWrite({}) invoked.", dto);
		
		try { // 필드에 주입받은 서비스 객체의 메소드 호출 => 핵심 비지니스 로직 수행
			if(this.noticeService.contentCreate(dto)) {
//				rttrs.addFlashAttribute("_RESULT_", "SUCCEED");		// Request Scope의 공유속성으로 전달
				rttrs.addAttribute("_RESULT_", "SUCCEED");			// 전송파라미터로 전달(GET방식의 쿼리스트링 형태)
			} else {
//				rttrs.addFlashAttribute("_RESULT_", "FAILED");		// Request Scope의 공유속성으로 전달
				rttrs.addAttribute("_RESULT_", "FAILED");			// 전송파라미터로 전달(GET방식의 쿼리스트링 형태)
			} // if-else
			
			//작성후 공지사항 목록 창으로 리다이렉트
			return "redirect:/dashboard/tr/noticeplan"; //=> /WEB-INF/views/ + dashboard/trDashboardContents + .jsp
		} catch(Exception e) {
			throw new ControllerException(e);
		} // try-catch

	} // trNoticePlanWrite
	
	//----------------------------------------------------------------------------------//
	//	trDashboardContents : 트레이너 대시보드 (클래스 공지사항, 이번주 코칭계획  수정)
	//----------------------------------------------------------------------------------//
	@PostMapping("/noticeplan/update") // http://localhost:8080/dashboard/tr/noticeplan/update
	public String trNoticePlanUpdate() {
		log.trace("trNoticePlanUpdate() invoked.");
		
		//수정 후 게시글 내용 창으로 리다이렉트
		return "redirect:/dashboard/tr/noticeplan/detail"; //=> /WEB-INF/views/ + dashboard/trDashboardContents + .jsp
	} // trNoticePlanUpdate
	
	//----------------------------------------------------------------------------------//
	//	trDashboardContents : 트레이너 대시보드 (클래스 공지사항 삭제)
	//----------------------------------------------------------------------------------//
	@ResponseBody
	@PostMapping("/notice/delete") // http://localhost:8080/dashboard/tr/notice/delete
	public int trNoticeDelete() {
		log.trace("trNoticeDelete() invoked.");
		
		//삭제하면 모달창으로 한번 더 확인후 삭제가 성공하면 1을 리턴, 실패하면 0으로 리턴
		return 1; 
	} // trNoticeDelete
	
	
	//----------------------------------------------------------------------------------//
	//	trDashboardContents : 트레이너 대시보드 (이번주 코칭계획 삭제)
	//----------------------------------------------------------------------------------//
	@ResponseBody
	@PostMapping("/plan/delete") // http://localhost:8080/dashboard/tr/plan/delete
	public int trPlanDelete() {
		log.trace("trPlanDelete() invoked.");
		
		//삭제하면 모달창으로 한번 더 확인후 삭제가 성공하면 1을 리턴, 실패하면 0으로 리턴
		return 1; 
	} // trPlanDelete
	

	//----------------------------------------------------------------------------------//
	//	trFeedbackList : 트레이너 식단 피드백 회원 목록
	//----------------------------------------------------------------------------------//
	@GetMapping("/foodfb") // http://localhost:8080/dashboard/tr/foodfb
	public String trFeedbackList() {
		log.trace("trFeedbackList() invoked.");
		
		return "/dashboard/trFeedbackList"; //=> /WEB-INF/views/ + dashboard/trFeedbackList + .jsp
	} // trFeedbackList
	
	//----------------------------------------------------------------------------------//
	//	trFoodFeedback : 트레이너 식단 피드백 관리
	//----------------------------------------------------------------------------------//
	@GetMapping("/foodfb/manage") // http://localhost:8080/dashboard/tr/foodfb/manage
	public String trFoodFeedback(Model model) throws ControllerException {
		log.trace("trFoodFeedback({}) invoked.", model);
		
		try {
			List<FeedbackVO> list = this.foodfeedbackService.getAllFoodList();
			List<FeedbackVO> coachinglist = this.foodfeedbackService.getAllFoodList();
			list.forEach(log::info);
			
			// null이 아니면 model 상자에 넣어주고, null이면 안들어감
			// value가 NULL 이면, 공유속성으로 추가안됨(***) => if문 필요없음

			model.addAttribute("__FOODLIST__", list);	// 식단 리스트
	
//			log.trace("\t+ ===============================list: {}", list);
			
			//식단을 올리면 바로 식단목록에 반영된다
			return "/dashboard/trFoodFeedback"; //=> /WEB-INF/views/ + dashboard/trFoodFeedback + .jsp
		
		} catch(Exception e) {
			throw new ControllerException(e);
		} // try-catch

	} // trFoodFeedback
	
	//----------------------------------------------------------------------------------//
	//	trFoodFeedbackContents : 트레이너 식단 피드백 상세
	//----------------------------------------------------------------------------------//
	@GetMapping("/foodfb/detail") // http://localhost:8080/dashboard/trainer/foodfb/detail
	public String trFoodFeedbackContents() {
		log.trace("trFoodFeedbackContents() invoked.");
		
		return "/dashboard/trFoodFeedbackContents"; //=> /WEB-INF/views/ + dashboard/trFoodFeedbackContents + .jsp
	} // trFoodFeedbackContents
	
	//----------------------------------------------------------------------------------//
	//	trfoodFbWrite : 트레이너 식단 피드백 작성
	//----------------------------------------------------------------------------------//
	@PostMapping("/foodfb/write") // http://localhost:8080/dashboard/tr/foodfb/write
	public String trfoodFbWrite() {
		log.trace("trfoodFbWrite() invoked.");
		
		//작성 후 식단 피드백 상세 페이지로 리다이렉트 (페이지 이동x)
		return "redirect:/dashboard/tr/foodfb/detail"; //=> /WEB-INF/views/ + dashboard/trFoodFeedbackContents + .jsp
	} // trfoodFbWrite
	
	//----------------------------------------------------------------------------------//
	//	trFoodFeedbackContents : 트레이너 식단 피드백 수정
	//----------------------------------------------------------------------------------//
	@PostMapping("/foodfb/update") // http://localhost:8080/dashboard/tr/foodfb/update
	public String trfoodFbUpdate() {
		log.trace("trfoodFbUpdate() invoked.");
		
		//수정 후 식단 피드백 상세 페이지로 리다이렉트 (페이지 이동x)
		return "redirect:/dashboard/tr/foodfb/detail"; //=> /WEB-INF/views/ + dashboard/trFoodFeedbackContents + .jsp
	} // trfoodFbUpdate
	
	//----------------------------------------------------------------------------------//
	//	trFoodFeedbackContents : 트레이너 식단 피드백 삭제
	//----------------------------------------------------------------------------------//
	@ResponseBody
	@PostMapping("/foodfb/delete") // http://localhost:8080/dashboard/trainer/foodfb/delete
	public int trfoodFbDelete() {
		log.trace("trfoodFbDelete() invoked.");
		
		//삭제하면 모달창으로 한번 더 확인후 삭제가 성공하면 1을 리턴, 실패하면 0으로 리턴
		return 1; 
	} // trfoodFbDelete
	
	//----------------------------------------------------------------------------------//
	//	trScheduleManagement : 트레이너 스케쥴 관리
	//----------------------------------------------------------------------------------//
	@GetMapping("/schedule")// http://localhost:8080/dashboard/tr/schedule
	public String trScheduleManagement() {
		log.trace("trScheduleManagement() invoked.");
		
		
		
		return "/dashboard/trScheduleManagement"; //=> /WEB-INF/views/ + dashboard/trScheduleManagement + .jsp
	} // trScheduleManagement
	
	
} // end class
