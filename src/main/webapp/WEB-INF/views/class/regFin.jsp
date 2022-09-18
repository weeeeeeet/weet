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

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>
    
    <link rel="stylesheet" href="${path}/resources/css/classes/regFin.css" />
    <link href="js/weet_class_reg2.js" rel="stylesheet" />

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
                <progress value="100" max="100"></progress>
            </div>       
        </div>

        <div class="ct">
            <p>정상적으로 <span>등록신청</span> 되었습니다.</p>
            <button a type="button" class="btn btn-primary" onclick="status.href='weet_reg2_2.html'">클래스 등록 현황 확인하기</button>
        </div>

    </div>
    


    <!-- ==================FOOTER==================== -->
      
    <%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>

</html>
<!--ddd  -->