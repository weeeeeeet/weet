package com.weet.app.classes.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor

@Data
public class ClassDTO {

	private String classId; 
	private String userId;
	private String classType;
	private String classTitle;
	private String classTrainerName;
	private String classMainImgUrl;
	private String classIntro;
	private String video_url;
	private Date classRecruitStartDate;
	private Date classRecruitEndDate;
	private Integer classRecruitMaxNum;
	private Long classFee;
	private String classTag1;
	private String classTag2;
	private String classTag3;
	private String classPhotoUrl;
	private Float classAvgStar;
	private String classRegisterStatus;
	private Integer classRunningTime;
	private Integer classCount;
	private String classAddress;
	private Integer classHeartCnt;
	
} // end class
