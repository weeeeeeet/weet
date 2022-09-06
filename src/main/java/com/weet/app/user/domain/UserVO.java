package com.weet.app.user.domain;

import java.sql.Date;

import lombok.Value;

@Value
public class UserVO {	// T_User
	
	private String userId;							// 아이디
	private String userName;						// 이름
	private Character userType;						// 회원유형 : 일반회원 or 트레이너
	private String userNickname;					// 닉네임
	private String userPhone;						// 번호
	private String userEmail;						// 이메일
	private String userProfile;						// 프로필사진
	private Character userGender;					// 성별
	private Character userSvcUseAgmtYN;				// 이용약관동의
	private Character userSvcPCYAgmtYN;				// 개인정보처리동의
	private Character userReciveEmailAgmtYN;		// 이메일 수신
	private Character userReciveSMSAgmtYN;			// SMS 수신
	private Date userJoinTs;						// 가입일
	private Date userLastLoginTs;					// 최종로그인 일시
	private Character userStatus;					// 회원상태 : 활동 / 휴면 / 탈퇴 
	
} // EmployeeVO
