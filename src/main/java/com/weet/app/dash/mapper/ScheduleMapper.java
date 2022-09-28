package com.weet.app.dash.mapper;

import java.util.List;

import com.weet.app.dash.domain.FeedbackVO;
import com.weet.app.dash.domain.ScheduleVO;
import com.weet.app.exception.DAOException;

// 데이터 접근

//이 자바 인터페이스가 영속성 계층의 DAO 역할을 할,
//마이바티스의 Mapper Interface로서의 역할 수행하도록 구현
public interface ScheduleMapper {
	
	//==================================================
	// 1. 스케쥴 불러오기
	//==================================================
	public abstract List<ScheduleVO> selectAllScheduleList() throws DAOException;

	//==================================================
	// 2. 스케쥴 상세조회
	//==================================================
//	@Select("SELECT n_num, n_title, n_content, n_ts FROM t_notice WHERE n_num = #{n_numToBeRead}")
//	public abstract NoticeVO select(@Param("n_numToBeRead") String n_num) throws DAOException;
	
} // end interface
