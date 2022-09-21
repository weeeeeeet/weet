package com.weet.app.dash.domain;

import java.util.Date;

import lombok.Value;

@Value
public class FeedbackVO {

	// 1. 식단 피드백 글 id
	private String feedback_id;
	// 2. 클래스 id
	private String class_id;
	// 3. 트레이너 id
	private String user_id;
	// 4. 회원 id
	private String user_id2;
	// 5. 식단 이미지 url
	private String feedback_img_url;
	// 6. 식단 내용
	private String feedback_diet_content;
	// 7. 트레이너 식단 피드백 댓글 내용
	private String feedback_tr_content;
	// 8. 회원 식단 등록 날짜
	private Date feedback_diet_ts;
	// 9. 식단 피드백글 트레이너 피드백 날짜
	private Date feedback_tr_ts;
	// 10. 식단 피드백 등록 여부 (예:Y, 아니오:N)
	private Character feedback_registration;
	
} // end class
