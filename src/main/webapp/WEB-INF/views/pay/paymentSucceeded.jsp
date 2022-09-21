<jsp:include page="/WEB-INF/views/include/header.jsp" />

<!DOCTYPE html>

<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>payment</title>

    <!-- css -->
    <link rel="stylesheet" href="/resources/css/pay/paymentSucceeded.css">

    <!-- font -->
    <link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet">

    <!-- fontawesome -->
    <script src="https://kit.fontawesome.com/63eb3bc178.js" crossorigin="anonymous"></script>

    <!-- favicon -->
    <link rel="shortcut icon" href="/resources/ico/favicon.ico" type="image/x-icon">
    <link rel="icon" href="/resources/ico/favicon.ico" type="image/x-icon">

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
    <section class="contents">
        <h2>정상적으로 <span>결제 완료</span> 되었습니다.</h2>

        <div class="inner-contents">

            <div class="area">
                <div class="order-num">
                    <p>구매상세내역</p>
                    <table>
                        <colgroup>
                            <col style="width: 80%;">
                            <col style="width: 20%;">
                            <col style="width: 10%;">
                        </colgroup>
                        <tr>
                            <td><span>${ __PAYINFO__.payNum }</span> / <span>${ __PAYINFO__.payTs }</span></td>
                            <td><fmt:formatNumber type="currency" currencySymbol="￦" value="${ __PAYINFO__.payAmount }" /></td>
                            <td>원</td>
                        </tr>
                    </table>
                </div>

                <div class="order-info">
                    <p>주문정보</p>
                    <table>
                        <colgroup>
                            <col style="width: 80%;">
                            <col style="width: 20%;">
                            <col style="width: 10%;">
                        </colgroup>
                        <tr>
                            <td>결제수단</td>
                            <td colspan="2">${ __PAYINFO__.payMethod }</td>
                        </tr>
                        <tr>
                            <td>카드사</td>
                            <td colspan="2">${ __PAYINFO__.payCardName }</td>
                        </tr>
                        <tr>
                            <td><hr></td>
                            <td><hr></td>
                            <td><hr></td>
                        </tr>
                        <tr>
                            <td>상품 정가</td>
                            <td><fmt:formatNumber type="currency" currencySymbol="￦" value="${ __PAYINFO__.classFee }" /></td>
                            <td>원</td>
                        </tr>
                        <tr>
                            <td>쿠폰 할인금액</td>
                            <td><fmt:formatNumber type="currency" currencySymbol="￦" value="${ __PAYINFO__.classFee - __PAYINFO__.payAmount }" /></td>
                            <td>원</td>
                        </tr>
                        <tr>
                            <td><hr></td>
                            <td><hr></td>
                            <td><hr></td>
                        </tr>
                        <tr>
                            <td>최종 결제금액</td>
                            <td><fmt:formatNumber type="currency" currencySymbol="￦" value="${ __PAYINFO__.payAmount }" /></td>
                            <td>원</td>
                        </tr>
                    </table>
                </div>

                <div class="buy-product">
                    <p>구매상품</p>
                    <table>
                        <tr>
                            <td rowspan="3"><img src="/${ __PAYINFO__.classMainImgUrl }" alt=""></td>
                            <td style="padding-left: 30px; font-weight: 500;">${ __PAYINFO__.classTitle }</td>
                        </tr>
                        <tr>
                            <td style="padding-left: 30px; font-size: 15px;">${ __PAYINFO__.classTrainerName } / 
                            	<c:if test="${ __PAYINFO__.classType == '1'.charAt(0) }">개인</c:if>
                            	<c:if test="${ __PAYINFO__.classType == '2'.charAt(0) }">그룹</c:if>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-left: 30px; font-size: 13px; color: #777">경기 남양주시 와부읍 덕소로 214 5층 SM휘트니스&필라테스</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>

        <a href="/mypage/pay/detail" class="button-link">
            <div class="pay-button">구매내역 확인하기</div>
        </a>
    </section>

</body>

<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</html>
