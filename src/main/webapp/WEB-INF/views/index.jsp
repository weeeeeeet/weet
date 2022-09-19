<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>맞춤형 PT 예약 플랫폼::Wee.T</title>

<link rel="stylesheet" href="/resources/css/main/index.css" />
<link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/63eb3bc178.js"
	crossorigin="anonymous"></script>


<script src="js/loadHTML.js"></script>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">
<!-- favicon -->
<link rel="shortcut icon" href="resources/ico/favicon.ico"
	type="image/x-icon">
<link rel="icon" href="resources/ico/favicon.ico" type="image/x-icon">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="vendors/linericon/style.css" />
<link rel="stylesheet" href="css/font-awesome.min.css" />
<link rel="stylesheet" href="css/themify-icons.css" />
<link rel="stylesheet" href="css/flaticon.css" />
<link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css" />
<link rel="stylesheet" href="vendors/lightbox/simpleLightbox.css" />
<link rel="stylesheet" href="vendors/nice-select/css/nice-select.css" />
<link rel="stylesheet" href="vendors/animate-css/animate.css" />
<link rel="stylesheet" href="vendors/jquery-ui/jquery-ui.css" />
<!-- main css -->
<link rel="stylesheet" href="css/index.css" />
<!-- fontawesome -->
<script src="https://kit.fontawesome.com/63eb3bc178.js"
	crossorigin="anonymous"></script>
<!-- font -->
<link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">

</head>

<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<!-- ==================BANNER==================== -->

	<div id="carouselExampleFade" class="carousel slide carousel-fade"
		data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>

		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="resources/img/static/banner1.png" class="d-block w-100"
					alt="...">
			</div>
			<div class="carousel-item">
				<img src="resources/img/static/banner2.png" class="d-block w-100"
					alt="...">
			</div>
			<div class="carousel-item">
				<img src="resources/img/static/banner3.png" class="d-block w-100"
					alt="...">
			</div>
		</div>

		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleFade" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleFade" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
		crossorigin="anonymous"></script>



	<!-- =================== 추천클래스 ===================== -->

	<section class="feature_product_area section_gap_bottom_custom">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-12">
					<div class="main_title">
						<h2>
							<span>추천 클래스</span>
						</h2>
						<a href="/class/search/recommend" target="_self">+ 더보기&nbsp&nbsp</a>
						<p>Wee.T 회원님들의 후기가 좋은 클래스에요!</p>
					</div>
				</div>
			</div>
			<div class="row">
				<c:forEach var="recommend" items="${_LIST_RECOMMEND_}">
					<div class="col-lg-4 col-md-6">
						<div class="single-product">
							<a href="/class/detail/${recommend.classId}">
								<div class="product-img">
									<img class="img-fluid w-100" src="${recommend.classMainImgUrl}"
										alt="" />
								</div>
								<div class="product-btm">
									<c:if test="${recommend.classType eq '1'}">
										<h1>개인클래스
									</c:if>
									<c:if test="${recommend.classType eq '2'}">
										<h1>그룹클래스
									</c:if>
										/ 서울시 강남구</h1> <a href="/class/detail/${recommend.classId}"><h4>${recommend.classTitle}</h4></a>
									<h5>${recommend.classTrainerName}</h5>
									<div class="star">
										<i class="fa-solid fa-star"></i> ${recommend.classAvgStar}
									</div>
									<hr>
									<h2>${recommend.classCount}회 ${recommend.classFee}원</h2> <br>
								</div>
							</a>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>

	<!--================ 마감임박 클래스 =================-->
	<section class="feature_product_area section_gap_bottom_custom">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-12">
					<div class="main_title">
						<h2>
							<span>마감임박 클래스</span>
						</h2>
						<a href="/class/search/end" target="_self">+ 더보기&nbsp&nbsp</a>
						<p>모집 마감이 얼마 남지 않았어요!</p>
					</div>
				</div>
			</div>

			<div class="row">
				<c:forEach var="voEnd" items="${_LIST_END_}">
					<div class="col-lg-4 col-md-6">
						<div class="single-product">
							<a href="/class/detail/${voEnd.classId}">
								<div class="product-img">
									<img class="img-fluid w-100" src="${voEnd.classMainImgUrl}"
										alt="" />
								</div>
								<div class="product-btm">
									<c:if test="${voEnd.classType eq '1'}">
										<h1>개인클래스
									</c:if>
									<c:if test="${voEnd.classType eq '2'}">
										<h1>그룹클래스
									</c:if>
									/ 서울시 강남구</h1> <a href="/class/detail/${voEnd.classId}"><h4>${voEnd.classTitle}</h4></a>
									<h5>${voEnd.classTrainerName}</h5>
									<div class="star">
										<i class="fa-solid fa-star"></i> ${voEnd.classAvgStar}
									</div>
									<hr>
									<h2>${voEnd.classCount}회 ${voEnd.classFee}원</h2> <br>
								</div>
							</a>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>

	<!--================ 신규 클래스 =================-->
	<section class="feature_product_area section_gap_bottom_custom">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-12">
					<div class="main_title">
						<h2>
							<span>신규 클래스</span>
						</h2>
						<a href="/class/search/new" target="_self">+ 더보기&nbsp&nbsp</a>
						<p>새로 등록된 클래스를 확인하세요!</p>
					</div>
				</div>
			</div>

			<div class="row">
				<c:forEach var="voNew" items="${_LIST_NEW_}">
					<div class="col-lg-4 col-md-6">
						<div class="single-product">
							<a href="/class/detail/${voNew.classId}">
								<div class="product-img">
									<img class="img-fluid w-100" src="${voNew.classMainImgUrl}"
										alt="" />
								</div>
								<div class="product-btm">
									<c:if test="${voNew.classType eq '1'}">
										<h1>개인클래스
									</c:if>
									<c:if test="${voNew.classType eq '2'}">
										<h1>그룹클래스
									</c:if>
									/ 서울시 강남구</h1><a href="/class/detail/${voNew.classId}"><h4>${voNew.classTitle}</h4></a>
									<h5>${voNew.classTrainerName}</h5>
									<div class="star">
										<i class="fa-solid fa-star"></i> ${voNew.classAvgStar}
									</div>
									<hr>
									<h2>${voNew.classCount}회 ${voNew.classFee}원</h2> <br>
								</div>
							</a>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
	<!--================ End Feature Product Area =================-->

	<!--================ Start Blog Area =================-->
	<section class="blog-area section-gap">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-12">
					<div class="blog_title">
						<h2>
							<span>커뮤니티 인기글</span>
						</h2>
						<p>커뮤니티 인기글을 확인하세요!</p>
					</div>
				</div>
			</div>

			<div class="row">
				<c:forEach var="board" items="${_LIST_BOARD_}">
					<div class="col-lg-4 col-md-6">
						<div class="single-blog">
							<div class="short_details">
								<div class="meta-top d-flex">
									<a href="#">${board.userId}</a> <a href="#"><i
										class="fas fa-comment"></i>${board.commReplyCount}</a> <a href="#"><i
										class="fas fa-heart"></i>${board.commLikeNum}</a>
								</div>
								<a class="d-block" href="/board/${board.commId}">
									<h4>${board.commPostTitle}</h4>
								</a>
								<div class="text-wrap">
									<p>${board.commPostContents}</p>
								</div>
								<a href="/board/${board.commId}" class="blog_btn">+ 더보기 <span
									class="ml-2 ti-arrow-right"></span></a>
							</div>
						</div>
					</div>
				</c:forEach>	
			</div>
		</div>
	</section>

	<!--================ End footer Area  =================-->

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/popper.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/stellar.js"></script>
	<script src="vendors/lightbox/simpleLightbox.min.js"></script>
	<script src="vendors/nice-select/js/jquery.nice-select.min.js"></script>
	<script src="vendors/isotope/imagesloaded.pkgd.min.js"></script>
	<script src="vendors/isotope/isotope-min.js"></script>
	<script src="vendors/owl-carousel/owl.carousel.min.js"></script>
	<script src="js/jquery.ajaxchimp.min.js"></script>
	<script src="vendors/counter-up/jquery.waypoints.min.js"></script>
	<script src="vendors/counter-up/jquery.counterup.js"></script>
	<script src="js/mail-script.js"></script>
	<script src="js/theme.js"></script>

	<!-- footer -->

	<%@ include file="/WEB-INF/views/include/footer.jsp"%>



</body>

</html>


