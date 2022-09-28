package com.weet.app.dash.service;

import java.util.List;

import com.weet.app.dash.domain.ScheduleVO;
import com.weet.app.exception.ServiceException;

public interface ScheduleService {
	
	// 1. 스케쥴 조회하여  반환해주는 메소드
	public abstract List<ScheduleVO> getAllScheduleList() throws ServiceException;

} // end interface
