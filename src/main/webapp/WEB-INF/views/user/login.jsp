<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Weet Login</title>
    
    <!-- #### common ####-->
    <!-- favicon -->
    <link rel="shortcut icon" href="/resources/ico/favicon.ico" type="image/x-icon">
    <link rel="icon" href="/resources/ico/favicon.ico" type="image/x-icon">
    <!-- icon -->
    <script src="https://kit.fontawesome.com/63eb3bc178.js" crossorigin="anonymous"></script>
    <script src="https://code.iconify.design/2/2.1.0/iconify.min.js"></script>
    <!-- font -->
    <link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet">
    <!-- bootstrap v5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>
    <!-- jquery -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.0/jquery-migrate.min.js"></script>
    
    <!-- kakao js -->
    <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
    <!-- naver js -->
    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
 	<!-- google id -->
	<meta name ="google-signin-client_id" content="9667579877-f1vqr5748vk9uuv5bm6nel4gbpr8mi7a.apps.googleusercontent.com">
     <!-- #### style ####-->
    <!-- css -->
    <link href="/resources/css/user/login.css" rel="stylesheet" />
</head>
<body>
	<%@ include file= "/WEB-INF/views/include/header.jsp" %>
    <div class="login-contain">
	
        <div class="d-grid gap-2 col-4 mx-auto mx-block">
            <div class="login-main-text">로그인</div>
            <div class="lgn-btn">

                <div class="btn">

                    <!-- 
                    <a id="kakao-login-btn" href="javascript:loginWithKakao()" class="btn btn-primary kakao" 
                    <a href="/api/kakao/oauth" class="btn btn-primary kakao"
                   -->
                    
                    <a href="https://kauth.kakao.com/oauth/authorize?client_id=e633a1a319cc541dac0ec78d1f28cfa4&redirect_uri=http://localhost:8080/api/kakao/oauth&response_type=code" class="btn btn-primary kakao"
                        role="button" aria-disabled="true">
                        <div class="button-box">
                            <div class="login-icon kakao" width="90%"><img src="/resources/img/static/icon-kakao-medium.svg" alt="카카오 로그인 버튼"></div>
                            <div class="login-text kakao">카카오로 시작하기</div>
                        </div>
                    </a>
                </div>
                <div class="btn">
                    <a id="naverIdLogin_loginButton" href="/api/naver/oauth" class="btn btn-primary naver" id="naverIdLogin_loginButton" role="button" aria-disabled="true">
                        <div class="button-box">
                            <div class="login-icon naver"><img src="/resources/img/static/icon-naver-medium.svg" alt="네이버로 시작하기"></div>
                            <div class="login-text naver">네이버로 시작하기</div>
                        </div>
                    </a>
                </div>
                <div class="btn">
                    <a id="GgCustomLogin" href="javascript:void(0)" class="btn btn-primary google" role="button" aria-disabled="true">
                        <div class="button-box">
                            <div class="login-icon google"><img src="/resources/img/static/icon-google-medium.svg" alt="구글로 시작하기"></div>
                            <div class="login-text google">구글로 시작하기</div>
                            <script>
                                //처음 실행하는 함수
                                function init() {
                                    gapi.load('auth2', function() {
                                        gapi.auth2.init();
                                        options = new gapi.auth2.SigninOptionsBuilder();
                                        options.setPrompt('select_account');
                                        // 추가는 Oauth 승인 권한 추가 후 띄어쓰기 기준으로 추가
                                        options.setScope('email profile openid https://www.googleapis.com/auth/user.birthday.read');
                                        // 인스턴스의 함수 호출 - element에 로그인 기능 추가
                                        // GgCustomLogin은 li태그안에 있는 ID, 위에 설정한 options와 아래 성공,실패시 실행하는 함수들
                                        gapi.auth2.getAuthInstance().attachClickHandler('GgCustomLogin', options, onSignIn, onSignInFailure);
                                    })
                                }
                                
                                function onSignIn(googleUser) {
                                    var access_token = googleUser.getAuthResponse().access_token
                                    $.ajax({
                                        // people api를 이용하여 프로필 및 생년월일에 대한 선택동의후 가져온다.
                                        url: 'https://people.googleapis.com/v1/people/me'
                                        // key에 자신의 API 키를 넣습니다.
                                        , data: {personFields:'birthdays', key:'AIzaSyBOdmeC4SOSzXmPGLEM2vZueqiBSWKg3wk', 'access_token': access_token}
                                        , method:'GET'
                                    })
                                    .done(function(e){
                                        //프로필을 가져온다.
                                        var profile = googleUser.getBasicProfile();
                                        console.log(profile)
                                    })
                                    .fail(function(e){
                                        console.log(e);
                                    })
                                }
                                function onSignInFailure(t){		
                                    console.log(t);
                                }
                                </script>
                                <!-- 구글 api 사용을 위한 스크립트 -->
                                <script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
                            
                        </div>
                    </a>
                </div>
                <div class="btn">
                    <a href="/user/tr/login" class="btn btn-primary tr" role="button" aria-disabled="true">
                        <div class="button-box">
                            <div class="login-icon tricon"><i class="fas fa-dumbbell" alt="트레이너로 시작하기"></i></div>
                            <div class="login-text trtext">트레이너이신가요?</div>
                        </div>
                    </a>
                </div>
                <div class="greement">
                    <a href="#" class="agree_txt" role="button" aria-disabled="true">이용약관</a> 및 <a href="#"
                        class="agree_txt" role="button" aria-disabled="true">개인정보 처리방침</a>확인 후 동의합니다.
                </div>
            </div>
        </div>
    </div>

    <!-- js -->
    <!--  
    <script src="/resources/js/user/kakaoAuth.js"></script> 
    
    -->

</body>

</html>