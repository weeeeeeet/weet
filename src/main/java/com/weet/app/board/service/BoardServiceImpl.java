package com.weet.app.board.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weet.app.board.domain.BoardVO;
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
			List<BoardVO> list = this.mapper.selectListTop10();
			
			for(BoardVO vo : list) {
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
			List<BoardVO> list = this.mapper.selectAllList(keyword, cri);
			
			for(BoardVO vo : list) {
				Map<String, Object> map = new HashMap<>();
				List<ReplyVO> reply = this.mapper.selectReplyList(vo.getCommId(), true);
				
				map.put("board", vo);
				map.put("reply", reply);
				
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
			
			BoardVO vo = this.mapper.selectOneBoard(commId);
			List<ReplyVO> reply = this.mapper.selectReplyList(commId, false);
			
			map.put("board", vo);
			map.put("reply", reply);
			
			return map;
		} catch(DAOException e) { throw new ServiceException(e); } // try-catch
	} // getAllList

} // end class
