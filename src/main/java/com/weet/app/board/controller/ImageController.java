package com.weet.app.board.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.weet.app.board.service.ImageService;
import com.weet.app.common.APIResponse;
import com.weet.app.exception.ControllerException;
import com.weet.app.exception.ServiceException;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@RestController
@RequestMapping("/img")
public class ImageController {
	
	@Setter(onMethod_= @Autowired)
	private ImageService service;
	
	@Setter(onMethod_= @Autowired)
	ResourceLoader resourceLoader;
	
	// 파일 업로드
	@PostMapping("/new")
	public APIResponse imageUpload(MultipartFile file, HttpServletRequest req) throws ControllerException {
		log.trace("imageUpload({}) invoked.", file);
		
		APIResponse res = new APIResponse();
		try {
			int fileId = this.service.store(file, req);
			
			res.add("fileUrl", "/img/" + fileId);
		} catch(ServiceException e) { throw new ControllerException(e); } 
		
		return res;
	} // imageUpload
	
	// 파일 제공
	@GetMapping("/{fileId}")
	public ResponseEntity<?> serveImage(@PathVariable int fileId) throws ControllerException {
		log.trace("imageUpload({}) invoked.", fileId);
		
		try {
			String path = this.service.load(fileId);
			Resource resource = resourceLoader.getResource("file:" + path);
			return ResponseEntity.ok().body(resource);
		} catch (ServiceException e) { throw new ControllerException(e); } // try-catch
	} // serveImage
	
} // end class
