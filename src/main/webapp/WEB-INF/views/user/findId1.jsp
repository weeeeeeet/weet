<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Weet 아이디찾기</title>

    <!-- #### common ####-->
    <!-- favicon -->
    <link rel="shortcut icon" href="/resources/ico/favicon.ico" type="image/x-icon">
    <link rel="icon" href="/resources/ico/favicon.ico" type="image/x-icon">
    <!-- jq -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.0/jquery-migrate.min.js"></script>
    <!-- icon -->
    <script src="https://kit.fontawesome.com/63eb3bc178.js" crossorigin="anonymous"></script>
    <!-- font -->
    <link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css?ver=1.1" rel="stylesheet">
    <!-- bootstrap v5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css?ver=1.1" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js?ver=1.1"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>

     <!-- #### style ####-->
    <!-- css -->
    <link href="/resources/css/user/findId1.css?ver=1.1" rel="stylesheet" />

    

</head>

<body>
    <div class="wrap">
        <!-- header s -->
        <%@ include file= "/WEB-INF/views/include/header.jsp" %>
        <!-- header e -->

        <section class="login-contain">
            <div class="inner_box">
                <div class="login-main-text"> 아이디 찾기 </div>
                <div class="sub-text">
                    <h3>회원정보에 등록한 휴대전화로 인증</h3>
                    <P>회원정보에 등록한 휴대전화 번호와 입력한 휴대전화 번호가 같아야, 인증번호를 받을 수 있습니다.</P>
                </div>
                <form action="/user/find/id" method="POST" class="findid">
                    <div class="input_list">
                        <div class="inner-list">
                            <div class="la_input">
                                <label for="userName" class="form-label">이름</label>
                                <div class="input_group">
                                    <input type="text" class="form-control-sm" name="userName" id="userName" minlength="2" maxlength="15"
                                        placeholder="김영희" aria-describedby="button-addon2" required>
                                </div>
                            </div>
                            <div class="inner-list">
                                <div class="la_input">
                                    <label for="mobile" class="form-label">핸드폰번호</label>
                                    <div class="input-group putbtn">
                                        <input type="text" class="form-control" name="userPhone" id="user_phone"  minlength="10" maxlength="13"
                                            placeholder=" ' - ' 제외하고 입력해주세요"  aria-describedby="button-addon2" required>
                                        <button class="btn btn-outline-secondary putbtn" type="button" id="phoneChk">코드전송</button>
                                    </div>
                                </div>
                            </div>

                   			<p class="checkment2 successPhoneChk">휴대폰 번호 입력후 코드전송 버튼을 누르세요</p>

                            <div class="inner-list">
                            	<div class="la_input">
                                	<label for="authCode" class="form-label">인증번호</label>
                                    <div class="input-group putbtn">
                                        <input type="text" class="form-control" name="userPhone2" id="user_phone2" length="11"
                                            placeholder=" 인증번호를 입력해주세요" aria-label="Recipient's username" aria-describedby="button-addon2">
                                        <button class="btn btn-outline-secondary putbtn" type="button" id="phoneChk2">인증하기</button>
					                   	<input type="hidden" id="phoneDoubleChk"/>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <input class="loginbtn" id='findId_next' onsubmit="findId_form()" type="submit" value="다음">

                    </div>
                </form>
            </div>
        </section>
        
     </div>

    <!-- js -->
    <script src="/resources/js/user/phone.js"></script>
    <script src="/resources/js/user/findId.js"></script>
    
</body>

</html>