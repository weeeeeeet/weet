package com.weet.app.board.domain;

import lombok.Data;

@Data
public class FileDTO {
	
	private Integer fileId;
	
	private String filename;
	private String originname;
	private String path;
	private Long filesize;
	private String type;
	private String extension;
} // end class
