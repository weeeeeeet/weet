package com.weet.app.board.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardDTO {
	
	private String userId;
	private String commPostTitle;
	private String commPostContents;
	private Date commPostUpdateTs;
	private Integer commReplyCount;
	private Character commTempsave;
} // end class
