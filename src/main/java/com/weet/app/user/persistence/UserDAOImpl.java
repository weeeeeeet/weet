package com.weet.app.user.persistence;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.weet.app.user.domain.LoginDTO;
import com.weet.app.user.domain.UserVO;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

@Repository("userDAO")
public class UserDAOImpl implements UserDAO {
	
	@Setter(onMethod_= {@Autowired})
	private SqlSessionFactory sqlSessionFactory;

	
	
	@Override
	public UserVO selectUser(LoginDTO dto) throws Exception {
		log.debug("selectUser(dto) invoked.");
		
		log.info("\t+ dto: " + dto);
		
		Objects.requireNonNull(this.sqlSessionFactory);
		log.info("\t+ sqlSessionFactory: " + this.sqlSessionFactory);
		
		SqlSession sqlSession = this.sqlSessionFactory.openSession();
		try(sqlSession) {
			
			String namespace = "UserMapper";
			String sqlId = "selectUser";
			
			log.info("\t+ namespace.sqlId: " + namespace+"."+sqlId);
			
			UserVO user = sqlSession.selectOne(namespace+"."+sqlId, dto);
			log.info("\t+ user: " + user);
			
			return user;
			
		} // try-with-resources
	} // selectUser



	@Override
	public UserVO selectUserWithRememberMe(String rememberMe) throws Exception {
		log.debug("selectUserWithRememberMe(rememberMe) invoked.");
		
		Objects.requireNonNull(this.sqlSessionFactory);
		log.info("\t+ sqlSessionFactory: " + this.sqlSessionFactory);
		
		SqlSession sqlSession = this.sqlSessionFactory.openSession();
		try(sqlSession) {
			
			String namespace = "UserMapper";
			String sqlId = "selectUserWithRememberMe";
			
			log.info("\t+ namespace.sqlId: " + namespace+"."+sqlId);
			
			UserVO user = sqlSession.selectOne(namespace+"."+sqlId, rememberMe);
			log.info("\t+ user: " + user);
			
			return user;
		} // try-with-resources
	} // selectUserWithRememberMe



	@Override
	public int updateUserWithRememberMe(String userId, String rememberMe, Date rememberAge) throws Exception {
		log.debug("updateUserWithRememberMe(userId, rememberMe, rememberAge) invoked.");
		
		Objects.requireNonNull(this.sqlSessionFactory);
		log.info("\t+ sqlSessionFactory: " + this.sqlSessionFactory);
		
		SqlSession sqlSession = this.sqlSessionFactory.openSession();
		try(sqlSession) {
			
			String namespace = "UserMapper";
			String sqlId = "updateUserWithRememberMe";
			
			log.info("\t+ namespace.sqlId: " + namespace+"."+sqlId);
			
			Map<String, Object> params = new HashMap<>();
			params.put("rememberme", rememberMe);
			params.put("rememberage", rememberAge);
			params.put("userid", userId);
			
			log.info("\t+ params: " + params);
			
			int affectedUsers = sqlSession.update(namespace+"."+sqlId, params);
			log.info("\t+ affectedUsers: " + affectedUsers);
			
			return affectedUsers;
		} // try-with-resources
	} // updateUserWithRememberMe

} // end class
