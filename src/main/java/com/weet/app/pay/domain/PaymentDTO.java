package com.weet.app.pay.domain;

import lombok.Data;

@Data
public class PaymentDTO {
	
	private String payNum;
	private String classId;
	private String userId;
	private String payUid;
	private Integer payAmount;
	private String payEmail;
	private String payMethod;
	private String payAgmtYn;
	private String payCardName;
} // end class
