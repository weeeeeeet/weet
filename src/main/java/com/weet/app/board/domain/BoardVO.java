package com.weet.app.board.domain;

import java.util.Date;

import lombok.Value;

// 커뮤니티(게시판)
@Value
public class BoardVO {
	
	private String userId;
	private String commPostTitle;
	private String commPostContents;
	private Integer commLikeNum;
	private Integer commViewCount;
	private Date commPostInsertTs;
	private Date commPostUpdateTs;
	private String commDeleteYn;
	private Integer commReplyCount;
	private String commReplyYn;
	private String commId;
	
} // end class
