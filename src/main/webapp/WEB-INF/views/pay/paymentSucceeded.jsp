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
                            <td><span>138908239048920</span> / <span>2022-03-12 09:26:25</span></td>
                            <td>370,000</td>
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
                            <td colspan="2">신용카드</td>
                        </tr>
                        <tr>
                            <td>카드사</td>
                            <td colspan="2">신한카드</td>
                        </tr>
                        <tr>
                            <td><hr></td>
                            <td><hr></td>
                            <td><hr></td>
                        </tr>
                        <tr>
                            <td>총 상품금액</td>
                            <td>400,000</td>
                            <td>원</td>
                        </tr>
                        <tr>
                            <td>쿠폰 할인금액</td>
                            <td>30,000</td>
                            <td>원</td>
                        </tr>
                        <tr>
                            <td><hr></td>
                            <td><hr></td>
                            <td><hr></td>
                        </tr>
                        <tr>
                            <td>총 결제금액</td>
                            <td>370,000</td>
                            <td>원</td>
                        </tr>
                    </table>
                </div>

                <div class="buy-product">
                    <p>구매상품</p>
                    <table>
                        <colgroup>
                            <col style="width: 30%;">
                            <col style="width: 70%;">
                        </colgroup>
                        <tr>
                            <td><img src="https://picsum.photos/id/477/200/100" alt=""></td>
                            <td>클래스 이름 어쩌고저쩌고</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>

        <a href="/pay/payment" class="button-link">
            <div class="/mypage/pay/detail">구매내역 확인하기</div>
        </a>
    </section>

</body>

<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</html>
