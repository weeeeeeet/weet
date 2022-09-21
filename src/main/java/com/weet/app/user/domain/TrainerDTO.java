package com.weet.app.user.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor

@Data
public class TrainerDTO {		// T_TR
	
	private String userId;			// 아이디 - 외래키
	private String userPwd;			// 비밀번호
	private String userCareer;		// 경력
	private String userIntro;		// 소개
	private String userBiz;		// 사업자정보
	
} // EmployeeVO
