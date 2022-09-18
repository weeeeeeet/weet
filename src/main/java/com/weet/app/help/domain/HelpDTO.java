package com.weet.app.help.domain;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class HelpDTO {
	
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
	
	private List<FileUploadDTO> fileList;
	
} // end class
