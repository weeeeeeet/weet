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
    
    <link href="/resources/css/mypage/Mypage_Classroom.css" rel="stylesheet" />
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

                <div class="profile_photo"><img src="${ __LOGIN__.userProfile }" style="width: 100%;" /></div>
				
				<div class="row">
	                <div class="profile_id">${ __LOGIN__.userNickname }</div>
		
	                <img src="/resources/img/static/naver2.png" class="profile_social" alt="소설로그인표시">
				</div>
                <a href="/mypage/profile/myprofile" class="profile_email">${ __LOGIN__.userEmail } <i class="fas fa-angle-right"></i> </a>

            </div>

            <div class="mypage_list">
                <!-- 왼쪽 목록 -->

                <ul class="mypage_list_top">
                    <li><a href="/mypage/activity/boardlist?userId=${ __LOGIN__.userId }" class="on">내 활동</a></li>
                    <li><a href="/mypage/class/my?userId=${ __LOGIN__.userId }">내 클래스룸</a></li>
                    <li><a href="/mypage/mybody?userId=${ __LOGIN__.userId }">MY BODY</a></li>
                </ul>

                <ul class="mypage_list_bottom">
                    <li><a href="/mypage/pay/paylist?userId=${ __LOGIN__.userId }">구매 내역</a></li>
                    <li><a href="/help/inquiry">고객센터</a></li>
                </ul>

            </div>

        </nav>

        <div class="content_right">
            <!-- 오른쪽 영역 : 위쪽 목록 + 전체 / 답변완료 + -->

            <div class="mypage_top">

                <ul class="mypage_toplist">
                    <li><a href="/mypage/class/my?userId=${ __LOGIN__.userId }" class="on">내 클래스 룸</a></li>
                    <li><a href="/mypage/class/expired?userId=${ __LOGIN__.userId }">수강종료 클래스</a></li>
                    <li><a href="/mypage/class/before?userId=${ __LOGIN__.userId }">예약 클래스</a></li>
                    <li><a href="/mypage/class/like?userId=${ __LOGIN__.userId }">찜 한 클래스</a></li>
                </ul>

            </div>

            <p class="content_p"> ● 클래스 클릭 시 해당 클래스의 대시보드로 이동합니다.</p>

            <c:forEach var="board" items="${__LIST__}">

                <div class="class_card">
                    <img src="<spring:url value='/${board.classMainImgUrl}'/>" class="card_img" alt="클래스대표사진">
                    <a href="/dashboard/user/noticeplan" class="card-text">${board.classTitle}</a>
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