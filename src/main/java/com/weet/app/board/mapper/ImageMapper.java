package com.weet.app.board.mapper;

import com.weet.app.board.domain.FileDTO;
import com.weet.app.exception.DAOException;

public interface ImageMapper {
	
	// 파일 업로드
	public abstract int insertFile(FileDTO dto) throws DAOException;
	
	// 파일 로드
	public abstract String selectFile(int fileId) throws DAOException;
	
} // end interface
