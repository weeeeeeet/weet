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
    <link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet">
    <!-- bootstrap v5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>

     <!-- #### style ####-->
    <!-- css -->
    <link href="/resources/css/user/findPwd2.css" rel="stylesheet" />

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
                    <h3>회원정보에 등록한 휴대전화로 인증</h3>
                    <P>회원정보에 등록한 휴대전화 번호와 입력한 휴대전화 번호가 같아야, 인증번호를 받을 수 있습니다.</P>
                </div>
                <form action="Findpwd" class="findpwd">
                    <div class="input_list">
                        <div class="inner-list">
                            <div class="la_input">
                                <label for="uname" class="form-label">이름</label>
                                <div class="input-group">
                                    <input type="text" class="form-control-sm" id="uname" minlength="2" maxlength="15"
                                        placeholder="김영희" aria-label="Recipient's username"
                                        aria-describedby="button-addon2">
                                </div>
                            </div>
                            <div class="inner-list">
                                <div class="la_input">
                                    <label for="mobile" class="form-label">핸드폰번호</label>
                                    <div class="input-group putbtn">
                                        <input type="tell" class="form-control " id="tell" class="int" length="11"
                                            placeholder=" ' - ' 제외하고 입력해주세요" aria-label="Recipient's username"
                                            aria-describedby="button-addon2">
                                        <button class="btn btn-outline-secondary" type="button"
                                            id="button-addon2">인증요청</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <input class="loginbtn" type="submit" value="다음">
                    </div>
                </form>
            </div>
        </section>
    </div>
</body>

</html>