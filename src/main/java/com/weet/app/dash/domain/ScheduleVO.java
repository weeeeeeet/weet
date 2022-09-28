package com.weet.app.dash.domain;

import java.util.Date;

import lombok.Value;

@Value
public class ScheduleVO {

	// T_CLASS_SCHEDULE
	
	// 1. 클래스 스케쥴 코드
	private String cs_id;
	// 2. 클래스 id
	private String class_id;
	// 3. 요일
	private String cs_day;
	// 4. 클래스 시작일
	private Date cs_start_date;
	// 5. 수업시작 오전 오후 선택 (오전:1, 오후:2)
	private String cs_start_time_ampm;
	// 6. 수업 시작 시(hh)
	private Integer cs_start_time_hh;
	// 7. 수업 시작 분(mm)
	private Integer cs_start_time_mm;
	
	// T_CLASS_LISTENER
	// 8. 유저 id
	private String user_id;
	
	
} // end class
