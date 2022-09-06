package com.weet.app.board.domain;

import lombok.Value;

@Value
public class BoardVO {

	private String userId;
	private String commPostTitle;
	private String commPostContents;
	private Integer commLikeNum;
	private Integer commViewCount;
	private String commPostInsertTs;
	private String commPostUpdateTs;
	private Integer commReplyCount;
	private Integer commId;
} // end class
