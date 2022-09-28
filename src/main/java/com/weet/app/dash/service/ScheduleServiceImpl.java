package com.weet.app.dash.service;

import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weet.app.dash.domain.ScheduleVO;
import com.weet.app.dash.mapper.ScheduleMapper;
import com.weet.app.exception.DAOException;
import com.weet.app.exception.ServiceException;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2

@Service("scheduleService")
public class ScheduleServiceImpl implements ScheduleService, InitializingBean, DisposableBean {

	//의존성 주입
	@Setter(onMethod_= @Autowired)
	private ScheduleMapper mapper;
	
	// 핵심비지니스로직: DB 게시판 테이블을 조회하여,
	// 게시글 전체목록을 얻어내고, 이 목록데이터를 호출자에 반환
	
	//==================================================
	// 1. 스케쥴목록 반환
	//==================================================
	@Override
	public List<ScheduleVO> getAllScheduleList() throws ServiceException {
		log.trace("getAllScheduleList() invoked.");
		
		try { return mapper.selectAllScheduleList(); }
		catch (DAOException e) { throw new ServiceException(e); } // try-catch
	} // getAllScheduleList


//=================================================================================================//	
	// DisposableBean : 이 Bean 클래스로부터 생성된 bean 객체가 파괴되기 직전에 called back.
	@Override
	public void destroy() throws Exception {			// 후처리(Post-processing)
		log.trace("destroy() invoked.");
		
	} // destroy


	// // InitializingBean : 이 Bean 클래스로부터 새로운 bean 객체를 생성한 직후에 called back.
	@Override
	public void afterPropertiesSet() throws Exception {	// 전처리(Pre-processing)
		log.trace("afterPropertiesSet() invoked.");
		
		// 필드에 의존성 주입이 정상적인지 체크
		Objects.requireNonNull(this.mapper);			// 1st. method
		assert this.mapper != null;						// 2nd. method
		
		log.info("\t+ this.mapper: {}", this.mapper);
	} // afterPropertiesSet


} // end interface
