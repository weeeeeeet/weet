package com.weet.app.user.service;

import java.util.Date;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.UncategorizedSQLException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.weet.app.exception.DAOException;
import com.weet.app.exception.ServiceException;
import com.weet.app.user.domain.LoginDTO;
import com.weet.app.user.domain.MemberVO;
import com.weet.app.user.domain.TrainerDTO;
import com.weet.app.user.domain.TrainerVO;
import com.weet.app.user.domain.UserDTO;
import com.weet.app.user.domain.UserVO;
import com.weet.app.user.mapper.UserMapper;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor


@Service("userService")
public class UserServiceImpl implements UserService {

	@Setter(onMethod_= @Autowired)
	private UserMapper mapper;
	
	// 회원가입
	@Override
	@Transactional
	public boolean trJoin(UserDTO userDTO, TrainerDTO trainerDTO) throws ServiceException {
		log.trace("trJoin({},{}) invoked.", userDTO, trainerDTO);
				
		try {		

			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			// dto.getpwd -> 암호화 -> dto.setpwd
			String encPassword = encoder.encode(trainerDTO.getUserPwd());	// get으로 받아온 pwd -> encoding
			trainerDTO.setUserPwd(encPassword);								// encoded pwd -> set으로 넣어주기
			log.info("\t+ encPassword:{}" , encPassword);
			
			// 아래 2개의 DML 작업은 1개의 트랜잭션으로 처리되어야 함(*****)			

			int result1= this.mapper.insertUser(userDTO);				// 가정1: user 테이블에 가입정보 저장
			int result2= this.mapper.insertTr(trainerDTO);				// 가정2: trainer 테이블에 가입정보 저장
			
			return (result1 == 1 && result2 == 1) ? true : false;
			
		} catch(UncategorizedSQLException e) {	// RuntimeException, and related with Global Transaction
			throw e;							
		} catch(Exception e) {throw new ServiceException(e); } // try-catch
	} // trJoin
	
	
	// 아이디중복체크
	@Override
	public int idCheck(String id) throws ServiceException {
		log.trace("idCheck({}) invoked.", id);
				
		try { return this.mapper.selectId(id);}
		catch (DAOException e) { throw new ServiceException(e); } // try-catch

	}
	
	// 로그인
	@Override
	public TrainerVO login(LoginDTO dto) throws ServiceException {
		log.trace("login({}) invoked. ", dto);                                                                                                                                                                                                                                                          

		try {
			TrainerVO loginUser = this.mapper.selectUser(dto);

			Objects.requireNonNull(loginUser);
			log.info("\t+ selectUser: " + loginUser);

			// dto의 pwd와 DB의 복호화된 pwd가 동일한지 비교한다.
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			boolean isMatched = encoder.matches(dto.getUserPwd(),loginUser.getUserPwd());
			log.info("\t+ isMatched:{}", isMatched);

			if(isMatched) {
				log.info("\t+ loginUser: " + loginUser);
				return loginUser;
			} else {
				return null;
			}

		} catch (Exception e) {
			throw new ServiceException(e);
		} // try-catch

	} // login


	// rememberMe 기능 사용유무
	@Override
	public TrainerVO findUserByRememberMe(String rememberMe) throws ServiceException {
		log.debug("findUserByRememberMe(rememberMe) invoked.");
		
		log.info("\t+ rememberMe: " + rememberMe);
		
		try {
			return this.mapper.selectUserWithRememberMe(rememberMe);
		} catch(Exception e) {
			throw new ServiceException(e);
		} // try-catch
	} // findUserByRememberMe


	// rememberMe 정보 업데이트
	@Override
	public boolean modifyUserWithRememberMe(String userId, String rememberMe, Date rememberAge) throws ServiceException {
		log.trace("modifyUserWithRememberMe({}, {}, {}) invoked.", userId, rememberMe, rememberAge);
		
		try {
			return this.mapper.updateUserWithRememberMe(userId, rememberMe, rememberAge) == 1;
		} catch(Exception e) {
			throw new ServiceException(e);
		} // try-catch
	} // modifyUserWithRememberMe

	// =============== 추가한 코드 ================= // 
	// 일반유저 등록
	@Override
	@Transactional
	public boolean userJoin(UserDTO userDTO, MemberVO memberVO) throws ServiceException {
		log.trace("userJoin({}, {}) invoked.", userDTO, memberVO);
		
		try {
			if ( this.mapper.insertUser(userDTO) == 1 && this.mapper.insertMem(memberVO) == 1 ) return true;
			
			return false;
		} catch(UncategorizedSQLException e) {	// RuntimeException, and related with Global Transaction
			throw e;							
		} catch(Exception e) {throw new ServiceException(e); } // try-catch
	} // userJoin

	// 로그인 토큰 업데이트
	@Override
	public void userTokenUpdate(MemberVO memberVO) throws ServiceException {
		log.trace("userTokenUpdate({}) invoked.", memberVO);
		
		try { this.mapper.updateToken(memberVO); } 
		catch(DAOException e) { throw new ServiceException(e); } // try-catch
	} // userTokenUpdate


	// 유저 프로필 조회
	@Override
	public UserVO getUserProfile(String userId) throws ServiceException {
		log.trace("getUserProfile({}) invoked.", userId);
		
		try { return this.mapper.selectUserInfo(userId); } 
		catch(DAOException e) { throw new ServiceException(e); } // try-catch
	} // getUserProfile

} // end class
