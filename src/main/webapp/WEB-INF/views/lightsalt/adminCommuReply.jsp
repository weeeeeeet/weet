<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Admin 답글</title>

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
    <script src="js/lightsalt/admin_chk.js"></script>

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

            <!-- 컨텐츠 (게시글) -->
            <div class="content-container">
                <div class="inner">
                    <h3>댓글 목록</h3>
                    <div class="select-box">
                        <form action="">
                            <div calss="search-box">
                                <ul>
                                    <li><span class="search-title">검색어 </span>:</li>
                                    <li>
                                        <div class="search-bar">
                                            <select class="search-select" name="search-type">
                                                <option value="user_name">댓글 내용</option>
                                                <option value="user_id">닉네임</option>
                                                <option value="user_mail">이메일</option>
                                            </select>
                                            <input type="text" name="search" placeholder="검색어 입력">
                                            <button class="search_btn" name="search">검색</button>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </form>
                    </div>
                    <form id="boardForm" name="boardForm">
                        <input type="hidden" id="function_name" name="function_name" value="getBoardList" />
                        <input type="hidden" id="current_page_no" name="current_page_no" value="1" />

                        <div class="tb_top">
                            <div class="page_info">
                                <ul>
                                    <li><span id="new_count">신규</span>/<span>전체</span> : </li>
                                    <li><span id="new_count">32</span>/<span id="total_count">9999</span></li>
                                    <li>검색결과 : </li>
                                    <li><span id="search_conut">0</span></li>
                                </ul>
                            </div>
                            <div class="delete-btn">
                                <button class="btns deletebtn">삭제</button>
                            </div>
                        </div>
                        <div class="table-box">
                            <table class="table table-striped">
                                <colgroup>
                                    <col width="5%" />
                                    <col width="20%" />
                                    <col width="36%" />
                                    <col width="12%" />
                                    <col width="13%" />
                                    <col width="6%" />
                                    <col width="8%" />
                                </colgroup>
                                <thead id="theader" class="theader">
                                    <tr>
                                        <th><input type="checkbox" name="checked" id="checked"></th>
                                        <th>게시글 제목</th>
                                        <th>답글 내용</th>
                                        <th>닉네임</th>
                                        <th>작성일시</th>
                                        <th>좋아요</th>
                                        <th>채택여부</th>
                                    </tr>
                                </thead>
                                <tbody id="tbody" class="tbody">
                                    <tr>
                                        <th><input type="checkbox" name="checked" id="checked"></th>
                                        <th>운동할 때 어떤 보조제를 먹는 것이 ...</th>
                                        <th>단백질 보조제는 블라블라 어쩌고저쩌고가 있는 데 그 중 ...</th> <!-- 공백포함 30자 까지 표시 -->
                                        <th>근육짱짱맨</th>
                                        <th>2022-07-22 22:12:00</th> <!-- 초 까지 표시 -->
                                        <th>6</th>
                                        <th>Y</th>
                                    </tr>
                                    <tr>
                                        <th><input type="checkbox" name="checked" id="checked"></th>
                                        <th>운동하는 데 왜 근육이 어쩌고 저쩌고 ...</th>
                                        <th>그건 님이 운동을 그렇게 해서 그런 거 어쩌고 블라블라 ...</th>
                                        <th>헬짱맨스</th>
                                        <th>2022-07-22 22:10:12</th>
                                        <th>0</th>
                                        <th>N</th>
                                    </tr>
                                    <tr>
                                        <th><input type="checkbox" name="checked" id="checked"></th>
                                        <th>운동할 때 어떤 보조제를 먹는 것이 ...</th>
                                        <th>단백질 보조제는 블라블라 어쩌고저쩌고가 있는 데 그 중 ...</th> <!-- 공백포함 30자 까지 표시 -->
                                        <th>근육짱짱맨</th>
                                        <th>2022-07-22 22:12:00</th> <!-- 초 까지 표시 -->
                                        <th>6</th>
                                        <th>Y</th>
                                    </tr>
                                    <tr>
                                        <th><input type="checkbox" name="checked" id="checked"></th>
                                        <th>운동하는 데 왜 근육이 어쩌고 저쩌고 ...</th>
                                        <th>그건 님이 운동을 그렇게 해서 그런 거 어쩌고 블라블라 ...</th>
                                        <th>헬짱맨스</th>
                                        <th>2022-07-22 22:10:12</th>
                                        <th>0</th>
                                        <th>N</th>
                                    </tr>
                                    <tr>
                                        <th><input type="checkbox" name="checked" id="checked"></th>
                                        <th>운동할 때 어떤 보조제를 먹는 것이 ...</th>
                                        <th>단백질 보조제는 블라블라 어쩌고저쩌고가 있는 데 그 중 ...</th> <!-- 공백포함 30자 까지 표시 -->
                                        <th>근육짱짱맨</th>
                                        <th>2022-07-22 22:12:00</th> <!-- 초 까지 표시 -->
                                        <th>6</th>
                                        <th>Y</th>
                                    </tr>
                                    <tr>
                                        <th><input type="checkbox" name="checked" id="checked"></th>
                                        <th>운동하는 데 왜 근육이 어쩌고 저쩌고 ...</th>
                                        <th>그건 님이 운동을 그렇게 해서 그런 거 어쩌고 블라블라 ...</th>
                                        <th>헬짱맨스</th>
                                        <th>2022-07-22 22:10:12</th>
                                        <th>0</th>
                                        <th>N</th>
                                    </tr>
                                    <tr>
                                        <th><input type="checkbox" name="checked" id="checked"></th>
                                        <th>운동할 때 어떤 보조제를 먹는 것이 ...</th>
                                        <th>단백질 보조제는 블라블라 어쩌고저쩌고가 있는 데 그 중 ...</th> <!-- 공백포함 30자 까지 표시 -->
                                        <th>근육짱짱맨</th>
                                        <th>2022-07-22 22:12:00</th> <!-- 초 까지 표시 -->
                                        <th>6</th>
                                        <th>Y</th>
                                    </tr>
                                    <tr>
                                        <th><input type="checkbox" name="checked" id="checked"></th>
                                        <th>운동하는 데 왜 근육이 어쩌고 저쩌고 ...</th>
                                        <th>그건 님이 운동을 그렇게 해서 그런 거 어쩌고 블라블라 ...</th>
                                        <th>헬짱맨스</th>
                                        <th>2022-07-22 22:10:12</th>
                                        <th>0</th>
                                        <th>N</th>
                                    </tr>
                                    <tr>
                                        <th><input type="checkbox" name="checked" id="checked"></th>
                                        <th>운동할 때 어떤 보조제를 먹는 것이 ...</th>
                                        <th>단백질 보조제는 블라블라 어쩌고저쩌고가 있는 데 그 중 ...</th> <!-- 공백포함 30자 까지 표시 -->
                                        <th>근육짱짱맨</th>
                                        <th>2022-07-22 22:12:00</th> <!-- 초 까지 표시 -->
                                        <th>6</th>
                                        <th>Y</th>
                                    </tr>
                                    <tr>
                                        <th><input type="checkbox" name="checked" id="checked"></th>
                                        <th>운동하는 데 왜 근육이 어쩌고 저쩌고 ...</th>
                                        <th>그건 님이 운동을 그렇게 해서 그런 거 어쩌고 블라블라 ...</th>
                                        <th>헬짱맨스</th>
                                        <th>2022-07-22 22:10:12</th>
                                        <th>0</th>
                                        <th>N</th>
                                    </tr>
                                    <tr>
                                        <th><input type="checkbox" name="checked" id="checked"></th>
                                        <th>운동할 때 어떤 보조제를 먹는 것이 ...</th>
                                        <th>단백질 보조제는 블라블라 어쩌고저쩌고가 있는 데 그 중 ...</th> <!-- 공백포함 30자 까지 표시 -->
                                        <th>근육짱짱맨</th>
                                        <th>2022-07-22 22:12:00</th> <!-- 초 까지 표시 -->
                                        <th>6</th>
                                        <th>Y</th>
                                    </tr>
                                    <tr>
                                        <th><input type="checkbox" name="checked" id="checked"></th>
                                        <th>운동하는 데 왜 근육이 어쩌고 저쩌고 ...</th>
                                        <th>그건 님이 운동을 그렇게 해서 그런 거 어쩌고 블라블라 ...</th>
                                        <th>헬짱맨스</th>
                                        <th>2022-07-22 22:10:12</th>
                                        <th>0</th>
                                        <th>N</th>
                                    </tr>
                                    <tr>
                                        <th><input type="checkbox" name="checked" id="checked"></th>
                                        <th>운동할 때 어떤 보조제를 먹는 것이 ...</th>
                                        <th>단백질 보조제는 블라블라 어쩌고저쩌고가 있는 데 그 중 ...</th> <!-- 공백포함 30자 까지 표시 -->
                                        <th>근육짱짱맨</th>
                                        <th>2022-07-22 22:12:00</th> <!-- 초 까지 표시 -->
                                        <th>6</th>
                                        <th>Y</th>
                                    </tr>
                                    <tr>
                                        <th><input type="checkbox" name="checked" id="checked"></th>
                                        <th>운동하는 데 왜 근육이 어쩌고 저쩌고 ...</th>
                                        <th>그건 님이 운동을 그렇게 해서 그런 거 어쩌고 블라블라 ...</th>
                                        <th>헬짱맨스</th>
                                        <th>2022-07-22 22:10:12</th>
                                        <th>0</th>
                                        <th>N</th>
                                    </tr>
                                    <tr>
                                        <th><input type="checkbox" name="checked" id="checked"></th>
                                        <th>운동할 때 어떤 보조제를 먹는 것이 ...</th>
                                        <th>단백질 보조제는 블라블라 어쩌고저쩌고가 있는 데 그 중 ...</th> <!-- 공백포함 30자 까지 표시 -->
                                        <th>근육짱짱맨</th>
                                        <th>2022-07-22 22:12:00</th> <!-- 초 까지 표시 -->
                                        <th>6</th>
                                        <th>Y</th>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="paging-box">
                            <ul class="pagination">
                                <li class="page-item"><a class="page-link move" href="#"><i
                                            class="fas fa-angle-left"></i>
                                        이전</a></li>
                                <li class="page-item"><a class="page-link" href="#">1</a></li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item"><a class="page-link" href="#">4</a></li>
                                <li class="page-item"><a class="page-link" href="#">5</a></li>
                                <li class="page-item"><a class="page-link" href="#">6</a></li>
                                <li class="page-item"><a class="page-link" href="#">7</a></li>
                                <li class="page-item"><a class="page-link" href="#">8</a></li>
                                <li class="page-item"><a class="page-link" href="#">9</a></li>
                                <li class="page-item"><a class="page-link" href="#">10</a></li>
                                <li class="page-item"><a class="page-link move" href="#">다음 <i
                                            class="fas fa-angle-right"></i></a></li>
                            </ul>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script>includeHTML();</script>
</body>

</html>