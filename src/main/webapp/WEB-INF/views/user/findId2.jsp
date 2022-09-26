<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Weet finding Id</title>

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
    <link href="/resources/css/user/findId2.css" rel="stylesheet" />
    <!-- java script -->

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
                <P>고객님의 정보와 일치하는 아이디 목록입니다.</P>
            </div>
            <form action="#" class="findid">
                <div class="inner_list">
                    <div class="findid_list">
                        <table class="findid-box">
                            <colgroup>
                            <col width="50%">
                            <col width="50%">
                        </colgroup>
                            <thead>
                                <tr>
                                    <th id="userName" vlaue="${_USER_.userId}" readonly></th>
                                    <th id="userPhone" vlaue="${_USER_.userPhone}" readonly></th>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="btn-box">
                        <button  class="findbtn" type="button" onclick="location.href='weet_login_tr'">로그인하기</button>
                        <button class="findbtn" type="submit">비밀번호찾기</button>
                    </div>
                </div>
            </form>
        </div>
        </section>
    </div>
</body>

</html>