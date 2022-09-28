package com.weet.app.dash.domain;

import lombok.Value;

@Value
public class ClassListenerVO {

	// 1. pk
	private Integer class_listener;
	// 2. 클래스 아이디
	private String class_id;
	// 3. 회원 아이디
	private String user_id;
	// 4. 진행과정 (pt 횟수 카운트)
	private Integer progress;
	// 5. 클래스 상태 (0 : 진행중 1 : 종료)
	private String status;
	
} // end class
