<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Weet 비밀번호변경</title>

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
    <link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet">
    <!-- bootstrap v5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>

     <!-- #### style ####-->
    <!-- css -->
    <link href="/resources/css/user/findPwd3.css" rel="stylesheet" />

</head>

<body>
    <div class="wrap">
        <!-- header s -->
        <%@ include file= "/WEB-INF/views/include/header.jsp" %>
        <!-- header e -->
        <section class="login-contain">
            <div class="inner_box">
                <div class="login-main-text"> 비밀번호 찾기 </div>
                <div class="sub-text">
                    <h3>비밀번호를 변경해 주세요.</h3>
                    <P>영문 대소문자, 숫자, 특수문자를 조합하여 8이상 15자리 미만을 사용하세요.</P>
                </div>
                
                <form action="/user/find/pwdch" id="findpwd2_form" name="findpwd2_form" class="findpwd" method="POST">
                
             		<input type="hidden" name="userId" id="userId" value="${ param._USERID_}" required/>
             		
                    <div class="input_list">
                        <div class="inner-list">
                            <div class="la_input">
                                <label for="pwd" class="form-label">새 비밀번호</label>
                                <div class="input_group">
                                    <input type="password" class="form-control-sm" name="userPwd" id="user_pwd" minlength="8"
                                        maxlength="14" placeholder="새로운 비밀번호를 입력해주세요" autocomplete="off" required>
                                </div>
                            </div>
                         </div>
                         <div class="inner-list">
                                <div class="la_input">
                                    <label for="pwd2" class="form-label">비밀번호 확인</label>
                                    <div class="input_group">
                                        <input type="password" class="form-control-sm" name="userPwd2" id="user_pwd2"
                                            minlength="8" maxlength="14" placeholder="비밀번호를 한번 더 입력해주세요"
                                            autocomplete="off" required>
                                    </div>
                                    <span class="checkment" id="pwdCheck"></span>
                                </div>
                            </div>
                            
                        <input class="loginbtn" id='findId_next' onsubmit="changePwd_form()" type="submit" value="다음">
                    
                    </div>
                </form>
            </div>
        </section>
    </div>
    
        <!-- js -->
    <script src="/resources/js/user/findpwd.js"></script>
</body>

</html>