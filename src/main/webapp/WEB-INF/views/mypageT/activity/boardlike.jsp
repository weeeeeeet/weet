<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>마이페이지 - 내활동 - 좋아요</title>

    <link href="/resources/css/mypageTr.css" rel="stylesheet" />
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

    <%@ include file="/WEB-INF/views/include/header.jsp" %>

    <!-- ==================CONTENT==================== -->

    <section class="content">

        <nav class="content_left">
            <!-- 프로필 + 왼쪽 목록 -->

            <div class="profile">

                <div class="profile_photo"></div>

                <div class="profile_id">구창식2</div>

                <div class="profile_social">T</div>

                <div class="profile_level">LV.3</div>

                <a href="#" class="profile_email">helloword@naver.com <i class="fas fa-angle-right"></i> </a>

            </div>

            <div class="mypage_list">
                <!-- 왼쪽 목록 -->

                <ul class="mypage_list_top">
                    <li><a href="/mypageT/activity/boardlist" class="on">내 활동</a></li>
                    <li><a href="/mypageT/class/my">내 클래스룸</a></li>
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
                    <li><a href="/mypageT/activity/boardlist">TR 게시판</a></li>
                    <li><a href="/mypageT/activity/boardlike" class="on">좋아요</a></li>
                    <li><a href="/mypageT/activity/boardreplye">댓글</a></li>
                </ul>

            </div>

            <div>

                <ul class="mypage_top_tabs">
                    <li><a href="/mypageT/activity/boardlike" class="on"><span class="on2"></span> 전체</a></li>
                </ul>

            </div>

            <div class="TR_tables">

                <div class="tb1">
                    <span class="tr_no">109</span>
                    <a href="#" class="tr_title">운동을 처음 시작하는데, PT로 시작해도 ...</a>
                    <span class="tr_date">2022.06.19</span>
                    <span style="color: red;" class="heart"><i class="fas fa-heart"></i></span> <span class="tr_like">12</span>
                    <span style="color: #2370DF;" class="comment"><i class="fa-regular fa-comment-dots"></i></span><span class="tr_comment">5</span>
                </div>

                <div class="tb1">
                    <span class="tr_no">108</span>
                    <a href="#" class="tr_title">다음주부터 PT를 시작하게 되었어요!</a>
                    <span class="tr_date">2022.06.19</span>
                    <span style="color: red;" class="heart"><i class="fas fa-heart"></i></span> <span class="tr_like">7</span>
                    <span style="color: #2370DF;" class="comment"><i class="fa-regular fa-comment-dots"></i></span><span class="tr_comment">6</span>
                </div>

                <div class="tb1">
                    <span class="tr_no">107</span>
                    <a href="#" class="tr_title">제 식단 좀 봐주실 수 있을까요?</a>
                    <span class="tr_date">2022.06.19</span>
                    <span style="color: red;" class="heart"><i class="fas fa-heart"></i></span> <span class="tr_like">7</span>
                    <span style="color: #2370DF;" class="comment"><i class="fa-regular fa-comment-dots"></i></span><span class="tr_comment">6</span>
                </div>

                <div class="tb1">
                    <span class="tr_no">106</span>
                    <a href="#" class="tr_title">게시물 제목</a>
                    <span class="tr_date">2022.06.19</span>
                    <span style="color: red;" class="heart"><i class="fas fa-heart"></i></span> <span class="tr_like">7</span>
                    <span style="color: #2370DF;" class="comment"><i class="fa-regular fa-comment-dots"></i></span><span class="tr_comment">6</span>
                </div>

            </div>

        </div>

    </section>

    <!-- ==================FOOTER==================== -->
    
    <%@ include file="/WEB-INF/views/include/footer.jsp" %>
   
</body>

</html>