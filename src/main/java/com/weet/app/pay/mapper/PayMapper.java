package com.weet.app.pay.mapper;

import com.weet.app.exception.DAOException;
import com.weet.app.pay.domain.PaymentDTO;
import com.weet.app.pay.domain.PaymentVO;
import com.weet.app.user.domain.UserVO;

public interface PayMapper {
	
	// 결제정보 조회
	public abstract PaymentVO selectPayInfo(String payNum) throws DAOException;
	
	// 결제 유저정보 조회
	public abstract UserVO selectUserInfo(String userId) throws DAOException;
	
	// 결제정보 저장
	public abstract int insertPayInfo(PaymentDTO dto) throws DAOException;

	// 등록정보 저장
	public abstract int insertClassListener(String classId, String userId) throws DAOException;
} // end interface
