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

    <!-- favicon -->
    <link rel="icon" href="/resources/ico/favicon.ico" type="image/x-icon">
    <link rel="shortcut icon" href="/resources/ico/favicon.ico" type="image/x-icon">
    
    <link href="/resources/css/mypage/mypagePayDetail.css" rel="stylesheet" />
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
                    <li><a href="/mypage/pay/paylist" class="on">구매 내역</a></li>
                    <li><a href="#">고객센터</a></li>
                </ul>

            </div>

        </nav>

        <div class="content_right">
            <!-- 오른쪽 영역 : 위쪽 목록 + 전체 / 답변완료 + -->

            <div class="mypage_top">

                <ul class="mypage_toplist">
                    <li><a href="/mypage/pay/paylist" class="on">구매 내역</a></li>
                </ul>

            </div>

            <!-- 구매한 클래스 상세 내역 -->

            <div class="class_card_purchase_detail">

                <!-- 구매상세 내역 -->
                <div class="class_card_purchase_detail_num">
                    <p>구매상세내역</p>
                    <div class="class_card_purchase">
                        <div class="class_card_purchase_number">20220312092608632933</div>
                        <div class="class_card_purchase_number"> / 2022.07.09 09:26:25 </div>
                        <div class="class_card_purchase_money">75,000원</div>
                    </div>
                </div>

                <!-- 주문정보 -->
                <div class="class_card_purchase_detail_info">
                    <p>주문정보</p>

                    <div class="class_card_purchase_detail_info_content">

                        <div class="class_card_purchase_detail_info_type">
                            <div class="purchase_type">결제수단</div>
                            <div class="purchase_type_value">신용카드</div>

                            <div class="purchase_card">카드사</div>
                            <div class="purchase_card_value">카카오 카드</div>
                        </div>
                        
                        <div class="class_card_purchase_detail_dc">
                            <div class="class_card_purchase_detail_orginalmoney">총 상품금액</div>
                            <div class="class_card_purchase_detail_orginalmoney_value">78,000원</div>
                            <div class="class_card_purchase_detail_cupon">쿠폰 상품금액</div>
                            <div class="class_card_purchase_detail_cupon_value">3,000</div>
                        </div>
                        
                        <div class="class_card_purchase_detail_total">
                            <div class="class_card_purchase_detail_total_money">총 결제 금액</div>
                            <div class="class_card_purchase_detail_total_money_value">75,000원</div>
                        </div>

                    </div>

                </div>

                <!-- 구매상품 -->
                <div class="class_card_purchase_detail_target">

                    <p>구매상품</p>
                    <img src="/resources/img/static/classcard1.jpg" class="card_img" alt="해당 클래스의 대포사진 자리">

                    <div class="class_card_purchase_detail_target_right">
                        <!-- 클래스 게시물과 연결해야 한다. -->
                        <a href="#" class="class_card_target_text">[인기 클래스] 국내1위 홈트계 끝판왕 '위이티'</a>

                        <button type="button" class="class_card_btn_delete btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop1">
                            주문취소
                        </button>

                        <button type="button" class="class_card_btn_info btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop2">?</button>

                    </div>

                </div>

            </div>
            
        </div>

        <div class="tttoooo"></div>

        <!-- Modal 창 (팝업창1) - 주문취소 -->
        <div class="modal fade" id="staticBackdrop1" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">

                <div class="modal-content">

                    <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel">환불 정보 입력</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>

                    <form action="#">
                        <div class="modal-body">
                        
                            <p class="modal_class_title">신청정보</p>
                            <p class="modal_class_title_value">[인기 클래스] 국내1위 홈트계 끝판왕 '위이티'</p>
                        
                            <div class="modal_class_content">
                        
                                <p class="modal_class_title">환불사유</p>
                        
                                <input type="checkbox" name="refund_reason" value="1" checked> 수강 스케줄<br>
                                <input type="checkbox" name="refund_reason" value="2"> 고객센터 불만족<br>
                                <input type="checkbox" name="refund_reason" value="3"> 퀄리티 불만족<br>
                                <input type="checkbox" name="refund_reason" value="4"> 중복결제<br>
                                <input type="checkbox" name="refund_reason" value="5"> 결제수단 변경<br>
                                <input type="checkbox" name="refund_reason" value="6"> 쿠폰 사용 후 결제<br>
                                <input type="checkbox" name="refund_reason" value="7"> 기타 : 
                                <input type="text" name="refund_reason_ect" class="reason_input">
                        
                            </div>
                        
                            <div class="modal_class_email">

                                <p class="modal_class_title">이메일 정보</p>
                        
                                <div class="refund_email">이메일 입력</div>
                                <input type="text" name="email" class="email_input" placeholder="이메일 주소를 입력해주세요." required>
                        
                            </div>
                        
                        </div>
                        
                        <div class="modal-footer">
                            <input type="submit" class="btn_submit" value="주문 취소">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                        </div>

                    </form>
                    
                </div>

            </div>

        </div>

        <!-- Modal 창 (팝업창2) - ? -->
        <div class="modal fade" id="staticBackdrop2" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">

                <div class="modal-content">

                    <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel">환불규정 안내</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>

                    <div class="modal-body">

                        <div class="modal_class_content">

                            <p class="modal_class_title">개강 전</p>
                            <p> ● 수강료 전액 환불</p>

                            <p class="modal_class_title">개강 이후</p>
                            <p> ● 단순 변심으로 인한 환불 요청 시 잔여 수업 금액의 10%를(위약금) 제외 후 나머지 금액을 환불 받게 됩니다.</p>
                            <p> ● 시설 이용 및 강습 등에 관한 내용이 계약 내용 또는 광고 내용과 나른 경우 잔여 수업 금액의 100%를 환불 받게 됩니다.</p>
                            <p> ● 이전, 휴업, 폐업, 시설 고장 등으로 시설물을 이용할 수 없는 경우 잔여 수업 금액의 100%를 환불 받게 됩니다.</p>

                        </div>

                    </div>
                    
                </div>

            </div>

        </div>

    </section>

    <!-- ==================FOOTER==================== -->
    <jsp:include page="/WEB-INF/views/include/footer.jsp" />
   
</body>

</html>