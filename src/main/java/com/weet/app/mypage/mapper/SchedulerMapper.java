package com.weet.app.mypage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.weet.app.exception.DAOException;

public interface SchedulerMapper {
	
	// 1. 전체 클래스 ID 조회
	@Select("SELECT class_id FROM t_class")
	public abstract List<String> selectAllClassId() throws DAOException;
	
	// 2. 진행상황 업데이트
	public abstract int updateProgress(String classId) throws DAOException;
		
	// 3. 종료여부 업데이트
	public abstract int updateStatus(String classId) throws DAOException;

} // end interface
