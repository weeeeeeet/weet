package com.weet.app.classes.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weet.app.classes.domain.ClassDetailVO;
import com.weet.app.classes.domain.ClassVO;
import com.weet.app.classes.domain.Criteria2;
import com.weet.app.classes.domain.ReviewVO;
import com.weet.app.classes.domain.TotalReviewVO;
import com.weet.app.classes.mapper.ClassMapper;
import com.weet.app.common.domain.Criteria;
import com.weet.app.exception.DAOException;
import com.weet.app.exception.ServiceException;
import com.weet.app.user.domain.TrainerVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2

@Service("classService")
public class ClassServiceImpl implements ClassService {
	
	@Setter(onMethod_= @Autowired)
	private ClassMapper mapper;
	
	// =========================== 메인페이지 ===========================
	// 추천 클래스
	@Override
	public List<ClassVO> getListRecommend() throws ServiceException {
		log.trace("getListRecommend() invoked.");
		
		try {
			return mapper.selectClassRecommend();
		} catch(DAOException e) {
			throw new ServiceException(e);
		} // try-catch
	} // getListRecommend

	
	// 마감임박 클래스
	@Override
	public List<ClassVO> getListEnd() throws ServiceException {
		log.trace("getListEnd() invoked.");
		
		try {
			return mapper.selectClassEnd();
		} catch(DAOException e) {
			throw new ServiceException(e);
		} // try-catch
	} // getListEnd


	@Override
	// 신규 클래스
	public List<ClassVO> getListNew() throws ServiceException {
		log.trace("getListNew() invoked.");
		
		try {
			return mapper.selectClassNew();
		} catch(DAOException e) {
			throw new ServiceException(e);
		} // try-catch
	} // getListNew

	
	// =========================== +더보기 ===========================
	@Override
	public List<ClassVO> getListRecommendAll() throws ServiceException {
		log.trace("getListRecommendAll() invoked.");
		
		try {
			return mapper.selectClassRecommendAll();
		} catch(DAOException e) {
			throw new ServiceException(e);
		} // try-catch
	} // getListRecommendAll


	@Override
	public List<ClassVO> getListEndAll() throws ServiceException {
		log.trace("getListEndAll() invoked.");
		
		try {
			return mapper.selectClassEndAll();
		} catch(DAOException e) {
			throw new ServiceException(e);
		} // try-catch
	} // getListEndAll


	@Override
	public List<ClassVO> getListNewAll() throws ServiceException {
		log.trace("getListNewAll() invoked.");
		
		try {
			return mapper.selectClassNewAll();
		} catch(DAOException e) {
			throw new ServiceException(e);
		} // try-catch
	} // getListNewAll
	
	
	
	// =================== 클래스 목록 페이지: 모든 클래스 ==================
	@Override
	public List<ClassVO> getListAll() throws ServiceException {
		try {
			return mapper.selectAllClass();
		} catch(DAOException e) {
			throw new ServiceException(e);
		} // try-catch
	} // getListAll

	// 페이징 처리 된 클래스 목록
	@Override
	public List<ClassVO> getClassPaging(Criteria2 cri) throws ServiceException {
		try {
			return mapper.selectClassPaging(cri);
		} catch(DAOException e) {
			throw new ServiceException(e);
		} // try-catch
	} // getClassPaging

	// 클래스 총 갯수
	@Override
	public int getTotal(Criteria2 cri) {
		return mapper.getTotal(cri);
	} // getTotal
	
	// 클래스 상세조회
	@Override
	public ClassDetailVO getDetail(String classId) throws ServiceException {
		
		try { return this.mapper.selectDetail(classId); }
		catch(DAOException e) { throw new ServiceException(e); } // try-catch
	} // getDetail

	// 리뷰조회
	@Override
	public List<ReviewVO> getReviews(@Param("classId") String classId, @Param("cri") Criteria cri) throws ServiceException {
		try { return this.mapper.selectReviews(classId, cri); }
		catch(DAOException e) { throw new ServiceException(e); } // try-catch
	} // getReviews

	// 리뷰요약정보
	@Override
	public TotalReviewVO getreviewInfo(String classId) throws ServiceException {
		
		try { return this.mapper.selectTotalReviewInfo(classId); }
		catch(DAOException e) { throw new ServiceException(e); } // try-catch
	} // getreviewInfo

	// 총 좋아요수
	@Override
	public int getTotalLikes(String classId) throws ServiceException {
		
		try { return this.mapper.selectLikes(classId); }
		catch(DAOException e) { throw new ServiceException(e); } // try-catch
	} // getreviewInfo

	// 좋아요 여부 체크
	@Override
	public boolean checkMyLike(String classId, String userId) throws ServiceException {

		try { 
			int selectedRows = this.mapper.selectMyLike(classId, userId);
			
			return selectedRows == 0 ? false : true;
		} catch(DAOException e) { throw new ServiceException(e); } // try-catch
	} // checkMyLike

	// 조와요~!
	@Override
	public boolean classLike(String classId, String userId) throws ServiceException {
		
		try { 
			int selectedRows = this.mapper.insertMyLike(classId, userId);
			
			return selectedRows == 0 ? false : true;
		} catch(DAOException e) { throw new ServiceException(e); } // try-catch
	} // checkMyLike

	// 싫어요~!
	@Override
	public boolean cancelClassLike(String classId, String userId) throws ServiceException {

		try { 
			int selectedRows = this.mapper.deleteMyLike(classId, userId);
			
			return selectedRows == 0 ? false : true;
		} catch(DAOException e) { throw new ServiceException(e); } // try-catch
	} // cancelClassLike
	
	// 트레이너 프로필 조회
	@Override
	public TrainerVO getTrainerProfile(String userId) throws ServiceException {
		
		try { return this.mapper.selectTrainer(userId); }
		catch(DAOException e) { throw new ServiceException(e); } // try-catch
	} // getTrainerProfile

} // end class
