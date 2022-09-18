package com.weet.app.board.domain;

import lombok.Value;

@Value
public class CommunityVO {
	
	private Integer commId;
	
	private String userId;		// 작성자 아이디
	private String userNickname; // 작성자 닉네임
	
	private String commPostTitle;
	private String commPostContents;
	private Integer commLikeNum;
	private Integer commViewCount;
	private String commPostInsertTs;
	private String commPostUpdateTs;
	private Integer commReplyCount;
} // end class
