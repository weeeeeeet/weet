<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자주 묻는 질문</title>
    <link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/63eb3bc178.js" crossorigin="anonymous"></script>

    <script src="loadHTML.js"></script>
	
	 <!-- favicon -->
	<link rel="shortcut icon" href="${path}/resources/ico/favicon.ico" type="image/x-icon">
	<link rel="icon" href="${path}/resources/ico/favicon.ico" type="image/x-icon">
	
    <link rel="stylesheet" href="${path}/resources/css/help/qnaRead.css">

</head>

<body>
    <div class="warp">
        <!-- ==================HEADER==================== -->
		<%@ include file="/WEB-INF/views/include/header.jsp"%>
		
		 <!-- =================검색 배너==================== -->
		<%@ include file="/WEB-INF/views/include/helpBanner.jsp"%>

        <div class="inner">
        <!-- ==================Q&A==================== -->

	    </section>


        <section class="contents">
            <div class="question">
                <i class="QA_q fas fa-q fa-3x"><span class="QA_q_text"> ${_QNA_.csTitle}</span></i>
                <i class="QA_list fas fa-list-ul"><a href="/help/qna" class="QA_list_text">목록</a></i>
            </div>
            <div class="answer">
                <i class="QA_a fab fa-adn fa-4x"><span class="QA_a_text">${_QNA_.csContent}</span></i>
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