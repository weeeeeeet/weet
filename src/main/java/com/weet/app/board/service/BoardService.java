package com.weet.app.board.service;

import java.util.List;
import java.util.Map;

import com.weet.app.common.domain.Criteria;
import com.weet.app.exception.ServiceException;

public interface BoardService {
	
	// 인기게시글 top10 조회
	public abstract List<Object> getListTop10() throws ServiceException;
	
	// 전체게시글 목록 조회
	public abstract List<Object> getAllList(String keyword, Criteria cri) throws ServiceException;
	
	// 게시글 수 카운트
	public abstract int getListCount(String keyword) throws ServiceException;
	
	// 게시글 상세 조회
	public abstract Map<String, Object> getOneBoard(int commId) throws ServiceException;

} // end interface