<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>sidebar</title>

    <!-- 외부 스타일 시트 연결 -->
    <!-- 사이드바 css -->
    <link rel="stylesheet" href="/resources/css/include/sidebarTr.css" />

   <!-- 폰트어썸 설정 -->
    <!-- <link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet"> -->
    <script src="https://kit.fontawesome.com/63eb3bc178.js" crossorigin="anonymous"></script>

</head>
<body>

    <!-- 사이드바 -->
    <section>

        <div class="sidebar g">
    
            <!-- 프로필 -->
            <div class="profile g">
                <img src="https://picsum.photos/id/550/200/200" alt="100x100 profile">
                <!-- 이름 -->
                <div class="name-level">
                    <span><h1 class="g">Darlene Robertson</h1></span>
                    <span><h2 class="trainer g">T</h2></span>
                    <span><h3 class="level g">LV.3</h3></span>
                </div>
    
                <!-- <h2 class="g">클래스 진행 현황</h2> -->
                <!-- 진행 바 -->
                <!-- <progress class="g" value="6" max="10"></progress> -->
    
                <!-- <h3 class="g">6회 / 10회</h3> -->
            </div>
    
             <!-- 메뉴 -->
             <div class="menu g">
                <div class="menu-list notice g"> 
                    <i class="fas fa-thumbtack"></i>
                    <a class="g" href="/dashboard/tr/noticeplan" target="self">공지사항</a>
                </div>
                <div class="menu-list feedback g">
                    <i class="fas fa-heart-pulse"></i>
                    <a href="/dashboard/tr/foodfb" target="self">피드백</a>
                </div>
                <div class="menu-list mySchedule g">
                    <i class="fas fa-calendar-days"></i>
                    <a href="/dashboard/tr/schedule" target="self">내 스케줄</a>
                </div>
            </div>
        </div>
        
    </section>

</body>
</html>