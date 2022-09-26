

// ================ 공통 변수 ========================== //

const heart = document.querySelector('#heartCheck');
const path = window.location.pathname;
const classId = path.substring(path.lastIndexOf("/") + 1);
const loginUserId = document.querySelector('input[name=userId]').value;

// ================ 함수 영역 ========================== //

// 리뷰 조회 (매개변수 classId(클래스 아이디), sort(정렬기준), currPage(현재페이지))
const getReviews = (classId, sort, currPage) => {


    $.ajax({
        url: "/class/reviews/" + classId + "?sort=" + sort + "&currPage=" + currPage,
        type: "GET",
        success: data => {
            console.log(data);

            const reviewArea = document.querySelector('#class-review-area');
            const paginationArea = document.querySelector('#pagination-area');
            let content = '';
            let paging = '<ul class="pagination d-flex justify-content-center flex-wrap pagination-rounded-flat pagination-success">';

			// 리뷰영역
			if(data.reviews.length == 0) {
				content += '<p style="text-align: center; color: #777;">이 클래스에 등록된 후기가 없어요!</p>';
			} else {
				
	            $.each(data.reviews, (i, e) => {
	                content += '<div class="row d-flex">'
	                    + '<div class="row d-flex review-header">'
	                    + '<div class="col-4">'
	                    + '<h3 class="mt-2 mb-0">' + e.userNickname + '</h3>'
	                    + '</div>'
	                    + '<div class="col-4">'
	                    + '<p class="text-left"><span class="text-muted">' + e.reviewStar + '</span>';
	
	                for (let i = 1; i <= 5; i++) {
	                    if (i <= e.reviewStar) {
	                        content += '<span class="fa fa-star star-active"></span>';
	                    } else {
	                        content += '<span class="fa fa-star star-inactive"></span>';
	                    } // if-else
	                } // for
	
	                content += '</p></div>'
	                    + '<div class="col-4 date">'
	                    + '<p class="text-muted pt-5 pt-sm-3">' + e.reviewDatetime + '</p>'
	                    + '</div>'
	                    + '</div>'
	                    + '<div class="row text-left">'
	                    + '<p class="content">' + e.reviewContents + '</p>'
	                    + '</div>'
	                    + '<div class="row text-left"></div></div><hr>';
	
	            }) // .each
			} // if-else
            
            // 페이징처리
            if (data.paging.prev) {
                paging += '<li class="page-item"><a class="page-link" href="#" data-abc="true" onclick="getReviews(\'' + classId + '\', \'' + sort + '\', ' + (data.paging.startPage - 1) + '); return false;">'
                    + '<i class="fa fa-angle-left"></i></a></li>';
            } // if

            for (let i = data.paging.startPage; i <= data.paging.endPage; i++) {

                paging += '<li class="page-item';

                if( i == data.paging.cri.currPage) paging += ' active'; // 현재 페이지에 active속성 추가

                // 각 페이지를 클릭하면 해당 함수 재호출(currPage값만 변경, 나머지 매개변수 동일)
                paging += '"><a class="page-link" href="#" data-abc="true" onclick="getReviews(\'' + classId + '\', \'' + sort + '\', ' + i + '); return false;">' + i + '</a></li>';
            } // for

            console.log("next 클릭!");
            if (data.paging.next) {
                paging += '<li class="page-item"><a class="page-link" href="#" data-abc="true" onclick="getReviews(\'' + classId + '\', \'' + sort + '\', ' + (data.paging.endPage + 1) + '); return false;">'
                    + '<i class="fa fa-angle-right"></i></a></li>';
            } // if
            paging += '</ul>';

            // HTML 영역에 데이터 추가
            reviewArea.innerHTML = content;
            paginationArea.innerHTML = paging;
        } // success
    }) // .ajax
	
} // getReviews

const goCouponBook = () => {
    self.location = "/coupons/book";
} // goCouponBook

// 총 좋아요 수 카운트
const getTotalLikes = (classId) => {

    $.ajax({
        url: "/class/likes/" + classId,
        type: "GET",
        async: false,
        success: data => {
            document.querySelector('.heartCount').innerHTML = data;
        } // success

    }) // .ajax
} // getTotalLikes

// 좋아요 여부 체크
const likeCheck = (classId, userId) => {

    $.ajax({
        url: "/class/likes/check",
        type: "POST",
        data: {"classId" : classId, "userId" : userId},
        success: data => {
            if(data) {
                heart.checked = true;
                
                return;
            } // if
			
			heart.checked = false;
        } // success
    }); // .ajax
} // likeCheck

// 조와요하기
const like = (classId, userId) => {

    $.ajax({
        url: "/class/likes/" + classId + "/" + userId,
        type: "PUT",
        async: false,
        success: data => {
            if(data) {
                heart.checked = true;

                return;
            } // if

            alert('일시적 오류가 발생하였습니다. 잠시 후 다시 시도해 주세요.');

        } // success

    }) // .ajax
} // like

// 조와요의 반대
const likeCancel = (classId, userId) => {

    $.ajax({
        url: "/class/likes/" + classId + "/" + userId,
        type: "DELETE",
        async: false,
        success: data => {
            if(data) {
                heart.checked = false;

                return;
            } // if

            alert('일시적 오류가 발생하였습니다. 잠시 후 다시 시도해 주세요.');
        } // success

    }) // .ajax
} // likeCancel

// 하트버튼에 onclick 이벤트
const clickLike = () => {
	
	if(loginUserId === '') {
		alert('로그인이 필요한 서비스입니다.');
		
		return;
	} // if

    if(heart.checked === false) {
        like(classId, loginUserId);
    } else {
        likeCancel(classId, loginUserId);
    } // if-else
    
    getTotalLikes(classId);
} // clickLike

// ================ 이벤트 리스너 ========================== //

// 상세조회 페이지 로딩시 같이 출력되어야할 정보를 담은 함수호출(default 정렬 최신순)

getReviews(classId, 'recent', 1);
getTotalLikes(classId);
likeCheck(classId, 'user1');

const mainImg = (document.querySelector('.main-img-url').src);
document.querySelector('.hero').style.backgroundImage 
	= "linear-gradient(to bottom, rgba(117, 43, 0, 0.5), rgba(0, 0, 3, 0.9), rgba(0, 0, 3, 0.9)), url('" + mainImg + "')"

