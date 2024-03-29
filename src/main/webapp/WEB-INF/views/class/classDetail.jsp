<%@page import="com.weet.app.classes.domain.TotalReviewVO" %>
    <%@page import="com.weet.app.classes.domain.ReviewVO" %>
        <jsp:include page="/WEB-INF/views/include/header.jsp" />

        <!doctype html>
        <html lang="ko">

        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">

            <title>${__CLASS__.classTitle}</title>

            <!-- font -->
            <link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet">

            <!-- font awesome -->
            <script src="https://kit.fontawesome.com/63eb3bc178.js" crossorigin="anonymous"></script>

            <!-- google fonts -->
            <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

            <!-- favicon -->
            <link rel="shortcut icon" href="/resources/ico/favicon.ico" type="image/x-icon">
            <link rel="icon" href="/resources/ico/favicon.ico" type="image/x-icon">

            <!-- bootstrap v5 -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
                crossorigin="anonymous">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
                crossorigin="anonymous"></script>

            <!-- css -->
            <link href="/resources/css/class/classDetail.css" rel="stylesheet">

            <!-- jQuery -->
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.0/jquery-migrate.min.js"></script>

        </head>

        <body>

            <main>
                <section class="hero" id="hero">
                    <input type="hidden" name="userId" value="${ __LOGIN__.userId }">
                    <div class="row justify-content-center">
                        <div class="col-md-5">
                            <img class="main-img-url" src="/${__CLASS__.classMainImgUrl}" alt="">
                        </div>
                        <div class="col-md-5 hero-text">
                            <div class="card bg-transparent border-0 p-0">
                                <div class="row text-white">

                                    <c:if test="${__CLASS__.classType == '1'.charAt(0)}">
                                        <span class="badge-personal">개인</span>
                                    </c:if>
                                    <c:if test="${__CLASS__.classType == '2'.charAt(0)}">
                                        <span class="badge-group">그룹</span>
                                    </c:if>

                                    <% 
                                    	TotalReviewVO vo =(TotalReviewVO) request.getAttribute("__REVIEW__"); 
                                    	double avgStar=0; 
                                    	if(vo.getAvgStar() !=null) { avgStar=vo.getAvgStar(); } %>
                                        <% for(int i=1; i<=5; i++) { if (i <=avgStar) { %>
                                            <span class="fa fa-star star-active"></span>
                                   	<% } else { %>
                                            <span class="fa fa-star star-inactive"></span>
                                                <% } // if-else 
                                               } %>
                                              <span class="reviews">(${ __REVIEW__.totalReview } 개의 후기)</span>
                                </div>
                                <div class="row text-white">
                                    <h1>${__CLASS__.classTitle}</h1>
                                </div>
                                <div class="row text-white">
                                    <span><span class="material-icons">fitness_center</span>
                                        <strong>${__CLASS__.classTrainerName}</strong> 트레이너</span>
                                    <span><span class="material-icons">schedule</span>
                                        <strong>${__CLASS__.classCount}</strong>회</span>
                                    <span><span class="material-icons">person</span> 모집인원
                                        <strong>${__CLASS__.classRecruitMaxNum}</strong>명</span>
                                    <span><span class="material-icons">calendar_month</span> 모집기간
                                        <strong>
                                            <fmt:formatDate value="${__CLASS__.classRecruitStartDate}"
                                                pattern="yyyy-MM-dd" />
                                        </strong> ~
                                        <strong>
                                            <fmt:formatDate value="${__CLASS__.classRecruitEndDate}"
                                                pattern="yyyy-MM-dd" />
                                        </strong></span>
                                </div>
                                <div class="row text-white tag-area">
                                    #
                                    <c:if test="${ not empty __CLASS__.classTag1}"><span><a class="tag-search-link"
                                                href="/class/search?type=personalandgroup&classSort=newest&keyword=${__CLASS__.classTag1}">${__CLASS__.classTag1}</a></span>
                                    </c:if>
                                    <c:if test="${ not empty __CLASS__.classTag2}"><span><a class="tag-search-link"
                                                href="/class/search?type=personalandgroup&classSort=newest&keyword=${__CLASS__.classTag2}">${__CLASS__.classTag2}</a></span>
                                    </c:if>
                                    <c:if test="${ not empty __CLASS__.classTag3}"><span><a class="tag-search-link"
                                                href="/class/search?type=personalandgroup&classSort=newest&keyword=${__CLASS__.classTag3}">${__CLASS__.classTag3}</a></span>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <nav class="navbar navbar-expand-lg bg-light shadow-lg" id="navbar">
                    <div class="container">

                        <div class="collapse navbar-collapse" id="navbarNav">
                            <ul class="navbar-nav mx-auto">
                                <li class="nav-item active">
                                    <a class="nav-link" href="#section01">클래스소개</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#section02">트레이너소개</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#section03">커리큘럼</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#section04">헬스장정보</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#section05">클래스사진</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#section06">클래스후기</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#section07">환불규정</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>

                <section class="news-detail section-padding">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-8 mx-auto">
                                <div class="class01 class-intro" id="section01">

                                    <div class="class-title">
                                        <h1>클래스 소개</h1>
                                    </div>

                                    <div class="container mt-5">
                                        <!-- 유튜브 링크 -->
                                        <iframe class="youtube" width="100%" height="350"
                                            src="${__CLASS__.classVideoUrl}" title="YouTube video player"
                                            frameborder="0"
                                            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                                            allowfullscreen>
                                        </iframe>

                                        <h2 class="mb-3">${__CLASS__.classTitle}</h2>

                                        <p class="me-4">${__CLASS__.classIntro}</p>

                                    </div>
                                </div>

                                <div class="class trainer-intro" id="section02">

                                    <div class="class-title">
                                        <h1>트레이너 소개</h1>
                                    </div>

                                    <div class="container mt-5 mb-5 d-flex justify-content-center">
							    <div class="card rounded trainer-intro-card">
							        <div class=" d-block justify-content-center">
							            <div class="area1 p-3 py-5"> </div>
							            <div class="area2 p- text-center px-3">
							                <div class="image mr-3"> <img src="https://cdn-icons-png.flaticon.com/512/2964/2964522.png" class="rounded-circle" width="100" />
							                    <h4 class=" name mt-3 ">${ __CLASS__.classTrainerName } 트레이너</h4>
							                    
							                    <p class="information info-header mt-3 text-justify">경력사항</p>
							                    <p class="information mt-3 text-justify">${ __TR__.userCareer }</p>
							                    <p class="information info-header mt-3 text-justify">소개글</p>
							                    <p class="information mt-3 text-justify">${ __TR__.userIntro }</p>
							                </div>
							            </div>
							            </div>
							            </div>
                            </div>


                    <div class="class center-info" id="section04">

                        <div class="class-title">
                            <h1>헬스장 정보</h1>
                        </div>

                        <div class="container mt-5">

                            <div class="row justify-content-center center-facilities">
                                <div class="col-md-6">
                                    <p class="text-secondary text-decoration-line-through"><span
                                            class="material-icons">shower</span> 샤워실 제공</p>
                                    <p class="text-secondary text-decoration-line-through"><span
                                            class="material-icons">dry_cleaning</span> 타올 제공</p>
                                    <p class="text-primary"><span class="material-icons">shower</span> 운동복 제공</p>

                                </div>
                                <div class="col-md-3">
                                    <p class="text-primary"><span class="material-icons">inbox</span> 개인 사물함 제공</p>
                                    <p class="text-primary"><span class="material-icons">local_parking</span> 주차공간
                                        제공</p>
                                    <p class="text-primary"><span class="material-icons">wifi</span> 와이파이 제공</p>
                                </div>
                            </div>

                            <iframe src="https://www.google.com/maps?q=${__CLASS__.classAderess}&output=embed"
                                width="100%" height="500"></iframe>

                        </div>
                    </div>

                    <div class="class class-review" id="section06">

                        <div class="class-title">
                            <h1>클래스 후기</h1>
                        </div>

                        <div class="container mt-5">
                            <div class="card">
                                <div class="row no-gutters">
                                    <div class="col-md-4 border-right">
                                        <div class="ratings text-center p-4 py-5">
                                            <span class="badge">
                                                <c:if test="${empty __REVIEW__.avgStar}">0 </c:if>
                                                ${__REVIEW__.avgStar}
                                                <i class="fa fa-star-o"></i>
                                            </span>

                                            <c:choose>

                                                <c:when test="${__REVIEW__.avgStar > 4.5}">
                                                    <span class="d-block about-rating">최고에요!</span>
                                                </c:when>
                                                <c:when test="${__REVIEW__.avgStar > 4.0}">
                                                    <span class="d-block about-rating">추천해요!</span>
                                                </c:when>
                                                <c:when test="${__REVIEW__.avgStar > 3.5}">
                                                    <span class="d-block about-rating">만족스러워요</span>
                                                </c:when>
                                                <c:when test="${__REVIEW__.avgStar > 3.0}">
                                                    <span class="d-block about-rating">괜찮아요</span>
                                                </c:when>
                                                <c:when test="${__REVIEW__.avgStar > 2.5}">
                                                    <span class="d-block about-rating">그저그래요</span>
                                                </c:when>
                                                <c:when test="${__REVIEW__.avgStar > 0}">
                                                    <span class="d-block about-rating">별로에요</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="d-block about-rating"></span>
                                                </c:otherwise>
                                            </c:choose>
                                            <span class="d-block total-ratings">${__REVIEW__.totalReview} 개의
                                                후기</span>
                                        </div>
                                    </div>
                                    <div class="col-md-7">
                                        <div class="rating-progress-bars p-3 mt-2">
                                            <div class="d-flex align-items-center">
                                                <span class="stars">
                                                    <span>5 <i class="fa fa-star"></i></span>
                                                </span>
                                                <div class="col px-2">
                                                    <div class="progress" style="height: 5px;">
                                                        <div class="progress-bar" role="progressbar"
                                                            style="width: ${__REVIEW__.star5 / __REVIEW__.totalReview * 100}%;"
                                                            aria-valuenow="${__REVIEW__.star5 / __REVIEW__.totalReview * 100}"
                                                            aria-valuemin="0" aria-valuemax="100"></div>
                                                    </div>
                                                </div>
                                                <span class="percent">
                                                    <span>
                                                        <c:if test="${ __REVIEW__.totalReview != 0 }">
                                                            <fmt:formatNumber
                                                                value="${__REVIEW__.star5 / __REVIEW__.totalReview}"
                                                                type="percent" />
                                                        </c:if>
                                                    </span>
                                                </span>
                                            </div>

                                            <div class="d-flex align-items-center">
                                                <span class="stars">
                                                    <span>4 <i class="fa fa-star"></i></span>
                                                </span>
                                                <div class="col px-2">
                                                    <div class="progress" style="height: 5px;">
                                                        <div class="progress-bar" role="progressbar"
                                                            style="width: ${__REVIEW__.star4 / __REVIEW__.totalReview * 100}%;"
                                                            aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">
                                                        </div>
                                                    </div>
                                                </div>
                                                <span class="percent">
                                                    <span>
                                                        <c:if test="${ __REVIEW__.totalReview != 0 }">
                                                            <fmt:formatNumber
                                                                value="${__REVIEW__.star4 / __REVIEW__.totalReview}"
                                                                type="percent" />
                                                        </c:if>
                                                    </span>
                                                </span>
                                            </div>

                                            <div class="d-flex align-items-center">
                                                <span class="stars">
                                                    <span>3 <i class="fa fa-star"></i></span>
                                                </span>
                                                <div class="col px-2">
                                                    <div class="progress" style="height: 5px;">
                                                        <div class="progress-bar" role="progressbar"
                                                            style="width: ${__REVIEW__.star3 / __REVIEW__.totalReview * 100}%;"
                                                            aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">
                                                        </div>
                                                    </div>
                                                </div>
                                                <span class="percent">
                                                    <span>
                                                        <c:if test="${ __REVIEW__.totalReview != 0 }">
                                                            <fmt:formatNumber
                                                                value="${__REVIEW__.star3 / __REVIEW__.totalReview}"
                                                                type="percent" />

                                                        </c:if>
                                                    </span>
                                                </span>
                                            </div>


                                            <div class="d-flex align-items-center">
                                                <span class="stars">
                                                    <span>2 <i class="fa fa-star"></i></span>
                                                </span>
                                                <div class="col px-2">
                                                    <div class="progress" style="height: 5px;">
                                                        <div class="progress-bar" role="progressbar"
                                                            style="width: ${__REVIEW__.star2 / __REVIEW__.totalReview * 100}%;"
                                                            aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">
                                                        </div>
                                                    </div>
                                                </div>
                                                <span class="percent">
                                                    <span>
                                                        <c:if test="${ __REVIEW__.totalReview != 0 }">
                                                            <fmt:formatNumber
                                                                value="${__REVIEW__.star2 / __REVIEW__.totalReview}"
                                                                type="percent" />
                                                        </c:if>
                                                    </span>
                                                </span>
                                            </div>


                                            <div class="d-flex align-items-center">
                                                <span class="stars">
                                                    <span>1 <i class="fa fa-star"></i></span>
                                                </span>
                                                <div class="col px-2">
                                                    <div class="progress" style="height: 5px;">
                                                        <div class="progress-bar" role="progressbar"
                                                            style="width: ${__REVIEW__.star1 / __REVIEW__.totalReview * 100}%;"
                                                            aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">
                                                        </div>
                                                    </div>
                                                </div>
                                                <span class="percent">
                                                    <span>
                                                        <c:if test="${ __REVIEW__.totalReview != 0 }">
                                                            <fmt:formatNumber
                                                                value="${__REVIEW__.star1 / __REVIEW__.totalReview}"
                                                                type="percent" />
                                                        </c:if>
                                                    </span>
                                                </span>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="card reviews">
                                <div class="row d-flex sort">
                                    <input type="radio" class="radio" name="sort-btn" id="sortByDate" checked />
                                    <label for="sortByDate"
                                        onclick="getReviews('${__CLASS__.classId}', 'recent', 1)">최신순</label>

                                    <input type="radio" class="radio" name="sort-btn" id="sortByStarsDESC" />
                                    <label for="sortByStarsDESC"
                                        onclick="getReviews('${__CLASS__.classId}', 'starDESC', 1)">별점 높은순</label>

                                    <input type="radio" class="radio" name="sort-btn" id="sortByStarsASC" />
                                    <label for="sortByStarsASC"
                                        onclick="getReviews('${__CLASS__.classId}', 'starASC', 1)">별점 낮은순</label>

                                </div>

                                <!-- 리뷰 영역 -->
                                <div id="class-review-area"></div>

                                <!-- 페이징 영역 -->
                                <nav id="pagination-area"></nav>
                            </div>
                        </div>
                    </div>

                    <div class="class class-refund" id="section07">

                        <div class="class-title">
                            <h1>환불규정</h1>
                        </div>

                        <div class="container mt-5">
                            <div class="page page-7" id="page-7">
                                <div class="refund">
                                    <h2>환불규정 안내</h2>

                                    <h2>개강전</h2>
                                    <p>· 수강료 전액 환불</p>

                                    <h2>개강 이후</h2>
                                    <p>· 단순 변심으로 인한 환불 요청 시 잔여 수업 금액의 10%를(위약금) 제외 후 나머지 금액을 환불 받게 됩니다.</p>
                                    <p>· 시설 이용 및 강습 등에 관한 내용이 계약 내용 또는
                                        광고 내용과 나른 경우 잔여 수업 금액의 100%를 환불 받게 됩니다.</p>
                                    <p>· 이전, 휴업, 폐업, 시설 고장 등으로 시설물을 이용할 수
                                        없는 경우 잔여 수업 금액의 100%를 환불 받게 됩니다.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    </div>
                    </div>



                    <!-- SIDE-BOX -->
                    <div class="col-md-3 col-2 mx-auto">
                        <div class="side-box">
                            <div class="card bg-white p-0 mb-4">
                                <div class="card-header" onclick="goCouponBook()">신규회원 전용 웰컴쿠폰 받아가세요!</div>
                                <div class="p-3">
                                    <div class="d-flex justify-content-between mb-4">
                                        <div class="card-info">
                                            <div class="card-info__basic">
                                                <h3 class="mb-0 class-type">
                                                    <c:if test="${__CLASS__.classType == '1'.charAt(0)}">
                                                        <span>개인</span>
                                                    </c:if>
                                                    <c:if test="${__CLASS__.classType == '2'.charAt(0)}">
                                                        <span>그룹</span>
                                                    </c:if>
                                                    PT 클래스
                                                </h3>
                                                <p class="text-muted mb-0 class-count">${__CLASS__.classCount}회</p>
                                                <p class="class-amount">
                                                    <fmt:formatNumber type="currency" currencySymbol="￦"
                                                        value="${__CLASS__.classFee}" />
                                                </p>

                                                <progress id="participant" value="${__CLASS__.currentRegCnt}"
                                                    max="${__CLASS__.classRecruitMaxNum}"></progress>
                                                <p class="participants"><span>${__CLASS__.classRecruitMaxNum}</span>명 중
                                                    <span>${__CLASS__.currentRegCnt}</span>명이 이 클래스를
                                                    신청했어요!
                                                </p>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-6">
                                            <button type="button" name="share" id="sharebtn"><i
                                                    class="material-icons">share</i> 공유하기</button>
                                        </div>
                                        <div class="col-6">
                                            <button type="button" name="likes" id="likebtn"
                                                onclick="clickLike(); return false;">
                                                <div class="heartbox">
                                                    <input type="checkbox" class="checkbox" id="heartCheck" />
                                                    <label for="heartCheck">
                                                        <svg id="heart-svg" viewBox="467 392 58 57"
                                                            xmlns="http://www.w3.org/2000/svg">
                                                            <g id="Group" fill="none" fill-rule="evenodd"
                                                                transform="translate(467 392)">
                                                                <path
                                                                    d="M29.144 20.773c-.063-.13-4.227-8.67-11.44-2.59C7.63 28.795 28.94 43.256 29.143 43.394c.204-.138 21.513-14.6 11.44-25.213-7.214-6.08-11.377 2.46-11.44 2.59z"
                                                                    id="heart" fill="#AAB8C2" />
                                                                <circle id="main-circ" fill="#E2264D" opacity="0"
                                                                    cx="29.5" cy="29.5" r="1.5" />

                                                                <g id="heartgroup7" opacity="0"
                                                                    transform="translate(7 6)">
                                                                    <circle id="heart1" fill="#9CD8C3" cx="2" cy="6"
                                                                        r="2" />
                                                                    <circle id="heart2" fill="#8CE8C3" cx="5" cy="2"
                                                                        r="2" />
                                                                </g>

                                                                <g id="heartgroup6" opacity="0"
                                                                    transform="translate(0 28)">
                                                                    <circle id="heart1" fill="#CC8EF5" cx="2" cy="7"
                                                                        r="2" />
                                                                    <circle id="heart2" fill="#91D2FA" cx="3" cy="2"
                                                                        r="2" />
                                                                </g>

                                                                <g id="heartgroup3" opacity="0"
                                                                    transform="translate(52 28)">
                                                                    <circle id="heart2" fill="#9CD8C3" cx="2" cy="7"
                                                                        r="2" />
                                                                    <circle id="heart1" fill="#8CE8C3" cx="4" cy="2"
                                                                        r="2" />
                                                                </g>

                                                                <g id="heartgroup2" opacity="0"
                                                                    transform="translate(44 6)">
                                                                    <circle id="heart2" fill="#CC8EF5" cx="5" cy="6"
                                                                        r="2" />
                                                                    <circle id="heart1" fill="#CC8EF5" cx="2" cy="2"
                                                                        r="2" />
                                                                </g>

                                                                <g id="heartgroup5" opacity="0"
                                                                    transform="translate(14 50)">
                                                                    <circle id="heart1" fill="#91D2FA" cx="6" cy="5"
                                                                        r="2" />
                                                                    <circle id="heart2" fill="#91D2FA" cx="2" cy="2"
                                                                        r="2" />
                                                                </g>

                                                                <g id="heartgroup4" opacity="0"
                                                                    transform="translate(35 50)">
                                                                    <circle id="heart1" fill="#F48EA7" cx="6" cy="5"
                                                                        r="2" />
                                                                    <circle id="heart2" fill="#F48EA7" cx="2" cy="2"
                                                                        r="2" />
                                                                </g>

                                                                <g id="heartgroup1" opacity="0"
                                                                    transform="translate(24)">
                                                                    <circle id="heart1" fill="#9FC7FA" cx="2.5" cy="3"
                                                                        r="2" />
                                                                    <circle id="heart2" fill="#9FC7FA" cx="7.5" cy="2"
                                                                        r="2" />
                                                                </g>
                                                            </g>
                                                        </svg>

                                                        <span class="heartCount"></span>
                                                    </label>
                                                </div>
                                            </button>
                                        </div>
                                    </div>

                                    <form action="/pay/payment" method="get">
                                        <button type="submit" name="buy" id="buybtn" value="${__CLASS__.classId}">지금
                                            구매</button>
                                    </form>
                                </div>
                            </div>


                        </div>
                    </div>
                </section>

                <!-- TOP-BUTTON -->
                <a href="#top">
                    <div class="top-btn">
                        <i class="fas fa-angle-up"></i>
                        <p>TOP</p>
                    </div>
                </a>
            </main>

            <!-- JAVASCRIPT FILES -->
            <script src="/resources/js/class/jquerySticky.js"></script>
            <script src="/resources/js/class/aos.js"></script>
            <script src="/resources/js/class/custom.js"></script>
            <script src="/resources/js/class/classes.js"></script>

        </body>

        <jsp:include page="/WEB-INF/views/include/footer.jsp" />

        </html>