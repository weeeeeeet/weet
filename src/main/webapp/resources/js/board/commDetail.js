const commId = location.href.substring(location.href.lastIndexOf("/") + 1);

const getBoard = () => {
	
    $.ajax({

        url: "/board/api/" + commId,
        type: "GET",
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
                    + '<p>' + e.replyInsertTs + '</p></div>'
                    + '<div class="reply-select">'
                    + '<small>채택</small>'
                    + '<i class="fas fa-circle-check"></i></div></div>'
                    + '<p>' + e.replyContents + '</p>'
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
            if ( boardData.userId != 'user2' ) {
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

getBoard();
