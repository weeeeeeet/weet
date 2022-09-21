package com.weet.app.dash.service;

import java.util.List;

import com.weet.app.dash.domain.FeedbackVO;
import com.weet.app.exception.ServiceException;

public interface FoodFeedbackService {
	
	// 1. 식단 전체 목록을 조회하여 리스트로 반환해주는 메소드
	public abstract List<FeedbackVO> getAllFoodList() throws ServiceException;

	// 1-1. 코칭계획 전체 목록을 조회하여 리스트로 반환해주는 메소드
//	public abstract List<NoticeVO> getAllCoachingList() throws ServiceException;
	
	// 2. 공지사항 특정 게시글 상세조회 요청 처리
//	public abstract NoticeVO read(NoticeContentDTO dto) throws ServiceException;

	
	
} // end interface
