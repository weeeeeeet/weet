package com.weet.app.help.domain;

import java.util.Date;

import lombok.Data;

@Data
public class FileUploadDTO {
	
	private String filename;
	private String originname;
	private String path;
	private Integer filesize;
	private String type;
	private Date uploadTs;
	private Long fileId;
	private String extension;	// 확장자
} // end class
