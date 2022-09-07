package com.weet.app.mypage.service;

import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weet.app.exception.DAOException;
import com.weet.app.exception.ServiceException;
import com.weet.app.mypage.domain.Criteria;
import com.weet.app.mypage.domain.MypageBoardVO;
import com.weet.app.mypage.domain.MypageClassVO;
import com.weet.app.mypage.domain.MypageReplyVO;
import com.weet.app.mypage.mapper.MypageMapper;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

@Service
public class MypageServiceImpl implements MypageService, InitializingBean {
	
	// + 의존성 주입
	@Setter(onMethod_= {@Autowired})
	private MypageMapper mapper;
	
	// ======================================================================

	@Override
	public void afterPropertiesSet() throws Exception {
		
		log.trace("afterPropertiesSet() invoked.");
		
		Objects.requireNonNull(this.mapper);
		log.trace("\t + this.mapper : {}", this.mapper);
		
	} // afterPropertiesSet : 의존성 주입 확인
	
	// ======================================================================
	
	// ======================================================================
	// 1 ) 전체 게시물 페이징 처리
	// ======================================================================

	@Override
	public List<MypageBoardVO> getListPerPage(Criteria cri, MypageBoardVO vo) throws ServiceException {
		
		log.trace("getListPerPage({}, {}) invoked.", cri, vo);
		
		try {
			return this.mapper.selectListWithPaging(cri, vo.getUserId());
		} catch (DAOException e) {
			throw new ServiceException(e);
		} // try - catch
		
	} // getListPerPage
	
	// ======================================================================
	// 2 ) 게시물 페이징 처리에 필요한 총 양 구하기 
	// ======================================================================
	
	@Override
	public Integer getTotal(MypageBoardVO vo) throws ServiceException {
		log.trace("getTotal({}) invoked.", vo);
		
		try {
			return this.mapper.selectTotalAmount(vo.getUserId());
		} catch (DAOException e) {
			throw new ServiceException(e);
		} // try - catch
		
	} // getTotal
	
	// ======================================================================
	// 3 ) 답변 완료 게시물 페이징 처리
	// ======================================================================
	@Override
	public List<MypageBoardVO> getListReplyDone(Criteria cri, MypageBoardVO vo) throws ServiceException {
		
		log.trace("getListReplyDone({}, {}) invoked.", cri, vo);
		
		try {
			return this.mapper.selectReplyDoneList(cri, vo.getUserId() );
		} catch (DAOException e) {
			throw new ServiceException(e);
		} // try - catch
		
	} // getListReplyDone
	// ======================================================================
	@Override
	public Integer getTotalReply(MypageBoardVO vo) throws ServiceException {
		
		log.trace("getTotalReply({}) invoked.", vo);
		
		try {
			return this.mapper.selectReplyDoneAmount(vo.getUserId());
		} catch (DAOException e) {
			throw new ServiceException(e);
		} // try - catch
		
	} // getListReplyDone
	
	// ======================================================================
	// 4 ) 좋아요 게시물 페이징 처리
	// ======================================================================
	
	@Override
	public List<MypageBoardVO> getListLike(Criteria cri, MypageBoardVO vo) throws ServiceException {
		log.trace("getListLike({}, {}) invoked.", cri, vo);
		
		try {
			return this.mapper.selectLikeList(cri, vo.getUserId());
		} catch (DAOException e) {
			throw new ServiceException(e);
		} // try - catch
		
	} // getListLike

	@Override
	public Integer getTotalLike(MypageBoardVO vo) throws ServiceException {
		log.trace("getTotalLike({}) invoked.", vo);
		
		try {
			return this.mapper.selectLikeAmount(vo.getUserId());
		} catch (DAOException e) {
			throw new ServiceException(e);
		} // try - catch
		
	} // getTotalLike
	
	// ======================================================================
	// 5 ) 댓글 게시물 페이징 처리
	// ======================================================================
	
	@Override
	public List<MypageReplyVO> getListReply(Criteria cri, MypageReplyVO vo) throws ServiceException {
		log.trace("getListReply({}, {}) invoked.", cri, vo);
		
		try {
			return this.mapper.selectReplyList(cri, vo.getUserId());
		} catch (DAOException e) {
			throw new ServiceException(e);
		} // try - catch
		
	} // getListReply

	@Override
	public Integer getTotalReplies(MypageReplyVO vo) throws ServiceException {
		log.trace("getTotalReplies({}) invoked.", vo);
		
		try {
			return this.mapper.selectReplyAmount(vo.getUserId());
		} catch (DAOException e) {
			throw new ServiceException(e);
		} // try - catch
		
	} // getTotalReplies
	
	// ======================================================================
	// 6 ) 수강 중인 클래스 조회
	// ======================================================================
	
	@Override
	public List<MypageClassVO> getListClass(Criteria cri, MypageClassVO vo) throws ServiceException {
		
		try {
			return this.mapper.selectClass(cri, vo.getUserId());
		} catch (DAOException e) {
			throw new ServiceException(e);
		} // try - catch
		
	} // getListClass

	@Override
	public Integer getTotalClass(MypageClassVO vo) throws ServiceException {
		
		try {
			return this.mapper.selectClassAmount(vo.getUserId());
		} catch (DAOException e) {
			throw new ServiceException(e);
		} // try - catch
		
	} // getTotalClass
	
	// ======================================================================
	// 7 ) 수강완료한 클래스 조회
	// ======================================================================
	
	@Override
	public List<MypageClassVO> getListDoneClass(Criteria cri, MypageClassVO vo) throws ServiceException {
		
		try {
			return this.mapper.selectDoneClass(cri, vo.getUserId());
		} catch (DAOException e) {
			throw new ServiceException(e);
		} // try - catch
		
	} // getListDoneClass

	@Override
	public Integer getTotalDoneClass(MypageClassVO vo) throws ServiceException {
		
		try {
			return this.mapper.selectDoneClassAmount(vo.getUserId());
		} catch (DAOException e) {
			throw new ServiceException(e);
		} // try - catch
		
	} // getTotalDoneClass
	
	// ======================================================================
	// + 후기 등록 기능
	// ======================================================================
	
	// ======================================================================
	// 8 ) 좋아요 누른 클래스 조회
	// ======================================================================
	
	// ======================================================================
	// 9 ) 시작 전인 클래스 조회
	// ======================================================================
	
	// ======================================================================
	// 10 ) 마이바디 데이터 입력
	// ======================================================================
	
	// ======================================================================
	// 11 ) 마이바디 데이터 수정
	// ======================================================================
	
	// ======================================================================
	// 12 ) 마이바디 데이터 조회
	// ======================================================================
	
	// ======================================================================
	// 13 ) 구매 내역
	// ======================================================================
	
	// ======================================================================
	// 14 ) 구매내역 상세 조회
	// ======================================================================
	
	// ======================================================================
	// 15 ) 프로필 조회 전 비밀번호 입력 (???)
	// ======================================================================
	
	// ======================================================================
	// 16 ) 프로필 조회
	// ======================================================================
	
	// ======================================================================
	// 17 ) 프로필 수정 페이지 조회
	// ======================================================================
	
	// ======================================================================
	// 18 ) 프로필 수정 - 닉네임 중복 확인 기능
	// ======================================================================
	
	// ======================================================================
	// 19 ) 휴대폰 본인 인증
	// ======================================================================
	
	// ======================================================================
	// 20 ) 이메일 저장
	// ======================================================================
	
	// ======================================================================
	// 21 ) 알림 설정
	// ======================================================================
	
	// ======================================================================
	// 22 ) 알림 설정 저장
	// ======================================================================
	
	// ======================================================================
	// 23 ) 회원 탈퇴
	// ======================================================================
	

} // end class