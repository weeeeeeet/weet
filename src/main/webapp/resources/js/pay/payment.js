// 모달창에 사용가능한 쿠폰조회
const getCouponList = () => {
    $('.wrapper>.box').empty();

    // 전송파라미터
    const userId = { "userId": "user1" };
    

    $.ajax({
        url: "/coupons/my",
        type: "GET",
        data: userId,
        dataType: "JSON",
        success: data => {
            
			document.querySelector("#payModalLabel>span").innerText = data.length; // 사용가능 쿠폰갯수 표시
			
            $.each(data, (i, e) => {
	
				e.couponEndTs = e.couponEndTs === null ? '' : ('~' + e.couponEndTs);

                let str = '<input type="radio" class="coupon-select" name="select" id="coupon-' + i + '" value="'
                    + e.couponDcPct + '"/>'
                    + '<label for="coupon-' + i + '" class="coupon-select">'
                    + '<div class="select-dots"></div>'
                    + '<div class="row">'
                    + '<div class="col-2 text-dc-pct">' + e.couponDcPct + '%</div>'
                    + '<div class="col-7 text-name">' + e.couponName + '</div>'
                    + '<div class="col-3 text-ts">' + e.couponEndTs + '</div>'
                    + '</div>'
                    + '</label>';

                $('.wrapper>.box').append(str);
            }); // .each

        } // success
    }) // .ajax
} // getCouponList

// 쿠폰 적용
const applyCoupon = (selectValue) => {
    event.preventDefault();

    // 클래스 정가
    let originAmount = document.querySelector("#original-amount>p").innerText;
    originAmount = originAmount.replace(",", "");
    originAmount = Number(originAmount.substring(0, originAmount.lastIndexOf("원")));

    // 할인금액
    const discountAmount = originAmount * (Number(selectValue) * 0.01);
    document.querySelector("#coupon-modal>a").innerText = discountAmount.toLocaleString() + "원";

    // 최종 결제 금액
    document.querySelector("#total-amount>p").innerText = (originAmount - discountAmount).toLocaleString() + "원";
} // applyCoupon

const goPayment = () => {
    console.clear();
    console.log('goPayment() invoked.');

    event.preventDefault();

    const productName = $('.class-title').text();    // 상품정보
    
    const name = document.querySelector("input[name=buyer_name]").value;
    const tel = document.querySelector("input[name=buyer_tel]").value;
    const email = document.querySelector("input[name=buyer_email]").value;
    
    const amount = parseInt($('#total-amount').text().substring(0, $('#total-amount').text().length - 1).replace(",", "")); // 금액
    const pg = document.querySelector("input[name=pg]:checked").value;
    console.log(pg);
    
    const IMP = window.IMP; // 생략 가능
    IMP.init("imp98682392"); // Example: imp00000000
    // IMP.request_pay(param, callback) 결제창 호출
    IMP.request_pay(
        {
            // param
            pg: pg,
            pay_method: "card",
            merchant_uid: "order_" + new Date().getTime(),
            name: productName,
            amount: 10,
            buyer_email: email,
            buyer_name: name,
            buyer_tel: tel
        },
        function (rsp) {
            console.log(rsp);

            // 결제검증
            $.ajax({
                type: "POST",
                url: "/pay/verify/" + rsp.imp_uid

            }).done((data) => {
                console.log(data);

                // rsp.paid_amount와 data.response.amount를 비교(import 서버검증)
                if (rsp.paid_amount == data.response.amount) {
                    alert('결제 및 결제검증 완료');

                    console.log(data.response);
                    $.ajax({
                        type: "POST",
                        url: "/pay/payment",
                        data: data.response,
                        statusCode: {
                            200: () => {
                            },

                        }
                    })
                } else {
                    alert('결제 실패');
                }
            })

        }

    );
} // goPayment

// 체크박스 전체선택
const selectAll = (selectAll) => {
    const checkboxes = document.querySelectorAll('input[name="agmt"]');

    checkboxes.forEach((checkbox) => {
        checkbox.checked = selectAll.checked
    }); // forEach

} // selectAll

// 하나라도 체크 해제되면 전체선택 해제
const checkSelectAll = (checkbox) => {
    const selectall = document.querySelector('#agmt-all');

    if (checkbox.checked === false) {
        selectall.checked = false;
    } // if

} // checkSelectAll