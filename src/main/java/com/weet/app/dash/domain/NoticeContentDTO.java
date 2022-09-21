package com.weet.app.dash.domain;

import java.util.Date;

import lombok.Data;


//Request Message에 포함된 모든 전송파라미터를 수집하는 용도의 객체

@Data // 뉴터블 = 수정가능하도록
public class NoticeContentDTO {
	
	// DTO 클래스의 필드의 타입 역시, VO클래스와 마찬가지로,
	// 기본타입을 사용하지 않고, 참조타입으로 선언 <- null 을 리턴할 수 있도록!! 
	
	// 1. 글번호
	private String n_num;
	// 2. 글 제목
	private String n_title;
	// 3. 글 내용
	private String n_content;
	// 4. 글 작성일
	private Date n_ts;
	
}// end class
