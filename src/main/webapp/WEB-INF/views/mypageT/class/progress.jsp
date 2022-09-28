<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>마이페이지 - 클래스룸</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!-- favicon -->
    <link rel="icon" href="/resources/ico/favicon.ico" type="image/x-icon">
    <link rel="shortcut icon" href="/resources/ico/favicon.ico" type="image/x-icon">

    <!-- 제이쿼리 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.0/jquery-migrate.min.js" integrity="sha512-QDsjSX1mStBIAnNXx31dyvw4wVdHjonOwrkaIhpiIlzqGUCdsI62MwQtHpJF+Npy2SmSlGSROoNWQCOFpqbsOg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <link href="/resources/css/mypageT/mypageTClass.css" rel="stylesheet" />
    <link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/63eb3bc178.js" crossorigin="anonymous"></script>

</head>

<body>

    <!-- ==================HEADER==================== -->
    
    <jsp:include page="/WEB-INF/views/include/header.jsp" />
    
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
                    <li><a href="/mypageT/activity/boardlist">내 활동</a></li>
                    <li><a href="/mypageT/class/my" class="on">내 클래스룸</a></li>
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
                    <li><a href="/mypageT/class/my">내 클래스 룸</a></li>
                    <li><a href="/mypageT/class/expired">종료 클래스 룸</a></li>
                    <li><a href="/mypageT/class/progress" class="on">클래스 검수</a></li>
                </ul>

            </div>

            <div class="content_right_Myclass">

                <div class="Myclass_checkclass_comment">
                    <div>● 클래스 등록을 요청하시면 하시면 검수를 통해서 승인 완료됩니다.</div>
                </div>

                <table class="table_checkclass_table table table-striped table-hover">

                    <thead>
                        <tr>
                            <th>클래스명</th>
                            <th>유형</th>
                            <th>금액</th>
                            <th>등록일</th>
                            <th>모집기간</th>
                            <th>모집인원</th>
                            <th>승인</th>
                        </tr>
                    </thead>

                    <tbody>

                        <c:forEach var="board" items="${__LIST__}">

                            <tr>
                                <td>${board.classTitle}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${board.classType eq '1'}">
                                            개인 
                                        </c:when>
                                        <c:when test="${board.classType eq '2'}">
                                            그룹
                                        </c:when>
                                    </c:choose>

                                </td>
                                <td>${board.classFee}</td>
                                <td><fmt:formatDate pattern="yyyy/MM/dd" value="${board.classRecruitStartDate}" /></td>
                                <td> <fmt:formatDate pattern="yyyy/MM/dd" value="${board.classRecruitStartDate}" /> <br>
                                ~ <fmt:formatDate pattern="yyyy/MM/dd" value="${board.classRecruitEndDate}" /> </td>
                                <td>${board.classRecruitMaxNum}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${board.classRegisterStatus eq '1'}">
                                            대기 
                                        </c:when>
                                        <c:when test="${board.classRegisterStatus eq '1'}">
                                            반려
                                        </c:when>
                                        <c:when test="${board.classRegisterStatus eq '3'}">
                                            승인
                                        </c:when>
                                    </c:choose>
                                </td>
                            </tr>

                        </c:forEach>

                    </tbody>

                </table>

            </div>
            
        </div>


    </section>

    <!-- ==================FOOTER==================== -->
    <jsp:include page="/WEB-INF/views/include/footer.jsp" />
   
</body>

</html>