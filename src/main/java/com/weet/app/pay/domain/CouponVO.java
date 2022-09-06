package com.weet.app.pay.domain;

import lombok.Value;

@Value
public class CouponVO {
	
	private String couponId;
	private String couponName;
	private Integer couponDcPct;
	private String couponStartTs;
	private String couponEndTs;
	private String couponExplan;
} // end class
