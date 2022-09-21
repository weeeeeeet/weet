package com.weet.app.help.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weet.app.help.domain.HelpVO;
import com.weet.app.help.domain.Criteria;
import com.weet.app.exception.DAOException;
import com.weet.app.exception.ServiceException;
import com.weet.app.help.domain.HelpDTO;
import com.weet.app.help.domain.HelpVO;
import com.weet.app.help.mapper.HelpMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2

@Service("HelpService")
public class HelpServiceImpl implements HelpService {

	@Setter(onMethod_= {@Autowired})
	private HelpMapper mapper;

	
//	============================= 1대 1문의 ============================== //
	
	@Override
	public List<HelpVO> selectInquiryList() throws ServiceException {
		log.trace("getList() invoked.");
		
		try {
			return mapper.selectInquiryList();
		} catch (DAOException e) {
			throw new ServiceException(e);
		} // try-catch
		
	} // selectInquiryList

	
	@Override
	public boolean createInquiry(HelpDTO dto) throws ServiceException {
		log.trace("create({}) invoked.", dto);
		
		try {
			return this.mapper.insertInquiry(dto) == 1;
		} catch (DAOException e) {
			throw new ServiceException(e);
		} // try-catch
		
	} // createInquiry

	
	@Override
	public HelpVO readInquiry(HelpDTO dto) throws ServiceException {
		log.trace("read({}) invoked.", dto);
		
		try {
			return this.mapper.selectInquiry(dto.getServiceNo());
		} catch (DAOException e) {
			throw new ServiceException(e);
		} // try-catch
	} // readInquiry


	@Override
	public boolean removeInquiry(HelpDTO dto) throws ServiceException {
		log.trace("remove({}) invoked.", dto);
		
		try {
			return this.mapper.deleteInquiry(dto.getServiceNo()) == 1; 
		} catch (DAOException e) {
			throw new ServiceException(e);
		} // try-catch
	} // removeInquiry


	@Override
	public boolean updateInquiry(HelpDTO dto) throws ServiceException {
		log.trace("update({}) invoked.", dto);
		
		try {
			return this.mapper.updateInquiry(dto) == 1; 
		} catch (DAOException e) {
			throw new ServiceException(e);
		} // try-catch
	} // updateInquiry

	
//	=========================== 자주 묻는 질문 =========================== //
	
	@Override
	public List<HelpVO> selectQnaList(Criteria cri) throws ServiceException {
		log.trace("selectQnaList() invoked.");
		
		try {
			return mapper.selectQnaList(cri);
		} catch (DAOException e) {
			throw new ServiceException(e);
		} // try-catch
		
	} // selectInquiryList
	
	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotal(cri);
	}

	@Override
	public HelpVO readQna(HelpDTO dto) throws ServiceException {
		log.trace("readQna({}) invoked.", dto);
		
		try {
			return this.mapper.selectQna(dto.getServiceNo());
		} catch (DAOException e) {
			throw new ServiceException(e);
		} // try-catch
	} // readQna
	

//	=========================== 공지사항 =========================== //
	
	@Override
	public List<HelpVO> selectNoticeList(Criteria cri) throws ServiceException {
		log.trace("selectNoticeList() invoked.");
		
		try {
			return mapper.selectNoticeList(cri);
		} catch (DAOException e) {
			throw new ServiceException(e);
		} // try-catch
	} // selectNoticeList
	
	@Override
	public HelpVO readNotice(HelpDTO dto) throws ServiceException {
		log.trace("readNotice({}) invoked.", dto);
		
		try {
			return this.mapper.selectNotice(dto.getServiceNo());
		} catch (DAOException e) {
			throw new ServiceException(e);
		} // try-catch
	} // readNotice
	
	@Override
	public int getTotalNotice(Criteria cri) {
		return mapper.getTotal(cri);
	} // getTotalNotice
	
} // end class
