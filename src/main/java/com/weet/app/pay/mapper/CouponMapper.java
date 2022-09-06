package com.weet.app.pay.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.weet.app.exception.DAOException;
import com.weet.app.pay.domain.CouponVO;

public interface CouponMapper {
	
	// 전체 쿠폰목록 반환(공개된 쿠폰만 & 마감일이 유효한 쿠폰만)
	public abstract List<CouponVO> selectCouponList() throws DAOException;
	
	// 내쿠폰 목록 반환(유효한 쿠폰만)
	public abstract List<CouponVO> selectMyCouponList(@Param("userId") String userId) throws DAOException;
	
	// 내쿠폰에 쿠폰 등록(사용자 입장에서)
	public abstract Integer insertMyCoupon(@Param("couponId") String couponId, @Param("userId") String userId) throws DAOException;

} // end interface
