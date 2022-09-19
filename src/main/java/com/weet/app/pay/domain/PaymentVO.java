package com.weet.app.pay.domain;

import lombok.Value;

@Value
public class PaymentVO {
	
	private String payNum;
	private String classTitle;
	private Character classType;
	private String classTrainerName;
	private String classMainImgUrl;
	private Integer classFee;
	private String classAderess;
	private Integer payAmount;
	private String payTs;
	private String payMethod;
	private String payCardName;
} // end class
