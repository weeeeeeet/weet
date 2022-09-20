package com.weet.app.board.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.UncategorizedSQLException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.weet.app.board.domain.BoardVO;
import com.weet.app.board.domain.CommunityDTO;
import com.weet.app.board.domain.CommunityVO;
import com.weet.app.board.domain.ReplyDTO;
import com.weet.app.board.domain.ReplyVO;
import com.weet.app.board.mapper.BoardMapper;
import com.weet.app.common.domain.Criteria;
import com.weet.app.exception.DAOException;
import com.weet.app.exception.ServiceException;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
public class BoardServiceImpl implements BoardService {
	
	@Setter(onMethod_= @Autowired)
	private BoardMapper mapper;

	// 인기게시글 + 댓글미리보기 조회
	@Override
	public List<Object> getListTop10() throws ServiceException {
		
		List<Object> result = new ArrayList<>();
		
		try {
			List<CommunityVO> list = this.mapper.selectListTop10();
			
			for(CommunityVO vo : list) {
				Map<String, Object> map = new HashMap<>();
				List<ReplyVO> reply = this.mapper.selectReplyList(vo.getCommId(), true);
				
				ReplyVO replyVO = reply.size() != 0 ? reply.get(0) : null;
				
				map.put("board", vo);
				map.put("reply", replyVO);
				
				result.add(map);
			} // enhanced for
			
		} catch(DAOException e) { throw new ServiceException(e); } // try-catch
		
		return result;
	} // getListTop10

	// 전체 게시글 목록 조회
	@Override
	public List<Object> getAllList(String keyword, Criteria cri) throws ServiceException {
		
		List<Object> result = new ArrayList<>();
		
		try {
			List<CommunityVO> list = this.mapper.selectAllList(keyword, cri);
			
			for(CommunityVO vo : list) {
				Map<String, Object> map = new HashMap<>();
				List<ReplyVO> reply = this.mapper.selectReplyList(vo.getCommId(), true);
				
				ReplyVO replyVO = reply.size() != 0 ? reply.get(0) : null;
				
				map.put("board", vo);
				map.put("reply", replyVO);
				
				result.add(map);
			} // enhanced for
			
		} catch(DAOException e) { throw new ServiceException(e); } // try-catch
		
		return result;
	} // getAllList
	
	// 게시글 수 카운트
	@Override
	public int getListCount(String keyword) throws ServiceException {
		
		try { return this.mapper.selectListCount(keyword); }
		catch(DAOException e) { throw new ServiceException(e); } // try-catch
	} // getAllList

	// 게시글 상세조회
	@Override
	public Map<String, Object> getOneBoard(int commId) throws ServiceException {
		
		try { 
			Map<String, Object> map = new HashMap<>();
			
			CommunityVO vo = this.mapper.selectOneBoard(commId);
			List<ReplyVO> reply = this.mapper.selectReplyList(commId, false);
			
			map.put("board", vo);
			map.put("reply", reply);
			
			return map;
		} catch(DAOException e) { throw new ServiceException(e); } // try-catch
	} // getAllList

	// 게시글 작성
	@Override
	public boolean createBoard(CommunityDTO dto) throws ServiceException {
		log.trace("CreateBoard({}) invoked.", dto);
		
		try { return this.mapper.insertBoard(dto) == 1 ? true : false; }
		catch(DAOException e) { throw new ServiceException(e); } // try-catch
	} // createBoard

	// 게시글 수정
	@Override
	public boolean modifyBoard(CommunityDTO dto) throws ServiceException {
		log.trace("ModifyBoard({}) invoked.", dto);
		
		try { return this.mapper.updateBoard(dto) == 1 ? true : false; }
		catch(DAOException e) { throw new ServiceException(e); } // try-catch
	} // modifyBoard

	// 게시글 삭제
	@Override
	public boolean removeBoard(int commId) throws ServiceException {
		log.trace("removeBoard({}) invoked.", commId);
		
		try { return this.mapper.deleteBoard(commId) == 1 ? true : false; }
		catch(DAOException e) { throw new ServiceException(e); } // try-catch
	} // removeBoard

	// 댓글 작성
	@Override
	@Transactional
	public boolean createReply(ReplyDTO dto) throws ServiceException {
		log.trace("createReply({}) invoked.", dto);
		
		try { 
			int result1 = this.mapper.insertReply(dto);
			int result2 = this.mapper.updateReplyGroup(dto);
			
			int result3 = this.mapper.updateReplyCount(dto.getCommId());
			
			return (result1 == 1 && result2 == 1 && result3 == 1) ? true : false;
		} catch(UncategorizedSQLException e) {
			throw e;
		} catch(Exception e) {
			log.info("\t+ Transfer Failure.");
			
			throw new ServiceException(e);
		} // try-catch
	} // createReply

	// 댓글 수정
	@Override
	public boolean modifyReply(ReplyDTO dto) throws ServiceException {
		log.trace("modifyReply({}) invoked.", dto);
		
		try { return this.mapper.updateReply(dto) == 1 ? true : false; }
		catch(DAOException e) { throw new ServiceException(e); } // try-catch
	} // modifyReply

	// 댓글 삭제
	@Override
	@Transactional
	public boolean removeReply(int replyId, int commId) throws ServiceException {
		log.trace("modifyReply({}) invoked.", replyId);
		
		try { 
			int result1 = this.mapper.deleteReply(replyId);
			int result2 = this.mapper.updateReplyCount(commId);
			
			return (result1 == 1 && result2 == 1) ? true : false;
		} catch(UncategorizedSQLException e) {
			throw e;
		} catch(Exception e) {
			log.info("\t+ Transfer Failure.");
			
			throw new ServiceException(e);
		} // try-catch
	} // removeReply

	// 대댓글 작성
	@Override
	@Transactional
	public boolean createReReply(ReplyDTO dto) throws ServiceException {
		log.trace("createReReply({}) invoked.", dto);
		
		try { 
			int result1 = this.mapper.insertReReply(dto);
			int result2 = this.mapper.updateReplyCount(dto.getCommId());
			
			return (result1 == 1 && result2 == 1) ? true : false;
		} catch(UncategorizedSQLException e) {
			throw e;
		} catch(Exception e) {
			log.info("\t+ Transfer Failure.");
			
			throw new ServiceException(e);
		} // try-catch
	} // removeReply

	// 임시저장 목록 조회
	@Override
	public List<CommunityVO> getTmpSave(String userId) throws ServiceException {
		log.trace("getTmpSave({}) invoked.", userId);
		
		try { return this.mapper.selectTmpSaveList(userId); }
		catch(DAOException e) { throw new ServiceException(e); } // try-catch
	} // removeReply

	// 게시글 추천여부 조회
	@Override
	public boolean checkMyLike(int commId, String userId) throws ServiceException {
		
		try { 
			int selectedRows = this.mapper.selectMyLike(commId, userId);
			
			return selectedRows == 0 ? false : true;
		} catch(DAOException e) { throw new ServiceException(e); } // try-catch
	} // checkMyLike

	// 게시글 추천
	@Override
	@Transactional
	public boolean boardLike(int commId, String userId) throws ServiceException {
		
		try { 
			int affectedLines1 = this.mapper.insertBoardLike(userId, commId);
			int affectedLines2 = this.mapper.updateLikeCount(commId);
			
			return (affectedLines1 == 1 && affectedLines2 == 1) ? true : false;
		} catch(UncategorizedSQLException e) {
			throw e;
		} catch(Exception e) {
			log.info("\t+ Transfer Failure.");
			
			throw new ServiceException(e);
		} // try-catch
	} // boardLike

	// 게시글 추천취소
	@Override
	@Transactional
	public boolean cancelBoardLike(int commId, String userId) throws ServiceException {
		
		try { 
			int affectedLines1 = this.mapper.deleteBoardLike(userId, commId);
			int affectedLines2 = this.mapper.updateLikeCount(commId);
			
			return (affectedLines1 == 1 && affectedLines2 == 1) ? true : false;
		} catch(UncategorizedSQLException e) {
			throw e;
		} catch(Exception e) {
			log.info("\t+ Transfer Failure.");
			
			throw new ServiceException(e);
		} // try-catch
	} // cancelBoardLike

	// 조회수 업데이트
	@Override
	public boolean increaseView(int commId) throws ServiceException {
		
		try { return this.mapper.updateViewCount(commId) == 1 ? true : false; } 
		catch(DAOException e) { throw new ServiceException(e); } // try-catch
	} // increaseView

	// 대댓글목록 조회
	@Override
	public List<ReplyVO> getReReplyList(int commId, int replyGroup) throws ServiceException {
		
		try { return this.mapper.selectReReplyList(commId, replyGroup); } 
		catch(DAOException e) { throw new ServiceException(e); } // try-catch
	} // increaseView
	
	// 댓글 채택
	@Override
	@Transactional
	public boolean replySelect(int replyId, String userId) throws ServiceException {

		try { 
			if( this.mapper.updateReplySelected(replyId) == 1 ) {
				int replyCnt = this.mapper.selectSelectedReplyCountOfTrainer(userId);
				
				if( BoardService.contains(BoardService.LEVEL_TRIGGER, replyCnt) ) {
					this.mapper.updateTrainerLevel(userId);
				} // if
				
				return true;
			} else {
				
				return false;
			} // if-else
		} catch(UncategorizedSQLException e) {
			throw e;
		} catch(Exception e) {
			log.info("\t+ Transfer Failure.");
			
			throw new ServiceException(e);
		} // try-catch
	} // getBoardMain
	
	// 메인 페이지의 커뮤니티 인기글
	@Override
	public List<BoardVO> getBoardMain() throws ServiceException {
		log.trace("getBoardMain() invoked");
		
		try {
			return this.mapper.selectBoardMain();
		} catch(Exception e) {
			throw new ServiceException(e);
		} // try-catch
	} // getBoardMain
	

} // end class