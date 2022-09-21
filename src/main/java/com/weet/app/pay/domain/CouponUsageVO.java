package com.weet.app.pay.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CouponUsageVO {
	
	private String couponId;
	private String userId;
	private Character couponUsed;
	private Date couponApplyTs;
} // end class
