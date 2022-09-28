package com.weet.app.mypage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.weet.app.exception.DAOException;
import com.weet.app.mypage.domain.Criteria;
import com.weet.app.mypage.domain.MypageBoardVO;
import com.weet.app.mypage.domain.MypageBodyDTO;
import com.weet.app.mypage.domain.MypageCheckClassVO;
import com.weet.app.mypage.domain.MypageClassVO;
import com.weet.app.mypage.domain.MypageReplyVO;

public interface MypageTMapper {
	
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
	// 9. 클래스 검수 (OK)
	// ====================================================================
	public abstract List<MypageCheckClassVO> selectLikeClass(@Param("userId")String userId) throws DAOException;
	
	// ====================================================================
	// 10. 마이바디 페이지 불러오기
	// ====================================================================
	public abstract List<MypageBodyDTO> selectMyBody(@Param("userId")String userId) throws DAOException;
	
	// ====================================================================
	// 11. 마이바디 입력 (OK..?)
	// ====================================================================
	public abstract Integer insertMyBody(MypageBodyDTO dto) throws DAOException;
	
	// ====================================================================
	// 12. 마이바디 수정
	// ====================================================================
	public abstract Integer updateMyBody(MypageBodyDTO dto) throws DAOException;
	
	// ====================================================================
	// 13. 마이바디 - 날짜선택 ( 그래프가 적용이 안됨... ) (**********)
	// ====================================================================
	public abstract List<MypageBodyDTO> selectMyBodyDate(MypageBodyDTO dto) throws DAOException;
	
	
	
	// ====================================================================
	// 14. 구매내역 - 전체 내역
	// ====================================================================
	@Select("SELECT count(CLASS_LISTENER) FROM t_class_listener WHERE USER_ID = #{userId}")
	public abstract Integer selectAllPay(@Param("userId")String userId) throws DAOException;
	
	
	// 14. 구매내역 - 상세 내역
	
	// 15. 프로필 - 조회
	
	// 16. 프로필 - 수정
	
	// 17. 알림설정
	
	// 18. 회원탈퇴
	
	
	
} // end interface
