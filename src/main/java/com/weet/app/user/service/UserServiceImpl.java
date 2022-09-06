package com.weet.app.user.service;

import java.util.Date;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weet.app.exception.ServiceException;
import com.weet.app.user.domain.JoinDTO;
import com.weet.app.user.domain.LoginDTO;
import com.weet.app.user.domain.UserVO;
import com.weet.app.user.persistence.UserDAO;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor


@Service("userService")
public class UserServiceImpl implements UserService {
	
	@Setter(onMethod_= {@Autowired})
	private UserDAO userDAO;

	@Override
	public boolean trJoin(JoinDTO joinDTO) throws ServiceException {
		// TODO Auto-generated method stub
		return false;
	}



	@Override
	public int idCheck(String id) throws ServiceException {
		// TODO Auto-generated method stub
		return 0;
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
