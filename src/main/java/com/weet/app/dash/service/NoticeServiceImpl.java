package com.weet.app.dash.service;

import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weet.app.dash.domain.NoticeContentDTO;
import com.weet.app.dash.domain.NoticeVO;
import com.weet.app.dash.mapper.NoticeMapper;
import com.weet.app.exception.DAOException;
import com.weet.app.exception.ServiceException;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService, InitializingBean, DisposableBean {

	//의존성 주입
	@Setter(onMethod_= @Autowired)
	private NoticeMapper mapper;
	
	// 핵심비지니스로직: DB 게시판 테이블을 조회하여,
	// 게시글 전체목록을 얻어내고, 이 목록데이터를 호출자에 반환
	
	//==================================================
	// 1. 공지사항 목록 반환
	//==================================================
	@Override
	public List<NoticeVO> getAllNoticeList() throws ServiceException {
		log.trace("getAllNoticeList() invoked.");
		
		try { return mapper.selectAllNoticeList(); }
		catch (DAOException e) { throw new ServiceException(e); } // try-catch
	} // getAllNoticeList

	//==================================================
	// 2. 코칭계획 목록
	//==================================================
	@Override
	public List<NoticeVO> getAllCoachingList() throws ServiceException {
		log.trace("getAllCoachingList() invoked.");
		
		try { return mapper.selectAllCoachingList(); }
		catch (DAOException e) { throw new ServiceException(e); } // try-catch
	} // getAllCoachingList
	
	
	//==================================================
	// 2. 공지사항 조회
	//==================================================
	@Override
	public NoticeVO getNoticeContents(NoticeContentDTO dto) throws ServiceException {
		log.trace("read({}) invoked.", dto);
		
		try { return this.mapper.selectNoticeContents( dto.getN_num() );}
		catch (DAOException e) { throw new ServiceException(e); } // try-catch
	} // getNoticeContents
	
	//==================================================
	// 2-1. 코칭계획 조회
	//==================================================
	@Override
	public NoticeVO getCoachingContents(NoticeContentDTO dto) throws ServiceException {
		log.trace("read({}) invoked.", dto);
		
		try { return this.mapper.selectCoachingContents( dto.getN_num() );}
		catch (DAOException e) { throw new ServiceException(e); } // try-catch
	} // getCoachingContents
	
	//==================================================
	// 3. 게시글 작성
	//==================================================
	@Override
	public boolean contentCreate(NoticeContentDTO dto) throws ServiceException {
		log.trace("contentCreate({}) invoked.", dto);
		
		try { return this.mapper.insertSelectKey(dto) == 1; }
		catch (DAOException e) { throw new ServiceException(e); } // try-catch
	} // contentCreate
	
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
