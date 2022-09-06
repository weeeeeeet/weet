<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Weet</title>

    <link rel="stylesheet" href="${path}/resources/css/index.css" />
    <link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/63eb3bc178.js" crossorigin="anonymous"></script>


    <script src="js/loadHTML.js"></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
   <!-- favicon -->
   <link rel="shortcut icon" href="ico/favicon.ico" type="image/x-icon">
   <link rel="icon" href="ico/favicon.ico" type="image/x-icon">
</head>

<body>
   <%@ include file="/WEB-INF/views/include/header.jsp" %>

    <!-- ==================BANNER==================== -->
    
   <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true">
    <div class="carousel-indicators">
      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
    </div>
    <div class="carousel-inner">
      <div class="carousel-item active">
        <a href="weet_class_detail.html">
            <img src="resources/img/static/banner1.png" class="d-block w-100" alt="...">
        </a>
      </div>
      <div class="carousel-item">
        <a href="weet_class_detail.html">
            <img src="resources/img/static/banner2.png" class="d-block w-100" alt="...">
        </a>
      </div>
      <div class="carousel-item">
        <a href="weet_class_detail.html">
            <img src="resources/img/static/banner3.png" class="d-block w-100" alt="...">
        </a>
      </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Next</span>
    </button>
  </div>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>


    <!-- ===================MAIN===================== -->

    <div class="search_main">
        <input type="text" name="search"placeholder="&nbsp&nbsp&nbsp트레이너명 또는 클래스명 입력" autocomplete="off">
        <a href="#" class="fa-solid fa-magnifying-glass" target="_self"></a>
    </div>

    <section class="contents">
        <div class="main">
            <div class = "main_class_recommended">
                <div class="recommended">
                    <p>추천클래스</p>
                    <a href="#"  target="_self">+ 더보기&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</a>
                </div>
                <div class="class_list">
                    <a href="weet_class_detail.html"  target="_self">
                        <img src="resources/img/static/classlist.png" alt="">
                    </a>
                    <h1>곽두팔 / 개인클래스 / 서울시 강남구</h1>
                    <a href="#">헬스? 어렵지 않아! (5/6)</a><br>
                    <a href="#">곽두팔</a><br>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star-half"></i>
                    <hr>
                    <h1>10회 400,000원</h1>
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

                                    <g id="heartgroup1" opacity="0"
                                        transform="translate(44 6)">
                                        <circle id="heart2" fill="#CC8EF5" cx="5" cy="6"
                                            r="2" />
                                        <circle id="heart1" fill="#CC8EF5" cx="2" cy="2"
                                            r="2" />
                                    </g>


                                </g>
                            </svg>
                </div>
                <div class="class_list">
                    <a href="#"  target="_self">
                        <img src="resources/img/static/classlist.png" alt="">
                    </a>
                    <h1>곽두팔 / 개인클래스 / 서울시 강남구</h1>
                    <a href="#">헬스? 어렵지 않아! (5/6)</a><br>
                    <a href="#">곽두팔</a><br>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star-half"></i>
                    <hr>
                    <h1>10회 400,000원</h1>
                    <input type="checkbox" class="checkbox2" id="heartCheck2" />
                    <label for="heartCheck2">
                        <svg id="heart-svg" viewBox="467 392 58 57"
                            xmlns="http://www.w3.org/2000/svg">
                            <g id="Group" fill="none" fill-rule="evenodd"
                                transform="translate(467 392)">
                                <path
                                    d="M29.144 20.773c-.063-.13-4.227-8.67-11.44-2.59C7.63 28.795 28.94 43.256 29.143 43.394c.204-.138 21.513-14.6 11.44-25.213-7.214-6.08-11.377 2.46-11.44 2.59z"
                                    id="heart" fill="#AAB8C2" />
                                <circle id="main-circ" fill="#E2264D" opacity="0"
                                    cx="29.5" cy="29.5" r="1.5" />

                                <g id="heartgroup" opacity="0"
                                    transform="translate(44 6)">
                                    <circle id="heart2" fill="#CC8EF5" cx="5" cy="6"
                                        r="2" />
                                    <circle id="heart1" fill="#CC8EF5" cx="2" cy="2"
                                        r="2" />
                                </g>
                            </g>
                        </svg>
                </div>
                <div class="class_list">
                    <a href="#"  target="_self">
                        <img src="resources/img/static/classlist.png" alt="">
                    </a>
                    <h1>곽두팔 / 개인클래스 / 서울시 강남구</h1>
                    <a href="#">헬스? 어렵지 않아! (5/6)</a><br>
                    <a href="#">곽두팔</a><br>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star-half"></i>
                    <hr>
                    <h1>10회 400,000원</h1>
                    <input type="checkbox" class="checkbox3" id="heartCheck3" />
                    <label for="heartCheck3">
                        <svg id="heart-svg" viewBox="467 392 58 57"
                            xmlns="http://www.w3.org/2000/svg">
                            <g id="Group" fill="none" fill-rule="evenodd"
                                transform="translate(467 392)">
                                <path
                                    d="M29.144 20.773c-.063-.13-4.227-8.67-11.44-2.59C7.63 28.795 28.94 43.256 29.143 43.394c.204-.138 21.513-14.6 11.44-25.213-7.214-6.08-11.377 2.46-11.44 2.59z"
                                    id="heart" fill="#AAB8C2" />
                                <circle id="main-circ" fill="#E2264D" opacity="0"
                                    cx="29.5" cy="29.5" r="1.5" />

                                <g id="heartgroup" opacity="0"
                                    transform="translate(44 6)">
                                    <circle id="heart2" fill="#CC8EF5" cx="5" cy="6"
                                        r="2" />
                                    <circle id="heart1" fill="#CC8EF5" cx="2" cy="2"
                                        r="2" />
                                </g>
                            </g>
                        </svg>
                </div>
            </div>
            <div class = "main_class_end">
                <div class="end">
                    <p>마감임박 클래스</p>
                    <a href="#"  target="_self">+ 더보기&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</a>
                </div>
                <div class="class_list">
                    <a href="#"  target="_self">
                        <img src="resources/img/static/classlist.png" alt="">
                    </a>
                    <h1>곽두팔 / 개인클래스 / 서울시 강남구</h1>
                    <a href="#">헬스? 어렵지 않아! (5/6)</a><br>
                    <a href="#">곽두팔</a><br>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star-half"></i>
                    <hr>
                    <h1>10회 400,000원</h1>
                    <input type="checkbox" class="checkbox4" id="heartCheck4" />
                    <label for="heartCheck4">
                        <svg id="heart-svg" viewBox="467 392 58 57"
                            xmlns="http://www.w3.org/2000/svg">
                            <g id="Group" fill="none" fill-rule="evenodd"
                                transform="translate(467 392)">
                                <path
                                    d="M29.144 20.773c-.063-.13-4.227-8.67-11.44-2.59C7.63 28.795 28.94 43.256 29.143 43.394c.204-.138 21.513-14.6 11.44-25.213-7.214-6.08-11.377 2.46-11.44 2.59z"
                                    id="heart" fill="#AAB8C2" />
                                <circle id="main-circ" fill="#E2264D" opacity="0"
                                    cx="29.5" cy="29.5" r="1.5" />

                                <g id="heartgroup" opacity="0"
                                    transform="translate(44 6)">
                                    <circle id="heart2" fill="#CC8EF5" cx="5" cy="6"
                                        r="2" />
                                    <circle id="heart1" fill="#CC8EF5" cx="2" cy="2"
                                        r="2" />
                                </g>
                            </g>
                        </svg>
                </div>
                <div class="class_list">
                    <a href="#"  target="_self">
                        <img src="resources/img/static/classlist.png" alt="">
                    </a>
                    <h1>곽두팔 / 개인클래스 / 서울시 강남구</h1>
                    <a href="#">헬스? 어렵지 않아! (5/6)</a><br>
                    <a href="#">곽두팔</a><br>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star-half"></i>
                    <hr>
                    <h1>10회 400,000원</h1>
                    <input type="checkbox" class="checkbox5" id="heartCheck5" />
                    <label for="heartCheck5">
                        <svg id="heart-svg" viewBox="467 392 58 57"
                            xmlns="http://www.w3.org/2000/svg">
                            <g id="Group" fill="none" fill-rule="evenodd"
                                transform="translate(467 392)">
                                <path
                                    d="M29.144 20.773c-.063-.13-4.227-8.67-11.44-2.59C7.63 28.795 28.94 43.256 29.143 43.394c.204-.138 21.513-14.6 11.44-25.213-7.214-6.08-11.377 2.46-11.44 2.59z"
                                    id="heart" fill="#AAB8C2" />
                                <circle id="main-circ" fill="#E2264D" opacity="0"
                                    cx="29.5" cy="29.5" r="1.5" />

                                <g id="heartgroup" opacity="0"
                                    transform="translate(44 6)">
                                    <circle id="heart2" fill="#CC8EF5" cx="5" cy="6"
                                        r="2" />
                                    <circle id="heart1" fill="#CC8EF5" cx="2" cy="2"
                                        r="2" />
                                </g>
                            </g>
                        </svg>
                </div>
                <div class="class_list">
                    <a href="#"  target="_self">
                        <img src="resources/img/static/classlist.png" alt="">
                    </a>
                    <h1>곽두팔 / 개인클래스 / 서울시 강남구</h1>
                    <a href="#">헬스? 어렵지 않아! (5/6)</a><br>
                    <a href="#">곽두팔</a><br>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star-half"></i>
                    <hr>
                    <h1>10회 400,000원</h1>
                    <input type="checkbox" class="checkbox6" id="heartCheck6" />
                    <label for="heartCheck6">
                        <svg id="heart-svg" viewBox="467 392 58 57"
                            xmlns="http://www.w3.org/2000/svg">
                            <g id="Group" fill="none" fill-rule="evenodd"
                                transform="translate(467 392)">
                                <path
                                    d="M29.144 20.773c-.063-.13-4.227-8.67-11.44-2.59C7.63 28.795 28.94 43.256 29.143 43.394c.204-.138 21.513-14.6 11.44-25.213-7.214-6.08-11.377 2.46-11.44 2.59z"
                                    id="heart" fill="#AAB8C2" />
                                <circle id="main-circ" fill="#E2264D" opacity="0"
                                    cx="29.5" cy="29.5" r="1.5" />

                                <g id="heartgroup" opacity="0"
                                    transform="translate(44 6)">
                                    <circle id="heart2" fill="#CC8EF5" cx="5" cy="6"
                                        r="2" />
                                    <circle id="heart1" fill="#CC8EF5" cx="2" cy="2"
                                        r="2" />
                                </g>
                            </g>
                        </svg>
                </div>
                
            </div>
        
            <div class = "main_class_new">
                <div class="new">
                    <p>신규 클래스</p>
                    <a href="#"  target="_self">+ 더보기&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</a>
                </div>
                <div class="class_list">
                    <a href="#"  target="_self">
                        <img src="resources/img/static/classlist.png" alt="">
                    </a>
                    <h1>곽두팔 / 개인클래스 / 서울시 강남구</h1>
                    <a href="#">헬스? 어렵지 않아! (5/6)</a><br>
                    <a href="#">곽두팔</a><br>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star-half"></i>
                    <hr>
                    <h1>10회 400,000원</h1>
                    <input type="checkbox" class="checkbox7" id="heartCheck7" />
                    <label for="heartCheck7">
                        <svg id="heart-svg" viewBox="467 392 58 57"
                            xmlns="http://www.w3.org/2000/svg">
                            <g id="Group" fill="none" fill-rule="evenodd"
                                transform="translate(467 392)">
                                <path
                                    d="M29.144 20.773c-.063-.13-4.227-8.67-11.44-2.59C7.63 28.795 28.94 43.256 29.143 43.394c.204-.138 21.513-14.6 11.44-25.213-7.214-6.08-11.377 2.46-11.44 2.59z"
                                    id="heart" fill="#AAB8C2" />
                                <circle id="main-circ" fill="#E2264D" opacity="0"
                                    cx="29.5" cy="29.5" r="1.5" />

                                <g id="heartgroup" opacity="0"
                                    transform="translate(44 6)">
                                    <circle id="heart2" fill="#CC8EF5" cx="5" cy="6"
                                        r="2" />
                                    <circle id="heart1" fill="#CC8EF5" cx="2" cy="2"
                                        r="2" />
                                </g>
                            </g>
                        </svg>
                </div>
                <div class="class_list">
                    <a href="#"  target="_self">
                        <img src="resources/img/static/classlist.png" alt="">
                    </a>
                    <h1>곽두팔 / 개인클래스 / 서울시 강남구</h1>
                    <a href="#">헬스? 어렵지 않아! (5/6)</a><br>
                    <a href="#">곽두팔</a><br>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star-half"></i>
                    <hr>
                    <h1>10회 400,000원</h1>
                    <input type="checkbox" class="checkbox8" id="heartCheck8" />
                    <label for="heartCheck8">
                        <svg id="heart-svg" viewBox="467 392 58 57"
                            xmlns="http://www.w3.org/2000/svg">
                            <g id="Group" fill="none" fill-rule="evenodd"
                                transform="translate(467 392)">
                                <path
                                    d="M29.144 20.773c-.063-.13-4.227-8.67-11.44-2.59C7.63 28.795 28.94 43.256 29.143 43.394c.204-.138 21.513-14.6 11.44-25.213-7.214-6.08-11.377 2.46-11.44 2.59z"
                                    id="heart" fill="#AAB8C2" />
                                <circle id="main-circ" fill="#E2264D" opacity="0"
                                    cx="29.5" cy="29.5" r="1.5" />

                                <g id="heartgroup" opacity="0"
                                    transform="translate(44 6)">
                                    <circle id="heart2" fill="#CC8EF5" cx="5" cy="6"
                                        r="2" />
                                    <circle id="heart1" fill="#CC8EF5" cx="2" cy="2"
                                        r="2" />
                                </g>
                            </g>
                        </svg>
                </div>
                <div class="class_list">
                    <a href="#"  target="_self">
                        <img src="resources/img/static/classlist.png" alt="">
                    </a>
                    <h1>곽두팔 / 개인클래스 / 서울시 강남구</h1>
                    <a href="#">헬스? 어렵지 않아! (5/6)</a><br>
                    <a href="#">곽두팔</a><br>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star-half"></i>
                    <hr>
                    <h1>10회 400,000원</h1>
                    <input type="checkbox" class="checkbox9" id="heartCheck9" />
                    <label for="heartCheck9">
                        <svg id="heart-svg" viewBox="467 392 58 57"
                            xmlns="http://www.w3.org/2000/svg">
                            <g id="Group" fill="none" fill-rule="evenodd"
                                transform="translate(467 392)">
                                <path
                                    d="M29.144 20.773c-.063-.13-4.227-8.67-11.44-2.59C7.63 28.795 28.94 43.256 29.143 43.394c.204-.138 21.513-14.6 11.44-25.213-7.214-6.08-11.377 2.46-11.44 2.59z"
                                    id="heart" fill="#AAB8C2" />
                                <circle id="main-circ" fill="#E2264D" opacity="0"
                                    cx="29.5" cy="29.5" r="1.5" />

                                <g id="heartgroup" opacity="0"
                                    transform="translate(44 6)">
                                    <circle id="heart2" fill="#CC8EF5" cx="5" cy="6"
                                        r="2" />
                                    <circle id="heart1" fill="#CC8EF5" cx="2" cy="2"
                                        r="2" />
                                </g>
                            </g>
                        </svg>
                </div>
            </div>
        
            <div class = "board_hot">
                <div class="hot_p">
                    <p>커뮤니티 인기글</p>
                    <a href="#"  target="_self">+ 더보기&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</a>
                </div>
            </div>
        </div>
        
    </section>
    <div class="hot">
        <div id="hot_list">
            <div class="hot_list_list">
            </div>
            <div class="hot_list_list">
            </div>
            <div class="hot_list_list">
            </div>
        </div>
    </div>
    
    <!-- footer -->
    
    <%@ include file="/WEB-INF/views/include/footer.jsp" %>


   
</body>

</html>
