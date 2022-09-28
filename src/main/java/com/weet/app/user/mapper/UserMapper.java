package com.weet.app.user.mapper;

import java.util.Date;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.weet.app.exception.DAOException;
import com.weet.app.user.domain.LoginDTO;
import com.weet.app.user.domain.MemberVO;
import com.weet.app.user.domain.TrainerDTO;
import com.weet.app.user.domain.TrainerVO;
import com.weet.app.user.domain.UserDTO;
import com.weet.app.user.domain.UserVO;

public interface UserMapper {
	
	// 회원가입 T_USER 데이터 입력
	@Insert("INSERT INTO t_user(user_id, user_name, user_type, user_nickname, user_phone, user_email, user_profile, user_gender, \r\n"
			+ "user_svc_use_agmt_yn, user_svc_pcy_Agmt_yn, user_receive_email_agmt_yn, user_receive_sms_agmt_yn) \r\n"
			+ "VALUES( #{userId}, #{userName}, #{userType}, #{userNickname}, #{userPhone}, #{userEmail}, #{userProfile}, #{userGender}, \r\n"
			+ "#{userSvcUseAgmtYN}, #{userSvcPCYAgmtYN}, #{userReceiveEmailAgmtYN}, #{userReceiveSMSAgmtYN})")
	public abstract Integer insertUser(UserDTO userDTO) throws DAOException;

	// 회원가입 T_TRAINER 데이터 입력
	@Insert("INSERT INTO t_tr(user_id, user_pwd, user_career, user_intro, user_biz) \r\n"
			+ "     VALUES(#{userId}, #{userPwd}, #{userCareer}, #{userIntro}, #{userBiz} )")
	public abstract Integer insertTr(TrainerDTO trainerDTO) throws DAOException;
	
	// ============ Naver Join&Login Start ============= //
	// 유저 정보 조회
	@Select("SELECT * FROM t_user WHERE user_id = #{userId}")
	public abstract UserVO selectUserInfo(String userId) throws DAOException;
	
	// 회원가입 T_MEM 데이터 입력
	@Insert("INSERT INTO t_mem (user_id, user_platform, user_id_token) "
			+ "VALUES (#{userId}, #{userPlatform}, #{userIdToken})")
	public abstract Integer insertMem(MemberVO memberVO) throws DAOException;
	
	// 유저 토큰 업데이트
	@Update("UPDATE t_mem SET user_id_token = #{userIdToken} WHERE user_id = #{userId}")
	public abstract Integer updateToken(MemberVO memberVO) throws DAOException;
	// ============ Naver Join&Login End ============= //
	
	// 아이디 중복확인
	public abstract Integer selectId(String id) throws DAOException;

	// 로그인 창에서 입력한 아이디와 암호에 매칭되는 회원이 있는지 확인
	public abstract TrainerVO selectUser(LoginDTO dto) throws DAOException;
	
	// 자동로그인 쿠키값으로 사용자를 조회하여 인증정보를 생성
	public abstract TrainerVO selectUserWithRememberMe(String rememberMe) throws DAOException;

	// 자동로그인 설정이 on된 상태로 로그인 성공 수행시, 쿠키정보를 기록
	public abstract int updateUserWithRememberMe(String userId, String rememberMe, Date rememberAge) throws DAOException;
	
}
