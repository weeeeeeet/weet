package com.weet.app.user.mapper;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.weet.app.exception.DAOException;
import com.weet.app.user.domain.UserVO;

public interface UserFindMapper {

	// 아이디 찾기
	@Select("SELECT * FROM t_user WHERE user_name= #{userName} AND user_phone= #{userPhone}")
	public abstract UserVO selectMatchId(String userName, String userPhone) throws DAOException;
	
	// 사용자 정보 얻기
	@Select("SELECT * FROM t_user WHERE user_id = #{userId} AND user_name = #{userName} AND user_phone = #{userPhone}")
	public abstract UserVO selectMatchUser(String userId, String userName, String userPhone) throws DAOException;
	
	// 비빌번호 변경
	@Update("UPDATE t_tr SET user_pwd = #{userPwd} WHERE user_id = #{userId}")
	public abstract Integer updatePwd(String userId, String userPwd) throws DAOException;
}