package com.weet.app.mypage.mapper;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.weet.app.exception.DAOException;
import com.weet.app.mypage.domain.Criteria;
import com.weet.app.mypage.domain.MypageBoardVO;
import com.weet.app.mypage.domain.MypageBodyDTO;
import com.weet.app.mypage.domain.MypageClassVO;
import com.weet.app.mypage.domain.MypageReplyVO;
import com.weet.app.mypage.domain.MypageReviewDTO;

public interface MypageMapper {
	
	// ====================================================================
	// 1. 전체 게시물 조회 (OK)
	// ====================================================================
	public abstract List<MypageBoardVO> selectListWithPaging(Criteria cri, @Param("userId")String userId) throws DAOException;
	
	// ====================================================================
	// + 페이징 처리에 필요한 총 게시물의 수 반환 (OK)
	// ====================================================================
	@Select("SELECT count(comm_id) FROM T_COMMUNITY WHERE USER_ID = #{userId}")
	public abstract Integer selectTotalAmount(@Param("userId")String userId) throws DAOException;
	
	// ====================================================================
	// 2. 답변완료 게시물 조회 (OK)
	// ====================================================================
	public abstract List<MypageBoardVO> selectReplyDoneList(Criteria cri, @Param("userId")String userId) throws DAOException;
	
	// ====================================================================
	// + 페이징 처리에 필요한 총 답변완료 게시물의 수 반환 (OK)
	// ====================================================================
	@Select("SELECT count(comm_id) FROM T_COMMUNITY WHERE USER_ID = #{userId} AND COMM_REPLY_YN = 'Y'")
	public abstract Integer selectReplyDoneAmount(@Param("userId")String userId) throws DAOException;
	
	// ====================================================================
	// 3. 좋아요 게시물 조회 (OK)
	// ====================================================================
	public abstract List<MypageBoardVO> selectLikeList(Criteria cri, @Param("userId")String userId) throws DAOException;
	
	// ====================================================================
	// + 페이징 처리에 필요한 총 좋아요 게시물의 수 반환 (OK)
	// ====================================================================
	@Select("SELECT count(lb_id) FROM T_Like_Board WHERE USER_ID = #{userId}")
	public abstract Integer selectLikeAmount(@Param("userId")String userId) throws DAOException;
	
	// ====================================================================
	// 4. 댓글 조회 (OK)
	// ====================================================================
	public abstract List<MypageReplyVO> selectReplyList(Criteria cri, @Param("userId")String userId) throws DAOException;
	
	// ====================================================================
	// + 페이징 처리에 필요한 총 댓글의 수 반환 (OK)
	// ====================================================================
	@Select("SELECT count(comm_id) FROM T_REPLY WHERE USER_ID = #{userId}")
	public abstract Integer selectReplyAmount(@Param("userId")String userId) throws DAOException;
	
	// ====================================================================
	// 5. 내 수강 중 클래스룸
	// ====================================================================
	public abstract List<MypageClassVO> selectClass(Criteria cri, @Param("userId")String userId) throws DAOException;
	
	// ====================================================================
	// + 페이징 처리에 필요한 총 수강 중 클래스의 수 반환 (OK)
	// ====================================================================
	@Select("SELECT count(CLASS_LISTENER) FROM t_class_listener WHERE USER_ID = #{userId}")
	public abstract Integer selectClassAmount(@Param("userId")String userId) throws DAOException;
	
	// ====================================================================
	// 6. 수강 종료 클래스룸 ( 페이지는 보입니다. )
	// ====================================================================
	public abstract List<MypageClassVO> selectDoneClass(Criteria cri, @Param("userId")String userId) throws DAOException;
	
	// ====================================================================
	// + 페이징 처리에 필요한 총 수강 중 클래스의 수 반환 (OK)
	// ====================================================================
	public abstract Integer selectDoneClassAmount(@Param("userId")String userId) throws DAOException;
	
	// ====================================================================
	// 7. 후기 등록하기 ( 미완 : 파일업로드 관련 문제 )
	// ====================================================================
	public abstract Integer insertReview(MypageReviewDTO dto) throws DAOException;
	
	// ====================================================================
	// 8. 시작 전 클래스 (OK)
	// ====================================================================
	public abstract List<MypageClassVO> selectBeforeClass(@Param("userId")String userId) throws DAOException;
	
	// ====================================================================
	// 9. 찜한 클래스 (OK)
	// ====================================================================
	public abstract List<MypageClassVO> selectLikeClass(@Param("userId")String userId) throws DAOException;
	
	// ====================================================================
	// 10. 마이바디 페이지 불러오기
	// ====================================================================
	public abstract List<MypageBodyDTO> selectMyBody(@Param("userId")String userId) throws DAOException;
	
	// ====================================================================
	// 11. 마이바디 입력
	// ====================================================================
	public abstract Integer insertMyBody(MypageBodyDTO dto) throws DAOException;
	
	// ====================================================================
	// 12. 마이바디 수정
	// ====================================================================
	public abstract List<MypageBodyDTO> updateMyBody() throws DAOException;
	
	// ====================================================================
	// 12. 마이바디 - 날짜선택
	// ====================================================================
	public abstract Date selectMyBodyDate() throws DAOException;
	
		
	// 13. 구매내역 - 전체 내역
	
	// 14. 구매내역 - 상세 내역
	
	// 15. 프로필 - 조회
	
	// 16. 프로필 - 수정
	
	// 17. 알림설정
	
	// 18. 회원탈퇴
	
	
	
} // end interface
