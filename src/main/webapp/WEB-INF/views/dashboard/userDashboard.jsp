<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>userDashboard</title>

     <!-- favicon -->
     <link rel="shortcut icon" href="/resources/ico/favicon.ico" type="image/x-icon">
     <link rel="icon" href="/resources/ico/favicon.ico" type="image/x-icon">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!-- 외부 스타일 시트 연결 -->
    <!-- 유저 대시보드 css -->
    <link href="${path}/resources/css/dashboard/userDashboard.css" rel="stylesheet" />

    <!-- 폰트어썸 설정 -->
    <!-- <link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet"> -->
    <script src="https://kit.fontawesome.com/63eb3bc178.js" crossorigin="anonymous"></script>

    <!-- 외부 JS 연결 -->

</head>
    
<body>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
    crossorigin="anonymous"></script>

    <!-- header 불러오기 -->
     <%@ include file="/WEB-INF/views/include/header.jsp" %>

    <!-- contents -->
    <section class="wrap">

        <!-- sidebar 불러오기 -->
       <%@ include file="/WEB-INF/views/include/sidebar.jsp" %>

        <!--대시보드 -->
        <div class="dash g">

            <div class="g">
                <h1>회원 대시보드</h1>

            </div>

            <!-- 클래스 공지사항 -->
            <div class="class-notice g">
                <h2>클래스 공지사항</h2>

                    
                <div class="notice-list g">

                        <ul class="">
                            <c:forEach var="notice" items="${__NOTICELIST__}">
                                <li class="g"><a href="/dashboard/user/noticeplan/detail?n_num=${notice.n_num}" target="self">${notice.n_title}<span><fmt:formatDate pattern="yyyy/MM/dd" value="${notice.n_ts}" /></span></a></li>
                                <!-- <li class="g"><a href="/dashboard/user/noticeplan/detail" target="self">Complete the Compensation Plan Quiz<span>2022.07.20</span></a></li>
                                <li class="g"><a href="/dashboard/user/noticeplan/detail" target="self">Get set on autoship<span>2022.07.20</span></a></li>
                                <li class="g"><a href="/dashboard/user/noticeplan/detail" target="self">Complete the Compensation Plan Quiz<span>2022.07.20</span></a></li>
                                <li class="g"><a href="/dashboard/user/noticeplan/detail" target="self">Get set on autoship<span>2022.07.20</span></a></li>
                                <li class="g"><a href="/dashboard/user/noticeplan/detail" target="self">Set your goals for your first 90 days<span>2022.07.20</span></a></li> -->
                            </c:forEach>
                        </ul>
                   
                </div>
            </div>

            <!-- 이번주 코칭계획 -->
            <div class="coaching-plan g">
                <h2>이번주 코칭계획</h2>

                <div class="plan-list g">
                    <ul>
                        <c:forEach var="notice" items="${__COACHINGLIST__}">
                            <li class="g"><a href="/dashboard/user/noticeplan/detail?n_num=${notice.n_num}" target="self">${notice.n_title}<span><fmt:formatDate pattern="yyyy/MM/dd" value="${notice.n_ts}" /></span></a></li>
                            <!-- <li class="g"><a href="/dashboard/user/noticeplan/detail" target="self">2주차 코칭 계획<span>2022.07.20</span></a></li>
                            <li class="g"><a href="/dashboard/user/noticeplan/detail" target="self">3주차 코칭 계획<span>2022.07.20</span></a></li>
                            <li class="g"><a href="/dashboard/user/noticeplan/detail" target="self">4주차 코칭 계획<span>2022.07.20</span></a></li>
                            <li class="g"><a href="/dashboard/user/noticeplan/detail" target="self">5주차 코칭 계획<span>2022.07.20</span></a></li>
                            <li class="g"><a href="/dashboard/user/noticeplan/detail" target="self">6주차 코칭 계획<span>2022.07.20</span></a></li>
                            <li class="g"><a href="/dashboard/user/noticeplan/detail" target="self">7주차 코칭 계획<span>2022.07.20</span></a></li> -->
                        </c:forEach>
                    </ul>
                </div>
            </div>

        </div>

    </section>

    <!-- footer 불러오기 -->
    <%@ include file="/WEB-INF/views/include/footer.jsp" %>


</body>

</html>