package com.weet.app.pay.controller;

import java.io.IOException;
import java.util.Objects;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.request.CancelData;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;
import com.weet.app.classes.domain.ClassDetailVO;
import com.weet.app.classes.service.ClassService;
import com.weet.app.common.APIResponse;
import com.weet.app.exception.ControllerException;
import com.weet.app.exception.ServiceException;
import com.weet.app.pay.service.PayService;
import com.weet.app.user.domain.TrainerVO;
import com.weet.app.user.domain.UserVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2

@RequestMapping("/pay")
@Controller
public class PayController {
	
	private IamportClient api;
	
	@Setter(onMethod_= @Autowired)
	private ClassService classService;
	
	@Setter(onMethod_= @Autowired)
	private PayService payService;
	
	public PayController() {
		this.api = new IamportClient("3192791213481602", "e87a637193d097e320a3503f09f4d9c234296d309785ebdccd7091ef346b401f57d47682f395e9c1");
	} // constructor
	
	// 구매 창 GET
	@GetMapping("/payment")
	public String paymentPage(
		@RequestParam("buy") String classId,
		HttpSession session,
		Model model) throws ControllerException {
		log.trace("paymentPage() invoked.");
		
		try {
			ClassDetailVO vo = this.classService.getDetail(classId);
			
			TrainerVO trainervo = (TrainerVO) session.getAttribute("__LOGIN__");
			
			if(trainervo != null) {
				UserVO uservo = this.payService.getPayUserInfo(trainervo.getUserId());
				model.addAttribute("__USER__", uservo);
			} // if
			
			Objects.requireNonNull(vo);
			model.addAttribute("__CLASS__", vo);
		} catch(Exception e) {
			throw new ControllerException(e);
		} // try-catch
		
		return "/pay/payment";
	} // paymentPage
	
	// 결제 검증
	@ResponseBody
	@PostMapping("/verify/{imp_uid}")
	public APIResponse paymentByImpUid(
			@PathVariable(value = "imp_uid") String imp_uid,
			String classId,
			String userId,
			String couponId
		) throws IamportResponseException, IOException, ControllerException {
		
		log.trace("paymentByImpUid({}, {}, {}, {}) invoked.", imp_uid, classId, userId, couponId);
		
		
		APIResponse res = new APIResponse();
		String result = "";
		Payment payment = this.api.paymentByImpUid(imp_uid).getResponse(); // 검증처리
		
		// 리턴받은 payment의 status가 결제완료이면 DB조작 메소드 실행
		try {
			switch(payment.getStatus()) {
				case "paid" : 
					result = this.payService.savePayment(payment, classId, userId, couponId);
					
					break;
				case "failed" :
					result = "FAIL:04";
					
					break;
			} // switch
			
			res.add("result", result);
			res.add("orderNum", payment.getMerchantUid());
		} catch (ServiceException e) {
			throw new ControllerException(e);
		} // try-catch
		
		return res;
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
		CancelData cancelData) throws ControllerException {
		log.trace("cancelPaymentByImpUid({}, {}) invoked.", imp_uid, cancelData);
		
		return null;
	} // cancelPaymentByImpUid
	
	// 구매완료 창 GET
	@GetMapping("/succeeded/{uid}")
	public String paySucceeded(
		@PathVariable("uid") String orderNum,
		Model model) throws ControllerException {
		log.trace("paySucceeded() invoked.");
		 
		try { model.addAttribute("__PAYINFO__", this.payService.getPayInfo(orderNum)); } 
		catch(ServiceException e) { throw new ControllerException(e); }
		
		return "/pay/paymentSucceeded";
	} // paySucceeded

} // end class
