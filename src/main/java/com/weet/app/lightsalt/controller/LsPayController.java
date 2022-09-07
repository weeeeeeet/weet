package com.weet.app.lightsalt.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@RequestMapping("/lightsalt/pay")
@Controller
public class LsPayController {

	// 1. 결제관리 목록
	@GetMapping("/payment")
	public String payList() {
		log.trace("payList() invoked.");
		
		return "/lightsalt/adminPayment";
	} // payList
	
	// 2. 환불관리 목록
	@GetMapping("/refund")
	public String payRefund() {
		log.trace("rejectClassList() invoked.");
		
		return "/lightsalt/adminPayRefund";
	} // rejectClassList		
	
	// 3. 환불요청 승인
	@GetMapping("/accept")
	public String refundAccept() {
		log.trace("refundAccept() invoked.");
		
		return "redirect:/ .... api";
	} // refundAccept		
	
	// 4. 쿠폰목록
	@GetMapping("/coupon")
	public String couponList() {
		log.trace("couponList() invoked.");
		
		return "/lightsalt/adminCoupon";
	} // couponList	
	
	// 5. 쿠폰등록
	@PostMapping("/coupon")
	public String couponReg() {
		log.trace("couponReg() invoked.");
		
		return "/lightsalt/adminCoupon";
	} // couponReg	
	
	// 6. 쿠폰삭제
	@PostMapping("/coupondel")
	public String couponDelete() {
		log.trace("couponDelete() invoked.");
		
		return "/lightsalt/adminCoupon";
	} // couponDelete	
}
