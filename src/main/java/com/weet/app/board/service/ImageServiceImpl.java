package com.weet.app.board.service;

import java.io.File;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.weet.app.board.domain.FileDTO;
import com.weet.app.board.mapper.ImageMapper;
import com.weet.app.common.UUIDGenerator;
import com.weet.app.exception.DAOException;
import com.weet.app.exception.ServiceException;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
public class ImageServiceImpl implements ImageService {
	
	@Setter(onMethod_= @Autowired)
	private ImageMapper mapper;
	
	private static final String UPLOAD_PATH = "C:/temp/upload/";
	
	// DB에 파일 저장 후 파일아이디 반환
	@Override
	public int store(MultipartFile file, HttpServletRequest req) throws ServiceException {
		log.trace("store({}) invoked.", file);
		
		try {
			String path = fileSave(file, req);
			FileDTO dto = new FileDTO();
			
			dto.setOriginname(file.getOriginalFilename());
			dto.setFilename(path.substring(path.lastIndexOf("/") + 1));
			dto.setFilesize(file.getResource().contentLength());
			dto.setPath(path);
			dto.setType(file.getContentType());
			dto.setExtension(file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".")));
			
			this.mapper.insertFile(dto);
			
			return dto.getFileId();
		} catch(DAOException | IOException e) {
			throw new ServiceException(e);
		} // try-catch
	} // store
	
	// 파일 아이디를 받으면 파일 전체경로를 반환
	@Override
	public String load(int fileId) throws ServiceException {
		log.trace("load({}) invoked.", fileId);
		
		try { return this.mapper.selectFile(fileId); } 
		catch (DAOException e) { throw new ServiceException(e); } // try-catch
	} // load
	
	// 오늘날짜 폴더에 UUID로 파일 저장. 저장할 파일명을 반환
	public String fileSave(MultipartFile file, HttpServletRequest req) throws ServiceException {
		log.trace("fileSave({}) invoked.", file);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String fileDate = sdf.format(new Date());
		String targetPath = UPLOAD_PATH + fileDate;
		
		File uploadDir = new File(targetPath);
		
		if( !uploadDir.exists() ) uploadDir.mkdir();
		
		try {
			String saveFileName = UUIDGenerator.generateUniqueKeysWithUUIDAndMessageDigest();
			File saveFile = new File(targetPath, saveFileName);
			FileCopyUtils.copy(file.getBytes(), saveFile);
			
			return targetPath + "/" + saveFileName;
		} catch (IOException | NoSuchAlgorithmException e) { throw new ServiceException(e); } // try-catch
	} // fileSave

} // end class
