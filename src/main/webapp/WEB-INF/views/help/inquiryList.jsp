<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>1대 1 문의</title>
	<link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet">
	<script src="https://kit.fontawesome.com/63eb3bc178.js" crossorigin="anonymous"></script>
	
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
		crossorigin="anonymous">
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
		crossorigin="anonymous"></script>
		
	<link rel="stylesheet" href="${path}/resources/css/help/inquiryList.css">
	<script src="loadHTML.js"></script>
	
	<!-- favicon -->
	<link rel="shortcut icon" href="${path}/resources/ico/favicon.ico" type="image/x-icon">
	<link rel="icon" href="${path}/resources/ico/favicon.ico" type="image/x-icon">
</head>

<body>

	<div class="wrap">
	
	<!-- ==================HEADER==================== -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	
	<!-- ================== 검색 배너 ==================== -->
	<%@ include file="/WEB-INF/views/include/helpBanner.jsp"%>

	
		<!-- ================== 카테고리 ==================== -->
		<section class="contents">
			<div class="select_category">
				<button type="button" onclick="location.href='/help/qna';"
					class="FAQ_btn1 btn btn-primary btn-lg">자주 묻는 질문</button>
				<button type="button" onclick="location.href='/help/inquiry';"
					class="FAQ_btn2 btn btn-secondary btn-lg">1:1 문의</button>
			</div>

			<!-- ================== 1대1 문의 박스 ==================== -->
			
			<div class="inquiry_box1">
				<div class="inquiry_box2">
					<p class="card-text">
						안녕하세요! <span class="inquiry_wee">Wee</span><span class="inquiry_.">.</span><span class="inquiry_t">T</span> 입니다! <br> 도움이 필요하신가요? <br>
						문의를 남겨 주시면 자세히 안내해 드리겠습니다.
					</p>
					<button type="button"
							onclick="location.href='/help/inquiry/register';"
							class="inquiry_btn3 btn btn-primary btn-lg">문의하기
					</button>

				</div>
					
				<c:forEach var="inquiryList" items="${INQUIRY_LIST}" >
					<div class="inquiry_confirmation_hi">
							<i class="inquiry_confirmation_q fas fa-q fa-4x" ></i>
								<div class="single_inquery_title">
									<a href="/help/inquiry/read?serviceNo=${inquiryList.serviceNo}" class="Inquiry_confirmation_btn4">${inquiryList.csTitle}</a>
									<p class="Inquiry_confirmation_date">${inquiryList.csTs}</p>
								</div>
							<c:choose>
								<c:when test="${inquiryList.inquiryReplyTitle ne null}">
									<div class="Inquiry_confirmation_answer2"> 답변완료 </div>
								</c:when>
								<c:when test="${empty inquiryList.inquiryReplyTitle}">
									<div class="Inquiry_confirmation_answer1"> 답변대기 </div>
								</c:when>
							</c:choose>
					</div>
				</c:forEach>
	
			</div>
			
		</section>
	</div>

<!-- ==================FOOTER==================== -->

	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	
	<script>
		includeHTML();
	</script>

</body>

</html>