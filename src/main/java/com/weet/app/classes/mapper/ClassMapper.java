package com.weet.app.classes.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.weet.app.classes.domain.ClassDetailVO;
import com.weet.app.classes.domain.ClassVO;
import com.weet.app.classes.domain.Criteria2;
import com.weet.app.classes.domain.ReviewVO;
import com.weet.app.classes.domain.TotalReviewVO;
import com.weet.app.common.domain.Criteria;
import com.weet.app.exception.DAOException;

public interface ClassMapper {

//	메인 / 클래스 목록 =====================================================================	
	
	// 추천 클래스
	public abstract List<ClassVO> selectClassRecommend() throws DAOException;
	public abstract List<ClassVO> selectClassRecommendAll() throws DAOException; // +더보기

	// 마감임박 클래스
	public abstract List<ClassVO> selectClassEnd() throws DAOException;
	public abstract List<ClassVO> selectClassEndAll() throws DAOException;		 // +더보기
	
	// 신규 클래스
	public abstract List<ClassVO> selectClassNew() throws DAOException;
	public abstract List<ClassVO> selectClassNewAll() throws DAOException;		 // +더보기
	
	// 모든 클래스(클래스 검색 페이지)
	public abstract List<ClassVO> selectAllClass() throws DAOException;
	
	// 페이징을 적용한 클래스 목록
	public abstract List<ClassVO> selectClassPaging(Criteria2 cri) throws DAOException;
	
	// 총 개수
	public int getTotal(Criteria2 cri);
	
	
//	클래스 상세보기 =====================================================================
	
	// 클래스 상세보기
	public abstract ClassDetailVO selectDetail(String classId) throws DAOException;
	
	// 리뷰 보기
	public abstract List<ReviewVO> selectReviews(@Param("classId") String classId, @Param("cri") Criteria cri) throws DAOException;

	// 해당 클래스 리뷰요약 보기
	public abstract TotalReviewVO selectTotalReviewInfo(String classId) throws DAOException;
	
	// 총 좋아요 수 카운트
	@Select("SELECT count(wish_id) FROM t_like_class WHERE class_id = #{classId}")
	public abstract int selectLikes(String classId) throws DAOException;
	
	// 좋아요 체크
	@Select("SELECT count(wish_id) FROM t_like_class WHERE class_id = #{classId} AND user_id = #{userId}")
	public abstract int selectMyLike(String classId, String userId) throws DAOException;
	
	// 좋아요 추가
	public abstract int insertMyLike(String classId, String userId) throws DAOException;
	
	// 좋아요 취소(삭제)
	public abstract int deleteMyLike(String classId, String userId) throws DAOException;
} // end interface
