// 공통변수
const classId = document.querySelector("input[name=class-id]").value;
const userId = document.querySelector("input[name=user-id]").value;

// 모달창에 사용가능한 쿠폰조회
const getCouponList = () => {
    $('.wrapper>.box').empty();

    // 전송파라미터
    const params = { "userId": userId };
    

    $.ajax({
        url: "/coupons/my",
        type: "GET",
        data: params,
        dataType: "JSON",
        success: data => {
            
			document.querySelector("#payModalLabel>span").innerText = data.length; // 사용가능 쿠폰갯수 표시
			
            $.each(data, (i, e) => {
	
				e.couponEndTs = e.couponEndTs === null ? '' : ('~' + e.couponEndTs);

                let str = '<input type="radio" class="coupon-select" name="select" id="coupon-' + i + '" value="'
                    + e.couponId + '"/>'
                    + '<label for="coupon-' + i + '" class="coupon-select" id="' + e.couponId + '">'
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
    
    let dcPct = document.querySelector(`#${selectValue} .text-dc-pct`).innerText;
    dcPct = dcPct.substring(0, dcPct.lastIndexOf("%"));
    console.log(dcPct);

    // 클래스 정가
    let originAmount = document.querySelector("#original-amount>p").innerText;
    originAmount = originAmount.replace(",", "");
    originAmount = Number(originAmount.substring(0, originAmount.lastIndexOf("원")));

    // 할인금액
    const discountAmount = originAmount * (Number(dcPct) * 0.01);
    document.querySelector("#coupon-modal>a").innerText = discountAmount.toLocaleString() + "원";

    // 최종 결제 금액
    document.querySelector("#total-amount>p").innerText = (originAmount - discountAmount).toLocaleString() + "원";
} // applyCoupon

// 아임포트 결제
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
            amount: amount,
            buyer_email: email,
            buyer_name: name,
            buyer_tel: tel
        },
        function (rsp) {
            console.log(rsp);

            if(rsp.success) {
                
                verifyAndSavePayInfo(rsp.imp_uid);

            } else {
                alert('처리 중 오류가 발생하였습니다. 다시 시도해 주세요');
                
            } // if-else

        } // function(rsp)

    ); // .request_pay
} // goPayment

// 결제검증 후 DB업데이트
const verifyAndSavePayInfo = (imp_uid) => {
    const couponId = document.querySelector("input[name=select]:checked").value;

    const params = {
        "classId": classId,
        "userId": userId,
        "couponId": couponId
    }

    $.ajax({

        type: "POST",
        url: "/pay/verify/" + imp_uid,
        data: params,
        success: data => {
            console.log(data);

            if(data.data.result === "SUCCESS") {
                location.href = "/pay/succeeded/" + data.data.orderNum;
            } else {
                alert('처리 중 오류가 발생하였습니다. 다시 시도해 주세요');
            } // if-else
        } // success

    }) // .ajax

} // savePayInfo

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