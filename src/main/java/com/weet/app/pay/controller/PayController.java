package com.weet.app.pay.controller;

import java.io.IOException;
import java.util.List;
import java.util.Locale;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonObject;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.request.CancelData;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;
import com.weet.app.classes.domain.ClassDetailVO;
import com.weet.app.classes.service.ClassService;
import com.weet.app.exception.ControllerException;
import com.weet.app.pay.domain.CouponVO;
import com.weet.app.pay.domain.PaymentDTO;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2

@RequestMapping("/pay")
@Controller
public class PayController {
	
	private IamportClient api;
	
	@Setter(onMethod_= @Autowired)
	private ClassService service;
	
	public PayController() {
		this.api = new IamportClient("3192791213481602", "e87a637193d097e320a3503f09f4d9c234296d309785ebdccd7091ef346b401f57d47682f395e9c1");
	} // constructor
	
	// 구매 창 GET
	@GetMapping("/payment")
	public String paymentPage(
		@RequestParam("buy") String classId,
		Model model) throws ControllerException {
		log.trace("paymentPage() invoked.");
		
		try {
			ClassDetailVO vo = this.service.getDetail(classId);
			
			Objects.requireNonNull(vo);
			model.addAttribute("__CLASS__", vo);
		} catch(Exception e) {
			throw new ControllerException(e);
		} // try-catch
		
		return "/pay/payment";
	} // paymentPage
	
	// 구매
	@PostMapping("/payment")
	@ResponseBody
	public String payment(PaymentDTO dto) {
		log.trace("payment() invoked.");
		
		log.info("\t+ dto: {}", dto);
		return "GOOD";
	} // payment
	
	// 결제 검증
	@ResponseBody
	@PostMapping("/verify/{imp_uid}")
	public IamportResponse<Payment> paymentByImpUid(
			Model model,
			Locale locale,
			@PathVariable(value = "imp_uid") String imp_uid
		) throws IamportResponseException, IOException {
		
		log.trace("paymentByImpUid({}) invoked.", imp_uid);
		
		// 필드 추가 필요
		return this.api.paymentByImpUid(imp_uid);
	} // paymentByImpUid
	
	// 환불 요청(사용자 요청)
	@PostMapping("/refund/req")
	public String refundRequest() {
		log.trace("refundRequest() invoked.");
		
		return "redirect:/mypage/pay/detail";
	} // refundRequest
	
	// 환불(관리자 요청)
	@ResponseBody
	@PostMapping("/refund/{ imp_uid }")
	public IamportResponse<Payment> cancelPaymentByImpUid(
			@PathVariable(value = "imp_uid") String imp_uid,
			CancelData cancelData
		) {
		log.trace("cancelPaymentByImpUid({}, {}) invoked.", imp_uid, cancelData);
		
		return null;
	} // cancelPaymentByImpUid
	
	// 구매완료 창 GET
	@GetMapping("/succeeded")
	public String paySucceeded() {
		log.trace("paySucceeded() invoked.");
		 
		return "/pay/paymentSucceeded";
	} // paySucceeded

} // end class
