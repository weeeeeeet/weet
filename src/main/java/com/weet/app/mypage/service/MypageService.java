package com.weet.app.mypage.service;

import java.util.List;

import com.weet.app.exception.ServiceException;
import com.weet.app.mypage.domain.Criteria;
import com.weet.app.mypage.domain.MypageBoardVO;
import com.weet.app.mypage.domain.MypageClassVO;
import com.weet.app.mypage.domain.MypageReplyVO;

public interface MypageService {
	
	// 1. 전체 게시물 - 페이징 처리
	public abstract List <MypageBoardVO> getListPerPage(Criteria cri, MypageBoardVO vo) throws ServiceException;
	
	// + 페이징 처리에 필요한 게시물의 총 양 구하기
	public abstract Integer getTotal(MypageBoardVO vo) throws ServiceException;
	
	// 2. 답변 완료 게시물 - 페이징 처리
	public abstract List <MypageBoardVO> getListReplyDone(Criteria cri, MypageBoardVO vo) throws ServiceException;

	// + 페이징 처리에 필요한 게시물의 총 양 구하기
	public abstract Integer getTotalReply(MypageBoardVO vo) throws ServiceException;
	
	// 3. 좋아요 게시물 - 페이징 처리
	public abstract List <MypageBoardVO> getListLike(Criteria cri, MypageBoardVO vo) throws ServiceException;
	
	// + 페이징 처리에 필요한 게시물의 총 양 구하기
	public abstract Integer getTotalLike(MypageBoardVO vo) throws ServiceException;
	
	// 4. 댓글 조회
	public abstract List <MypageReplyVO> getListReply(Criteria cri, MypageReplyVO vo) throws ServiceException;
	
	// + 페이징 처리에 필요한 댓글의 총 양 구하기
	public abstract Integer getTotalReplies(MypageReplyVO vo) throws ServiceException;
	
	// 5. 수강중인 클래스 조회
	public abstract List <MypageClassVO> getListClass(Criteria cri, MypageClassVO vo) throws ServiceException;
	
	// + 페이징 처리에 필요한 수강중인 클래스의 총 양 구하기
	public abstract Integer getTotalClass(MypageClassVO vo) throws ServiceException;
	
	// 6. 수강 종료 클래스 조회
	public abstract List <MypageClassVO> getListDoneClass(Criteria cri, MypageClassVO vo) throws ServiceException;
	
	// + 페이징 처리에 필요한 수강 종료 클래스의 총 양 구하기
	public abstract Integer getTotalDoneClass(MypageClassVO vo) throws ServiceException;
	
} // end interface
