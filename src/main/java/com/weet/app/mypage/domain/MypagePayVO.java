package com.weet.app.mypage.domain;

import java.sql.Date;

import lombok.Value;

@Value
public class MypagePayVO {
	
	// Null을 넣을 수 있는 건 참조타입

	// 1. 구매 번호
	private String payNum;
	
	// 2. 클래스 아이디
	private String classId;
	
	// 3. 작성자 이름
	private String userId;
	
	// 4. 구매 UID
	private String payUid;
	
	// 5. 구매 금액
	private Integer payAmount;
	
	// 6. 구매일
	private Date payTs;
	
	// 7. 구매 이메일
	private String payEmail;
	
	// 8. 구매 방법
	private String payMethod;
	
	// 9. 구매 동의 여부
	private String payAGMTYn;
	
	// 10. 카드 이름
	private String payCardName;
	
} // mypageBoardVO
