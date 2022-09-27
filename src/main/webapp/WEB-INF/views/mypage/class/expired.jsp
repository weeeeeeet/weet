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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>

    <!-- favicon -->
    <link rel="icon" href="/resources/ico/favicon.ico" type="image/x-icon">
    <link rel="shortcut icon" href="/resources/ico/favicon.ico" type="image/x-icon">
    
    <link href="/resources/css/mypage/mypageEndClassroom.css" rel="stylesheet" />
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
        
        $("input[type=radio][name='reviewStar']").removeAttr("checked");

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
                    <li><a href="/mypage/class/my">내 클래스 룸</a></li>
                    <li><a href="/mypage/class/expired" class="on">수강종료 클래스</a></li>
                    <li><a href="/mypage/class/before">예약 클래스</a></li>
                    <li><a href="/mypage/class/like">찜 한 클래스</a></li>
                </ul>

            </div>

            <c:forEach var="board" items="${__LIST__}" varStatus="vs">

                <div class="class_card">
                    <img src="<spring:url value='/${board.classMainImgUrl}'/>" class="card_img" alt="클래스대표사진">
                    <a href="#" class="card-text" id="classTitle">${board.classTitle}</a>
                    <button type="button" class="class_card_btn btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop${vs.index}">
                        후기 등록하기
                    </button>
                </div>

                <!-- Modal 창 (팝업창) -->
                <div class="modal fade" id="staticBackdrop${vs.index}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    
                    <div class="modal-dialog">

                        <div class="modal-content">

                            <div class="modal-header">
                                <h5 class="modal-title" id="staticBackdropLabel">클래스 후기 등록하기</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>

                            <form action="/mypage/class/expired/register" method="post" id="replyForm">

                                <div class="modal-body">
                            
                                    <input type="hidden" name="userId" value="${board.userId}">
                                    <input type="hidden" name="classId" value="${board.classId}">

                                    <p class="modal_class_title">${board.classTitle}</p>
                            
                                    <div class="modal_class_content">
                            
                                        <div class="modal_class_content_profile">
                            
                                            <div class="modal_class_content_profile_photo"></div>
                            
                                            <p class="modal_class_content_profile_id">${board.userId}</p>
                            
                                            <p class="modal_class_content_profile_date">2022.07.06</p>
                            
                                        </div>
                            
                                        <div class="star-rating">
                                            <input type="radio" id="5-stars" name="reviewStar" value="5" />
                                            <label for="5-stars" class="star">&#9733;</label>
                                            <input type="radio" id="4-stars" name="reviewStar" value="4" />
                                            <label for="4-stars" class="star">&#9733;</label>
                                            <input type="radio" id="3-stars" name="reviewStar" value="3" checked />
                                            <label for="3-stars" class="star">&#9733;</label>
                                            <input type="radio" id="2-stars" name="reviewStar" value="2" />
                                            <label for="2-stars" class="star">&#9733;</label>
                                            <input type="radio" id="1-star" name="reviewStar" value="1" />
                                            <label for="1-star" class="star">&#9733;</label>
                                        </div>
                            
                                        <div class="modal_class_content_review">
                                            <input type="text" name="reviewContents" id="modal_class_content_review_inner" placeholder="수강후기를 작성해주세요.">
                                        </div>
                            
                                    </div>

                                    <p class="file_comment">사진 용량은 사진 한 장당 10MB까지 등록 가능합니다. <br>
                                        사진은 최대 5장 까지 권장합니다.그 이상은 등록이 불가합니다. </p>
                            
                                    <input id="uploadFiles" class="modal_class_file" type="file" name="reviewImgUrl" multiple style="width:300px" onchange="uploadFileAdded()">

                                    <input type="submit" class="modal_submit btn btn-primary" value="등록하기">
                            
                                </div>

                            </form>
                            
                        </div>

                    </div>
                </div>

            </c:forEach>

        </div>

    </section>

    <!-- ==================TOPBUTTON==================== -->

    <jsp:include page="/WEB-INF/views/include/footer.jsp" />
   
</body>

</html>