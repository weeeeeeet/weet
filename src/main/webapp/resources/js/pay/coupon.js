const loginUserId = document.querySelector('input[name=userId]').value;

const getMyCoupon = () => {
	$('#my-coupon-list-area').empty();
	
	$.ajax({
		url: "/coupons/my?userId=" + loginUserId,
		type: "GET",
		success: data => {
			// console.log(data);
			
			$.each(data, (i, e) => {
				// 시작일이나 종료일이 null로 보여지는걸 방지
				e.couponStartTs = e.couponStartTs === null ? '' : e.couponStartTs;
				e.couponEndTs = e.couponEndTs === null ? '' : e.couponEndTs;
				
				let str = '<div class="col-sm-6 col-md-6 col-lg-4">'
					+ '<div class="card bg-white p-3 mb-4 shadow">'
					+ '<div class="d-flex justify-content-between mb-4">'
					+ '<div class="coupon-info">'
					+ '<div class="coupon-info__basic">'
					+ '<h3 class="mb-0">' + e.couponDcPct + '% 할인</h3>'
					+ '<p class="text-muted mb-0">' + e.couponName + '</p>'
					+ '</div>'
					+ '</div>'
					+ '</div>';
				
				// 둘다 공백일 경우 = 기간무제한
				if(e.couponStartTs === '' && e.couponEndTs === '') {
					str += '<h6 class="mb-0"><span class="startDate">기간 무제한</span></h6>'
				} else {
					str += '<h6 class="mb-0"><span class="startDate">' + e.couponStartTs + '</span>~<span'
					+ 'class="endDate">' + e.couponEndTs + '</span></h6>'
				} // if-else
					
				str += '<small>' + e.couponExplan + '</small>'
				+ '</div>'
				+ '</div>';
				
				$('#my-coupon-list-area').append(str);
			}); // each

		} // success
	}); // .ajax
} // getMyCoupon

const createMyCoupon = (inputValue) => {
	event.preventDefault();
	
	// 모달창 스타일 & 텍스트 초기화
	const icon = document.querySelector('.icon-box>i');
	const iconBox = document.querySelector('.icon-box');
	const modalTitle = document.querySelector('.modal-title');
	const modalText = document.querySelector('.text-center');
	const modalButton = document.querySelector('.modal-confirm .btn');

	icon.className = "fas fa-check";
	iconBox.style.background = "#2370DF";
	modalButton.style.background = "#2370DF";
	modalTitle.innerText = "쿠폰이 발급되었습니다!";
	modalText.innerText = "다운로드한 쿠폰은 '쿠폰푹 > 내 쿠폰'에서 확인하실 수 있습니다.";
	
	// 파라미터 수집
	const couponId = inputValue.toUpperCase();
	// console.log(couponId);
	
	const params = { "couponId" : couponId, "userId" : loginUserId };

	$.ajax({
		url: "/coupons/reg",
		type: "POST",
		data: params,
		success: () => {
			// console.log(data);
			
			getMyCoupon();	// 추가완료되면 내 쿠폰함에 바로 추가
		}, // success
		error: (request) => {
			icon.className = "fas fa-exclamation";
			iconBox.style.background = "#FF730E";
			modalButton.style.background = "#FF730E";
			console.log(request);
			
			modalTitle.innerText = "쿠폰 발급에 실패하였습니다.";
			modalText.innerText = "이미 발급받았거나 존재하지 않는 쿠폰입니다.";
		}, // error
		complete: () => {
			$('#myModal').modal("show");
		} // complete

	}); // .ajax
} // createMyCoupon