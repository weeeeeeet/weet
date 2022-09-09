package com.weet.app.user.service;

import java.util.Date;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.UncategorizedSQLException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.weet.app.exception.DAOException;
import com.weet.app.exception.ServiceException;
import com.weet.app.user.domain.LoginDTO;
import com.weet.app.user.domain.TrainerDTO;
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
	
	
	@Transactional
	@Override
	public boolean trJoin(UserDTO userDTO, TrainerDTO trainerDTO) throws ServiceException {
		log.trace("trJoin({},{}) invoked.", userDTO, trainerDTO );
				
		try {		
			// dto.getpwd -> 암호화 -> dto.setpwd
			
			// 아래 2개의 DML 작업은 1개의 트랜잭션으로 처리되어야 함(*****)			
			int result1= this.mapper.insertUser(userDTO);				// 가정1: user 테이블에 가입정보 저장
			int result2= this.mapper.insertTr(trainerDTO);				// 가정2: trainer 테이블에 가입정보 저장
			
			return (result1 == 1 && result2 == 1) ? true : false;
			
		} catch(UncategorizedSQLException e) {	// RuntimeException, and related with Global Transaction
			throw e;							
		} catch(Exception e) {throw new ServiceException(e); } // try-catch
	} // trJoin
	
	@Override
	public int idCheck(String id) throws ServiceException {
		log.trace("idCheck({}) invoked.", id);
				
		try { return this.mapper.selectId(id);}
		catch (DAOException e) { throw new ServiceException(e); } // try-catch

	}
	
	
	@Override
	public UserVO login(LoginDTO dto) throws Exception {
		log.debug("login(dto) invoked.");
		
		log.info("\t+ dto: " + dto);
		
		Objects.requireNonNull(this.mapper.selectUser(dto));
		log.info("\t+ selectUser: " + this.mapper.selectUser(dto));
		
		UserVO user = this.mapper.selectUser(dto);

		log.info("\t+ user: " + user);
		
		return user;
	} // login



	@Override
	public UserVO findUserByRememberMe(String rememberMe) throws Exception {
		log.debug("findUserByRememberMe(rememberMe) invoked.");
		
		log.info("\t+ rememberMe: " + rememberMe);
		
		Objects.requireNonNull(this.mapper);
		log.info("\t+ userDAO: " + this.mapper);
		
		UserVO user = this.mapper.selectUserWithRememberMe(rememberMe);
		log.info("\t+ user: " + user);
		
		return user;
	} // findUserByRememberMe



	@Override
	public void modifyUserWithRememberMe(String userId, String rememberMe, Date rememberAge) throws Exception {
		log.debug("modifyUserWithRememberMe(userId, rememberMe, rememberAge) invoked.");
		
		log.info("\t+ userId: " + userId);
		log.info("\t+ rememberMe: " + rememberMe);
		log.info("\t+ rememberAge: " + rememberAge);
		
		Objects.requireNonNull(this.mapper.updateUserWithRememberMe(userId, rememberMe, rememberAge));
		log.info("\t+ mapper: " + this.mapper.updateUserWithRememberMe(userId, rememberMe, rememberAge));
		
		int modifiedUsers = this.mapper.updateUserWithRememberMe(userId, rememberMe, rememberAge);
		log.info("\t+ modifiedUsers: " + modifiedUsers);

	
	} // modifyUserWithRememberMe

} // end class
