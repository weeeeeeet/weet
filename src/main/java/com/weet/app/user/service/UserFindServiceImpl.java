package com.weet.app.user.service;

import java.util.Objects;

import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weet.app.exception.DAOException;
import com.weet.app.exception.ServiceException;
import com.weet.app.user.domain.UserVO;
import com.weet.app.user.mapper.UserFindMapper;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor


@Service("userFindService")
public class UserFindServiceImpl implements UserFindService, InitializingBean, DisposableBean {

	@Setter(onMethod_= @Autowired)
	private UserFindMapper findmapper;

	@Override
	public UserVO findId(String userName, String userPhone) throws ServiceException {
		log.trace("findId({},{}) invoked.", userName, userPhone);

		try { 
			UserVO vo = this.findmapper.selectMatchId( userName, userPhone );
			return vo; 

		} catch (DAOException e) { throw new ServiceException(e); } // try-catch

	} // FindId

	//===================================================//

	// DisposableBean : 이 Bean 클래스로부터 생성된 bean 객체가 파괴되기 직전에 called back.
	@Override
	public void destroy() throws Exception {			// 후처리(Post-processing)
		log.trace("destroy() invoked.");

	} // destroy


	// // InitializingBean : 이 Bean 클래스로부터 새로운 bean 객체를 생성한 직후에 called back.
	@Override
	public void afterPropertiesSet() throws Exception {	// 전처리(Pre-processing)
		log.trace("afterPropertiesSet() invoked.");

		// 필드에 의존성 주입이 정상적인지 체크
		Objects.requireNonNull(this.findmapper);			// 1st. method
		assert this.findmapper != null;						// 2nd. method

		log.info("\t+ this.mapper: {}", this.findmapper);
	} // afterPropertiesSet




} // end class