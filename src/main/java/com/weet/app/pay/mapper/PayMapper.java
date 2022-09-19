package com.weet.app.pay.mapper;

import com.weet.app.exception.DAOException;
import com.weet.app.pay.domain.PaymentDTO;

public interface PayMapper {
	
	// 결제정보 저장
	public abstract int insertPayInfo(PaymentDTO dto) throws DAOException;

	// 등록정보 저장
	public abstract int insertClassListener(String classId, String userId) throws DAOException;
} // end interface
