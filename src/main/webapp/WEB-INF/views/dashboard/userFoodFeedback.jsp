<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>userFoodFeedback 식단 목록</title>

    <!-- favicon -->
    <link rel="shortcut icon" href="/resources/ico/favicon.ico" type="image/x-icon">
    <link rel="icon" href="/resources/ico/favicon.ico" type="image/x-icon">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!-- 외부 스타일 시트 연결 -->
    <!-- 유저 대시보드 css -->
    <link href="/resources/css/dashboard/userFoodFeedback.css" rel="stylesheet" />

    <!-- 폰트어썸 설정 -->
    <!-- <link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet"> -->
    <script src="https://kit.fontawesome.com/63eb3bc178.js" crossorigin="anonymous"></script>

    <!-- 외부 JS 연결 -->

    <!-- defer : 브라우저가 스크립트를 문서 분석 이후에 실행해야 함을 나타내는 불리언 속성이다. -->
    <script type="text/javascript" defer src="/resources/js/dashboard/userFeedback.js"></script>

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

            <!-- 오늘의 식단 올리기 대시보드 -->
            <div class="today-food g">
                <div class="todayFoodTitle g">
                    <h2>오늘의 식단 올리기</h2>
                </div>

      		<!-- 사진 첨부 안내 메세지 -->
			<div>
 				<p class=" g message">오늘 먹은 음식의 사진을 첨부해주세요.</p>
 			</div>
 			
                <!-- 사진첨부 & 텍스트 입력 -->
                <div class="picAndText g">
                    <!-- ** get 방식으로 보내면 양식이 다 보인다 -->
                    <!-- 그래서 중요한 정보를 노출하기 싫으면 get 방식으로 보내면 안된다 -->
                    <!-- post 방식은 쿼리 스트링이 보이지 않는다! -->
                    <form class="g foodForm" action="http://localhost:8080" method="POST"
                        enctype="multipart/form-data">
        
                        <!-- 사진 첨부파일 -->
                        <div class="image-container g">
                            <!-- 이미지 미리보기 -->
                            <p>
                                <img class="g" style="width: 150px;" id="preview-image"
                                    src="https://dummyimage.com/300x300/ffffff/000000.png&text=preview+image">
                            </p>

                            <!-- 파일선택 버튼 -->
                            <div class="image-select-btn g">
                                <p><input style="display: block;" type="file" id="input-image"></p>
                            </div>
                        </div>

                        <!-- 텍스트 입력 박스 추가하고 삭제하는 버전 -->
                        <!-- <div class="g">
                                <div id="box">
                                <input type="text"> <input type="button" value="추가" onclick="add_textbox()">
                            </div> -->

                        <!-- 텍스트 입력 박스-->
                        <div class="text-container g">
                            <p><input class="text-box" type="text" name="food-comend"></p>
                            <p><input type="submit" value="올리기"></p>
                        </div>

                    </form>
        
                </div>

                <!-- 내 식단 -->
                <div class="myFood g">
                    <h2>내 식단</h2>
                </div>

                <!-- 식단 리스트 -->
                
                <div class="pic-list g">
                    
               
                    <div class="row">
                 	  <c:forEach var="foodfeedback" items="${__FOODLIST__}">
                        <!-- 첫번째 라인 -->
                        <div class="col">
                          
                                <div class="card g" >
                                    <a href="/dashboard/user/food/detail" class="g" target="self">
                                    <img src="https://picsum.photos/id/889/600/400" class="card-img-top" alt="">
                                    <h5 class="card-title g"><fmt:formatDate pattern="yyyy/MM/dd" value="${foodfeedback.feedback_diet_ts}" /></h5>
                                    </a>
                                </div>   
                         
                        </div> <!-- col -->
                    
                            <!-- <div class="card g" >
                                <a href="/dashboard/user/food/detail" class="g" target="self">
                                <img src="https://picsum.photos/id/999/600/400" class="card-img-top" alt="">
                                <h5 class="card-title g">2022.07.13</h5>
                                </a>
                            </div> -->
        
                            <!-- <div class="card g" >
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
                            </div> -->
                       

                        <!-- 두번째 라인 -->
                        <!-- <div class="col"> -->
                            <!-- <div class="card g" >
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
                            </div> -->
                        <!-- </div> -->

                       </c:forEach>   
                    </div> <!-- row -->
              
                </div> <!-- pic-list -->  
            </div> <!-- today-food -->
        </div>

    </section>

    <!-- footer 불러오기 -->
    <%@ include file="/WEB-INF/views/include/footer.jsp" %>

</body>

</html>