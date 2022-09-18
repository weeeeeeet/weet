<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
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
    <link rel="stylesheet" href="${path}/resources/css/help/noticeList.css">
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

    <section class="contents">

		<div class="titleNotice">
			<p>공지사항</p>
		</div>

        <div class="noticeList">
	        <table class="table"> 
	            <tbody>
	            	<c:forEach var="noticeList" items="${NOTICE_LIST}" >
		                <tr>
		                    <td class="categories">
							  <c:if test="${noticeList.noticeType eq '1'}">
								<p>[새 소식]</p>
							  </c:if> 
							  <c:if test="${noticeList.noticeType eq '2'}">
								<p>[업데이트]</p>
							  </c:if> 
							  <c:if test="${noticeList.noticeType eq '3'}">
								<p>[서비스 오류 안내]</p>
							  </c:if> 
							  <c:if test="${noticeList.noticeType eq '4'}">
								<p>[서비스 임시 중단 안내]</p>
							  </c:if> 
							</td>
		                    <td class="title indent text-align-left"><a href="/help/notice/read?serviceNo=${noticeList.serviceNo}"><p>${noticeList.csTitle}</p></a></td>
		                    <td class="write_time"><p>${noticeList.csTs}</p></td>
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
						<li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":"" }"><a href="/help/notice?pageNum=${num}">${num}</a></li>
					</c:forEach>
					
					<c:if test="${pageMaker.next}">
                    	<li class="pageInfo_btn next"><a href="${pageMaker.endPage + 1 }">Next</a></li>
                	</c:if>    
				
                </ul>
			</div>
		</div>
   
    </section>
    </section>



    <!-- ==================FOOTER==================== -->
    <%@ include file="/WEB-INF/views/include/footer.jsp"%>
	
	<script>
		includeHTML();
	</script>

</body>

</html>