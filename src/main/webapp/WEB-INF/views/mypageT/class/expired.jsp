<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>마이페이지 - 클래스룸</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>

    <!-- favicon -->
    <link rel="icon" href="/resources/ico/favicon.ico" type="image/x-icon">
    <link rel="shortcut icon" href="/resources/ico/favicon.ico" type="image/x-icon">
    
    <link href="/resources/css/mypageT/mypageEndClassroom.css" rel="stylesheet" />
    <link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/63eb3bc178.js" crossorigin="anonymous"></script>

</head>

<body>

    <!-- ==================HEADER==================== -->

    <jsp:include page="/WEB-INF/views/include/header.jsp" />

    <!-- ==================CONTENT==================== -->

    <section class="content">

        <nav class="content_left">
            <!-- 프로필 + 왼쪽 목록 -->

            <div class="profile">

                <div class="profile_photo"></div>

                <div class="profile_id">구창식2</div>

                <div class="profile_social">T</div>

                <div class="profile_level">LV.3</div>

                <a href="/마이페이지_트레이너_내정보.html" class="profile_email">helloword@naver.com <i class="fas fa-angle-right"></i> </a>

            </div>

            <div class="mypage_list">
                <!-- 왼쪽 목록 -->

                <ul class="mypage_list_top">
                    <li><a href="/mypageT/activity/boardlist">내 활동</a></li>
                    <li><a href="/mypageT/class/my" class="on">내 클래스룸</a></li>
                    <li><a href="/mypageT/mybody">MY BODY</a></li>
                </ul>

                <ul class="mypage_list_bottom">
                    <li><a href="/mypageT/pay/paylist">구매 내역</a></li>
                    <li><a href="#">고객센터</a></li>
                </ul>

            </div>

        </nav>

        <div class="content_right">
            <!-- 오른쪽 영역 : 위쪽 목록 + 전체 / 답변완료 + -->

            <div class="mypage_top">

                <ul class="mypage_toplist">
                    <li><a href="/mypageT/class/my">내 클래스 룸</a></li>
                    <li><a href="/mypageT/class/expired" class="on">종료 클래스 룸</a></li>
                    <li><a href="/mypageT/class/progress">클래스 검수</a></li>
                </ul>

            </div>

            <c:forEach var="board" items="${__LIST__}" varStatus="vs">

                <div class="class_card">
                    <img src="<spring:url value='/${board.classMainImgUrl}'/>" class="card_img" alt="클래스대표사진">
                    <a href="#" class="card-text" id="classTitle">${board.classTitle}</a>
                </div>

            </c:forEach>

        </div>

    </section>

    <!-- ==================TOPBUTTON==================== -->

    <jsp:include page="/WEB-INF/views/include/footer.jsp" />
   
</body>

</html>