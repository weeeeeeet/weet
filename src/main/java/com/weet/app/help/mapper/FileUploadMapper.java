package com.weet.app.help.mapper;

import java.util.List;

import com.weet.app.exception.DAOException;
import com.weet.app.help.domain.FileUploadDTO;

public interface FileUploadMapper {

	public void insert(FileUploadDTO dto) throws DAOException;
	public void delete(String filename) throws DAOException;
	public List<FileUploadDTO> findByFileId(Long fileId) throws DAOException;
	
} // end interface
