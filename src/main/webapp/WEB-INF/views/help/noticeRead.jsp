<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
    <link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/63eb3bc178.js" crossorigin="anonymous"></script>

	<link rel="stylesheet" href="/resources/vendors/bootstrap/bootstrap.min.css">
	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>
	
    <script src="loadHTML.js"></script>
	
	 <!-- favicon -->
	<link rel="shortcut icon" href="${path}/resources/ico/favicon.ico" type="image/x-icon">
	<link rel="icon" href="${path}/resources/ico/favicon.ico" type="image/x-icon">
	
    <link rel="stylesheet" href="${path}/resources/css/help/noticeRead.css">

</head>

<body>
    <div class="warp">
        <!-- ==================HEADER==================== -->
		<%@ include file="/WEB-INF/views/include/header.jsp"%>
		

        <div class="inner">
        <!-- ==================Q&A==================== -->

        <section class="contents">
	
			<div class="titleNotice">
				<p>공지사항</p>
			</div>
		
            <div class="noticeContent">
            	<div class="noticeTitle">
            		<c:if test="${_NOTICE_.noticeType eq '1'}">
						<p class="notice_type"><span>[새 소식]</span>
					</c:if> 
					<c:if test="${_NOTICE_.noticeType eq '2'}">
						<p class="notice_type"><span>[업데이트]</span>
					</c:if> 
					<c:if test="${_NOTICE_.noticeType eq '3'}">
						<p class="notice_type"><span>[서비스 오류 안내]</span>
					</c:if> 
					<c:if test="${_NOTICE_.noticeType eq '4'}">
						<p class="notice_type"><span>[서비스 임시 중단 안내]</span>
					</c:if> 
            		&nbsp${_NOTICE_.csTitle}</p>
                	<i class="notice_list fas fa-list-ul"><a href="/help/notice" class="notice_list_text">목록</a></i>
            	</div>
                <p class="cs_ts">${_NOTICE_.csTs}</p>
            	
	            <div class="notice_content">
	                <p>${_NOTICE_.csContent}</p>
	            </div>
            </div>
        </section>

        </div>

    </div>
        <!-- ==================FOOTER==================== -->
		<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	
		<script>
			includeHTML();
		</script>
</body>

</html>