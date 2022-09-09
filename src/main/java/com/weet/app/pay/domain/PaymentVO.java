package com.weet.app.pay.domain;

import lombok.Value;

@Value
public class PaymentVO {
	
	private String payNum;
	private String payAmount;
	private String payTs;
	private String payMethod;
	private String payBankName;
	private String payCardName;
} // end class
