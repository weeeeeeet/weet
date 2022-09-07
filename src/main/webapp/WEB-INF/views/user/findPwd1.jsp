<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Weet 비밀번호찾기</title>

    <!-- #### common ####-->
    <!-- favicon -->
    <link rel="shortcut icon" href="/resources/ico/favicon.ico" type="image/x-icon">
    <link rel="icon" href="/resources/ico/favicon.ico" type="image/x-icon">
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
    <link href="/resources/css/user/findPwd1.css?ver=1.1" rel="stylesheet" />

</head>

<body>
    <div class="wrap">
        <!-- header s -->
        <%@ include file= "/WEB-INF/views/include/header.jsp" %>
        <!-- header e -->

        <section class="login-contain">
            <div class="inner_box">
            <div class="login-main-text"> 비밀번호 찾기 </div>
            <div class="sub-text"> <h3>비밀번호를 찾고자 하는 아이디를 입력해 주세요.</h3>
            </div>
            <form action="Findpwd" class="findpwd">
                <div class="input_list">
                    <div class="inner-list">
                        <div class="la_input alon">
                            <label for="id" class="form-label">아이디</label>
                            <div class="input_group">
                                <input type="text" class="form-control-sm" id="id" minlength="8" maxlength="15"
                                    placeholder="8-15자의 영문 소문자, 숫자만 가능합니다.">
                            </div>
                        </div>
                    <button class="loginbtn" type="submit" value="다음">다음</button>
                </div>
            </form>
        </div>
        </section>
    </div>
</body>

</html>