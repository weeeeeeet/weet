<jsp:include page="/WEB-INF/views/include/header.jsp" />

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Community List</title>

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
                <li class="list-item"><a href="/board/list">전체</a></li>
                <li class="list-item"><a href="/board/list?selected=Y" title="채택된 답변이 달린 게시글만 보여줘요">채택</a></li>
                <li class="list-item"><a href="/board/list?selected=N" title="작성자가 채택하지 않은 게시글만 보여줘요">미채택</a></li>
            </ul>

            <nav>
                <form class="input-group board-search" method="get" onsubmit="getBoardList(1); return false;">
                    <input type="text" placeholder="커뮤니티 내 검색" name="keyword" id="searchInput">
                    <button type="submit"><span class="material-icons-outlined">search</span></button>
                </form>
            </nav>
            <div class="write-btn">
                <i class="fas fa-pen"></i> 글쓰기
            </div>
        </div>

        <div class="sort-menu">
            <p>총 <span></span>건의 게시글</p>
            <p class="keyword"><span></span>(으)로 검색한 결과입니다.</p>

            <select class="sort-select" onchange="getBoardList(1)">
                <option selected value="recent">최신순</option>
                <option value="like">추천순</option>
                <option value="reply">댓글순</option>
                <option value="view">조회순</option>
            </select>


        </div>

        <div class="board-contents">
            <div class="board-list"></div>
        </div>

        <div class="chat"></div>
    </section>

    <script src="/resources/js/board/commList.js"></script>
</body>

<jsp:include page="/WEB-INF/views/include/footer.jsp" />

</html>