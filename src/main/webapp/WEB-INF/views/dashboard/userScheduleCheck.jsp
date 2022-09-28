<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>userScheduleCheck</title>

    <!-- favicon -->
    <link rel="shortcut icon" href="/resources/ico/favicon.ico" type="image/x-icon">
    <link rel="icon" href="/resources/ico/favicon.ico" type="image/x-icon">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!-- 외부 스타일 시트 연결 -->
    <!-- 유저 대시보드 css -->
    <link href="/resources/css/dashboard/userScheduleCheck.css" rel="stylesheet" />

    <!-- 폰트어썸 설정 -->
    <!-- <link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet"> -->
    <script src="https://kit.fontawesome.com/63eb3bc178.js" crossorigin="anonymous"></script>

    <!-- 외부 JS 연결 -->
    <!-- defer : 브라우저가 스크립트를 문서 분석 이후에 실행해야 함을 나타내는 불리언 속성이다. -->

    <!-- defer : 브라우저가 스크립트를 문서 분석 이후에 실행해야 함을 나타내는 불리언 속성이다. -->
    <script type="text/javascript" defer src="/resources/js/dashboard/userSchedule.js"></script>

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

            <!-- 내 스케쥴 확인 대시보드 -->
            <div class="mySchedule g">
                <div class="myScheduleTitle g">
                    <h2>내 스케줄 확인</h2>
                </div>

                 <div class="ScheduleBoard g">
                     <!-- 타임라인 -->

                    <div class="ScheduleScroll g">
                        <ul id='timeline'>

                            <!-- class1 시간표 -->
                            <c:forEach var="schedulelist" items="${__SCHEDULELIST__}">
                            <!-- 이전 -->
                            <li class='work'>
                                <input class='radio' id='work5' name='works' type='radio' >
                                <div class="relative">
                                <label for='work5'><c:out value="${schedulelist.csDay}"/>

                                <c:set target="${schedulelist.cs_startTimeAmpm}" var="type" value="1" />
                                <c:if test="${type eq '1'}">
                                    <span class='time'>am</span>
                                </c:if>
                                <c:if test="${type eq '2'}">
                                    <span class='time'>pm</span>
                                </c:if>
                                <c:out value="${schedulelist.cs_start_time_hh}"/>시
                                <c:out value="${schedulelist.cs_start_time_mm}"/>분
                                <span class='date'></span>
                                <span class='circle'></span>
                                </div>
                                <div class='content'>

                                </div>
                            </li>
                            </c:forEach>
                        </ul>
                    </div>
                        <!-- 오늘 -->
                        <!-- <li class='work'>
                            <input class='radio' id='work4' name='works' type='radio' checked>
                            <div class="relative">
                            <label for='work4'> 8월 06일 오후 07:00</label>
                            <span class='date'>오늘 스케줄</span>
                            <span class='circle'></span>
                            </div>
                            <div class='content'>
                            <p>
                                2회차
                            </p>
                            </div>
                        </li>-->

                        <!-- 다음 -->
                        <!--<li class='work'>
                            <input class='radio' id='work3' name='works' type='radio'>
                            <div class="relative">
                            <label for='work3'>8월 08일 오후 07:00</label>
                            <span class='date'>다음 스케줄</span>
                            <span class='circle'></span>
                            </div>
                            <div class='content'>
                            <p>
                                3회차
                            </p>
                            </div>
                        </li>-->
                    
                 </div>

            </div> 

        </div>

    </section>

    <!-- footer 불러오기 -->
    <%@ include file="/WEB-INF/views/include/footer.jsp" %>

</body>

</html>