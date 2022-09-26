<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>트레이너 공지사항, 코칭계획 작성 trDashboardContentsWrite</title>

     <!-- favicon -->
     <link rel="shortcut icon" href="/resources/ico/favicon.ico" type="image/x-icon">
     <link rel="icon" href="/resources/ico/favicon.ico" type="image/x-icon">
 
     <!-- Bootstrap CSS -->
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
         integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
 
     <!-- 외부 스타일 시트 연결 -->
     <!-- 트레이너 글쓰기 팝업창 css -->
    <link href="/resources/css/dashboard/trDashboardWrite.css" rel="stylesheet">

     <!-- 폰트어썸 설정 -->
     <script src="https://kit.fontawesome.com/63eb3bc178.js" crossorigin="anonymous"></script>
 
     <!-- 외부 JS 연결 -->
 
    <!-- jquery -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.0/jquery-migrate.min.js"></script>

    <!-- include libraries(jQuery, bootstrap) -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <!-- include summernote css/js -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

    <!-- summernote script 추가 -->
      <script>$(document).ready(function () {
    	$.noConflict();
        $('#summernote').summernote({
            height: 400,
            lang: "ko-KR"
        });
    });</script>

</head>
<body>

    <div id="content-body">

        <!-- 컨텐츠 (게시글)-->
        <div class="content-container">

            <div class="content-box g">
                <form action="/noticeplan/write" method="post">
                    <div calss="write_container">

                        <div class="boardtype_box">
                            <span class="subject boardtype">게시판명</span>
                            <select class="boardtype-select" name="boardtype">
                                <option value="notice">클래스 공지사항</option>
                                <option value="faq">이번주 코칭계획</option>
                            </select>
                        </div>

                        <div class="boardtitle_box">
                            <label class="subject boardtitle">제목</label>
                            <input type="text" name="title" id="title" size="50" placeholder="제목을 입력해주세요">
                        </div>

                        <div class="boardcontents_box">
                            <p class="subject boardcontents">본문</p>

                            <div class="write_box">
                                <div id="summernote" aria-placeholder="내용을 입력해주세요"></div>
                            </div>
                        </div>

						 <!-- 공지사항 목록 버튼 -->
                        <button type="button" onclick="location.href='/dashboard/tr/noticeplan'" class="list_btn" name="noticeList" >목록</button>
                        
                        <!-- 글 저장 버튼 -->
                        <button type="submit" id="submitBtn" class="save_btn" name="writeSave">등록</button>

                    </div>
                </form>
            </div>
            
        </div>

    </div>
     
</body>
</html>