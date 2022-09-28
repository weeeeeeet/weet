<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>마이페이지 - 클래스룸</title>

    <link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/63eb3bc178.js" crossorigin="anonymous"></script>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!-- favicon -->
    <link rel="icon" href="/resources/ico/favicon.ico" type="image/x-icon">
    <link rel="shortcut icon" href="/resources/ico/favicon.ico" type="image/x-icon">

    <!-- 제이쿼리 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.0/jquery-migrate.min.js" integrity="sha512-QDsjSX1mStBIAnNXx31dyvw4wVdHjonOwrkaIhpiIlzqGUCdsI62MwQtHpJF+Npy2SmSlGSROoNWQCOFpqbsOg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    
    <link href="/resources/css/mypageT/mypageTClassNormal.css" rel="stylesheet" />
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
                    <li><a href="/mypageT/activity/boardlist?userId=tr1">내 활동</a></li>
                    <li><a href="/mypageT/class/my?userId=tr1" class="on">내 클래스룸</a></li>
                    <li><a href="/mypageT/mybody?userId=tr1">MY BODY</a></li>
                </ul>

                <ul class="mypage_list_bottom">
                    <li><a href="/mypageT/pay/paylist?userId=tr1">구매 내역</a></li>
                    <li><a href="#">고객센터</a></li>
                </ul>

            </div>

        </nav>

        <div class="content_right">
            <!-- 오른쪽 영역 : 위쪽 목록 + 전체 / 답변완료 + -->

            <div class="mypage_top">

                <ul class="mypage_toplist">
                    <li><a href="/mypageT/class/my?userId=tr1" class="on">내 클래스 룸</a></li>
                    <li><a href="/mypageT/class/expired?userId=tr1">종료 클래스 룸</a></li>
                    <li><a href="/mypageT/class/progress?userId=tr1">클래스 검수</a></li>
                </ul>

            </div>

            <p class="content_p"> ● 클래스 클릭 시 해당 클래스의 대시보드로 이동합니다.</p>

            <c:forEach var="board" items="${__LIST__}">

                <div class="class_card">
                    <img src="<spring:url value='/${board.classMainImgUrl}'/>" class="card_img" alt="클래스대표사진">
                    <a href="http://localhost:8080/dashboard/tr/noticeplan" class="card-text">${board.classTitle}</a>
                </div>

            </c:forEach>

            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            
        </div>

    </section>

    <!-- ==================FOOTER==================== -->
    
    <jsp:include page="/WEB-INF/views/include/footer.jsp" />
   
</body>

</html>