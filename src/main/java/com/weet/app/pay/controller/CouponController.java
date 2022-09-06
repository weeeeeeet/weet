package com.weet.app.pay.controller;

import java.util.List;
import java.util.Objects;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.weet.app.exception.ControllerException;
import com.weet.app.pay.domain.CouponVO;
import com.weet.app.pay.service.CouponService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@AllArgsConstructor

@RequestMapping("/coupons")
@Controller
public class CouponController {
	
	private CouponService service;
	
	// 쿠폰북 조회
	@GetMapping("/book")
	public String couponBook(Model model) throws ControllerException {
		log.trace("couponBook() invoked.");
		
		try {
			List<CouponVO> list = this.service.getCoupons();
			
			Objects.requireNonNull(list);
			model.addAttribute("_COUPONS_", list);
		} catch(Exception e) {
			throw new ControllerException(e);
		} // try-catch
		
		return "/pay/couponBook";
	} // couponBook
	
	// 내쿠폰 조회
	@ResponseBody
	@GetMapping("/my")
	public List<CouponVO> availableCoupon(Model model, String userId) throws ControllerException {
		log.trace("availableCoupon({}) invoked.", userId);
		
		try {
			List<CouponVO> list = this.service.getMyCoupons(userId);
			
			Objects.requireNonNull(list);
			return list;
		} catch(Exception e) {
			throw new ControllerException(e);
		} // try-catch
	} // availableCoupon
	
	// 쿠폰 직접등록
	@ResponseBody
	@PostMapping("/reg")
	public boolean registerCoupon(String couponId, String userId) throws ControllerException {
		log.trace("registerCoupon() invoked.");
		
		try { 
			boolean isSuccess = this.service.createMyCoupon(couponId, userId);
			
			return isSuccess;
		} catch(Exception e) {
			throw new ControllerException(e);
		} // try-catch
	} // registerCoupon
	
} // end class
