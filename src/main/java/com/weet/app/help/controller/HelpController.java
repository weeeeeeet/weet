package com.weet.app.help.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.weet.app.help.domain.PageMakerDTO;
import com.weet.app.exception.ControllerException;
import com.weet.app.exception.ServiceException;
import com.weet.app.help.domain.Criteria;
import com.weet.app.help.domain.HelpDTO;
import com.weet.app.help.domain.HelpVO;
import com.weet.app.help.service.HelpService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@AllArgsConstructor

@RequestMapping("/help/")
@Controller
public class HelpController {

	@Setter(onMethod_= {@Autowired})
	private HelpService helpService;
	
//	=======================================================================
//  1대 1 문의
//	=======================================================================
	
	// 1. 1대1 문의 목록 조회 요청
	@GetMapping("inquiry")
	public String inquiryList(Model model) throws ControllerException {
		log.trace("list({}) invoked.", model);
		
		try {
			List<HelpVO> list = this.helpService.selectInquiryList();
			model.addAttribute("INQUIRY_LIST", list);
		} catch (ServiceException e) {
			throw new ControllerException(e);
		}
		return "/help/inquiryList";
	} // list
	
	
	// -------------------------------------------
	// 2. 신규 1대1 문의 등록 화면 요청
	@GetMapping("/inquiry/register")
	public String inquiryRegisterView() {
		log.trace("inquiryRegister() invoked.");
		
		return "/help/inquiryWrite";
	} // register
	
	
	// -------------------------------------------
	// 3. 신규 1대1 문의글 생성 요청 처리
	@PostMapping("/inquiry/register")
	public String inquiryRegister(HelpDTO dto, RedirectAttributes rttrs) throws ControllerException {
		log.debug("modify({}, {}) invoked.", dto, rttrs);
		
		try {
			if(this.helpService.createInquiry(dto)) {
				rttrs.addFlashAttribute("_RESULT_", "SUCCESS");
			} else {
				rttrs.addFlashAttribute("_RESULT_", "FAILED");
			} // if-else
			
			return "redirect:/help/inquiry";
		} catch(Exception e) {
			throw new ControllerException(e);
		} // try-catch
	} // inquiryRegister
	
	
	// -------------------------------------------
	// 4. 특정 문의글 상세조회 화면 요청
	@GetMapping("/inquiry/read")
	public String get(HelpDTO dto, Model model) throws ControllerException {
		log.trace("get({}, {}) invoked.", dto, model);
		
		try {	
			HelpVO vo = this.helpService.readInquiry(dto);
			log.info("\t+ vo: " + vo);
			
			// value가 NULL이면, 공유속성으로 추가 안됨(***) => if문 필요 없음
			model.addAttribute("_INQUIRY_", vo);
		} catch(Exception e) {
			throw new ControllerException(e);
		} // try-catch
		return "/help/inquiryRead";
	} // get
	
	
	// -------------------------------------------
	// 5. 특정 문의글 삭제 요청 처리
	@PostMapping("/inquiry/remove")
	public String remove(HelpDTO dto, RedirectAttributes rttrs) throws ControllerException {	
		log.trace("modify({}, {}) invoked.", dto, rttrs);
		
		try {
			if(this.helpService.removeInquiry(dto)) {
				rttrs.addFlashAttribute("_RESULT_", "SUCCESS"); // redirect되는 타겟 jsp의 request scope에 저장된다.
			} else {
				rttrs.addFlashAttribute("_RESULT_", "FAILED");
			} // if-else
			
			return "redirect:/help/inquiry";
		} catch (Exception e) {
			throw new ControllerException(e);
		} // try-catch
	} // remove
	
	
	// -------------------------------------------
	// 6. 특정 문의글 수정 화면 요청
	@GetMapping("/inquiry/modify")
	public String getModify(HelpDTO dto, Model model) throws ControllerException {
		log.trace("get({}, {}) invoked.", dto, model);
		
		try {	
			HelpVO vo = this.helpService.readInquiry(dto);
			log.info("\t+ vo: " + vo);
			
			// value가 NULL이면, 공유속성으로 추가 안됨(***) => if문 필요 없음
			model.addAttribute("_INQUIRY_", vo);
		} catch(Exception e) {
			throw new ControllerException(e);
		} // try-catch
		return "/help/inquiryModify";
	} // getModify
	
	
	// -------------------------------------------
	// 7. 게시판에 기존 게시글 수정 요청 처리 (***)
	@PostMapping("/inquiry/modify")
	public String modify(HelpDTO dto, RedirectAttributes rttrs) throws ControllerException {
		log.debug("modify({}, {}) invoked.", dto, rttrs);
		
		try {
			if(this.helpService.updateInquiry(dto)) {
				rttrs.addAttribute("_RESULT_", "SUCCESS");
			} else {
				rttrs.addAttribute("_RESULT_", "FAILED");
			}
			
			return "redirect:/help/inquiry";
		} catch (Exception e) {
			throw new ControllerException(e);
		} // try-catch
	} // modify
	
	
//	=======================================================================
//  자주 묻는 질문
//	=======================================================================
	
	// 1. 자주 묻는 질문 목록 조회 요청 (페이징처리 / 검색처리)
	@GetMapping("/qna")
	public String qnaList(Model model, Criteria cri) throws ControllerException {
		log.trace("qnaList() invoked.");
		
		try {
			model.addAttribute("QNA_LIST", helpService.selectQnaList(cri));
			
			int total = helpService.getTotal(cri);
			
			PageMakerDTO pageMake = new PageMakerDTO(cri, total);
			model.addAttribute("pageMaker", pageMake);
			
		} catch (ServiceException e) {
			throw new ControllerException(e);
		} // try-catch
		return "/help/qnaList";
	} // qnaList
	
	
	// 2. 자주 묻는 질문 상세조회 화면 요청
	@GetMapping("/qna/read")
	public String qnaGet(HelpDTO dto, Model model) throws ControllerException {
		log.trace("get({}, {}) invoked.", dto, model);
		
		try {	
			HelpVO vo = this.helpService.readQna(dto);
			log.info("\t+ vo: " + vo);
			
			// value가 NULL이면, 공유속성으로 추가 안됨(***) => if문 필요 없음
			model.addAttribute("_QNA_", vo);
		} catch(Exception e) {
			throw new ControllerException(e);
		} // try-catch
		return "/help/qnaRead";
	} // qnaGet
	
	
//	=======================================================================
//  공지사항
//	=======================================================================
	
	// 1. 공지사항 목록 조회 요청 (페이징처리)
	@GetMapping("/notice")
	public String noticeList(Criteria cri, Model model) throws ControllerException {
		log.trace("noticeList() invoked.");
		
		try {
			model.addAttribute("NOTICE_LIST", helpService.selectNoticeList(cri));
			
			int total = helpService.getTotalNotice(cri);
			
			PageMakerDTO pageMake = new PageMakerDTO(cri, total);
			model.addAttribute("pageMaker", pageMake);
			
		} catch (ServiceException e) {
			throw new ControllerException(e);
		} // try-catch
		return "/help/noticeList";
	} // qnaList
	
	
	// 2. 공지사항 상세조회 화면 요청
	@GetMapping("/notice/read")
	public String noticeGet(HelpDTO dto, Model model) throws ControllerException {
		log.trace("get({}, {}) invoked.", dto, model);
		
		try {	
			HelpVO vo = this.helpService.readNotice(dto);
			log.info("\t+ vo: " + vo);
			
			// value가 NULL이면, 공유속성으로 추가 안됨(***) => if문 필요 없음
			model.addAttribute("_NOTICE_", vo);
		} catch(Exception e) {
			throw new ControllerException(e);
		} // try-catch
		return "/help/noticeRead";
	} // qnaGet
} // end class
