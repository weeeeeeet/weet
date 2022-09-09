package com.weet.app.classes.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.weet.app.classes.domain.ClassVO;
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
	
	// 클래스 검색
	@GetMapping("/search")
	public String searchClass() {
		log.trace("searchClass() invoked.");
		
		return "/class/classSearch";
	} // searchClass

	// 클래스 상세페이지 조회
	@GetMapping("/detail/{id}")
	public String classDetail(@PathVariable("id") String classId, Model model) throws ControllerException {
		log.trace("classDetail() invoked.");
		
		try {
			ClassVO vo = this.service.getDetail(classId);
			TotalReviewVO review = this.service.getreviewInfo(classId);
			
			model.addAttribute("__CLASS__", vo);
			model.addAttribute("__REVIEW__", review);
		} catch(Exception e) {
			throw new ControllerException(e);
		} // try-catch 
		
		return "/class/classDetail";
	} // classDetail
	
	// 클래스 등록 창 GET
	@GetMapping("/reg")
	public String classRegPage() {
		log.trace("classDetail() invoked.");
		
		return "/class/reg1";
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
