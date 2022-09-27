package com.weet.app.user.mapper;

import org.apache.ibatis.annotations.Select;

import com.weet.app.exception.DAOException;
import com.weet.app.user.domain.TrainerDTO;
import com.weet.app.user.domain.UserVO;

public interface UserFindMapper {

	// 아이디 찾기
	@Select("SELECT * FROM t_user WHERE user_name= #{userName} AND user_phone= #{userPhone}")
	public abstract UserVO selectMatchId(String userName, String userPhone) throws DAOException;

	// 비빌번호 변경
	public abstract Integer updatePwd(TrainerDTO trainerDTO) throws DAOException;
}