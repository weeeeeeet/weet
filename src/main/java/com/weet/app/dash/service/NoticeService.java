package com.weet.app.dash.service;

import java.util.List;

import com.weet.app.dash.domain.NoticeContentDTO;
import com.weet.app.dash.domain.NoticeVO;
import com.weet.app.exception.ServiceException;

public interface NoticeService {
	
	// 1. 공지사항 전체 목록을 조회하여 리스트로 반환해주는 메소드
	public abstract List<NoticeVO> getAllNoticeList() throws ServiceException;

	// 1-1. 코칭계획 전체 목록을 조회하여 리스트로 반환해주는 메소드
	public abstract List<NoticeVO> getAllCoachingList() throws ServiceException;
	
	// 2. 공지사항 특정 게시글 상세조회 요청 처리
	public abstract NoticeVO getNoticeContents(NoticeContentDTO dto) throws ServiceException;
	
	// 2-1. 코칭사항 특정 게시글 상세조회 요청 처리
	public abstract NoticeVO getCoachingContents(NoticeContentDTO dto) throws ServiceException;

	// 3. 새로운 게시글 생성 요청 처리
	public abstract boolean contentCreate(NoticeContentDTO dto) throws ServiceException;	
	
} // end interface
