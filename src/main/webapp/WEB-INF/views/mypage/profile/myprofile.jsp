<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>마이페이지 - 회원 - 내정보</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>

    <!-- 차트.js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>

    <link href="/resources/css/mypageProfile.css" rel="stylesheet" />
    <link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/63eb3bc178.js" crossorigin="anonymous"></script>

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
                    <li><a href="/mypage/pay/paylist">구매 내역</a></li>
                    <li><a href="#">고객센터</a></li>
                </ul>

            </div>

        </nav>

        <div class="content_right">
            <!-- 오른쪽 영역 : 위쪽 목록 + 전체 / 답변완료 + -->

            <div class="mypage_top">

                <ul class="mypage_toplist">
                    <li><a href="/mypage/profile/myprofile" class="on">프로필</a></li>
                    <li><a href="/mypage/profile/settings">알림살정</a></li>
                    <li><a href="/mypage/profile/quit">회원탈퇴</a></li>
                </ul>

            </div>

            <div class="content_right_MyProfile">

                <div class="content_right_MyProfile_TOP">

                    <div class="content_right_MyProfile_profile">

                        <div class="content_right_MyProfile_photo"></div>
        
                        <div class="content_right_MyProfile_id">WEE.T</div>
                        
                        <img src="/resources/img/static/naver2.png" class="content_right_MyProfile_social" alt="소설로그인표시">
        
                        <a href="#" class="content_right_MyProfile_email">helloword@naver.com </a>
        
                    </div>

                </div>

                <div class="content_right_MyProfile_content">

                    <div class="MyProfile_content_name">이름
                        <div class="MyProfile_content_name_value">김아무개</div>
                    </div>

                    <div class="MyProfile_content_gender">성별
                        <div class="MyProfile_content_gender_value">여성</div>
                    </div>

                    <div class="MyProfile_content_nickname">닉네임 변경
                        <div class="MyProfile_content_nickname_value">WEE.T</div>
                    </div>

                    <div class="MyProfile_content_phone">연락처 정보
                        <div class="MyProfile_content_phone_value">010-1234-5678</div>
                    </div>

                    <div class="MyProfile_content_email">이메일
                        <div class="MyProfile_content_email_value">helloword@naver.com</div>
                    </div>

                    <a href="/마이페이지_회원_내정보_수정.html" class="MyProfile_content_update">정보수정</a>

                </div>

            </div>
            
        </div>


    </section>

    <!-- ==================FOOTER==================== -->
    <%@ include file="/WEB-INF/views/include/footer.jsp" %>
   
</body>

</html>