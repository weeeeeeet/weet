// ================ 공통 변수 ========================== //

const commId = location.href.substring(location.href.lastIndexOf("/") + 1);	// 게시글번호
const loginUserId = document.querySelector('input[name=userId]').value;		// 접속유저 아이디
const loginUserType = document.querySelector('input[name=userType]').value;	// 접속유저 유형
const heart = document.querySelector('#heartCheck');						// 게시글 추천 체크박스


// ================ 함수 영역 ========================== //

const getBoard = () => {
	
    $.ajax({

        url: "/board/api/" + commId,
        type: "GET",
        async: false,
        success: data => {
            console.log(data);
            const boardData = data.data.result.board;
            const replyData = data.data.result.reply;
            let str = '';
            
            document.querySelector('.board-title>h3').innerHTML = boardData.commPostTitle;          // 글제목
            document.querySelector('.user-profile').innerHTML                                       // 글 정보(닉네임, ID, 업로드일, 수정일, 조회수)
                = "<p>" + boardData.userNickname + " <span>" + maskingId(boardData.userId) + "</span></p>"
                + "<p>작성 " + boardData.commPostInsertTs + " | 마지막 수정 " + boardData.commPostUpdateTs + " | 조회 " + boardData.commViewCount + "</p>";
            document.querySelector('.board-contents>p').innerHTML = boardData.commPostContents;     // 글내용
            document.querySelector('.heartCount').innerHTML = "좋아요 " + boardData.commLikeNum;   // 좋아요 수
            document.querySelector('.reply-write-area>p>span').innerHTML = boardData.commReplyCount;    // 댓글 수

            if( replyData.length === 0 ) return;

            console.log(replyData);

            // 댓글 출력
            $.each(replyData, (i, e) => {
                str += '<div class="item">'
                    + '<div class="reply-header">'
                    + '<div class="user-profile">'
                    + '<p>' + e.trainerNickname + '</p>'
                    + '<p>' + e.replyInsertTs + '</p>';

                // 작성아이디와 로그인아이디 같으면 수정 / 삭제 버튼 노출
                if( e.trainerId == 'tr3' ) {
                    str += '<p><span>수정</span> | <span>삭제</span></p>';
                } // if

                str += '</div><div class="reply-select">'
                    + '<small>채택</small>'
                    + '<i class="fas fa-circle-check"></i></div></div>'
                    + '<input type="text" id="replyContents" value="' + e.replyContents + '" readonly>'
                    + '<div class="re-reply-controller">'
                    + '<p class="more-reply">답글 보기</p></div></div>'
            }) // .each
            
            document.querySelector('.reply-content-area').innerHTML = str;

			// 채택된 답변이 있을 시 스타일 변경
			if ( replyData[0].replySelectedYn == 'Y' ) {
				document.querySelector('.item').classList.add('item-selected');
				document.querySelector('.reply-select').className = 'reply-selected';
			} // if
            
            // 현재 로그인 아이디와 작성자 아이디가 다르면 채택버튼 노출 X
            if ( boardData.userId != loginUserId ) {
                const replyControllerArea = document.querySelectorAll('.reply-select');
                replyControllerArea.forEach((e) => {
                    e.innerHTML = '';
                }) //.forEach
            } // if
        } // success

    }) // .ajax
} // getBoard

const regReply = () => {
    const userId = 'tr3';
    const content = document.querySelector('#reply-text').value;
    
    if( content == '' ) {
        alert('댓글 내용을 입력해주세요.');
        document.querySelector('#reply-text').focus();

        return;
    } // if

    const params = {
        "commId": commId,
        "replyContents": content,
        "userId": userId
    }

    $.ajax({

        url: "/board/api/reply/new",
        type: "POST",
        data: params,
        success: data => {
	
			$('#replyModal').modal('show');
        } // success
    }) // .ajax

} // regReply

const regReReply = () => {

} // regReReply

const modifyReply = () => {

} // modifyReply

const deleteReply = () => {

} // deleteReply

const maskingId = (userId) => {
	if( userId == undefined || userId === '' ) return '';
	
	const pattern = /.{3}$/;
	return userId.replace(pattern, "***");
} // maskingId

const goModify = () => {
    location.href = "/board/new?commId=" + commId;
} // goModify

// 추천 여부 체크
const voteCheck = () => {

    $.ajax({
        url: "/board/api/vote/" + commId + "/" + loginUserId,
        type: "GET",
        success: data => {
            if(data.data.result) {
                heart.checked = true;
                
                return;
            } // if
			
			heart.checked = false;
        } // success
    }); // .ajax
} // likeCheck

// 추천하기
const vote = () => {

    $.ajax({
        url: "/board/api/vote/" + commId + "/" + loginUserId,
        type: "POST",
        async: false,
        success: data => {
            if(data.data.result === "SUCCESS") {
                heart.checked = true;

                return;
            } // if

            alert('일시적 오류가 발생하였습니다. 잠시 후 다시 시도해 주세요.');

        } // success

    }) // .ajax
} // vote

// 추천 취소
const voteCancel = () => {

    $.ajax({
        url: "/board/api/vote/" + commId + "/" + loginUserId,
        type: "DELETE",
        async: false,
        success: data => {
            if(data.data.result === "SUCCESS") {
                heart.checked = false;

                return;
            } // if

            alert('일시적 오류가 발생하였습니다. 잠시 후 다시 시도해 주세요.');
        } // success

    }) // .ajax
} // voteCancel

// 조회수 업데이트
const increaseViewCount = () => {
	
	$.ajax({
        url: "/board/api/view/" + commId,
        type: "PUT",
        success: data => {
            if(data.data.result === "SUCCESS") {
                getBoard();
                voteCheck();

                return;
            } // if

            alert('일시적 오류가 발생하였습니다. 잠시 후 다시 시도해 주세요.');
        } // success

    }) // .ajax
} // increaseViewCount


// ================ 이벤트 리스너 ========================== //

// 하트버튼에 onclick 이벤트
const clickLike = () => {
	if(heart.checked === false) vote();
    else voteCancel(); // if-else
    
    getBoard();
}; // onclick

increaseViewCount();
