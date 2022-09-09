package com.weet.app.board.domain;

import lombok.Data;

@Data
public class ReplyDTO {
	
	private Integer replyId;
	private String userId;
	private String replyWriter;
	
	private String replyContents;
	private Character replySelectedYn;
	private Character replyDeleteYn;
	
	private Integer commId;
	
	private Integer replyGroup;
	private Integer replyDepth;
	
} // end class
