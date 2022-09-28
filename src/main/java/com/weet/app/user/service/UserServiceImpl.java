package com.weet.app.user.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Date;
import java.util.HashMap;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.UncategorizedSQLException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.weet.app.exception.DAOException;
import com.weet.app.exception.ServiceException;
import com.weet.app.user.domain.LoginDTO;
import com.weet.app.user.domain.MemberDTO;
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

	
	// =============== Kakao Join&Login ================= // 
	// 카카오 로그인
	@Override
	public String getKaKaoAccessToken(String code) throws ServiceException {
        String access_Token="";
        String refresh_Token ="";
        String reqURL = "https://kauth.kakao.com/oauth/token";

        try{
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            
            // POST 요청을 위해 기본값이 false인 setDoOutput을 true로
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);
            
            // POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("&client_id=e633a1a319cc541dac0ec78d1f28cfa4");    // REST_API_KEY 입력
            sb.append("&redirect_uri=http://localhost:8080/api/kakao/oauth"); // 인가코드 받은 redirect_uri 입력
            sb.append("&code=");
            sb.append(code);
            bw.write(sb.toString());
            bw.flush();

            // 결과 코드가 200이라면 성공
            int responseCode = conn.getResponseCode();
            log.info("responseCode : {}", responseCode);
            
           // 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";
            while ((line = br.readLine()) != null) {
                result += line;
            }
            
            log.info("\t+ response body : {}" + result);
            
            //Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
            JsonElement element = JsonParser.parseString(result);
            JsonObject object = element.getAsJsonObject();
            
            access_Token = object.get("access_token").getAsString();
            refresh_Token = object.get("refresh_token").getAsString();
            log.info("\t+ access_Token: {}", access_Token);
            log.info("\t+ refresh_token : {}", refresh_Token);

            br.close();
            bw.close();
            
        } catch (Exception e) {
			throw new ServiceException(e);
		} // try-catch

        return access_Token;

    } // getKaKaoAccessToken


	@Override
	public void createKakaoUser(String token) throws ServiceException {
		String reqURL = "https://kapi.kakao.com/v2/user/me";
        
		//access_token을 이용하여 사용자 정보 조회
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            conn.setRequestMethod("POST");
            conn.setDoOutput(true);
            conn.setRequestProperty("Authorization", "Bearer " + token); // 전송할 header 작성, access_token전송
            														     // (*주의*) :Bearer {ACCESS_TOKEN}에서 Bearer 바로 뒤는 공백
            //결과 코드가 200이라면 성공
            int responseCode = conn.getResponseCode();
            log.info("responseCode : {}", responseCode);
            
            //요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";
            
            while ((line = br.readLine()) != null) {
                result += line;
            }
            log.info("response body : {} " , result);
            
            //Gson 라이브러리로 JSON파싱
            JsonElement element = JsonParser.parseString(result);
            JsonObject object = element.getAsJsonObject();
            
            int id = object.get("id").getAsInt();
            boolean hasEmail = object.get("kakao_account").getAsJsonObject().get("has_email").getAsBoolean();
            String email = "";
            if(hasEmail){
                email = object.get("kakao_account").getAsJsonObject().get("email").getAsString();
            }
            log.info("id : {} ", id);
            log.info("email : {} ", email);

            br.close();
            
        } catch (Exception e) {
			throw new ServiceException(e);
		} // try-catch

	}


	@Override
	public HashMap<String, Object> getUserInfo(String access_Token) throws ServiceException {
//	    요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
        HashMap<String, Object> userInfo = new HashMap<>();
        String reqURL = "https://kapi.kakao.com/v2/user/me";
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            //    요청에 필요한 Header에 포함될 내용
            conn.setRequestProperty("Authorization", "Bearer " + access_Token);

            int responseCode = conn.getResponseCode();
            log.info("responseCode : {}", responseCode);

            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            log.info("response body : {}", result);

            //Gson 라이브러리로 JSON파싱
            JsonElement element = JsonParser.parseString(result);
            JsonObject object = element.getAsJsonObject();

            JsonObject properties = object.get("properties").getAsJsonObject();
            JsonObject kakao_account = object.get("kakao_account").getAsJsonObject();

            String nickname = properties.getAsJsonObject().get("profile_nickname").getAsString();
            String profile_image = properties.getAsJsonObject().get("profile_image").getAsString();
            String email = kakao_account.getAsJsonObject().get("account_email").getAsString();
            String name = kakao_account.getAsJsonObject().get("name").getAsString();
            String gender = kakao_account.getAsJsonObject().get("gender").getAsString();
            String phone = kakao_account.getAsJsonObject().get("phone_number").getAsString();

            userInfo.put("nickname", nickname);
            userInfo.put("email", email);
            userInfo.put("profile_image", profile_image);
            userInfo.put("name", name);
            userInfo.put("gender", gender);

            log.info("\t + nickname :{}" , nickname);
            log.info("\t + email :{}" , email);
            log.info("\t + profile_image :{}" , profile_image);
            log.info("\t + name :{}" , name);
            log.info("\t + gender :{}" , gender);
            log.info("\t + phone :{}" , phone);


        } catch (Exception e) {
			throw new ServiceException(e);
		} // try-catch

        return userInfo;
    }
	
	
	// =============== Naver Join&Login ================= // 
	// 일반유저 등록
	@Override
	@Transactional
	public boolean userJoin(UserDTO userDTO, MemberDTO memberDTO) throws ServiceException {
		log.trace("userJoin({}, {}) invoked.", userDTO, memberDTO);
		
		try {
			if ( this.mapper.insertUser(userDTO) == 1 && this.mapper.insertMem(memberDTO) == 1 ) return true;
			
			return false;
		} catch(UncategorizedSQLException e) {	// RuntimeException, and related with Global Transaction
			throw e;							
		} catch(Exception e) {throw new ServiceException(e); } // try-catch
	} // userJoin

	// 로그인 토큰 업데이트
	@Override
	public void userTokenUpdate(MemberDTO memberDTO) throws ServiceException {
		log.trace("userTokenUpdate({}) invoked.", memberDTO);
		
		try { this.mapper.updateToken(memberDTO); } 
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
