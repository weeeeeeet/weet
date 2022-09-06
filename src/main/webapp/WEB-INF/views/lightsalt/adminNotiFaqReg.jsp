<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Admin 게시판글쓰기</title>

    <!-- #### common ####-->
    <!-- favicon -->
    <link rel="shortcut icon" href="/resources/ico/favicon.ico" type="image/x-icon">
    <link rel="icon" href="/resources/ico/favicon.ico" type="image/x-icon">
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
    <!-- jquery -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.0/jquery-migrate.min.js"></script>

     <!-- #### style ####-->
    <!-- css -->
    <link href="/resources/css/lightsalt/adminHome.css" rel="stylesheet">
    <!-- java script -->
    <script src="/resources/js/lightsalt/admin_chk.js"></script>

    <!-- include libraries(jQuery, bootstrap) -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <!-- include summernote css/js -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

    <link href="/resources/css/lightsalt/adminFaq2.css" rel="stylesheet">
    
    <script>$(document).ready(function () {
            $('#summernote').summernote({
                height: 400,
                lang: "ko-KR"
            });
        });</script>
</head>

<body>
    <div class="wrap">
        <!-- header s -->
        <%@ include file= "/WEB-INF/views/include/adminHeader.jsp" %>
        <!-- header e -->

        <div id="content-body">
            <!-- side s -->
            <%@ include file= "/WEB-INF/views/include/adminAside.jsp" %>
            <!-- side e -->

            <!-- 컨텐츠 (게시글)  s -->
            <div class="content-container">
                <div class="inner">
                    <h3>게시글 작성</h3>
                    <div class="content-box">
                        <form action="write">
                            <div calss="write_container">

                                <div class="boardtype_box">
                                    <span class="subject boardtype">게시판명</span>
                                    <select class="boardtype-select" name="boardtype">
                                        <option value="notice">공지사항</option>
                                        <option value="faq">자주묻는질문</option>
                                    </select>
                                </div>

                                <div class="boardtitle_box">
                                    <label class="subject boardtitle">제목</label>
                                    <input type="text" name="boardcontents" placeholder="제목을 입력해주세요">
                                </div>

                                <div class="boardcontents_box">
                                    <p class="subject boardcontents">본문</p>

                                    <div class="write_box">
                                        <div id="summernote"> 아쉬반ㅇ머햐ㅐㅂㄹ</div>
                                    </div>
                                </div>

                                <button class="save_btn" name="writeSave">완료</button>

                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- 컨텐츠 (게시글)  e -->
        </div>
    </div>
</body>

</html>