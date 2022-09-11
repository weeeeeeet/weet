package com.weet.app.board.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.weet.app.exception.ServiceException;

public interface ImageService {
	
	// 파일 저장
	public abstract int store(MultipartFile file, HttpServletRequest req) throws ServiceException;
	
	// 파일 로드
	public abstract String load(int fileId) throws ServiceException;
} // end interface
