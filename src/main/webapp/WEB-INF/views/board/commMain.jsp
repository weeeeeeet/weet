<jsp:include page="/WEB-INF/views/include/header.jsp" />

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Community Main</title>

    <!-- font -->
    <link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet">

    <!-- font awesome -->
    <script src="https://kit.fontawesome.com/63eb3bc178.js" crossorigin="anonymous"></script>

    <!-- google fonts -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined" rel="stylesheet">

    <!-- favicon -->
    <link rel="shortcut icon" href="ico/favicon.ico" type="image/x-icon">
    <link rel="icon" href="ico/favicon.ico" type="image/x-icon">

    <!-- bootstrap v5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>

    <!-- css -->
    <link href="/resources/css/board/commMain.css" rel="stylesheet">

    <!-- jQuery -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.0/jquery-migrate.min.js"></script>

    <link rel="stylesheet" type="text/css"
        href="https://cdn.jsdelivr.net/gh/kenwheeler/slick@1.8.1/slick/slick-theme.css" />
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
</head>

<body>

    <section id="commMain">

        <div class="board-banner">
            <img src="/resources/img/static/boardBanner.png" class="">
        </div>

        <div class="board-menu">

            <ul class="board-menu-list">
                <li class="list-item"><a href="/board/main">홈</a></li>
                <li class="list-item"><a href="/board/list?s_sort=recent">전체</a></li>
                <li class="list-item"><a href="/board/list?selected=Y" title="채택된 답변이 달린 게시글만 보여줘요">채택</a></li>
                <li class="list-item"><a href="/board/list?selected=N" title="작성자가 채택하지 않은 게시글만 보여줘요">미채택</a></li>
            </ul>

            <nav>
                <form class="input-group board-search" method="get">
                    <input type="text" placeholder="커뮤니티 내 검색" name="s_keyword">
                    <button type="submit"><span class="material-icons-outlined">search</span></button>
                </form>
            </nav>
        </div>

        <div class="board-contents">
            <h3 class="board-popular-title">금주 인기 게시물 TOP10</h3>
            <div class="board-popular">

                <div class="items">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">
                                <div class="row">
                                    <div class="col-sm-2">
                                        <img src="https://img.icons8.com/ultraviolet/30/000000/quote-left.png">
                                    </div>

                                    <div class="col-sm-6">
                                        <p class="user-nickname">새우새우</p>
                                    </div>

                                    <div class="col-sm-4">
                                        <p class="post-date">22.08.15</p>
                                    </div>
                                </div>

                            </h4>

                            <a href="#">
                            <div class="template-demo">
                                <p class="question-title">제목입니다.</p>

                                <p class="question-word">Online reviews can make or break a customer's decision to make
                                    a purchase. Read about
                                    these customer review sites where your customers'line reviews can make or break a
                                    customer's decision to make a purchase. Read about
                                    these customer review sites where your customers'line reviews can make or break a
                                    customer's decision to make a purchase. Read about
                                    these customer review sites where your customers'line reviews can make or break a
                                    customer's decision to make a purchase. Read about
                                    these customer review sites where your customers'</p>
                            </div>
                            </a>

                            <div class="row" style="margin-top: 10px;">

                                <div class="col-sm-3">
                                    <i class="commhome_comment fas fa-comment-dots" style="color: #2370DF;"></i>
                                    <span class="count">2</span>
                                </div>

                                <div class="col-sm-3">
                                    <i class="commhome_heart fas fa-heart" style="color: #ff589b;"></i>
                                    <span class="count">2</span>
                                </div>
                            </div>

                            <hr>

                            <div class="profile">
                                <div class="row">
                                    <p class="no-reply">아직 등록된 답변이 없습니다.
                                    </p>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">
                                <div class="row">
                                    <div class="col-sm-2">
                                        <img src="https://img.icons8.com/ultraviolet/30/000000/quote-left.png">
                                    </div>

                                    <div class="col-sm-6">
                                        <p class="user-nickname">새우새우바라기</p>
                                    </div>

                                    <div class="col-sm-4">
                                        <p class="post-date">22.08.15</p>
                                    </div>
                                </div>

                            </h4>

                            <div class="template-demo">
                                <p class="question-title">제목입니다.</p>

                                <p class="question-word">Online </p>
                            </div>

                            <div class="row" style="margin-top: 5px;">

                                <div class="col-sm-3">
                                    <i class="commhome_comment fas fa-comment-dots" style="color: #2370DF;"></i>
                                    <span class="count">2</span>
                                </div>

                                <div class="col-sm-3">
                                    <i class="commhome_heart fas fa-heart" style="color: #ff589b;"></i>
                                    <span class="count">2</span>
                                </div>
                            </div>

                            <hr>

                            <div class="profile">
                                <div class="row">
                                    <div class="col-sm-4">
                                        <p class="trainer-name">조덕출</p>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="trainer-level level-3">lv.3</div>
                                    </div>
                                </div>
                                <p class="reply-word">안녕하세요 회원님, 유산소 운동같은 경우엔
                                    처음에 먼저 이렇게 하시는 것이 좋습니다.
                                </p>
                            </div>

                        </div>
                    </div>
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">
                                <div class="row">
                                    <div class="col-sm-2">
                                        <img src="https://img.icons8.com/ultraviolet/30/000000/quote-left.png">
                                    </div>

                                    <div class="col-sm-6">
                                        <p class="user-nickname">새우새우바라기</p>
                                    </div>

                                    <div class="col-sm-4">
                                        <p class="post-date">22.08.15</p>
                                    </div>
                                </div>

                            </h4>

                            <div class="template-demo">
                                <p class="question-title">제목입니다.</p>

                                <p class="question-word">Online reviews can make or break a customer's decision to make
                                    a purchase. Read about
                                    these customer review sites where your customers'line reviews can make or break a
                                    customer's decision to make a purchase. Read about
                                    these customer review sites where your customers'line reviews can make or break a
                                    customer's decision to make a purchase. Read about
                                    these customer review sites where your customers'line reviews can make or break a
                                    customer's decision to make a purchase. Read about
                                    these customer review sites where your customers'</p>
                            </div>

                            <div class="row">

                                <div class="col-sm-3">
                                    <i class="commhome_comment fas fa-comment-dots" style="color: #2370DF;"></i>
                                    <span class="count">2</span>
                                </div>

                                <div class="col-sm-3">
                                    <i class="commhome_heart fas fa-heart" style="color: #ff589b;"></i>
                                    <span class="count">2</span>
                                </div>
                            </div>

                            <hr>

                            <div class="profile">
                                <div class="row">
                                    <div class="col-sm-4">
                                        <p class="trainer-name">조덕출</p>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="trainer-level level-3">lv.3</div>
                                    </div>
                                </div>
                                <p class="reply-word">안녕하세요 회원님, 유산소 운동같은 경우엔
                                    처음에 먼저 이렇게 하시는 것이 좋습니다.
                                </p>
                            </div>

                        </div>
                    </div>
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">
                                <div class="row">
                                    <div class="col-sm-2">
                                        <img src="https://img.icons8.com/ultraviolet/30/000000/quote-left.png">
                                    </div>

                                    <div class="col-sm-6">
                                        <p class="user-nickname">새우새우바라기</p>
                                    </div>

                                    <div class="col-sm-4">
                                        <p class="post-date">22.08.15</p>
                                    </div>
                                </div>

                            </h4>

                            <div class="template-demo">
                                <p class="question-title">제목입니다.</p>

                                <p class="question-word">Online reviews can make or break a customer's decision to make
                                    a purchase. Read about
                                    these customer review sites where your customers'line reviews can make or break a
                                    customer's decision to make a purchase. Read about
                                    these customer review sites where your customers'line reviews can make or break a
                                    customer's decision to make a purchase. Read about
                                    these customer review sites where your customers'line reviews can make or break a
                                    customer's decision to make a purchase. Read about
                                    these customer review sites where your customers'</p>
                            </div>

                            <div class="row">

                                <div class="col-sm-3">
                                    <i class="commhome_comment fas fa-comment-dots" style="color: #2370DF;"></i>
                                    <span class="count">2</span>
                                </div>

                                <div class="col-sm-3">
                                    <i class="commhome_heart fas fa-heart" style="color: #ff589b;"></i>
                                    <span class="count">2</span>
                                </div>
                            </div>

                            <hr>

                            <div class="profile">
                                <div class="row">
                                    <div class="col-sm-4">
                                        <p class="trainer-name">조덕출</p>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="trainer-level level-3">lv.3</div>
                                    </div>
                                </div>
                                <p class="reply-word">안녕하세요 회원님, 유산소 운동같은 경우엔
                                    처음에 먼저 이렇게 하시는 것이 좋습니다.
                                </p>
                            </div>

                        </div>
                    </div>
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">
                                <div class="row">
                                    <div class="col-sm-2">
                                        <img src="https://img.icons8.com/ultraviolet/30/000000/quote-left.png">
                                    </div>

                                    <div class="col-sm-6">
                                        <p class="user-nickname">새우새우바라기</p>
                                    </div>

                                    <div class="col-sm-4">
                                        <p class="post-date">22.08.15</p>
                                    </div>
                                </div>

                            </h4>

                            <div class="template-demo">
                                <p class="question-title">제목입니다.</p>

                                <p class="question-word">Online reviews can make or break a customer's decision to make
                                    a purchase. Read about
                                    these customer review sites where your customers'line reviews can make or break a
                                    customer's decision to make a purchase. Read about
                                    these customer review sites where your customers'line reviews can make or break a
                                    customer's decision to make a purchase. Read about
                                    these customer review sites where your customers'line reviews can make or break a
                                    customer's decision to make a purchase. Read about
                                    these customer review sites where your customers'</p>
                            </div>

                            <div class="row">

                                <div class="col-sm-3">
                                    <i class="commhome_comment fas fa-comment-dots" style="color: #2370DF;"></i>
                                    <span class="count">2</span>
                                </div>

                                <div class="col-sm-3">
                                    <i class="commhome_heart fas fa-heart" style="color: #ff589b;"></i>
                                    <span class="count">2</span>
                                </div>
                            </div>

                            <hr>

                            <div class="profile">
                                <div class="row">
                                    <div class="col-sm-4">
                                        <p class="trainer-name">조덕출</p>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="trainer-level level-3">lv.3</div>
                                    </div>
                                </div>
                                <p class="reply-word">안녕하세요 회원님, 유산소 운동같은 경우엔
                                    처음에 먼저 이렇게 하시는 것이 좋습니다.
                                </p>
                            </div>

                        </div>
                    </div>
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">
                                <div class="row">
                                    <div class="col-sm-2">
                                        <img src="https://img.icons8.com/ultraviolet/30/000000/quote-left.png">
                                    </div>

                                    <div class="col-sm-6">
                                        <p class="user-nickname">새우새우바라기</p>
                                    </div>

                                    <div class="col-sm-4">
                                        <p class="post-date">22.08.15</p>
                                    </div>
                                </div>

                            </h4>

                            <div class="template-demo">
                                <p class="question-title">제목입니다.</p>

                                <p class="question-word">Online reviews can make or break a customer's decision to make
                                    a purchase. Read about
                                    these customer review sites where your customers'line reviews can make or break a
                                    customer's decision to make a purchase. Read about
                                    these customer review sites where your customers'line reviews can make or break a
                                    customer's decision to make a purchase. Read about
                                    these customer review sites where your customers'line reviews can make or break a
                                    customer's decision to make a purchase. Read about
                                    these customer review sites where your customers'</p>
                            </div>

                            <div class="row">

                                <div class="col-sm-3">
                                    <i class="commhome_comment fas fa-comment-dots" style="color: #2370DF;"></i>
                                    <span class="count">2</span>
                                </div>

                                <div class="col-sm-3">
                                    <i class="commhome_heart fas fa-heart" style="color: #ff589b;"></i>
                                    <span class="count">2</span>
                                </div>
                            </div>

                            <hr>

                            <div class="profile">
                                <div class="row">
                                    <div class="col-sm-4">
                                        <p class="trainer-name">조덕출</p>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="trainer-level level-3">lv.3</div>
                                    </div>
                                </div>
                                <p class="reply-word">안녕하세요 회원님, 유산소 운동같은 경우엔
                                    처음에 먼저 이렇게 하시는 것이 좋습니다.
                                </p>
                            </div>

                        </div>
                    </div>
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">
                                <div class="row">
                                    <div class="col-sm-2">
                                        <img src="https://img.icons8.com/ultraviolet/30/000000/quote-left.png">
                                    </div>

                                    <div class="col-sm-6">
                                        <p class="user-nickname">새우새우바라기</p>
                                    </div>

                                    <div class="col-sm-4">
                                        <p class="post-date">22.08.15</p>
                                    </div>
                                </div>

                            </h4>

                            <div class="template-demo">
                                <p class="question-title">제목입니다.</p>

                                <p class="question-word">Online reviews can make or break a customer's decision to make
                                    a purchase. Read about
                                    these customer review sites w</p>
                            </div>

                            <div class="row">

                                <div class="col-sm-3">
                                    <i class="commhome_comment fas fa-comment-dots" style="color: #2370DF;"></i>
                                    <span class="count">2</span>
                                </div>

                                <div class="col-sm-3">
                                    <i class="commhome_heart fas fa-heart" style="color: #ff589b;"></i>
                                    <span class="count">2</span>
                                </div>
                            </div>

                            <hr>

                            <div class="profile">
                                <div class="row">
                                    <div class="col-sm-4">
                                        <p class="trainer-name">조덕출</p>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="trainer-level level-3">lv.3</div>
                                    </div>
                                </div>
                                <p class="reply-word">안녕하세요 회원님, 유산소 운동같은 경우엔
                                    처음에 먼저 이렇게 하시는 것이 좋습니다.
                                </p>
                            </div>

                        </div>
                    </div>
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">
                                <div class="row">
                                    <div class="col-sm-2">
                                        <img src="https://img.icons8.com/ultraviolet/30/000000/quote-left.png">
                                    </div>

                                    <div class="col-sm-6">
                                        <p class="user-nickname">새우새우바라기</p>
                                    </div>

                                    <div class="col-sm-4">
                                        <p class="post-date">22.08.15</p>
                                    </div>
                                </div>

                            </h4>

                            <div class="template-demo">
                                <p class="question-title">제목입니다.</p>

                                <p class="question-word">Online reviews can make or break a customer's decision to make
                                    a purchase. Read about
                                    these customer review sites where your customers'line reviews can make or break a
                                    customer's decision to make a purchase. Read about
                                    these customer review sites where your customers'line reviews can make or break a
                                    customer's decision to make a purchase. Read about
                                    these customer review sites where your customers'line reviews can make or break a
                                    customer's decision to make a purchase. Read about
                                    these customer review sites where your customers'</p>
                            </div>

                            <div class="row">

                                <div class="col-sm-3">
                                    <i class="commhome_comment fas fa-comment-dots" style="color: #2370DF;"></i>
                                    <span class="count">2</span>
                                </div>

                                <div class="col-sm-3">
                                    <i class="commhome_heart fas fa-heart" style="color: #ff589b;"></i>
                                    <span class="count">2</span>
                                </div>
                            </div>

                            <hr>

                            <div class="profile">
                                <div class="row">
                                    <div class="col-sm-4">
                                        <p class="trainer-name">조덕출</p>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="trainer-level level-3">lv.3</div>
                                    </div>
                                </div>
                                <p class="reply-word">안녕하세요 회원님, 유산소 운동같은 경우엔
                                    처음에 먼저 이렇게 하시는 것이 좋습니다.
                                </p>
                            </div>

                        </div>
                    </div>

                </div>


            </div>

            <div class="board-list">
                <h3 class="board-popular-title">최근 게시물</h3>
                <a href="#">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">
                                <div class="row">
                                    <div class="col-sm-1">
                                        <img src="https://img.icons8.com/ultraviolet/30/000000/quote-left.png">
                                    </div>

                                    <div class="col-sm-6">
                                        <p class="user-nickname">새우새우</p>
                                    </div>

                                    <div class="col-sm-4">
                                        <p class="post-date">22.08.15</p>
                                    </div>
                                </div>

                            </h4>

                            <div class="template-demo">
                                <p class="question-title">제목입니다.</p>

                                <p class="question-word">Online reviews can make or break a customer's decision to make
                                    a purchase. Read about
                                    these customer review sites where your customers'line reviews can make or break a
                                    customer's decision to make a purchase. Read about
                                    these customer review sites where your customers'line reviews can make or break a
                                    customer's decision to make a purchase. Read about
                                    these customer review sites where your customers'line reviews can make or break a
                                    customer's decision to make a purchase. Read about
                                    these customer review sites where your customers'</p>
                            </div>

                            <div class="row" style="margin-top: 10px;">

                                <div class="col-sm-1">
                                    <i class="commhome_comment fas fa-comment-dots" style="color: #2370DF;"></i>
                                    <span class="count">2</span>
                                </div>

                                <div class="col-sm-1">
                                    <i class="commhome_heart fas fa-heart" style="color: #ff589b;"></i>
                                    <span class="count">2</span>
                                </div>
                            </div>

                            <hr>

                            <div class="profile">
                                <div class="row">
                                    <p class="no-reply">아직 등록된 답변이 없습니다.
                                    </p>
                                </div>
                            </div>

                        </div>
                    </div>
                </a>


            </div>

            <div class="chat">

            </div>

    </section>

    <script src="/resources/js/board/commMain.js"></script>
</body>

<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</html>