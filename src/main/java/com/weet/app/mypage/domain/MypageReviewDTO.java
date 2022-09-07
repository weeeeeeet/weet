package com.weet.app.mypage.domain;

import java.util.Date;

import lombok.Data;


@Data
public class MypageReviewDTO {
	
	// Null을 넣을 수 있는 건 참조타입

	// 1. 리뷰번호
	private Integer reviewId;
	
	// 2. 리뷰 작성한 아이디
	private String userId;
	
	// 3. 리뷰 작성한 클래스 번호
	private String classId;
	
	// 4. 별점
	private Integer reviewStar;
	
	// 5. 리뷰 내용
	private String reviewContents;
	
	// 6. 리뷰 작성 날짜
	private Date reviewDateTime;
	
	// 7. 리뷰 첨부 파일 URI
	private String reviewImgUrl;
	
} // MypageReviewVO
