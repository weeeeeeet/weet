package com.weet.app.pay.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CouponDTO {
	
	private String couponId;
	private String couponName;
	private Integer couponDcPct;
	private Date couponStartTs;
	private Date couponEndTs;
	private String couponExplan;
} // end class
