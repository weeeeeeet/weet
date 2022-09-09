package com.weet.app.board.domain;

import lombok.Value;

@Value
public class ReplyVO {
	
	private Integer replyId;
	
	private String trainerId;
	private String trainerNickname;
	private Integer trainerLevel;
	
	private String replyContents;
	private String replyInsertTs;
	private Character replySelectedYn;
	private Character replyDeleteYn;
} // end class
