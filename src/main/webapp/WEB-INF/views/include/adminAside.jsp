<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!-- #### common ####-->
    <!-- favicon -->
    <link rel="shortcut icon" href="ico/favicon.ico" type="image/x-icon">
    <link rel="icon" href="ico/favicon.ico" type="image/x-icon">
    <!-- icon -->
    <script src="https://kit.fontawesome.com/63eb3bc178.js" crossorigin="anonymous"></script>
    <script src="https://code.iconify.design/2/2.1.0/iconify.min.js"></script>  

    <!-- font -->
    <link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet">
    <!-- bootstrap v5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>

     <!-- #### style ####-->
    <!-- css -->
    <link href="/resources/css/include/adminAside.css" rel="stylesheet">


<side id="sidebar-container">
    <nav class="sidebar-box">
        <article class="profile">
            <div class="img-box">
                <img src="https://picsum.photos/id/823/100/100" alt="profile">
            </div>
            <div class="pro-name">
                <h1>ADMIN</h1>
                <a href="#" class="btnMali">ADMIN@weet.co.kr</a>
            </div>
        </article>

        <div class="accordion" id="accordionPanelsStayOpenExample">
            <div class="accordion-item">
                <h2 class="accordion-header" id="panelsStayOpen-headingOne">
                    <button class="accordion-button collapsed ico-dash" type="button" data-bs-toggle="collapse"
                        aria-expanded="false" aria-controls="panelsStayOpen-collapseZero" style="font-size: 14px;">
                        <a href="/lightsalt/dashboard" target="_self" class="dashtext"style="color: black;"><span class="iconify menuicon" data-icon="radix-icons:dashboard"
                                style="color: black; font-size: 20px;"></span>
                            대시보드
                        </a>
                </h2>
                </button>
            </div>
            <div class="accordion-item">
                <h2 class="accordion-header" id="panelsStayOpen-headingOne">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                        data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="false"
                        aria-controls="panelsStayOpen-collapseOne" style="font-size: 14px;">
                        <span class="iconify menuicon" data-icon="uiw:user" style="color: black; font-size: 20px;"></span>
                        회원 관리
                    </button>
                </h2>
                <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse"
                    aria-labelledby="panelsStayOpen-headingOne">
                    <div class="accordion-body">
                        <ul>
                            <li><a href="/lightsalt/user/userlist" target="_self">회원 목록</a></li>
                            <li><a href="/lightsalt/user/inactive" target="_self">휴면 / 탈퇴 회원</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="accordion-item">
                <h2 class="accordion-header" id="panelsStayOpen-headingTwo">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                        data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false"
                        aria-controls="panelsStayOpen-collapseTwo" style="font-size: 14px;">
                        <span class="iconify menuicon" data-icon="bi:chat-right-text" style="font-size: 20px;"></span>
                        커뮤니티 관리
                    </button>
                </h2>
                <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse"
                    aria-labelledby="panelsStayOpen-headingTwo">
                    <div class="accordion-body">
                        <ul>
                            <li><a href="/lightsalt/commu/board" target="_self">게시글 목록</a></li>
                            <li><a href="/lightsalt/commu/reply" target="_self">댓글 목록</a></li>
                            <li><a href="/lightsalt/commu/review" target="_self">클래스 리뷰 목록</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="accordion-item">
                <h2 class="accordion-header" id="panelsStayOpen-headingThree">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                        data-bs-target="#panelsStayOpen-collapseThree" aria-expanded="false"
                        aria-controls="panelsStayOpen-collapseThree" style="font-size: 14px;">
                        <span><i class="fas fa-dumbbell menuicon dumbbell" style="font-size: 19px;"></i></span>
                        클래스 관리
                    </button>
                </h2>
                <div id="panelsStayOpen-collapseThree" class="accordion-collapse collapse"
                    aria-labelledby="panelsStayOpen-headingThree">
                    <div class="accordion-body">
                        <ul>
                            <li><a href="/lightsalt/class/reglist" target="_self">진행 클래스</a></li>
                            <li><a href="/lightsalt/class/refuselist" target="_self">신청 클래스</a></li>
                            <li><a href="/lightsalt/class/refuselist" target="_self">반려 클래스</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="accordion-item">
                <h2 class="accordion-header" id="panelsStayOpen-headingFour">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                        data-bs-target="#panelsStayOpen-collapseFour" aria-expanded="false"
                        aria-controls="panelsStayOpen-collapseFour" style="font-size: 14px;">
                        <span class="iconify menuicon" data-icon="bi:credit-card" style="font-size: 20px;"></span>
                        결제 및 쿠폰
                    </button>
                </h2>
                <div id="panelsStayOpen-collapseFour" class="accordion-collapse collapse"
                    aria-labelledby="panelsStayOpen-headingFour">
                    <div class="accordion-body">
                        <ul>
                            <li><a href="/lightsalt/pay/payment" target="_self">결제 현황 목록</a></li>
                            <li><a href="/lightsalt/pay/refund"target="_self">환불 요청 목록</a></li>
                            <li><a href="/lightsalt/pay/coupon" target="_self">쿠폰 관리</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="accordion-item">
                <h2 class="accordion-header" id="panelsStayOpen-headingFive">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                        data-bs-target="#panelsStayOpen-collapseFive" aria-expanded="false"
                        aria-controls="panelsStayOpen-collapseFive" style="font-size: 14px;">
                        <span class="iconify menuicon" data-icon="cil:chat-bubble" style="font-size: 20px;"></span>
                        고객지원
                    </button>
                </h2>
                <div id="panelsStayOpen-collapseFive" class="accordion-collapse collapse"
                    aria-labelledby="panelsStayOpen-headingFive">
                    <div class="accordion-body">
                        <ul>
                            <li><a href="/lightsalt/connect/list" target="_self">공지사항 / FAQ</a></li>
                            <li><a href="/lightsalt/connect/qa" target="_self">1:1 문의</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </nav>
</side>