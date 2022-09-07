package com.weet.app.board.service;

import java.util.List;

import com.weet.app.exception.ServiceException;

public interface BoardService {
	
	// 인기게시글 top10 조회
	public abstract List<Object> getListTop10() throws ServiceException;

} // end interface