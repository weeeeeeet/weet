package com.weet.app.board.mapper;

import java.util.List;

import com.weet.app.board.domain.BoardVO;
import com.weet.app.board.domain.ReplyVO;
import com.weet.app.exception.DAOException;

public interface BoardMapper {
	
	// 인기게시글 상위10 목록 조회
	public abstract List<BoardVO> selectListTop10() throws DAOException;
	
	// 댓글 목록
	public abstract List<ReplyVO> selectReplyList(int commId, boolean preview) throws DAOException;

} // end interface
