package com.weet.app.board.mapper;

import java.util.List;

import com.weet.app.board.domain.BoardVO;
import com.weet.app.board.domain.ReplyVO;
import com.weet.app.common.domain.Criteria;
import com.weet.app.exception.DAOException;

public interface BoardMapper {
	
	// 최근 7일 인기게시글 상위10 목록 조회
	public abstract List<BoardVO> selectListTop10() throws DAOException;
	
	// 댓글 목록 조회
	public abstract List<ReplyVO> selectReplyList(int commId, boolean preview) throws DAOException;
	
	// 전체 게시글 조회
	public abstract List<BoardVO> selectAllList(String keyword, Criteria cri) throws DAOException;
	
	// 게시글 수 카운트
	public abstract int selectListCount(String keyword) throws DAOException;
	
	// 게시글 상세조회
	public abstract BoardVO selectOneBoard(int commId) throws DAOException;

} // end interface
