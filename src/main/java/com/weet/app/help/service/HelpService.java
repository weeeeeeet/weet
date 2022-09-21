package com.weet.app.help.service;

import java.util.List;

import com.weet.app.help.domain.HelpVO;
import com.weet.app.help.domain.Criteria;
import com.weet.app.exception.ServiceException;
import com.weet.app.help.domain.HelpDTO;

public interface HelpService {
	
//	====================== 1대1 문의 ======================= //
	// 1대1 문의 목록
	public abstract List<HelpVO> selectInquiryList() throws ServiceException;
	
	// 1대1 문의 글쓰기
	public abstract boolean createInquiry(HelpDTO dto)throws ServiceException;
	
	// 1대1 문의 상세 조회
	public abstract HelpVO readInquiry(HelpDTO dto) throws ServiceException;
	
	// 1대1 문의 삭제
	public abstract boolean removeInquiry(HelpDTO dto) throws ServiceException;
	
	// 1대1 문의 수정
	public abstract boolean updateInquiry(HelpDTO dto) throws ServiceException;
	
//	=================== 자주 묻는 질문 ==================== //
	
	// 자주 묻는 질문 목록
	public List<HelpVO> selectQnaList(Criteria cri) throws ServiceException;
	
	// 자주 묻는 질문 갯수
	public abstract int getTotal(Criteria cri);
	
	// 자주 묻는 질문 상세 조회
	public abstract HelpVO readQna(HelpDTO dto) throws ServiceException;
	
//	======================= 공지사항 ====================== //
	
	// 공지사항
	public List<HelpVO> selectNoticeList(Criteria cri) throws ServiceException;
	
	// 공지사항 갯수
	public abstract int getTotalNotice(Criteria cri);
	
	// 공지사항 상세 조회
	public abstract HelpVO readNotice(HelpDTO dto) throws ServiceException;
	
} // end interface
