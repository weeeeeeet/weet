<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>마이페이지 - 클래스룸</title>

    <link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/63eb3bc178.js" crossorigin="anonymous"></script>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!-- favicon -->
    <link rel="icon" href="/resources/ico/favicon.ico" type="image/x-icon">
    <link rel="shortcut icon" href="/resources/ico/favicon.ico" type="image/x-icon">

    <!-- 제이쿼리 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.0/jquery-migrate.min.js" integrity="sha512-QDsjSX1mStBIAnNXx31dyvw4wVdHjonOwrkaIhpiIlzqGUCdsI62MwQtHpJF+Npy2SmSlGSROoNWQCOFpqbsOg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    
    <link href="/resources/css/mypage/Mypage_Classroom.css" rel="stylesheet" />
    <link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/63eb3bc178.js" crossorigin="anonymous"></script>

    <script>

        $(function() {

            // 이전 / 다음 페이지 목록
            $('a.prev, a.next').click( function (e) {

                e.preventDefault();

                // form태그 직접 조작 및 전송
                let formObj = $('#pagenationForm');
                formObj.attr('action', '/mypage/class/my');
                formObj.attr('method', 'GET');

                console.clear();
                console.log('>>> this.href : ', $(this).attr('href'));

                formObj.find('input[type=hidden][name=currPage]').val($(this).attr('href'));
                formObj.find('input[type=hidden][name=userId]').val('user2');
                // formObj.find('input[type=hidden][name=userId]').val(${userId});

                formObj.submit();

            });
            

         });

    </script>

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

                <div class="profile_id">WEE.T</div>

                <img src="/resources/img/static/naver2.png" class="profile_social" alt="소설로그인표시">

                <a href="/mypage/profile/myprofile" class="profile_email">helloword@naver.com <i class="fas fa-angle-right"></i> </a>

            </div>

            <div class="mypage_list">
                <!-- 왼쪽 목록 -->

                <ul class="mypage_list_top">
                    <li><a href="/mypage/activity/boardlist">내 활동</a></li>
                    <li><a href="/mypage/class/my" class="on">내 클래스룸</a></li>
                    <li><a href="/mypage/mybody">MY BODY</a></li>
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
                    <li><a href="/mypage/class/my" class="on">내 클래스 룸</a></li>
                    <li><a href="/mypage/class/expired">수강종료 클래스</a></li>
                    <li><a href="/mypage/class/before">예약 클래스</a></li>
                    <li><a href="/mypage/class/like">찜 한 클래스</a></li>
                </ul>

            </div>

            <p class="content_p"> ● 클래스 클릭 시 해당 클래스의 대시보드로 이동합니다.</p>

            <c:forEach var="board" items="${__LIST__}">

                <div class="class_card">
                    <img src="${board.classMainImgUrl}" class="card_img" alt="해당 클래스의 대포사진 자리">
                    <a href="#" class="card-text">${board.classTitle}</a>
                </div>

            </c:forEach>

            <p>&nbsp;</p>
            <p>&nbsp;</p>

            <div id="pagenation">

                <form id="pagenationForm">
    
                    <input type="hidden" name="currPage">
                    <input type="hidden" name="userId">
    
                    <ul>
    
                        <!-- 이전 페이지 목록 -->
                        <c:if test="${__PAGENATION__.prev}">
    
                            <li class="prev"> <a href="${__PAGENATION__.startPage -1}" class="prev">이전</a></li>
    
                        </c:if>
    
                        <!-- 현재 PAGENATION 범위에 속한 페이지 번호 목록 출력 -->
                        <c:forEach var="pageNum" begin="${__PAGENATION__.startPage}" end="${__PAGENATION__.endPage}">
    
                            <li> 
                            <!-- Userid 세션에서 받아 오는 것으로 수정해야 된다!!(********) -->
                                <a 
                                    href="/mypage/class/my?userId=user2&currPage=${pageNum}" 
                                    class="${pageNum == __PAGENATION__.cri.currPage ? 'currPage' : '' }" > 
    
                                    <strong>${pageNum}</strong>
    
                                </a>
                            </li>
    
                        </c:forEach>
    
                        <!-- 다음 페이지 목록 -->
                        <c:if test="${__PAGENATION__.next}">
    
                            <li class="next"> <a href="${__PAGENATION__.endPage +1}" class="next">다음</a></li>
    
                        </c:if>
    
                    </ul>
    
                </form>
    
            </div>
            
        </div>

    </section>

    <!-- ==================FOOTER==================== -->
    
    <jsp:include page="/WEB-INF/views/include/footer.jsp" />
   
</body>

</html>