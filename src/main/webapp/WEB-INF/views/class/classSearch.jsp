<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>Weet</title>
	
	<!-- css -->
	<link rel="stylesheet" href="${path}/resources/css/class/classSearch.css" />
	<link rel="stylesheet" href="/resources/vendors/bootstrap/bootstrap.min.css">
	
	<!-- font -->
	<link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet">
	<script src="https://kit.fontawesome.com/63eb3bc178.js" crossorigin="anonymous"></script>
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		
	<!-- favicon -->
	<link rel="shortcut icon" href="${path}/resources/ico/favicon.ico" type="image/x-icon">
	<link rel="icon" href="${path}/resources/ico/favicon.ico" type="image/x-icon">
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js" integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	
	<script>
	
		$(".pafeInfo a").on("click", function(e){
			
			e.preventDefault();
	        moveForm.find("input[name='pageNum']").val($(this).attr("href"));
	        moveForm.attr("action", "/class/search");
	        moveForm.submit();
	        
		});
		
		$(".banner_search button").on("click", function(e){
	        e.preventDefault();
	        
	        
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
	<%@ include file="/WEB-INF/views/include/header.jsp"%>

			
	<form id="moveForm" method="get">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
		<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
	</form>
	
	<!-- ======================BANNER======================== -->
	<form method="get"  id="listForm" action="/class/search">
	
		<section class="banner">
			<div class="banner_search">
					<input type="hidden" name="type" value="personalandgroup">
					<input type="hidden" name="sort" value="newest">
					<input type="text" name="keyword" value="${pageMaker.cri.keyword}"
						placeholder="&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp트레이너명 또는 클래스명 입력"
						autocomplete="off"> 
						<button><i class="fa-solid fa-magnifying-glass"></i></button>
				<a href="#" id="searchicon" class="fa-solid fa-magnifying-glass"></a>
			</div>
		</section>
	</form>

	<!-- =================== CLASS LIST ===================== -->

	<section class="contents">

		<div class="sort">
			<form id="typeForm" method="get" action="/class/search">
				<select name="type" id="type">
					<option name="type" value="personalandgroup" id="personalandgroup" >개인 / 그룹</option>
					<option name="type" value="personal" id="personal">개인</option>
					<option name="type" value="group" id="group">그룹</option>
				</select> 
				
				<button class="starBtn" name="sort" value="star">별점순</button>
				|
				<button class="newestBtn" name="sort" value="newest">최신순</button>
				|
				<button class="endBtn" name="sort" value="end">마감임박순</button>

				<input type="hidden" name="keyword" id="s_keyword" value="">
			</form>
		</div>
			
			
		<div class="main">

			<div class="row">
				<c:forEach var="listAll" items="${_LIST_ALL_}">
					<div class="col-lg-4 col-md-6">
						<div class="single-product">
							<a href="/class/detail/${listAll.classId}">
								<div class="product-img">
									<img class="img-fluid w-100" src="${path}/${listAll.classMainImgUrl}" alt="" />
								</div>
								<div class="product-btm">
									<c:if test="${listAll.classType eq '1'}">
										<h1>개인클래스
									</c:if>
									<c:if test="${listAll.classType eq '2'}">
										<h1>그룹클래스
									</c:if>
										/ 서울시 강남구</h1><a href="/class/detail/${listAll.classId}"><h4>${listAll.classTitle}</h4></a>
									<h5>${listAll.classTrainerName}</h5>
									<div class="star">
										<i class="fa-solid fa-star"></i> ${listAll.classAvgStar}
									</div>
									<hr>
									<h2>${listAll.classCount}회 ${listAll.classFee}원</h2> <br>
								</div>
							</a>
						</div>
					</div>
				</c:forEach>
			</div>

		</div>
		
		<!-- =================== 페이징 ===================== -->
		<div class="pageInfo_wrap">
			<div class="pageInfo_area">
				<ul id="pageInfo" class="pageInfo">
				
					<c:if test="${pageMaker.prev}">
                    	<li class="pageInfo_btn previous"><a href="${pageMaker.startPage-1}">Previous</a></li>
                	</c:if>
                	
					<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage}">
						<li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":"" }"><a href="/class/search?pageNum=${num}">${num}</a></li>
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
</body>

</html>


