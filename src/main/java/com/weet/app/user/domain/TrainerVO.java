package com.weet.app.user.domain;


import lombok.Value;

@Value
public class TrainerVO {		// T_TR
	
	private String userId;			// 아이디 - 외래키
	private String userPwd;			// 비밀번호
	private Integer userLevel;		// 레벨
	private String userCareer;		// 경력
	private String userIntro;		// 소개
	private Long userBiz;		// 사업자정보 

	
} // EmployeeVO
