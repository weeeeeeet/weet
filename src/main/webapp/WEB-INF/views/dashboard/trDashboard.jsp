<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>trainerDashboard</title>

        <!-- favicon -->
        <link rel="shortcut icon" href="/resources/ico/favicon.ico" type="image/x-icon">
        <link rel="icon" href="/resources/ico/favicon.ico" type="image/x-icon">
            
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

        <!-- 외부 스타일 시트 연결 -->
        <!-- 유저 대시보드 css -->
 		<link rel="stylesheet"  href="/resources/css/dashboard/trDashboard.css" />
 		
        <!-- 폰트어썸 설정 -->
        <!-- <link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet"> -->
        <script src="https://kit.fontawesome.com/63eb3bc178.js" crossorigin="anonymous"></script>

        <!-- 외부 JS 연결 -->
        <!-- include-html 연결하는 JS 파일 -->



</head>

<body>
    
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    
    <!-- header 불러오기 -->
    <%@ include file="/WEB-INF/views/include/header.jsp"  %>

    <!-- contents -->
    <section class="wrap">

        <!-- sidebar 불러오기 -->
        <%@ include file="/WEB-INF/views/include/sidebarTr.jsp" %>

        <!--대시보드 -->
        <div class="dash g">

            <div class="g"><h1>트레이너 대시보드</h1></div>

            <!-- 클래스 공지사항 -->
            <div class="class-notice g">

                <!-- 공지사항 & 작성버튼 -->
                <div class="notice-write g">
                    <h2 class="g">클래스 공지사항</h2>
    
                    <!-- 글 작성 버튼-->
                    <a href="/dashboard/tr/noticeplan/write" target="self">
                        <div class="write-icon g">
                            <i class="fas fa-pen-to-square"></i>
                            <h3 class="g">작성</h3>
                        </div>
                    </a>
                </div>

                <!-- 클래스 공지 리스트 -->
                <div class="notice-list g">
                    <ul class="">
                      	<c:forEach var="notice" items="${__NOTICELIST__}">
	                        <li class="g">
	                            <a href="/dashboard/tr/noticeplan/detail?n_num=${notice.n_num}" target="self">${notice.n_title}</a> 
	                            <a href="#" target="self"><h5 class="update g">수정</h4></a>
	                            <a href="#" target="self"><h4 class="delete g">삭제</h4></a>    
	                            <span class="date g"><fmt:formatDate pattern="yyyy/MM/dd" value="${notice.n_ts}" /></span>
	                        </li>
						</c:forEach>
					</ul>
                        <!-- <li class="g">
                            <a href="/dashboard/tr/noticeplan/detail" target="self">Set your goals for your first 90 days</a>
                            <a href="#" target="self"><h5 class="update g">수정</h4></a>
                            <a href="#" target="self"><h4 class="delete g">삭제</h4></a>    
                            <span class="date">2022.07.20</span>
                        </li>

                        <li class="g">
                            <a href="/dashboard/tr/noticeplan/detail" target="self">Complete the Compensation Plan Quiz</a>
                            <a href="#" target="self"><h5 class="update g">수정</h4></a>
                            <a href="#" target="self"><h4 class="delete g">삭제</h4></a>
                            <span class="date">2022.07.20</span>
                        </li>
                            
                        <li class="g">
                            <a href="/dashboard/tr/noticeplan/detail" target="self">Get set on autoship</a>
                            <a href="#" target="self"><h5 class="update g">수정</h4></a>
                            <a href="#" target="self"><h4 class="delete g">삭제</h4></a>
                            <span class="date">2022.07.20</span class="date">
                        </li>

                        <li class="g">
                            <a href="/dashboard/tr/noticeplan/detail" target="self">Complete the Compensation Plan Quiz</a>
                            <a href="#" target="self"><h5 class="update g">수정</h4></a>
                            <a href="#" target="self"><h4 class="delete g">삭제</h4></a>
                            <span class="date">2022.07.20</span>
                        </li>

                        <li class="g">
                            <a href="/dashboard/tr/noticeplan/detail" target="self">Get set on autoship</a>
                            <a href="#" target="self"><h5 class="update g">수정</h4></a>
                            <a href="#" target="self"><h4 class="delete g">삭제</h4></a>
                            <span class="date">2022.07.20</span class="date">
                        </li>

                        <li class="g">
                            <a href="/dashboard/tr/noticeplan/detail" target="self">Set your goals for your first 90 days</a>
                            <a href="#" target="self"><h5 class="update g">수정</h4></a>
                            <a href="#" target="self"><h4 class="delete g">삭제</h4></a>
                            <span class="date">2022.07.20</span>
                        </li>-->
                </div>
            </div>

            <!-- 이번주 코칭계획 -->
            <div class="coaching-plan g">
                
                <!-- 코칭계획 & 작성버튼 -->
                <div class="plan-write g">
                    <h2 class="g">이번주 코칭계획</h2>
    
                    <!-- 글 작성 버튼-->
                    <!-- 버튼태그 사용 -->
                    <!-- <button class="g" id="write-btn">
                        <div class="write-icon2 g">
                            <i class="fas fa-pen-to-square"></i>
                            <h3 class="g">작성</h3>
                        </div>
                    </button>    -->
                    <!-- a태그 사용 -->
                    <a href="/dashboard/tr/noticeplan/write" target="self">
                        <div class="write-icon g">
                            <i class="fas fa-pen-to-square"></i>
                            <h3 class="g">작성</h3>
                        </div>
                    </a>
                </div>

                <!-- 이번주 코칭 리스트 -->
                <div class="plan-list g">
                    <ul>
                   		<c:forEach var="notice" items="${__COACHINGLIST__}">
	                        <li class="g">
	                            <a href="/dashboard/tr/noticeplan/detail?n_num=${notice.n_num}" target="self">${notice.n_title}</a> 
	                            <a href="#" target="self"><h5 class="update g">수정</h4></a>
	                            <a href="#" target="self"><h4 class="delete g">삭제</h4></a>    
	                            <span class="date g"><fmt:formatDate pattern="yyyy/MM/dd" value="${notice.n_ts}" /></span>
	                        </li>
						</c:forEach>
						
                        <!-- <li class="g">
                            <a href="/dashboard/tr/noticeplan/detail" target="self">1주차 코칭 계획</a>
                            <a href="#" target="self"><h5 class="update g">수정</h4></a>
                            <a href="#" target="self"><h4 class="delete g">삭제</h4></a>  
                            <span class="date">2022.07.20</span>
                        </li>

                        <li class="g">
                            <a href="/dashboard/tr/noticeplan/detail" target="self">2주차 코칭 계획</a>
                            <a href="#" target="self"><h5 class="update g">수정</h4></a>
                            <a href="#" target="self"><h4 class="delete g">삭제</h4></a>  
                            <span class="date">2022.07.20</span>
                        </li>

                        <li class="g">
                            <a href="/dashboard/tr/noticeplan/detail" target="self">3주차 코칭 계획</a>
                            <a href="#" target="self"><h5 class="update g">수정</h4></a>
                            <a href="#" target="self"><h4 class="delete g">삭제</h4></a>  
                            <span class="date">2022.07.20</span>
                        </li>

                        <li class="g">
                            <a href="/dashboard/tr/noticeplan/detail/" target="self">4주차 코칭 계획</a>
                            <a href="#" target="self"><h5 class="update g">수정</h4></a>
                            <a href="#" target="self"><h4 class="delete g">삭제</h4></a>  
                            <span class="date">2022.07.20</span>
                        </li>

                        <li class="g">
                            <a href="/dashboard/tr/noticeplan/detail" target="self">5주차 코칭 계획</a>
                            <a href="#" target="self"><h5 class="update g">수정</h4></a>
                            <a href="#" target="self"><h4 class="delete g">삭제</h4></a>  
                            <span class="date">2022.07.20</span>
                        </li>

                        <li class="g">
                            <a href="/dashboard/tr/noticeplan/detail" target="self">6주차 코칭 계획</a>
                            <a href="#" target="self"><h5 class="update g">수정</h4></a>
                            <a href="#" target="self"><h4 class="delete g">삭제</h4></a>  
                            <span class="date">2022.07.20</span>
                        </li>

                        <li class="g">
                            <a href="/dashboard/tr/noticeplan/detail" target="self">7주차 코칭 계획</a>
                            <a href="#" target="self"><h5 class="update g">수정</h4></a>
                            <a href="#" target="self"><h4 class="delete g">삭제</h4></a>  
                            <span class="date">2022.07.20</span>
                        </li>
                    </ul> -->
                </div>
            </div>
        </div>

    </section>

        <!-- footer 불러오기 -->
        <%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>