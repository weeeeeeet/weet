package com.weet.app.board.service;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import com.weet.app.board.domain.BoardVO;
import com.weet.app.board.domain.CommunityDTO;
import com.weet.app.board.domain.CommunityVO;
import com.weet.app.board.domain.ReplyDTO;
import com.weet.app.board.domain.ReplyVO;
import com.weet.app.common.domain.Criteria;
import com.weet.app.exception.ServiceException;

public interface BoardService {
	
	public static final int[] LEVEL_TRIGGER = { 5, 10, 15 };	// 트레이너 레벨 상승 조건
	
	
	// 인기게시글 top10 조회
	public abstract List<Object> getListTop10() throws ServiceException;
	
	// 전체게시글 목록 조회
	public abstract List<Object> getAllList(String keyword, Criteria cri) throws ServiceException;
	
	// 게시글 수 카운트
	public abstract int getListCount(String keyword) throws ServiceException;
	
	// 게시글 상세 조회
	public abstract Map<String, Object> getOneBoard(int commId) throws ServiceException;
	
	// 대댓글 목록 조회
	public abstract List<ReplyVO> getReReplyList(int commId, int replyGroup) throws ServiceException;
	
	// 게시글 작성
	public abstract boolean createBoard(CommunityDTO dto) throws ServiceException;
	
	// 게시글 수정
	public abstract boolean modifyBoard(CommunityDTO dto) throws ServiceException;
	
	// 게시글 삭제
	public abstract boolean removeBoard(int commId) throws ServiceException;
	
	// 댓글 작성
	public abstract boolean createReply(ReplyDTO dto) throws ServiceException;
	
	// 댓글 수정
	public abstract boolean modifyReply(ReplyDTO dto) throws ServiceException;
	
	// 댓글 삭제
	public abstract boolean removeReply(int replyId, int commId) throws ServiceException;
	
	// 대댓글 작성
	public abstract boolean createReReply(ReplyDTO dto) throws ServiceException;
	
	// 임시저장 목록 조회
	public abstract List<CommunityVO> getTmpSave(String userId) throws ServiceException;
	
	// 게시글 추천여부 체크
	public abstract boolean checkMyLike(int commId, String userId) throws ServiceException;
	
	// 조와요
	public abstract boolean boardLike(int commId, String userId) throws ServiceException;
	
	// 시러요
	public abstract boolean cancelBoardLike(int commId, String userId) throws ServiceException;
	
	// 조회수 업데이트
	public abstract boolean increaseView(int commId) throws ServiceException;
	
	// 댓글 채택
	public abstract boolean replySelect(int replyId, String userId) throws ServiceException;
	
	// ==================================================================
	// 메인페이지의 '커뮤니티 인기글'
	public abstract List<BoardVO> getBoardMain() throws ServiceException;
	
	
	// 채택답변수가 레벨상승 조건에 맞는지 체크
	public static boolean contains(int[] levelArr, int target) {
		
		return Arrays.stream(levelArr).anyMatch(t -> t == target);
	} // contains
} // end interface