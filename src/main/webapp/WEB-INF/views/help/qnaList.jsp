<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자주 묻는 질문</title>
    <link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/63eb3bc178.js" crossorigin="anonymous"></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>
        
    <!-- favicon -->
	<link rel="shortcut icon" href="${path}/resources/ico/favicon.ico" type="image/x-icon">
	<link rel="icon" href="${path}/resources/ico/favicon.ico" type="image/x-icon">
	
	<!-- css -->
    <link rel="stylesheet" href="${path}/resources/css/help/qnaList.css">
    <script src="loadHTML.js"></script>
    
    <!-- jQuery -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.0/jquery-migrate.min.js"></script>
    
    <script>
    
	    $(".pafeInfo a").on("click", function(e){
			
			e.preventDefault();
	        moveForm.find("input[name='pageNum']").val($(this).attr("href"));
	        moveForm.attr("action", "/help/qna");
	        moveForm.submit();
	        
		});
		
		$(".banner_search button").on("click", function(e){
	        e.preventDefault();
	        let val = $("input[name='keyword']").val();
	        moveForm.find("input[name='keyword']").val(val);
	        moveForm.find("input[name='pageNum']").val(1);
	        moveForm.submit();
	    });
		
		$(".sortBtn", ".newestBtn", ".endBtn").on("click", function(e){
	        e.preventDefault();
			
	        // 정렬 form에 키워드 input 추가
	        document.querySelector("#s_keyword").value = document.querySelector("input[name='keyword']").value
	        typeForm.submit();
	    });
		
    </script>
</head>

<body>
    <!-- ==================HEADER==================== -->

	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<form id="moveForm" method="get">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
		<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
	</form>
    <!-- ==================COMM==================== -->
	<form method="get"  id="listForm" action="/help/qna">

    <section class="FAQ_search_bar">
        <div class="FAQ_box">
            <p class="FAQ_text">무엇을 도와 드릴까요?</p>

            <div class="banner_search">
                <input type="text" name="keyword" value="${pageMaker.cri.keyword}"
						placeholder="질문을 검색해 주세요"
						autocomplete="off"> 
						<button>버튼</button>
				<a href="#" id="searchicon" class="fa-solid fa-magnifying-glass"></a>
            </div>

        </div>
        <br>
    </section>
    </form>
    <section class="contents">
        <div class="select_category">
				<button type="button" onclick="location.href='/help/qna';"
					class="FAQ_btn1 btn btn-primary btn-lg">자주 묻는 질문</button>
				<button type="button" onclick="location.href='/help/inquiry';"
					class="FAQ_btn2 btn btn-secondary btn-lg">1:1 문의</button>
			</div>
		
		<div class="selectType">
			<form id="typeForm" method="get" action="/help/qna">
				<select name="type" class="qnaType" onchange="if(this.value) location.href=(this.value);">
					<option value="" selected disabled hidden>유형선택</option>
					<option name="type" value="/help/qna?type=all" >전체보기</option>
					<option name="type" value="/help/qna?type=class" >클래스</option>
					<option name="type" value="/help/qna?type=payment" >결제/환불</option>
					<option name="type" value="/help/qna?type=guide" >이용방법</option>
					<option name="type" value="/help/qna?type=account" >계정</option>
				</select>
				<input type="hidden" name="keyword" id="s_keyword" value="">
			</form>
		</div>
		

        <div class="qnaList">
	        <table class="table"> 
	            <tbody>
	            	<c:forEach var="qnaList" items="${QNA_LIST}" >
		                <tr>
		                    <td class="categories">
							  <c:if test="${qnaList.qnaType eq '1'}">
								<p>[클래스]</p>
							  </c:if> 
							  <c:if test="${qnaList.qnaType eq '2'}">
								<p>[결제/환불]</p>
							  </c:if> 
							  <c:if test="${qnaList.qnaType eq '3'}">
								<p>[이용방법]</p>
							  </c:if> 
							  <c:if test="${qnaList.qnaType eq '4'}">
								<p>[계정]</p>
							  </c:if> 
							</td>
		                    <td class="title indent text-align-left"><a href="/help/qna/read?serviceNo=${qnaList.serviceNo}">${qnaList.csTitle}</a></td>
		                </tr>
		             </c:forEach>  
	            </tbody>
	        </table>
        </div>
    
    <!-- =================== 페이징 ===================== -->
		<div class="pageInfo_wrap">
			<div class="pageInfo_area">
				<ul id="pageInfo" class="pageInfo">
				
					<c:if test="${pageMaker.prev}">
                    	<li class="pageInfo_btn previous"><a href="${pageMaker.startPage-1}">Previous</a></li>
                	</c:if>
                	
					<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage}">
						<li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":"" }"><a href="/help/qna?pageNum=${num}">${num}</a></li>
					</c:forEach>
					
					<c:if test="${pageMaker.next}">
                    	<li class="pageInfo_btn next"><a href="${pageMaker.endPage + 1 }">Next</a></li>
                	</c:if>    
				
                </ul>
			</div>
		</div>
   
    </section>



    <!-- ==================FOOTER==================== -->
    <%@ include file="/WEB-INF/views/include/footer.jsp"%>
	
	<script>
		includeHTML();
	</script>

</body>

</html>