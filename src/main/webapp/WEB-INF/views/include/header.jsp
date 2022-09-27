<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">

  <title>Wee.T</title>

  <!-- favicon -->
  <link rel="shortcut icon" href="/resources/ico/favicon.ico" type="image/x-icon">
  <link rel="icon" href="/resources/ico/favicon.ico" type="image/x-icon">

  <!-- font -->
  <link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css?ver=1.1" rel="stylesheet">

  <link rel="stylesheet"
    href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />


  <link rel="stylesheet" href="/resources/vendors/themify-icons/themify-icons.css?ver=1.1">
  <link rel="stylesheet" href="/resources/vendors/nice-select/nice-select.css?ver=1.1">

  <link rel="stylesheet" href="/resources/css/include/include.css?ver=1.1">
</head>

<body>
  <!--================ Start Header Menu Area =================-->
  <header class="header_area">
    <div class="main_menu">
      <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container m-auto">
          <a class="navbar-brand logo_h" href="/"><img src="/resources/img/static/weet_logo.png" alt=""
              style="width: 80px;"></a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <div class="collapse navbar-collapse offset" id="navbarSupportedContent">

            <ul class="nav navbar-nav menu_nav m-auto">
              <li class="nav-item active" id="navClassMenu"><a class="nav-link" href="/class/search">클래스</a></li>
              <li class="nav-item" id="navBoardMenu"><a class="nav-link" href="/board/main">커뮤니티</a></li>

            </ul>

            <ul class="nav navbar-nav menu_nav m-auto">

              <li class="nav-item">
                <form class="input-group filter-bar-search" method="get" action="/class/search">
                  <input type="text" name="s_keyword" id="s_keyword" placeholder="클래스명 또는 트레이너명 검색"
                    onfocus="searchBarColor()">
                  <div class="input-group-append">
                    <button type="submit"><i class="ti-search"></i></button>
                  </div>
                </form>
              </li>

            </ul>
			
            <%-- 로그인 / 비로그인 / 트레이너 테스트용입니다. 원하는 조건에 맞게 주석에 넣어주세요 
            1번 주석을 해제하면 로그인 상태의 헤더가 나타납니다.(일반유저) 
            1번을 해제함과 동시에 2번을 해제하면 트레이너 상태의 헤더가 나타납니다. 
            해당 라인에서 alt를 누른채로 방향키 위아래 조작을 통해 쉽게 주석 밖으로 이동할 수 있습니다. 
            
            1. 로그인 테스트
            
            2. 트레이너 테스트
            <c:set var="trainer" value="true" />
            <c:set var="login" value="true" />
            
            3. 관리자 테스트
            --%>

            <c:choose>

              <%-- ${공유속성이름.필드명 !=null} : 이름은 구현하면서 맞게 수정하면 됩니다!! --%>
                <c:when test="${not empty __LOGIN__}">

                  <ul class="nav navbar-nav menu_nav">
                    <ul class="nav-shop menu_nav">
                      <span>${ __LOGIN__.userNickname }</span>님, 환영합니다!

                      <li class="nav-item submenu dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button"
                          aria-haspopup="true" aria-expanded="false"><button aria-haspopup="true"><span
                              class="material-symbols-outlined">
                              account_circle
                            </span></button></a>
                        <ul class="dropdown-menu">

                          <c:choose>

                            <%-- 일반회원 / 트레이너 구별 --%>
                              <c:when test="${__LOGIN__.userType == 'T'.charAt(0)}">
                                <li class="nav-item"><a class="nav-link" href="/mypageT/activity/boardlist">마이페이지</a></li>
                                <li class="nav-item"><a class="nav-link" href="/class/reg">클래스등록</a></li>
                                <li class="nav-item"><a class="nav-link" href="/user/logout">로그아웃</a></li>
                              </c:when>

                              <c:otherwise>
                                <li class="nav-item"><a class="nav-link" href="/mypage/activity/boardlist?userid=${__LOGIN__.userId}">마이페이지</a>
                                </li>
                                <li class="nav-item"><a class="nav-link" href="/mypage/class/my">내 PT확인</a></li>
                                <li class="nav-item"><a class="nav-link" href="/coupons/book">쿠폰북</a></li>
                                <li class="nav-item"><a class="nav-link" href="/user/logout">로그아웃</a></li>
                              </c:otherwise>

                          </c:choose>
                        </ul>
                      </li>
                </c:when>

                <c:otherwise>
                  <li class="nav-item"><a class="button button-header" href="/user/login">로그인</a></li>

                </c:otherwise>

            </c:choose>
                </ul>
                </ul>

          </div>
        </div>
      </nav>
    </div>
  </header>
  <!--================ End Header Menu Area =================-->

  <script src="/resources/js/include/include.js"></script>
</body>

</html>