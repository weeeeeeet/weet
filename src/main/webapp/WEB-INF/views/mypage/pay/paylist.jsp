<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>마이페이지 - 클래스룸</title>

    <link href="/resources/css/mypage/mypagePay.css" rel="stylesheet" />
    <link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/63eb3bc178.js" crossorigin="anonymous"></script>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!-- favicon -->
    <link rel="icon" href="/resources/ico/favicon.ico" type="image/x-icon">
    <link rel="shortcut icon" href="/resources/ico/favicon.ico" type="image/x-icon">

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

                <div class="profile_id">WEE.T</div>

                <img src="/resources/img/static/naver2.png" class="profile_social" alt="소설로그인표시">

                <a href="/mypage/profile/myprofile" class="profile_email">helloword@naver.com <i class="fas fa-angle-right"></i> </a>

            </div>

            <div class="mypage_list">
                <!-- 왼쪽 목록 -->

                <ul class="mypage_list_top">
                    <li><a href="/mypage/activity/boardlist">내 활동</a></li>
                    <li><a href="/mypage/class/my">내 클래스룸</a></li>
                    <li><a href="/mypage/mybody">MY BODY</a></li>
                </ul>

                <ul class="mypage_list_bottom">
                    <li><a href="/mypage/pay/paylist" class="on">구매 내역</a></li>
                    <li><a href="#">고객센터</a></li>
                </ul>

            </div>

        </nav>

        <div class="content_right">
            <!-- 오른쪽 영역 : 위쪽 목록 + 전체 / 답변완료 + -->

            <div class="mypage_top">

                <ul class="mypage_toplist">
                    <li><a href="/mypage/pay/paylist" class="on">구매 내역</a></li>
                </ul>

            </div>

            <!-- 구매한 클래스 내역 -->

            <div class="class_card">
                <img src="/resources/img/static/classcard1.jpg" class="card_img" alt="해당 클래스의 대포사진 자리">

               <div class="class_card_content">
                    <!-- 클래스 게시물과 연결해야 한다. -->
                    <a href="#" class="card-text">[인기 클래스] 국내1위 홈트계 끝판왕 '위이티'</a>
                   
                    <div class="class_card_purchase">
                        <div class="class_card_purchase_number">20220312092608632933</div>
                        <div class="class_card_purchase_money">75,000원</div>
                    </div>

                    <a href="/mypage/pay/detail" class="class_card_btn btn btn-primary">상세내역</a>

               </div>

            </div>
            
        </div>

    </section>


    <!-- ==================FOOTER==================== -->
    <jsp:include page="/WEB-INF/views/include/footer.jsp" />
   
</body>

</html>