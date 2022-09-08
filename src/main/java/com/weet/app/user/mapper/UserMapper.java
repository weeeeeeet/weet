package com.weet.app.user.mapper;

import java.util.Date;

import org.apache.ibatis.annotations.Insert;

import com.weet.app.exception.DAOException;
import com.weet.app.user.domain.LoginDTO;
import com.weet.app.user.domain.TrainerDTO;
import com.weet.app.user.domain.UserDTO;
import com.weet.app.user.domain.UserVO;

public interface UserMapper {
	
	// 회원가입
	@Insert("INSERT INTO t_user(user_id, user_name, user_type, user_nickname, user_phone, user_email, user_profile, user_gender, \r\n"
							+ "user_svc_use_agmt_yn, user_svc_pcy_Agmt_yn, user_receive_email_agmt_yn, user_receive_sms_agmt_yn) \r\n"
							+ "VALUES( #{userId}, #{userName}, #{userType}, #{userNickname}, #{userPhone}, #{userEmail}, #{userProfile}, #{userGender}, \r\n"
							+ "#{userSvcUseAgmtYN}, #{userSvcPCYAgmtYN}, #{userReceiveEmailAgmtYN}, #{userReceiveSMSAgmtYN})")
	public abstract Integer insertUser(UserDTO userDTO) throws DAOException;
	
	@Insert("INSERT INTO t_tr(user_id, user_pwd, user_career, user_intro, user_biz) \r\n"
			+ "     VALUES( #{userId}, #{user_pwd}, #{user_career}, #{user_intro}, #{user_biz} )")
	public abstract Integer insertTr(TrainerDTO trainerDTO) throws DAOException;
	

	// 아이디 중복확인
	public abstract Integer selectId(String id) throws DAOException;

	// 로그인 창에서 입력한 아이디와 암호에 매칭되는 회원이 있는지 확인
	public abstract UserVO selectUser(LoginDTO dto) throws DAOException;
	
	// 자동로그인 쿠키값으로 사용자를 조회하여 인증정보를 생성
	public abstract UserVO selectUserByRememberMe(String rememberMe) throws DAOException;

	// 자동로그인 설정이 on된 상태로 로그인 성공 수행시, 쿠키정보를 기록
	public abstract int updateUserWithRememberMe(String userid, String rememberMe, Date rememberAge) throws DAOException;
	
}
