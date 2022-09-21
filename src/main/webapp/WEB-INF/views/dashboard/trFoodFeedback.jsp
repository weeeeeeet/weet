<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>trainerFoodFeedback</title>

<!-- favicon -->
<link rel="shortcut icon" href="/resources/ico/favicon.ico" type="image/x-icon">
<link rel="icon" href="/resources/ico/favicon.ico" type="image/x-icon">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<!-- 외부 스타일 시트 연결 -->
<!-- 유저 대시보드 css -->
<link href="/resources/css/dashboard/trFoodFeedback.css" rel="stylesheet" />

<!-- 폰트어썸 설정 -->
<!-- <link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet"> -->
<script src="https://kit.fontawesome.com/63eb3bc178.js" crossorigin="anonymous"></script>

<!-- 외부 JS 연결 -->

<!-- defer : 브라우저가 스크립트를 문서 분석 이후에 실행해야 함을 나타내는 불리언 속성이다. -->
<script type="text/javascript" defer src="/resources/js/trainerFoodFeedback.js"></script>

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

    <!-- 회원님의 식단 관리 대시보드 -->
    <div class="user-food g">
        <div class="back-color">
            <div class="g">
                <h2>Robert Fox 회원님의 식단 관리</h2>
            </div>
        </div>
        
        <!-- 회원님 식단 리스트 -->
        <div class="pic-list g">

            <div class="row">

            <!-- 첫번째 라인 -->
            <div class="col">
                <div class="card g" >
                    <a href="/dashboard/tr/foodfb/detail" class="g" target="self">
                    <img src="https://picsum.photos/id/889/600/400" class="card-img-top" alt="">
                    <h5 class="card-title g">2022.07.13</h5>
                    </a>
                    
                </div>

                <div class="card g" >
                    <a href="/dashboard/tr/foodfb/detail" class="g" target="self">
                    <img src="https://picsum.photos/id/999/600/400" class="card-img-top" alt="">
                    <h5 class="card-title g">2022.07.13</h5>
                    </a>
                </div>

                <div class="card g" >
                    <a href="/dashboard/tr/foodfb/detail" class="g" target="self">
                    <img src="https://picsum.photos/id/493/600/400" class="card-img-top" alt="">
                    <h5 class="card-title g">2022.07.13</h5>
                    </a>
                </div>

                <div class="card g" >
                    <a href="/dashboard/tr/foodfb/detail" class="g" target="self">
                    <img src="https://picsum.photos/id/429/600/400" class="card-img-top" alt="">
                    <h5 class="card-title g">2022.07.13</h5>
                    </a>
                </div>

                <div class="card g" >
                    <a href="/dashboard/tr/foodfb/detail" class="g" target="self">
                    <img src="https://picsum.photos/id/326/600/400" class="card-img-top" alt="">
                    <h5 class="card-title g">2022.07.13</h5>
                    </a>
                </div>

                <div class="card g" >
                    <a href="/dashboard/tr/foodfb/detail" class="g" target="self">
                    <img src="https://picsum.photos/id/292/600/400" class="card-img-top" alt="">
                        <h5 class="card-title g">2022.07.13</h5>
                    </a>
                </div>
            </div>
            
            <!-- 두번째 라인 -->
            <div class="col">
                <div class="card g" >
                    <a href="/dashboard/tr/foodfb/detail" class="g" target="self">
                    <img src="https://picsum.photos/id/889/600/400" class="card-img-top" alt="">
                    <h5 class="card-title g">2022.07.13</h5>
                    </a>
                    
                </div>

                <div class="card g" >
                    <a href="/dashboard/tr/foodfb/detail" class="g" target="self">
                    <img src="https://picsum.photos/id/999/600/400" class="card-img-top" alt="">
                    <h5 class="card-title g">2022.07.13</h5>
                    </a>
                </div>

                <div class="card g" >
                    <a href="/dashboard/tr/foodfb/detail" class="g" target="self">
                    <img src="https://picsum.photos/id/493/600/400" class="card-img-top" alt="">
                    <h5 class="card-title g">2022.07.13</h5>
                    </a>
                </div>

                <div class="card g" >
                    <a href="/dashboard/tr/foodfb/detail" class="g" target="self">
                    <img src="https://picsum.photos/id/429/600/400" class="card-img-top" alt="">
                    <h5 class="card-title g">2022.07.13</h5>
                    </a>
                </div>

                <div class="card g" >
                    <a href="#" class="g" target="self">
                    <img src="https://picsum.photos/id/326/600/400" class="card-img-top" alt="">
                    <h5 class="card-title g">2022.07.13</h5>
                    </a>
                </div>

                <div class="card g" >
                    <a href="#" class="g" target="self">
                    <img src="https://picsum.photos/id/292/600/400" class="card-img-top" alt="">
                        <h5 class="card-title g">2022.07.13</h5>
                    </a>
                </div>
            </div>
            
            <!-- 세번째 라인 -->
            <div class="col">
                <div class="card g" >
                    <a href="#" class="g" target="self">
                    <img src="https://picsum.photos/id/889/600/400" class="card-img-top" alt="">
                    <h5 class="card-title g">2022.07.13</h5>
                    </a>
                    
                </div>

                <div class="card g" >
                    <a href="#" class="g" target="self">
                    <img src="https://picsum.photos/id/999/600/400" class="card-img-top" alt="">
                    <h5 class="card-title g">2022.07.13</h5>
                    </a>
                </div>

                <div class="card g" >
                    <a href="#" class="g" target="self">
                    <img src="https://picsum.photos/id/493/600/400" class="card-img-top" alt="">
                    <h5 class="card-title g">2022.07.13</h5>
                    </a>
                </div>

                <div class="card g" >
                    <a href="#" class="g" target="self">
                    <img src="https://picsum.photos/id/429/600/400" class="card-img-top" alt="">
                    <h5 class="card-title g">2022.07.13</h5>
                    </a>
                </div>

                <div class="card g" >
                    <a href="#" class="g" target="self">
                    <img src="https://picsum.photos/id/326/600/400" class="card-img-top" alt="">
                    <h5 class="card-title g">2022.07.13</h5>
                    </a>
                </div>

                <div class="card g" >
                    <a href="#" class="g" target="self">
                    <img src="https://picsum.photos/id/292/600/400" class="card-img-top" alt="">
                        <h5 class="card-title g">2022.07.13</h5>
                    </a>
                </div>
            </div>

            <!-- 네번째 라인 -->
            <div class="col">
                <div class="card g" >
                    <a href="#" class="g" target="self">
                    <img src="https://picsum.photos/id/889/600/400" class="card-img-top" alt="">
                    <h5 class="card-title g">2022.07.13</h5>
                    </a>
                    
                </div>

                <div class="card g" >
                    <a href="#" class="g" target="self">
                    <img src="https://picsum.photos/id/999/600/400" class="card-img-top" alt="">
                    <h5 class="card-title g">2022.07.13</h5>
                    </a>
                </div>

                <div class="card g" >
                    <a href="#" class="g" target="self">
                    <img src="https://picsum.photos/id/493/600/400" class="card-img-top" alt="">
                    <h5 class="card-title g">2022.07.13</h5>
                    </a>
                </div>

                <div class="card g" >
                    <a href="#" class="g" target="self">
                    <img src="https://picsum.photos/id/429/600/400" class="card-img-top" alt="">
                    <h5 class="card-title g">2022.07.13</h5>
                    </a>
                </div>

                <div class="card g" >
                    <a href="#" class="g" target="self">
                    <img src="https://picsum.photos/id/326/600/400" class="card-img-top" alt="">
                    <h5 class="card-title g">2022.07.13</h5>
                    </a>
                </div>

                <div class="card g" >
                    <a href="#" class="g" target="self">
                    <img src="https://picsum.photos/id/292/600/400" class="card-img-top" alt="">
                        <h5 class="card-title g">2022.07.13</h5>
                    </a>
                </div>
            </div>
        
            <!-- 다섯번째 라인 -->
            <div class="col">
                <div class="card g" >
                    <a href="#" class="g" target="self">
                    <img src="https://picsum.photos/id/889/600/400" class="card-img-top" alt="">
                    <h5 class="card-title g">2022.07.13</h5>
                    </a>
                    
                </div>

                <div class="card g" >
                    <a href="#" class="g" target="self">
                    <img src="https://picsum.photos/id/999/600/400" class="card-img-top" alt="">
                    <h5 class="card-title g">2022.07.13</h5>
                    </a>
                </div>

                <div class="card g" >
                    <a href="#" class="g" target="self">
                    <img src="https://picsum.photos/id/493/600/400" class="card-img-top" alt="">
                    <h5 class="card-title g">2022.07.13</h5>
                    </a>
                </div>

                <div class="card g" >
                    <a href="#" class="g" target="self">
                    <img src="https://picsum.photos/id/429/600/400" class="card-img-top" alt="">
                    <h5 class="card-title g">2022.07.13</h5>
                    </a>
                </div>

                <div class="card g" >
                    <a href="#" class="g" target="self">
                    <img src="https://picsum.photos/id/326/600/400" class="card-img-top" alt="">
                    <h5 class="card-title g">2022.07.13</h5>
                    </a>
                </div>

                <div class="card g" >
                    <a href="#" class="g" target="self">
                    <img src="https://picsum.photos/id/292/600/400" class="card-img-top" alt="">
                        <h5 class="card-title g">2022.07.13</h5>
                    </a>
                </div>
            </div>

            <!-- 여섯번째 라인 -->
            <div class="col">
                <div class="card g" >
                    <a href="#" class="g" target="self">
                    <img src="https://picsum.photos/id/889/600/400" class="card-img-top" alt="">
                    <h5 class="card-title g">2022.07.13</h5>
                    </a>
                    
                </div>

                <div class="card g" >
                    <a href="#" class="g" target="self">
                    <img src="https://picsum.photos/id/999/600/400" class="card-img-top" alt="">
                    <h5 class="card-title g">2022.07.13</h5>
                    </a>
                </div>

                <div class="card g" >
                    <a href="#" class="g" target="self">
                    <img src="https://picsum.photos/id/493/600/400" class="card-img-top" alt="">
                    <h5 class="card-title g">2022.07.13</h5>
                    </a>
                </div>

                <div class="card g" >
                    <a href="#" class="g" target="self">
                    <img src="https://picsum.photos/id/429/600/400" class="card-img-top" alt="">
                    <h5 class="card-title g">2022.07.13</h5>
                    </a>
                </div>

                <div class="card g" >
                    <a href="#" class="g" target="self">
                    <img src="https://picsum.photos/id/326/600/400" class="card-img-top" alt="">
                    <h5 class="card-title g">2022.07.13</h5>
                    </a>
                </div>

                <div class="card g" >
                    <a href="#" class="g" target="self">
                    <img src="https://picsum.photos/id/292/600/400" class="card-img-top" alt="">
                        <h5 class="card-title g">2022.07.13</h5>
                    </a>
                </div>
            </div>
        </div>
        </div>

    </div>
</div>

</section>

<!-- footer 불러오기 -->
<%@ include file="/WEB-INF/views/include/footer.jsp" %>



</body>

</html>