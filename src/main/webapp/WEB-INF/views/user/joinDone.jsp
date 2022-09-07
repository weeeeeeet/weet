<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Weet 가입완료</title>

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
    <div id="wrap">
        <!-- header s -->
        <%@ include file= "/WEB-INF/views/include/header.jsp" %>
        <!-- header e -->


        <section class="login-contain">
            <div class="inner_box">
            <div class="join-box">
                <div class="login-main-text"> 회원가입이 완료되었습니다. </div>
                <div class="sub-text">
                    <p>weet member가 되어주셔서 감사합니다.</p>
                </div>
                <div class="inner-list alon">
                <button class="loginbtn" type="button" onclick="location.href='/user/tr/login'"> 로그인 </button>
            </div>
        </section>
    </div>
</body>

</html>