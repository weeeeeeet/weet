<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>trainerScheduleManagement</title>

    <!-- favicon -->
    <link rel="shortcut icon" href="/resources/ico/favicon.ico" type="image/x-icon">
    <link rel="icon" href="/resources/ico/favicon.ico" type="image/x-icon">
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!-- 외부 스타일 시트 연결 -->
    <!-- 유저 대시보드 css -->
    <link rel="stylesheet"  href="/resources/css/dashboard/trScheduleManagement.css" />

    <!-- 폰트어썸 설정 -->
    <!-- <link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet"> -->
    <script src="https://kit.fontawesome.com/63eb3bc178.js" crossorigin="anonymous"></script>

    <!-- 캘린더 자바스크립트 파일 -->
    <script type="text/javascript" defer src="/resources/js/dashboard/trainerCalendar.js"></script>

    <!-- jquery 설정 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.0/jquery-migrate.min.js"></script>

    <!-- fullcalendar CDN -->
    <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>

    <!-- fullcalendar 언어 CDN -->
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>

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
  		<%@ include file="/WEB-INF/views/include/sidebarTr.jsp" %>

        <!--대시보드 -->
        <div class="dash g">

            <div class="g">
                <h1>트레이너 대시보드</h1>
            </div>

        <!-- 오늘의 식단 올리기 대시보드 -->
        <div class="today-food g">
            <div class="g">
                <h2>스케쥴 확인</h2>
                <p class="g">일정을 한눈에 확인하세요</p>
            </div>

            <!-- 위클리 스케쥴러 -->
            <div class="container-fluid g">
                <div class="scheduler g">

                    <!-- 캘린더 -->
                    <!-- <div w3-include-html="/trCalendar.html"></div> -->
                    <div id='calendar' class="g"></div>
                </div>

                
            </div>  

        </div>

        
    </section>


    <!-- footer 불러오기 -->
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>

</body>

</html>