package com.weet.app.mypage.service;

import com.weet.app.exception.ServiceException;

public interface SchedulerService {
	
	// 1. 진행상황 관리
	public abstract void ptScheduler() throws ServiceException;
	
} // end interface
