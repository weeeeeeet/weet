package com.weet.app.dash.domain;

import java.util.Date;

import lombok.Value;

@Value
public class NoticeVO {

	// 1. 글번호
	private String n_num;
	// 2. 클래스 아이디
	private String class_id;
	// 3. 클래스 타입
	private String n_type;
	// 4. 글 제목
	private String n_title;
	// 5. 글 내용
	private String n_content;
	// 6. 글 작성일
	private Date n_ts;
	
// 카멜	================================
	
//	// 1. 글번호
//	private String nNum;
//	
//	// 2. 클래스 아이디
//	private String classId;
//	
//	// 3. 클래스 타입
//	private String nType;
//	
//	// 4. 글 제목
//	private String nTitle;
//	
//	// 5. 글 내용
//	private String nContent;
//	
//	// 6. 글 작성일
//	private Date nTs;
	
// 대문자	
//	private String N_NUM;
//	private String CLASS_ID;
//	private Character N_TYPE;
//	private String N_TITLE;
//	private String N_CONTENT;
//	private Date N_TS;
	
} // end class
