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
import com.weet.app.user.persistence.UserDAO;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor


@Service("userService")
public class UserServiceImpl implements UserService {

	@Setter(onMethod_= @Autowired)
	private UserMapper mapper;
	
	@Setter(onMethod_= {@Autowired})
	private UserDAO userDAO;
	
	@Transactional
	@Override
	public void trJoin(UserDTO userDTO, TrainerDTO trainerDTO) throws ServiceException {
		log.trace("trJoin({},{}) invoked.", userDTO, trainerDTO );
				
		try {
			Objects.requireNonNull(this.mapper.insertUser(userDTO));
			assert this.mapper.insertTr(trainerDTO) != null;
			
			// 아래 2개의 DML 작업은 1개의 트랜잭션으로 처리되어야 함(*****)			
			this.mapper.insertUser(userDTO);				// 가정1: user 테이블에 가입정보 저장
			this.mapper.insertTr(trainerDTO);				// 가정2: trainer 테이블에 가입정보 저장
			
			log.info("\t+ Transfer Success.");
			
			// ======================== 매우 주의할 것 ========================== //
			// Spring TX manager 가 Global Transaction 처리를 해주려면,
			// 아래의 메소드에서, org.springframework.jdbc.UncategorizedSQLException (RuntimeException) 예외 
			// 그대로 throw 하도록 해야 됨 (***)
			// 그렇지 않고, 다른 Exception 으로 wrapping 해 버리면, Gloval Transaction  처리가 되지 못함 (***)
			
		} catch(UncategorizedSQLException e) {	// RuntimeException, and related with Global Transaction
			throw e;							
		} catch(Exception e) {
			log.error("\t+ Transfer Failure.");
			
			throw new ServiceException(e);
			
		} // try-catch
	}



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
		
		Objects.requireNonNull(this.userDAO);
		log.info("\t+ userDAO: " + this.userDAO);
		
		UserVO user = this.userDAO.selectUser(dto);
		log.info("\t+ user: " + user);
		
		return user;
	} // login



	@Override
	public UserVO findUserByRememberMe(String rememberMe) throws Exception {
		log.debug("findUserByRememberMe(rememberMe) invoked.");
		
		log.info("\t+ rememberMe: " + rememberMe);
		
		Objects.requireNonNull(this.userDAO);
		log.info("\t+ userDAO: " + this.userDAO);
		
		UserVO user = this.userDAO.selectUserWithRememberMe(rememberMe);
		log.info("\t+ user: " + user);
		
		return user;
	} // findUserByRememberMe



	@Override
	public void modifyUserWithRememberMe(String userId, String rememberMe, Date rememberAge) throws Exception {
		log.debug("modifyUserWithRememberMe(userId, rememberMe, rememberAge) invoked.");
		
		log.info("\t+ userId: " + userId);
		log.info("\t+ rememberMe: " + rememberMe);
		log.info("\t+ rememberAge: " + rememberAge);
		
		Objects.requireNonNull(this.userDAO);
		log.info("\t+ userDAO: " + this.userDAO);
		
		int modifiedUsers = this.userDAO.updateUserWithRememberMe(userId, rememberMe, rememberAge);
		log.info("\t+ modifiedUsers: " + modifiedUsers);

	
	} // modifyUserWithRememberMe

} // end class
