package com.weet.app.classes.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weet.app.classes.domain.ClassDetailVO;
import com.weet.app.classes.domain.ReviewVO;
import com.weet.app.classes.domain.TotalReviewVO;
import com.weet.app.classes.mapper.ClassMapper;
import com.weet.app.common.domain.Criteria;
import com.weet.app.exception.DAOException;
import com.weet.app.exception.ServiceException;

import lombok.Setter;

@Service("classService")
public class ClassServiceImpl implements ClassService {
	
	@Setter(onMethod_= @Autowired)
	private ClassMapper mapper;

	
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

} // end class
