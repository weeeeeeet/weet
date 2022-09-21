package com.weet.app.mypage.domain;

import java.sql.Date;

import lombok.Value;

@Value
public class MypageClassVO {
	
	// Null을 넣을 수 있는 건 참조타입

	// 1. 클래스 번호
	private String classId;
	
	// 2. 클래스 등록한 회원 아이디
	private String userId;
	
	// 3. 클래스 - 트레이너 이름
	private String classTrainerName;
	
	// 4. 클래스 제목
	private String classTitle;
	
	// 5. 클래스 이미지 URL
	private String classMainImgUrl;
	
} // mypageClassVO
