package com.weet.app.user.service;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import com.weet.app.exception.ServiceException;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;


@Log4j2
@NoArgsConstructor

@Service("authService")
public class AuthServiceImpl implements AuthService {

	
	// 핸드폰 번호인증
	@Override
	public void certifiedPhoneNumber(String userPhone, int randomNumber) throws ServiceException {

		log.trace("certifiedPhoneNumber({},{}) invoked.", userPhone, randomNumber );
		
		String api_key = "NCSEJ8RXDPWSAVSC";
	        String api_secret = "KA78RHM2JDDGCIHFZHHEQWESNYWTKHJY";
	        Message coolsms = new Message(api_key, api_secret);
	        log.info("\t+ coolsms:{}", coolsms);

	        // 4 params(to, from, type, text) are mandatory. must be filled
	        HashMap<String, String> params = new HashMap<String, String>();
	        params.put("to", userPhone);   		  // 수신전화번호
	        params.put("from", "01026030137");        // 발신전화번호
	        params.put("type", "SMS");
	        params.put("text", "[WEET] 인증번호는" + "["+randomNumber+"]" + "입니다."); // 문자 내용 입력
	        params.put("app_version", "test app 1.2"); // application name and version

	         try {
	             JSONObject obj = (JSONObject) coolsms.send(params);
	             log.trace(obj.toString());
	           } catch (CoolsmsException e) {
	            log.trace(e.getMessage());
	            log.trace(e.getCode());
	         }  // try-catch
	} // certifiedPhoneNumber

} // AuthServiceImpl
