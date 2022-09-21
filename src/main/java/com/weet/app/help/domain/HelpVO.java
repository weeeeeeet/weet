package com.weet.app.help.domain;

import java.util.Date;

import lombok.Value;

// 고객센터(공지사항, 자주묻는 질문, 1대 1 문의)
@Value
public class HelpVO {
	
	// 공통
	private String adminId;
	private String userId;
	private String csType;
	private String csTs;
	private String csTitle;
	private String csContent;
	private String csUrl;
	
	// 1대1 문의
	private String inquiryType;
	private String inquiryReplyTitle;
	private String inquiryTid;
	private String inquiryPhone;
	private Date inquiryReplyTs;
	private String inquiryReplyStatus;
	private String inquiryAgmtYn;
	
	private Integer serviceNo;			// 기본키
	private String inquiryReplyContent;
	
	// 자주묻는질문 / 공지사항
	private String qnaType;
	private String noticeType;
	
} // end class


