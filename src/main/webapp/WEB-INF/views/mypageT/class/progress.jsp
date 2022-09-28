<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
    
    <link href="/resources/css/mypageTClass.css" rel="stylesheet" />
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

                <div class="profile_id">구창식2</div>

                <div class="profile_social">T</div>

                <div class="profile_level">LV.3</div>

                <a href="#" class="profile_email">helloword@naver.com <i class="fas fa-angle-right"></i> </a>

            </div>

            <div class="mypage_list">
                <!-- 왼쪽 목록 -->

                <ul class="mypage_list_top">
                    <li><a href="/마이페이지_트레이너_내활동.html">내 활동</a></li>
                    <li><a href="#" class="on">내 클래스룸</a></li>
                    <li><a href="#">MY BODY</a></li>
                </ul>

                <ul class="mypage_list_bottom">
                    <li><a href="#">구매 내역</a></li>
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
                    <div>● 클래스 검수 상태에서 대기는 1, 반려는 2, 승인은 3으로 나타납니다.</div>
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

                        <tr>
                            <td>헬린이들 모여라!!!</td>
                            <td>그룹</td>
                            <td>450,000</td>
                            <td>2022-06-13</td>
                            <td> 2022-06-13 <br>
                            ~ 2022-06-20</td>
                            <td>4</td>
                            <td>대기</td>
                        </tr>

                        <tr>
                            <td>건강한 습관 만들기</td>
                            <td>개인</td>
                            <td>550,000</td>
                            <td>2022-06-10</td>
                            <td> 2022-06-10 <br>
                            ~ 2022-06-17</td>
                            <td>5</td>
                            <td>완료</td>
                        </tr>

                    </tbody>

                </table>

            </div>
            
        </div>


    </section>

    <!-- ==================FOOTER==================== -->
    <%@ include file="/WEB-INF/views/include/footer.jsp" %>
   
</body>

</html>