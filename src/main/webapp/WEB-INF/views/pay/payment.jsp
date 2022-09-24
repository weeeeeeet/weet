<jsp:include page="/WEB-INF/views/include/header.jsp" />

<!DOCTYPE html>

<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>payment</title>

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

    <!-- css -->
    <link rel="stylesheet" href="/resources/css/pay/payment.css">

    <!-- javascript -->


    <!-- jQuery -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.0/jquery-migrate.min.js"></script>


    <!-- 결제모달 호출 -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

    <script>
        $(() => {
            $('#coupon-modal').click((e) => {
                e.preventDefault();
                $('#payModal').modal("show");
            });
            $('#coupon-close').click(() => $('#payModal').modal("hide"));
            $('#coupon-submit').click(() => $('#payModal').modal("hide"));
        }) // .jq
    </script>
</head>

<body>
    <section class="contents">
		<input type="hidden" name="class-id" value="${__CLASS__.classId}" />
		<input type="hidden" name="user-id" value="${__LOGIN__.userId}" />
		
        <form class="was-validated" name="payForm" onsubmit="goPayment()">

            <fieldset>
                <legend>상품 정보</legend>
				
                <div class="card mb-3">
                    <div class="row g-0">
                        <div class="col-md-4 embed-responsive embed-responsive-4by3">
                            <img src="/${__CLASS__.classMainImgUrl}"
                                class="card-img-top img-fluid rounded-start rounded-end embed-responsive-item"
                                alt="...">
                        </div>
                        <div class="col-md-8">
                            <div class="card-body">
                                <div class="row">
                                    <p class="card-title class-title">${__CLASS__.classTitle}</p>
                                    <p class="card-text class-info"><small class="text-muted">${__CLASS__.trainerName}/
                                    <c:if test="${ __CLASS__.classType == '1'.charAt(0) }">개인</c:if>
                            		<c:if test="${ __CLASS__.classType == '2'.charAt(0) }">그룹</c:if>
                                    클래스/${__CLASS__.classAderess}</small></p>
                                    <p class="card-text class-amount">
                                        <fmt:formatNumber type="currency" currencySymbol="￦" value="${__CLASS__.classFee}" />원</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </fieldset>

            <fieldset>
                <legend>결제자 정보</legend>

                <div class="pay-info">
                    <div class="mb-2 row">
                        <label for="name" class="col-sm-2 col-form-label">이름<span>*</span></label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="buyer_name" id="name" placeholder="홍길동"
                                pattern="^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}" value="${ __USER__.userName }" required autofocus>
                            <div class="invalid-feedback">
                                올바른 이름을 입력해주세요.
                            </div>
                        </div>
                    </div>
                    <div class="mb-2 row">
                        <label for="phone" class="col-sm-2 col-form-label">전화번호<span>*</span></label>
                        <div class="col-sm-10">
                            <input type="tel" class="form-control" name="buyer_tel" id="phone"
                                placeholder="010-0000-0000 ('-' 없이 입력)" pattern="\d*" minlength="10" maxlength="11" value="${ __USER__.userPhone }"
                                required>
                            <div class="invalid-feedback">
                                올바른 전화번호를 입력해주세요.
                            </div>
                        </div>
                    </div>
                    <div class="mb-2 row">
                        <label for="email" class="col-sm-2 col-form-label">이메일<span>*</span></label>
                        <div class="col-sm-10">
                            <input type="email" class="form-control" name="buyer_email" id="email"
                                placeholder="example@example.com"
                                pattern="^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}"
                                value="${ __USER__.userEmail }"
                                required>
                            <div class="invalid-feedback">
                                올바른 이메일 형식을 입력해주세요.
                            </div>
                        </div>
                    </div>
                </div>
            </fieldset>

            <fieldset>
                <legend>결제 금액</legend>

                <div class="row">
                    <div class="col-md-10">
                        <p>정가</p>
                    </div>
                    <div class="col-md-2" id="original-amount">
                        <p><fmt:formatNumber value="${__CLASS__.classFee}" />원</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-10">
                        <p>쿠폰할인</p>
                    </div>
                    <div class="col-md-2" id="coupon-modal" onclick="getCouponList()">
                        <a href="#">쿠폰적용</a>
                    </div>
                </div>
                <div class="row total-amount">
                    <div class="col-md-10">
                        <p>총 결제 금액</p>
                    </div>
                    <div class="col-md-2" id="total-amount">
                        <p><fmt:formatNumber value="${__CLASS__.classFee}" />원</p>
                    </div>
                </div>
            </fieldset>

            <fieldset>
                <legend>결제 수단</legend>

                <div class="pay-method-container">
                    <div class="row justify-content-center">
                        <div class="col-md-5">
                            <input type="radio" class="btn-check" name="pg" id="btn-check-normal" value="html5_inicis"
                                autocomplete="off" checked>
                            <label class="btn btn-outline-primary" for="btn-check-normal">
                                <i class="fas fa-credit-card"></i>
                                일반결제
                            </label>
                        </div>

                        <div class="col-md-5">
                            <input type="radio" class="btn-check" name="pg" id="btn-check-kakao" value="kakaopay"
                                autocomplete="off">
                            <label class="btn btn-outline-primary" for="btn-check-kakao">
                                <img src="/resources/img/static/payment_icon_yellow_medium.png" alt="카카오페이 이미지">
                                카카오페이
                            </label>
                        </div>
                    </div>
                </div>
            </fieldset>

            <fieldset>
                <legend>이용 약관</legend>

                <div class="container pay-agmt-container">
                    <div class="row">
                        <div class="col">
                            <label for="agmt-all" class="form-check-label">전체 동의</label>
                        </div>
                        <div class="col form-check-reverse">
                            <input type="checkbox" class="form-check-input" name="agmt-all" id="agmt-all"
                                onclick='selectAll(this)'>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <label for="agmt-age" class="form-check-label">만 14세 이상 결제 동의</label>
                        </div>
                        <div class="col form-check-reverse">
                            <input type="checkbox" class="form-check-input select" name="agmt" id="agmt-age"
                                onclick='checkSelectAll(this)' required>
                            <div class="invalid-feedback">
                                약관에 동의해 주세요.
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <label for="agmt-confirm" class="form-check-label">주문내용 확인 및 결제동의</label>
                        </div>
                        <div class="col form-check-reverse">
                            <input type="checkbox" class="form-check-input select" name="agmt" id="agmt-confirm"
                                onclick='checkSelectAll(this)' required>
                            <div class="invalid-feedback">
                                약관에 동의해 주세요.
                            </div>
                        </div>
                    </div>
                </div>
            </fieldset>

            <div class="text-center pay-submit">
                <button class="btn btn-primary" id="pay-submit" type="submit">결제</button>
            </div>
        </form>
    </section>

    <!-- 쿠폰팝업(모달창) -->
    <div class="modal fade" id="payModal" tabindex="-1" role="dialog" aria-labelledby="payModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="payModalLabel">사용가능 쿠폰 <span>3</span></h5>
                    <button type="button" class="btn-close" id="coupon-close" aria-label="Close"></button>
                </div>
                <form onsubmit="applyCoupon(select.value)">
                    <div class="modal-body">
                        <div class="wrapper">
                            <div class="box"></div>
                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-primary" id="coupon-submit">적용</button>
                        </div>
                   </div>
                </form>
            </div>
        </div>
    </div>

    <script src="/resources/js/pay/payment.js"></script>
</body>

<jsp:include page="/WEB-INF/views/include/footer.jsp" />

</html>