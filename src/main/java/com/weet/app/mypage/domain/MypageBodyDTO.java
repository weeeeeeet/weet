package com.weet.app.mypage.domain;

import java.sql.Date;

import lombok.Value;

@Value
public class MypageBodyDTO {
	
	// Null을 넣을 수 있는 건 참조타입

	// 1. 마이바디 번호
	private Integer bodyId;
	
	// 2. 마이바디 작성한 아이디
	private String userId;
	
	// 3. 마이바디 몸무게
	private Double bodyWeight;
	
	// 4. 마이바디 골격근량
	private Double bodyMuscle;
	
	// 5. 마이바디 체지방량
	private Double bodyFatPct;
	
	// 6. 마이바디 날짜
	private Date bodyDate;
	
} // mypageBoardVO
