package com.weet.app.classes.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.weet.app.classes.domain.ClassDetailVO;
import com.weet.app.classes.domain.ReviewVO;
import com.weet.app.classes.domain.TotalReviewVO;
import com.weet.app.common.domain.Criteria;
import com.weet.app.exception.ServiceException;

public interface ClassService {
	
	// 클래스 상세조회
	public abstract ClassDetailVO getDetail(String classId) throws ServiceException;
	
	// 리뷰보기
	public abstract List<ReviewVO> getReviews(@Param("classId") String classId, @Param("cri") Criteria cri) throws ServiceException;

	// 전체리뷰 정보보기
	public abstract TotalReviewVO getreviewInfo(String classId) throws ServiceException;
	
	// 총 좋아요 수 가져오기
	public abstract int getTotalLikes(String classId) throws ServiceException;
	
	// 좋아요 여부 체크하기
	public abstract boolean checkMyLike(String classId, String userId) throws ServiceException;
	
	// 조와요~~
	public abstract boolean classLike(String classId, String userId) throws ServiceException;
	
	// 좋아요 취소 흑흑
	public abstract boolean cancelClassLike(String classId, String userId) throws ServiceException;
} // end interface
