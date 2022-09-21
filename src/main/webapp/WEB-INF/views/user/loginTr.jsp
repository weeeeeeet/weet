<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Weet TR Login</title>

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

     <!-- #### style ####-->
    <!-- css -->
    <link href="/resources/css/user/loginTr.css" rel="stylesheet" />


   <script>
        // To display sign-in result.
        var result = "${__RESULT__}";

        if(result != null && result.length > 0) {
            alert(result);
        } // if
    </script>
</head>

<body>
    <div class="wrap">
        <!-- header s -->
        <%@ include file= "/WEB-INF/views/include/header.jsp" %>
        <!-- header e -->

        <section class="login-contain">

            <div class="inner_box">
                <div class="login-main-text"> 트레이너 로그인 </div>

                    <form action="/user/loginPost" method="post" class="member-login">
                        <div class="linput_list">
                            <div class="inner-list">
                                <div class="la_input">
                                    <label for="userId" class="form-label">아이디</label>
                                    <div class="input_group">
                                        <input type="text" class="form-control-sm ipg" id="userId" name="userId" placeholder="example1234"
                                            autocomplete="off">
                                    </div>
                                </div>
                                <div class="inner-list">
                                    <div class="la_input">
                                        <label for="userPwd" class="form-label">비밀번호</label>
                                        <div class="input_group">
                                            <input type="password" class="form-control-sm" id="userPwd" name="userPwd" >
                                        </div>
                                    </div>
                                </div>
													
					            <div>Remember-me <input type="checkbox" name="rememberMe"></div>
                                <ul class="mentbox">
                                    <li><a href="/user/find/pwd" class="findpw" role="button"
                                            aria-disabled="true">비밀번호 찾기</a></li>
                                    <li>|</li>
                                    <li><a href="/user/find/id" class="findid" role="button" aria-disabled="true">아이디
                                            찾기</a></li>
                                    <li>|</li>
                                    <li><a href="/user/tr/join" class="findin" role="button"
                                            aria-disabled="true">회원가입</a></li>
                                </ul>

                                <button class="loginbtn" type="submit">로그인</button>
                                <div class="greement">
                                    <a href="#" class="agree_txt" role="button" aria-disabled="true">이용약관</a> 및
                                    <a href="#" class="agree_txt" role="button" aria-disabled="true">개인정보 처리방침</a> 확인 후
                                    동의합니다
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
        </section>
    </div>
</body>

</html>