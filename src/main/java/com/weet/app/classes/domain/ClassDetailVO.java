package com.weet.app.classes.domain;

import java.util.Date;

import lombok.Value;

@Value
public class ClassDetailVO {
	
	private String classId;
	private String userId;
	private String trainerName;
	
	private Character classType;
	private String classTitle;
	private String classTrainerName;
	private String classMainImgUrl;
	private String classIntro;
	private String classVideoUrl;
	private Date classRecruitStartDate;
	private Date classRecruitEndDate;
	private Integer classRecruitMaxNum;
	private Integer classFee;
	private String classTag1;
	private String classTag2;
	private String classTag3;
	private Integer classAvgStar;
	private Integer classRunningTime;
	private Integer classCount;
	private String classAderess;
	private Integer classHeartCnt;
	
	private Integer currentRegCnt;
} // end class
