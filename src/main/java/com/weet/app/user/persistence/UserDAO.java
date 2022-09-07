package com.weet.app.user.persistence;

import java.util.Date;

import com.weet.app.user.domain.LoginDTO;
import com.weet.app.user.domain.UserVO;


public interface UserDAO {
	
	
	public UserVO selectUser(LoginDTO dto) throws Exception;
	public UserVO selectUserWithRememberMe(String rememberMe) throws Exception;
	public int updateUserWithRememberMe(String userId, String rememberMe, Date rememberAge) throws Exception;

} // end interface
