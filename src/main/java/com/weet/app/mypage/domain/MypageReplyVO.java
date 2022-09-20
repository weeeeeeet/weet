package com.weet.app.mypage.domain;

import java.sql.Date;

import lombok.Value;

@Value
public class MypageReplyVO {
	
	// Null을 넣을 수 있는 건 참조타입

	// 1. 댓글 번호
	private Integer replyId;
	
	// 2. 댓글이 작성된 게시물 번호
	private String commId;
	
	// 3. 댓글 작성한 아이디
	private String userId;
	
	// 4. 댓글 내용
	private String replyContents;
	
	// 5. 댓글 최종 수정 날짜
	private Date replyUpdateTs;
	
} // mypageBoardVO
