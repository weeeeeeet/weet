<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Weet Admin</title>

    <!-- favicon -->
    <link rel="shortcut icon" href="/resources/ico/favicon.ico" type="image/x-icon">
    <link rel="icon" href="/resources/ico/favicon.ico" type="image/x-icon">
    <link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/63eb3bc178.js" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>
    <link href="/resources/css/user/loginTr.css" rel="stylesheet" />

</head>

<body>
    <div class="wrap">
        <!-- header s -->
        <%@ include file="/WEB-INF/views/include/adminHeader.jsp" %>
        <!-- header e -->

        <section class="login-contain">

            <div class="inner_box">
                <div class="login-main-text"> 관리자 로그인 </div>
                <div class="sub-text">

                    <form action="Login" class="member-login">
                        <div class="linput_list">
                            <div class="inner-list">
                                <div class="la_input">
                                    <label for="userid" class="form-label">아이디</label>
                                    <div class="input_group">
                                        <input type="text" class="form-control-sm" id="userid"
                                            placeholder="example1234">
                                    </div>
                                </div>
                                <div class="inner-list">
                                    <div class="la_input">
                                        <label for="pwd" class="form-label">비밀번호</label>
                                        <div class="input_group">
                                            <input type="password" class="form-control-sm" id="pwd">
                                        </div>
                                    </div>
                                </div>

                                <ul class="mentbox admin">
                                    <li><a href="/user/find/pwd" class="findpw" role="button"
                                            aria-disabled="true">비밀번호
                                            찾기</a></li>
                                    <li>|</li>
                                    <li><a href="/user/find/id" class="findid" role="button" aria-disabled="true">아이디
                                            찾기</a></li>
                                </ul>
                                <button class="loginbtn" type="submit">로그인</button>
                            </div>
                    </form>
                </div>
            </div>
        </section>
    </div>
</body>

</html>