<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>마이페이지 - 클래스룸</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>

    <!-- 데이트 피커 -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css" />

    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.css" />
    <script src="/js/bootstrap-datepicker.kr.js" charset="UTF-8"></script>
    
    <!-- favicon -->
    <link rel="icon" href="/resources/ico/favicon.ico" type="image/x-icon">
    <link rel="shortcut icon" href="/resources/ico/favicon.ico" type="image/x-icon">
    
    <link href="/resources/css/mypage/mypageMyBody.css" rel="stylesheet" />
    <link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/63eb3bc178.js" crossorigin="anonymous"></script>

    <!-- 차트.js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

    <script>

        const weightArr = new Array();

        <c:forEach var="item" items="${weightArr}">

        	weightArr.push(${item});

        </c:forEach>
        
        console.log(weightArr);

    </script>
    
    <script>

        const datearr = new Array();

        <c:forEach var="item" items="${dateArr}">
        
        	datearr.push("${item}");

        </c:forEach>
        
        console.log(datearr);

    </script>
    
    <script>

        const fatPctarr = new Array();

        <c:forEach var="item" items="${fatPctArr}">

        	fatPctarr.push(${item});

        </c:forEach>
        
        console.log(fatPctarr);

    </script>
    
    <script>

        const muscleArr = new Array();

        <c:forEach var="item" items="${muscleArr}">

        	muscleArr.push(${item});

        </c:forEach>
        
        console.log(muscleArr);

    </script>

</head>

<body>

    <!-- ==================HEADER==================== -->
    <jsp:include page="/WEB-INF/views/include/header.jsp" />
    
    <!-- ==================CONTENT==================== -->

    <jsp:useBean id="now" class="java.util.Date" />
    <fmt:formatDate value="${now}" pattern="YY-MM-DD" var="nowDate" />

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
                    <li><a href="/mypage/mybody" class="on">MY BODY</a></li>
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
                    <li><a href="/mypage/mybody" class="on">신체정보</a></li>
                </ul>

            </div>

            <div class="mybody_wrapper">

                <div class="mybody">

                    <div class="mybody_weight on">
                        <div class="mybody_type">체중 (kg)</div>

                        <div class="mybody_weight_value">
                            <c:forEach var="board" items="${__LIST__}" varStatus="index">
                                <c:if test="${index.last eq true}">${board.bodyWeight}</c:if>
                            </c:forEach>
                        </div>

                        <div class="mybody_weight_type">표준</div>
                    </div>

                    <div class="mybody_muscle on">
                        <div  class="mybody_type">골격근량 (kg)</div>

                        <div  class="mybody_muscle_value">
                            <c:forEach var="board" items="${__LIST__}" varStatus="index">
                                <c:if test="${index.last eq true}">${board.bodyMuscle}</c:if>
                            </c:forEach>
                        </div>

                        <div  class="mybody_muscle_type">표준</div>
                    </div>

                    <div class="mybody_BMI on">
                        <div  class="mybody_type">체지방률 (%)</div>
                        
                        <div  class="mybody_BMI_value">
                            <c:forEach var="board" items="${__LIST__}" varStatus="index">
                                <c:if test="${index.last eq true}">${board.bodyFatPct}</c:if>
                            </c:forEach>
                        </div>

                        <div  class="mybody_BMI_type">표준</div>
                    </div>

                </div>
                
                <!-- 인바디 입력창 모달 -->
                <button type="button" class="mybody_Input btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                    인바디 입력
                </button>
                
                <button type="button" class="mybody_delete btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop3">
                    기록 수정
                </button>

            </div>

            <div class="mybody_chart_wrapper">

                <div class="mybody_chart_btn">

                    <button type="button" class="mybody_btn_date btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop2">
                        날짜 선택
                    </button>
                    
                </div>

                <!-- 차트 움직이게 하는 화면 -->
                <div class="outer">

                    <div class="inner-list">

                      <div class="inner">
                        <div class="container">
                            <canvas id="myChart"></canvas>
                            <script type="text/javascript" src="/resources/js/mypage/mybody1.js"></script>
                        </div>
                      </div>

                      <div class="inner">
                        <div class="container">
                            <canvas id="myChart2"></canvas>
                        </div>
                        <script type="text/javascript" src="/resources/js/mypage/mybody2.js"></script>
                      </div>

                      <div class="inner">
                        <div class="container">
                            <canvas id="myChart3"></canvas>
                        </div>
                        <script type="text/javascript" src="/resources/js/mypage/mybody3.js"></script>
                      </div>

                    </div>

                </div>
                  
                <div class="button-list">
                    <button class="button-left">← 이전</button>
                    <button class="button-right">다음 →</button>
                </div>

                <!-- 차트 -->
                <script type="text/javascript" src="/resources/js/mypage/mybodyChart.js"></script>

            </div>
            
        </div>

        <!-- Modal 창 - 인바디 입력창 (팝업창) -->
        <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">

            <div class="modal-content">

                <div class="modal-header">
                    <h5 class="modal-title" id="staticBackdropLabel">인바디 입력</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>

                <div class="modal-body">

                    <!-- 어디로 데이터를 보낼지 작성해야 한다. -->
                    <form action="/mypage/mybody/input" method="post" id="bodyInputForm">

                        <input type="hidden" name="userId" value="user2">

                        <!-- 날짜 -->
                        <div class="modal_mybody_date">
                            <p>날짜</p>
                            
                            <!-- 데이트 피커 적용 -->
                            <input 
                                    type="date" 
                                    name="bodyDate" 
                                    style="width: 300px; margin-left: 93px;  border: 1px solid #D7D7D7; border-radius: 3px; height: 33px;" 
                                    id="modal_datepicker insert_mybody_date">
                            
                        </div>

                        <!-- 체중 -->
                        <div class="modal_mybody_weight">
                            <p>체중 (kg)</p>
                            <input type="number" step="0.1" name="bodyWeight" placeholder="체중을 입력해주세요." required>
                        </div>

                        <!-- 골격근량 -->
                        <div class="modal_mybody_muscle">
                            <p>골격근량 (kg)</p>
                            <input type="number" step="0.1" name="bodyMuscle" placeholder="골격근량을 입력해주세요." required>
                        </div>

                        <!-- 체지방률 -->
                        <div class="modal_mybody_BMI">
                            <p>체지방률 (%)</p>
                            <input type="number" step="0.1" name="bodyFatPct" placeholder="체지방률을 입력해주세요." required>
                        </div>


                        <input type="submit" class="modal_mybody_input_btn" data-bs-dismiss="modal" value="등록">

                    </form>

                </div>
                
            </div>

            </div>
        </div>

        <!-- Modal 창 - 인바디 수정창 (모달창) -->
        <div class="modal fade" id="staticBackdrop3" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">

                <div class="modal-content">

                    <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel">인바디 수정</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>

                    <div class="modal-body">

                        <!-- 어디로 데이터를 보낼지 작성해야 한다. -->
                        <form action="/mypage/mybody/update" method="post" id="bodyUpdateForm">

                            <input type="hidden" name="userId" value="user2">

                            <!-- 날짜 -->
                            <div class="modal_mybody_date">
                                <p>날짜</p>
                                
                                <!-- 데이트 피커 적용 -->
                                <input 
                                    type="date" 
                                    name="bodyDate" 
                                    style="width: 300px; margin-left: 93px;  border: 1px solid #D7D7D7; border-radius: 3px; height: 33px;" 
                                    id="modal_datepicker insert_mybody_date">
                                
                            </div>

                            <!-- 체중 -->
                            <div class="modal_mybody_weight">
                                <p>체중 (kg)</p>
                                <input type="number" step="0.1" name="bodyWeight" placeholder="체중을 입력해주세요.">
                            </div>

                            <!-- 골격근량 -->
                            <div class="modal_mybody_muscle">
                                <p>골격근량 (kg)</p>
                                <input type="number" step="0.1" name="bodyMuscle" placeholder="골격근량을 입력해주세요.">
                            </div>

                            <!-- 체지방률 -->
                            <div class="modal_mybody_BMI">
                                <p>체지방률 (%)</p>
                                <input type="number" step="0.1"  name="bodyFatPct" placeholder="체지방률을 입력해주세요.">
                            </div>


                            <input type="submit" class="modal_mybody_input_btn" data-bs-dismiss="modal" value="등록">

                        </form>

                    </div>
                    
                </div>

            </div>
        </div>

        <!-- Modal 창 - 날짜 선택창 (팝업창) -->
        <div class="modal fade" id="staticBackdrop2" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">

                <div class="modal-content">

                    <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel">날짜 선택</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>

                    <div class="modal-body">

                        <!-- 어디로 데이터를 보낼지 작성해야 한다. -->
                        <form action="#">

                            <input type="hidden" name="userId" value="user2">
                            
                            <!-- 날짜 -->
                            <div class="modal_mybody_date">
                                <p>날짜</p>
                                
                                <input 
                                    type="date" 
                                    name="bodyDate"
                                    style="width: 230px; margin-left: 93px;  border: 1px solid #D7D7D7; border-radius: 3px; height: 33px;" 
                                    id="modal_datepicker insert_mybody_date">
                                <input type="submit" class="modal_mybody_date_btn" data-bs-dismiss="modal" value="선택">
                            </div>

                        </form>

                    </div>
                    
                </div>

            </div>
        </div>


    </section>


    <!-- ==================FOOTER==================== -->
    
    <jsp:include page="/WEB-INF/views/include/footer.jsp" />
   
</body>

</html>