package com.weet.app.mypage.domain;

import java.sql.Date;

import lombok.Value;

@Value
public class MypageBoardVO {
	
	// Null을 넣을 수 있는 건 참조타입

	// 1. 게시물 번호
	private Integer commId;
	
	// 2. 작성자 이름
	private String userId;
	
	// 3. 게시물 제목
	private String commPostTitle;
	
	// 4. 좋아요 수
	private Integer commLikeNum;
	
	// 5. 댓글 수
	private Integer commReplyCount;
	
	// 6. 등록일
	private Date commPostInsertTs;
	
} // mypageBoardVO
