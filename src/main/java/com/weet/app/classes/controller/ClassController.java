package com.weet.app.classes.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.weet.app.classes.domain.ClassDetailVO;
import com.weet.app.classes.domain.ClassVO;
import com.weet.app.classes.domain.Criteria2;
import com.weet.app.classes.domain.PageMakerDTO;
import com.weet.app.classes.domain.ReviewVO;
import com.weet.app.classes.domain.TotalReviewVO;
import com.weet.app.classes.service.ClassService;
import com.weet.app.common.domain.Criteria;
import com.weet.app.common.domain.PageDTO;
import com.weet.app.exception.ControllerException;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@RequestMapping("/class")
@Controller
public class ClassController {
	
	@Setter(onMethod_= @Autowired)
	private ClassService service;
	
//	클래스 목록 페이지 (페이징처리 / 검색처리) --------------------------------
	@GetMapping("/search")
	public String searchClass(Model model, Criteria2 cri) throws ControllerException {
		log.trace("searchClass() invoked.");
		
		try {
			model.addAttribute("_LIST_ALL_", service.getClassPaging(cri));
			
			int total = service.getTotal(cri);
			
			// 페이징 처리
			PageMakerDTO pageMake = new PageMakerDTO(cri, total);
			model.addAttribute("pageMaker", pageMake);
			
		} catch(Exception e) {
			throw new ControllerException(e);
		} //try-catch
		
		return "/class/classSearch";
	} // searchClass

	
// ================================================================================== //
	
//	메인페이지-> +더보기(추천 클래스) --------------------------------
	@GetMapping("/search/recommend")
	public String searchClassRecommend(Model model, Criteria2 cri) throws ControllerException {
		log.trace("searchClassRecommend() invoked.");
		
		try {
			List<ClassVO> listAll = this.service.getListRecommendAll();
			model.addAttribute("_LIST_ALL_", listAll);
		} catch(Exception e) {
			throw new ControllerException(e);
		} //try-catch
		
		return "/class/classSearch";
	} // searchClass
	
//	메인페이지-> +더보기(마감임박 클래스) --------------------------------
	@GetMapping("/search/end")
	public String searchClassEnd(Model model, Criteria2 cri) throws ControllerException {
		log.trace("searchClassEnd() invoked.");
		
		try {
			List<ClassVO> listAll = this.service.getListEndAll();
			model.addAttribute("_LIST_ALL_", listAll);
		} catch(Exception e) {
			throw new ControllerException(e);
		} //try-catch
		
		return "/class/classSearch";
	} // searchClass
	
//	메인페이지-> +더보기(신규 클래스) --------------------------------
	@GetMapping("/search/new")
	public String searchClassNew(Model model, Criteria2 cri) throws ControllerException {
		log.trace("searchClassNew() invoked.");
		
		try {
			List<ClassVO> listAll = this.service.getListNewAll();
			model.addAttribute("_LIST_ALL_", listAll);
		} catch(Exception e) {
			throw new ControllerException(e);
		} //try-catch
		
		return "/class/classSearch";
	} // searchClass
	

// ======================================================================= // 
// 	클래스 등록 
// ======================================================================= // 
	
//	클래스 등록 시작 페이지 ---------------------------
	@GetMapping("/reg")
	public String classRegPage() {
		log.trace("classRegPage() invoked.");
		
		return "/class/reg";
	} // classRegPage
	

//	---------------------------------------------------
	@GetMapping("/reg/1")
	public String classReg1Page() {
		log.trace("classReg1Page() invoked.");
		
		return "/class/reg1";
	} // classReg1Page
	
	@PostMapping("/reg/1")
	public String classReg1(@RequestParam("classType") String classType, 
			@RequestParam("classTitle") String classTitle,
			@RequestParam("classIntro") String classIntro,
			@RequestParam("classVideoUrl") String classVideoUrl,
			HttpServletRequest request) {
		log.trace("classReg1() invoked.");
		
		HttpSession session = request.getSession();
		session.setAttribute("classType", classType);
		session.setAttribute("classTitle", classTitle);
		session.setAttribute("classIntro", classIntro);
		session.setAttribute("classVideoUrl", classVideoUrl);
		
		return "redirect:/class/reg/2";
	} // classReg1
	
	
//	---------------------------------------------------
	@GetMapping("/reg/2")
	public String classReg2Page() {
		log.trace("classReg2Page() invoked.");
		
		return "/class/reg2";
	} // classReg2Page
	
	@PostMapping("/reg/2")
	public String classReg2() {
		log.trace("classReg2() invoked.");
		
		return "/class/reg2";
	} // classReg2
	
	
//	---------------------------------------------------
	@GetMapping("/reg/3")
	public String classReg3Page() {
		log.trace("classReg3Page() invoked.");
		
		return "/class/reg3";
	} // classReg3Page
	
	@PostMapping("/reg/3")
	public String classReg3() {
		log.trace("classReg3() invoked.");
		
		return "/class/reg3";
	} // classReg3
	
	
//	---------------------------------------------------
	@GetMapping("/reg/4")
	public String classReg4Page() {
		log.trace("classReg4Page() invoked.");
		
		return "/class/reg4";
	} // classReg4Page
	
	@PostMapping("/reg/4")
	public String classReg4() {
		log.trace("classReg4() invoked.");
		
		return "/class/reg5";
	} // classReg4
	
	
//	클래스 등록 완료 페이지 ---------------------------
	@GetMapping("/reg/fin")
	public String classRegFin() {
		log.trace("classRegFin() invoked.");
		
		return "/class/regFin";
	} // classRegFin

	
	
// ======================================================================= // 
// 	클래스 상세페이지 
// ======================================================================= // 	
	
	// 클래스 상세페이지 조회
	@GetMapping("/detail/{id}")
	public String classDetail(@PathVariable("id") String classId, Model model) throws ControllerException {
		log.trace("classDetail() invoked.");
		
		try {
			ClassDetailVO vo = this.service.getDetail(classId);
			TotalReviewVO review = this.service.getreviewInfo(classId);
			
			model.addAttribute("__CLASS__", vo);
			model.addAttribute("__REVIEW__", review);
		} catch(Exception e) {
			throw new ControllerException(e);
		} // try-catch 
		
		return "/class/classDetail";
	} // classDetail
	
	
	// 리뷰조회
	@ResponseBody
	@GetMapping("/reviews/{classId}")
	public Map<String, Object> classReviews(
		@PathVariable("classId") String classId, 
		Criteria cri) throws ControllerException {
		
		log.trace("classReviews() invoked.");
		
		try { 
			PageDTO paging = new PageDTO(cri, this.service.getreviewInfo(classId).getTotalReview());
			List<ReviewVO> vo = this.service.getReviews(classId, cri); 
			
			Map<String, Object> data = new HashMap<>();
			data.put("paging", paging);
			data.put("reviews", vo);
			
			return data;
		} catch(Exception e) { throw new ControllerException(e); } // try-catch 
	} // classReviews
	
	// 전체 좋아요 수 반환
	@ResponseBody
	@GetMapping("/likes/{classId}")
	public int classLikes(@PathVariable("classId") String classId) throws ControllerException {
		log.trace("classLikes({}) invoked.", classId);
		
		try { return this.service.getTotalLikes(classId); } 
		catch(Exception e) { throw new ControllerException(e); } // try-catch 
	} // classLikes
	
	// 좋아요 여부 체크
	@ResponseBody
	@PostMapping("/likes/check")
	public boolean isLikeChecked(String classId, String userId) throws ControllerException {
		log.trace("classLikes({}, {}) invoked.", classId, userId);
		
		try { return this.service.checkMyLike(classId, userId); } 
		catch(Exception e) { throw new ControllerException(e); } // try-catch 
	} // isLikeChecked
	
	// 조와요~~~!
	@ResponseBody
	@PutMapping("/likes/{classId}/{userId}")
	public boolean like(
		@PathVariable("classId") String classId, 
		@PathVariable("userId") String userId) throws ControllerException {
		
		log.trace("like({}, {}) invoked.", classId, userId);
		
		try { return this.service.classLike(classId, userId); } 
		catch(Exception e) { throw new ControllerException(e); } // try-catch 
	} // classLike
	
	// 싫어요~~! (좋아요 취소하기)
	@ResponseBody
	@DeleteMapping("/likes/{classId}/{userId}")
	public boolean likeCancel(
		@PathVariable("classId") String classId,
		@PathVariable("userId") String userId) throws ControllerException {
		
		log.trace("likeCancel({}, {}) invoked.", classId, userId);
		
		try { return this.service.cancelClassLike(classId, userId); } 
		catch(Exception e) { throw new ControllerException(e); } // try-catch 
	} // likeCancel
	
} // end class
