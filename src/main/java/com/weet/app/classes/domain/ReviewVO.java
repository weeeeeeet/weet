package com.weet.app.classes.domain;

import lombok.Value;

@Value
public class ReviewVO {
	
	private String userNickname;
	private String reviewContents;
	private String reviewDatetime;
	private Integer reviewStar;
	private String reviewImgUrl;
} // end class
