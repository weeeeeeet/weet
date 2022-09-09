package com.weet.app.board.mapper;

import java.util.List;

import com.weet.app.board.domain.BoardDTO;
import com.weet.app.board.domain.BoardVO;
import com.weet.app.board.domain.ReplyDTO;
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
	
	// 게시글 작성
	public abstract int insertBoard(BoardDTO dto) throws DAOException;
	
	// 게시글 수정
	public abstract int updateBoard(BoardDTO dto) throws DAOException;
	
	// 조회수 업데이트
	public abstract int updateViewCount(int commId) throws DAOException;
	
	// 댓글수 업데이트
	public abstract int updateReplyCount(int commId) throws DAOException;
	
	// 추천수 업데이트
	public abstract int updateLikeCount(int commId) throws DAOException;
	
	// 게시글 삭제
	public abstract int deleteBoard(int commId) throws DAOException;
	
	// 게시글 추천
	public abstract int insertBoardLike(String userId, int commId) throws DAOException;
	
	// 게시글 추천삭제
	public abstract int deleteBoardLike(String userId, int commId) throws DAOException;
	
	// 댓글 작성
	public abstract int insertReply(ReplyDTO dto) throws DAOException;
	
	// 댓글 그룹 업데이트
	public abstract int updateReplyGroup(ReplyDTO dto) throws DAOException;
	
	// 댓글 수정
	public abstract int updateReply(ReplyDTO dto) throws DAOException;
	
	// 댓글 삭제
	public abstract int deleteReply(int replyId) throws DAOException;
	
	// 대댓글 작성
	
	// 대댓글 수정
	
	// 대댓글 삭제
	
} // end interface
