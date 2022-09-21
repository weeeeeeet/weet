<jsp:include page="/WEB-INF/views/include/header.jsp" />

<!DOCTYPE html>

<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>coupon</title>

    <!-- css -->
    <link rel="stylesheet" href="/resources/css/pay/couponBook.css">

    <!-- font -->
    <link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet">

    <!-- fontawesome -->
    <script src="https://kit.fontawesome.com/63eb3bc178.js" crossorigin="anonymous"></script>

    <!-- favicon -->
    <link rel="shortcut icon" href="ico/favicon.ico" type="image/x-icon">
    <link rel="icon" href="ico/favicon.ico" type="image/x-icon">

    <!-- bootstrap v5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>

    <!-- jQuery -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.0/jquery-migrate.min.js"></script>
    
</head>

<body>
    <div class="contents">

        <div class="contents-info">
            <h5><span>Wee.</span><span>T</span><span> 쿠폰북</span></h5>
            <p>사용가능한 쿠폰을 다운로드받고, 보유 쿠폰을 확인하세요!</p>
        </div>

        <!-- 탭 메뉴 -->
        <ul class="nav nav-tabs" id="couponTab" role="tablist">
            <li class="nav-item" role="presentation">
                <button class="nav-link active" id="coupons-tab" data-bs-toggle="tab" data-bs-target="#coupons"
                    type="button" role="tab" aria-controls="coupons" aria-selected="true">쿠폰북</button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="mycoupon-tab" data-bs-toggle="tab" data-bs-target="#mycoupon" type="button"
                    role="tab" aria-controls="mycoupon" aria-selected="false" onclick="getMyCoupon()">내 쿠폰</button>
            </li>
        </ul>
        <!-- 내용 -->

        <!-- 쿠폰북 -->
        <div class="tab-content" id="myTabContent">
            <div class="tab-pane fade show active" id="coupons" role="tabpanel" aria-labelledby="coupons-tab">

                <div class="row">

                    <c:forEach var="coupon" items="${ _COUPONS_ }">

                        <div class="col-sm-6 col-md-6 col-lg-4">
                            <div class="card bg-white p-3 mb-4 shadow">
                                <div class="d-flex justify-content-between mb-4">
                                    <div class="coupon-info">
                                        <div class="coupon-info__basic">
                                            <h3 class="mb-0">${ coupon.couponDcPct }% 할인</h3>
                                            <p class="text-muted mb-0">${ coupon.couponName }</p>
                                        </div>
                                    </div>
                                    <form onsubmit="createMyCoupon(couponId.value)" method="POST">
                                        <input type="hidden" name="couponId"  value="${ coupon.couponId }">
                                        <button type="submit" class="download-ico">
                                            <i class="fas fa-download"></i>
                                        </button>
                                    </form>
                                </div>

                                <h6 class="mb-0">

                                    <c:choose>
                                        <c:when test="${ coupon.couponStartTs == null && coupon.couponEndTs == null }">
                                            <span class="startDate">
                                                기간 무제한
                                            </span>
                                            
                                        </c:when>

                                        <c:otherwise>
                                            <span class="startDate">
                                                ${ coupon.couponStartTs }
                                            </span>
                                            ~
                                            <span class="endDate">
                                                ${ coupon.couponEndTs }
                                            </span>
                                        </c:otherwise>
                                    </c:choose>
                                </h6>

                                <small>${ coupon.couponExplan }</small>
                            </div>
                        </div>
                    </c:forEach>

                </div>
            </div>

            <!-- 내 쿠폰 -->
            <input type="hidden" name="userId" value="${__LOGIN__.userId }">
            <div class="tab-pane fade" id="mycoupon" role="tabpanel" aria-labelledby="mycoupon-tab">
                <div class="row caption">
                    <div class="col-md-8">
                        <p>* 사용기간이 만료된 쿠폰은 자동으로 소멸됩니다.</p>
                    </div>
                    <div class="col-md-4">
                        <form class="reg-coupon" onsubmit="createMyCoupon(couponId.value)" method="POST">
                            <input type="text" placeholder="쿠폰코드를 입력하세요." pattern="^[a-zA-Z0-9]*$" name="couponId" id="couponId">
                            <input type="submit" value="등록">
                        </form>
                    </div>
                </div>
                <div class="row" id="my-coupon-list-area"></div>

            </div>
        </div>
    </div>

    <!-- 쿠폰발급 팝업 -->
    <script>
        $(() => {
            $('.download').click(() => $('#myModal').modal("show"));
            $('.btn-success').click(() => $('#myModal').modal("hide"));
        }) // .jq
    </script>

    <div id="myModal" class="modal fade">
        <div class="modal-dialog modal-confirm">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="icon-box">
                        <i class="fas fa-check"></i>
                    </div>
                    <h4 class="modal-title">쿠폰이 발급되었습니다!</h4>
                </div>
                <div class="modal-body">
                    <p class="text-center">다운로드한 쿠폰은 '쿠폰푹 > 내 쿠폰'에서 확인하실 수 있습니다.</p>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-success btn-block" data-dismiss="modal">확인</button>
                </div>
            </div>
        </div>
    </div>

	<script src="/resources/js/pay/coupon.js"></script>
</body>

<jsp:include page="/WEB-INF/views/include/footer.jsp" />

</html>