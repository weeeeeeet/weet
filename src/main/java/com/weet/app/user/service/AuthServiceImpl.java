package com.weet.app.user.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
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
		
		String api_key = "NCSDS17Q5TFJVO8V";
	    String api_secret = "SXJ31ME9JZZWQCYS2K2GQVGARTORIBCS";
	    Message coolsms = new Message(api_key, api_secret);
	    log.info("\t+ coolsms:{}", coolsms);

	    // 4 params(to, from, type, text) are mandatory. must be filled
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", userPhone);   		  // 수신전화번호
	    params.put("from", "01087761226");    // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
	    params.put("type", "SMS");
	    params.put("text", "[WEET] 인증번호는" + "["+randomNumber+"]" + "입니다."); // 문자 내용 입력
	    params.put("app_version", "test app 1.2"); // application name and version

	    try {
	        JSONObject obj = (JSONObject) coolsms.send(params);
	        log.trace(obj.toString());
	      } catch (CoolsmsException e) {
	        log.trace(e.getMessage());
	        log.trace(e.getCode());
	      }
	    
	} // certifiedPhoneNumber

	
	// 카카오 로그인
	@Override
	public String getKaKaoAccessToken(String code) throws ServiceException {
        String access_Token="";
        String refresh_Token ="";
        String reqURL = "https://kauth.kakao.com/oauth/token";

        try{
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            //POST 요청을 위해 기본값이 false인 setDoOutput을 true로
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);

            //POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=e633a1a319cc541dac0ec78d1f28cfa4");    // REST_API_KEY 입력
            sb.append("&redirect_uri=http://localhost:8080/auth/kakao"); // 인가코드 받은 redirect_uri 입력
            sb.append("&code=" + code);
            bw.write(sb.toString());
            bw.flush();

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
	
	
}

