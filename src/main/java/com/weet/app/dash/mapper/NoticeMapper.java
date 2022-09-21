package com.weet.app.dash.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.weet.app.dash.domain.NoticeContentDTO;
import com.weet.app.dash.domain.NoticeVO;
import com.weet.app.exception.DAOException;

// 데이터 접근

//이 자바 인터페이스가 영속성 계층의 DAO 역할을 할,
//마이바티스의 Mapper Interface로서의 역할 수행하도록 구현
public interface NoticeMapper {
	
	//==================================================
	// 1. 공지사항, 코칭계획 목록 반환
	//==================================================
	public abstract List<NoticeVO> selectAllNoticeList() throws DAOException;
	public abstract List<NoticeVO> selectAllCoachingList() throws DAOException;

	//==================================================
	// 2. 공지사항 컨텐츠 상세조회 (컨텐츠)
	//==================================================
	@Select("SELECT * FROM t_notice WHERE n_num = #{n_num} AND N_TYPE = '1'")
	public abstract NoticeVO selectNoticeContents(@Param("n_num") String n_num) throws DAOException;
	
	//==================================================
	// 3. 이번주 코칭계획 컨텐츠 상세조회 (컨텐츠)
	//==================================================
	@Select("SELECT * FROM t_notice WHERE n_num = #{n_num} AND N_TYPE = '2'")
	public abstract NoticeVO selectCoachingContents(@Param("n_num") String n_num) throws DAOException;
	
	// 게시글 등록에 필요한 데이터가 VO객체로 전달되었기 때문에,
	// @Param(바인드변수명) 어노테이션과 @Insert(SQL) 어노테이션으로 처리하기가 힘듦
	// 따라서, Mapper XML 파일에 SQL을 등록해서 처리할 필요가 있음. ("자동실행규칙"을 이용해야 함!!!)
	//==================================================
	// 4. 공지사항, 이번주 코칭계획 작성
	//==================================================
	public abstract Integer insert(NoticeContentDTO dto) throws DAOException;
	public abstract Integer insertSelectKey(NoticeContentDTO dto) throws DAOException;
	
	//==================================================
	// 5. 공지사항, 이번주 코칭계획 수정
	//==================================================
	public abstract Integer update(NoticeContentDTO dto) throws DAOException;
	
	//==================================================
	// 6. 공지사항, 이번주 코칭계획 삭제
	//==================================================
	@Delete("DELETE FROM t_notice WHERE n_num = #{n_numToBeDeleted}")
	public abstract int delete(@Param("n_numToBeDeleted") Integer bno) throws DAOException;
	
} // end interface
