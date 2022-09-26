<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>클래스 등록 페이지1</title>
 
    <link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/63eb3bc178.js" crossorigin="anonymous"></script>
    
    <link rel="stylesheet" href="/resources/css/class/reg.css" />

    <script src="js/loadHTML.js"></script>

    <!-- favicon -->
	<link rel="shortcut icon" href="${path}/resources/ico/favicon.ico" type="image/x-icon">
	<link rel="icon" href="${path}/resources/ico/favicon.ico" type="image/x-icon">
</head>

<body>
	
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	
    <!-- ==================CONTENTS==================== -->
    <div class="contents">
        <h3>클래스 등록</h3>

        <div class="cont_bar">
            <div class="txt">
                <div class="c1">
                    <li>클래스 등록하기</li>
                    <li>></li>
                    <li>클래스 기본정보</li>
                    <li>></li>
                    <li>스케줄 및 부가정보</li>
                    <li>></li>
                    <li>커리큘럼</li>
                    <li>></li>
                    <li>헬스장정보</li>
                    <li>></li>
                    <li>등록완료</li>
                </div>
            </div>
            <div class="bar">
                <progress value="18" max="100"></progress>
            </div>       
        </div>

        <div class="ct">
            <p><span class="wee">Wee</span><span class="dot">.</span><span class="tt">T</span> 에서 내가 가진 능력을 발휘해보세요. <br>
            기본정보와 스케줄 등록으로 직접 내가 <span class="ctc">클래스</span>를 만들고 운영할 수 있어요.</p>
            <button a type="button" class="btn btn-primary" onclick="location.href='reg/1'">+ 클래스등록 시작하기</button>
        </div>

        <!-- <div class="cla5">동영상 소개</div>
        <div class="mark"><p>?</p></div></div><p class="arrow_box">말풍선 등장!</p> -->
    </div>
    


    <!-- ==================FOOTER==================== -->
      
    <%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>

</html>