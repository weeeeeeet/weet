package com.weet.app.mypage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.weet.app.exception.DAOException;
import com.weet.app.exception.ServiceException;
import com.weet.app.mypage.mapper.SchedulerMapper;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

@Service
public class SchedulerServiceImpl implements SchedulerService {
	
	@Setter(onMethod_= {@Autowired})
	private SchedulerMapper mapper;

	@Override
	@Scheduled(cron = "0 0 0 * * *")
	public void ptScheduler() throws ServiceException {
		
		log.trace("ptScheduler() invoked.");
		
		try { 
			List<String> classIds = this.mapper.selectAllClassId();
			log.info("\t 클래스 아이디 리스트: {}", classIds);
			
			int progress = 0;
			int status = 0;
			
			for(String classId : classIds) {
				progress += this.mapper.updateProgress(classId);
				status += this.mapper.updateStatus(classId);
			} // enhanced for
			
			log.trace("\t+ *** Scheduler - 업데이트 완료 ***");
			log.trace("\t+ *** 1. progress 업데이트 행 수 : {} ***", progress);
			log.trace("\t+ *** 2. status 업데이트 행 수 : {} ***", status);
			
		} catch(DAOException e) { throw new ServiceException(e); } // try-catch

	} // ptScheduler

} // end class
