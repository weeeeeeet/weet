<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>마이페이지 - 회원 - 내정보</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>

    <!-- 차트.js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>

    <link href="/resources/css/mypageQuit.css" rel="stylesheet" />
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

                <div class="profile_id">WEE.T</div>

                <img src="/resources/img/static/naver2.png" class="profile_social" alt="소설로그인표시">

                <a href="/mypage/profile/myprofile" class="profile_email">helloword@naver.com <i class="fas fa-angle-right"></i> </a>

            </div>

            <div class="mypage_list">
                <!-- 왼쪽 목록 -->

                <ul class="mypage_list_top">
                    <li><a href="/mypage/activity/boardlist">내 활동</a></li>
                    <li><a href="/mypage/class/my">내 클래스룸</a></li>
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
                    <li><a href="/mypage/profile/myprofile">프로필</a></li>
                    <li><a href="/mypage/profile/settings">알림살정</a></li>
                    <li><a href="/mypage/profile/quit" class="on">회원탈퇴</a></li>
                </ul>

            </div>

            <div class="content_right_secede">

                    <div class="secede_agree">

                        <p> 정말 탈퇴하시겠어요? </p>
                        <p>
                            회원탈퇴 시 개인정보 및 WEE.T에서 만들어진 모든 데이터는 삭제 됩니다.<br>
                            ( 단, 아래 항목은 표기된 법률에 따라서 특정 기간 동안 보관됩니다. )<br>
                            <br>
                            1. 결제 또는 결제취소 등에 관란 기록 보존 이유 : 전자상거래 등에서의 소비자 보호에 관한 법률 ( 보존 기간 : 5년 ) <br>
                            2. 소비자의 불만 또는 분쟁 처리에 관한 보존 이유 : 전자상거래 등에서의 소비자 보호에 관한 법률 ( 보존 기간 : 3년 ) <br>
                            3. 신용정보의 수집/처리 및 이용 등에 관한 기록 보존 이유 : 신용정보 이용 및 보호에 관한 법률 ( 보존 기간 : 3년 ) <br>
                            4. 전자(세금)계산서 시스템 구축 운영하는 사업자가 지켜야 할 사할 고시(국세청 고시 제 2016-3호) (전자세금서 사용자에 한함) ( 보존 기간 : 5년 ) <br>
                            ( 단, 세금(계산서) 내 개인식별번호는 3년 경과 후 폐기 )
                        </p>

                    </div>

                    <button type="button" class="content_right_secede_delete btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop1">
                        회원 탈퇴하기
                    </button>

                    <!-- Modal 창 (팝업창1) - 회원탈퇴 -->
                    <div class="modal fade" id="staticBackdrop1" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog">

                            <div class="modal-content">

                                <div class="modal-header">
                                    <h5 class="modal-title" id="staticBackdropLabel">WEE.T 탈퇴 사유 입력</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>

                                <form action="#">
                                    <div class="modal-body">
                                    
                                        <p class="modal_class_title">탈퇴 사유</p>
                                    
                                        <div class="modal_class_content">
                                    
                                            <input type="checkbox" name="receive_agree_WEET_check" value="1" class="receive_agree_WEET_check"> 사생활 기록 삭제 목적 <br>
                                            <input type="checkbox" name="receive_agree_WEET_check" value="2" class="receive_agree_WEET_check"> 새 아이디 생성 목적 <br>
                                            <input type="checkbox" name="receive_agree_WEET_check" value="3" class="receive_agree_WEET_check"> 서비스 기능 불편 <br>
                                            <input type="checkbox" name="receive_agree_WEET_check" value="4" class="receive_agree_WEET_check"> Wee.T 이용 안함 <br>
                                            <input type="checkbox" name="receive_agree_WEET_check" value="5" class="receive_agree_WEET_check"> 개인정보 및 보안 우려 <br>
                                            <input type="checkbox" name="receive_agree_WEET_check" value="6" class="receive_agree_WEET_check"> Wee.T 정책 불만 <br>
                                            <input type="checkbox" name="receive_agree_WEET_check" value="7" class="receive_agree_WEET_check"> 기타 :
                                            <input type="text" name="receive_agree_WEET_check" class="receive_agree_WEET_check_text">
                                    
                                        </div>
                                    
                                    </div>
                                    
                                    <div class="modal-footer">
                                        <input type="submit" class="btn_submit" value="회원 탈퇴">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                                    </div>

                                </form>
                                
                            </div>

                        </div>

                    </div>


            </div>
            
        </div>

    </section>

    <!-- ==================FOOTER==================== -->
    <%@ include file="/WEB-INF/views/include/footer.jsp" %>
   
</body>

</html>