// ================ 공통 변수 ========================== //

const commId = location.href.substring(location.href.lastIndexOf("/") + 1);	// 게시글번호
const loginUserId = document.querySelector('input[name=userId]').value;		// 접속유저 아이디
const loginUserType = document.querySelector('input[name=userType]').value;	// 접속유저 유형
const heart = document.querySelector('#heartCheck');						// 게시글 추천 체크박스


// ================ 함수 영역 ========================== //

// 게시글 상세조회 + 댓글목록 출력
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
            
            let boardWriter = '';
            if(boardData.userId.length < 10) {
                boardWriter = maskingId(boardData.userId);
            } // if
            
            document.querySelector('.board-title>h3').innerHTML = boardData.commPostTitle;          // 글제목
            document.querySelector('.user-profile').innerHTML                                       // 글 정보(닉네임, ID, 업로드일, 수정일, 조회수)
                = "<p>" + boardData.userNickname + " <span>" + boardWriter + "</span></p>"
                + "<p>작성 " + boardData.commPostInsertTs + " | 마지막 수정 " + boardData.commPostUpdateTs + " | 조회 " + boardData.commViewCount + "</p>";
            document.querySelector('.board-contents>p').innerHTML = boardData.commPostContents;     // 글내용
            document.querySelector('.heartCount').innerHTML = "좋아요 " + boardData.commLikeNum;   // 좋아요 수
            document.querySelector('.reply-write-area>p>span').innerHTML = boardData.commReplyCount;    // 댓글 수

			// 작성자 아닐 시 수정 / 삭제 금지
			if( boardData.userId != loginUserId ) {
				document.querySelector('.btn-area').style.display = "none";
			} // if
			
            if( replyData.length === 0 ) {
                document.querySelector('.reply-content-area').innerHTML = str;

                return;
            } // if

            console.log(replyData);

            // 댓글 출력
            $.each(replyData, (i, e) => {
                str += '<div class="item">'
                    + '<div class="reply-header">'
                    + '<div class="user-profile">'
                    + '<div class="flexbox"><p>' + e.trainerNickname + '</p>';
                    
                    // 트레이너 레벨 구분
                    switch(e.trainerLevel) {
                        case 1 :
                            str += '<div class="trainer-level level-1">lv.1</div></div>';
                            break;
                        case 2 :
                            str += '<div class="trainer-level level-2">lv.2</div></div>';
                            break;
                        case 3 :
                            str += '<div class="trainer-level level-3">lv.3</div></div>';
                            break;
                    } // switch
                    
                str += '<p>' + e.replyInsertTs + '</p>';

                // 작성아이디와 로그인아이디 같으면 수정 / 삭제 버튼 노출
                if( e.trainerId == loginUserId ) {
                    str += '<p><span onclick="replyEdit(' + '\'replyContents\', ' + e.replyId + ')">수정</span> | <span onclick="deleteReply(' + e.replyId + ')">삭제</span></p>';
                } // if

                str += '</div><div class="reply-select" onclick="selectReply(' + e.replyId + ', \'' + e.trainerId + '\')">'
                    + '<small>채택</small>'
                    + '<i class="fas fa-circle-check"></i></div></div>'
                    + '<textarea name="replyContents" id="replyContents' + e.replyId + '" wrap="on" oninput="resize(event)" readonly>' + e.replyContents + '</textarea>'
                    + '<div class="modify-btn-area"><button class="reply-modify-cancel-btn" onclick="getBoard()">취소</button>'
                    + '<button class="reply-modify-btn" onclick="modifyReply(' + e.replyId + ')">등록</button></div>'
                    + '<div class="re-reply-controller controller-no-' + e.replyId + '">'
                    + '<p class="more-reply" onclick="getReReply(' + e.replyId + ')">▼ 답글 보기</p></div></div>'
                    + '<div class="item-reply re-reply-area-' + e.replyId + '"></div>';
            }) // .each
            
            document.querySelector('.reply-content-area').innerHTML = str;

			// 채택된 답변이 있을 시 스타일 변경 & 클릭이벤트 삭제
			if ( replyData[0].replySelectedYn == 'Y' ) {
                
                const replySelectEl = document.querySelector('.reply-select');
                
				document.querySelector('.item').classList.add('item-selected');
                replySelectEl.removeAttribute("onclick");
				replySelectEl.className = 'reply-selected';
			} // if
            
            // 현재 로그인 아이디와 작성자 아이디가 다르거나 채택된 답변이 있을 시 채택버튼 노출 X (채택은 글 당 하나만 가능)
            if ( (boardData.userId != loginUserId) || (replyData[0].replySelectedYn == 'Y') ) {
                const replyControllerArea = document.querySelectorAll('.reply-select');
                replyControllerArea.forEach((e) => {
                    e.innerHTML = '';
                }); //.forEach
            } // if
            
            // textarea 높이 수정
            document.querySelectorAll('textarea').forEach(e => {
				e.setAttribute("style", "height:" + (e.scrollHeight) + "px; overflow-y:hidden;");
			}); // .forEach
        } // success

    }) // .ajax
} // getBoard

// 대댓글목록 조회
const getReReply = (replyId) => {
	
	$.ajax({
		
		url: "/board/api/list/re/reply/" + commId + "/" + replyId,
        type: "GET",
        success: data => {
			console.log(data); 
			
			document.querySelector(`.re-reply-area-${replyId}`).style.display = "block";
			closeReReply(replyId);

            const replyData = data.data.result;
			let str = '';
			let id = '';
			
            if(replyData.length > 0) {
	
	
	            $.each(replyData, (i, e) => {
					if(e.trainerId.length <= 10) {
						id = maskingId(e.trainerId)
					}// if
					
	                str += '<div class="item re-reply-area">'
	                    + '<div class="reply-header">'
	                    + '<div class="user-profile">'
	                    + '<p>' + e.trainerNickname + ' <span>' + id + '</span></p>'
	                    + '<p>' + e.replyInsertTs + '</p></div></div>'
	                    + '<p>' + e.replyContents + '</p></div><hr>';
	
	            }) // .each
			} // if
            
            str += '<textarea class="re-reply-text" id="re-reply-text-' + replyId + '" placeholder="댓글을 입력해 주세요." oninput="resize(event)" required></textarea>'
            	+ '<button id="comm-reply" name="reply" class="btn btn-primary" onclick="regReReply(' + replyId + ')">등록</button>'
			
            document.querySelector(`.re-reply-area-${replyId}`).innerHTML = str;
        } // success
	}) // .ajax
	
} // getReReply

// 댓글수정(텍스트 편집)
const replyEdit = (id, idx) => {
    const textarea = document.querySelector(`#${id}${idx}`);

    textarea.removeAttribute("readonly");
    textarea.classList.add('edit-enabled');
    textarea.focus();
    
	$(textarea).next('.modify-btn-area').css("display", "flex");
} // replyEdit

// 댓글등록
const regReply = () => {
    const userId = loginUserId;
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

// 대댓글등록
const regReReply = (replyId) => {
    const contents = document.querySelector(`#re-reply-text-${replyId}`).value;

    const params = {
        "replyContents": contents,
        "commId": commId,
        "replyGroup": replyId,
        "replyWriter": loginUserId
    }

    $.ajax({

        url: "/board/api/re/reply/new",
        type: "POST",
        data: params,
        success: () => {

            getReReply(replyId);
        } // success
    }) // .ajax

} // regReReply

// 댓글수정
const modifyReply = (replyId) => {
	const contents = document.querySelector(`#replyContents${replyId}`).value;
	
	const params = {
		"replyId": replyId,
		"replyContents": contents
	}
	
	$.ajax({

        url: "/board/api/reply/" + replyId,
        type: "PUT",
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(params),
        success: () => {
			getBoard();
        } // success
    }) // .ajax

} // modifyReply

// 댓글삭제
const deleteReply = (replyId) => {
	
	$.ajax({

        url: "/board/api/reply/" + replyId + "?commId=" + commId,
        type: "DELETE",
        success: () => {
			alert('댓글이 삭제되었습니다.');
		
			getBoard();
        } // success
    }) // .ajax
} // deleteReply

// 대댓글접기 노출
const closeReReply = (replyId) => {
	const controller = document.querySelector(`.controller-no-${replyId}`);
	const str = '<p class="hide-reply" onclick="clearReReply(' + replyId + ')">▲ 답글 접기</p>'
	
	controller.innerHTML = str;
} // closeReReply

// 대댓글영역 clear
const clearReReply = (replyId) => {
	document.querySelector(`.re-reply-area-${replyId}`).style.display = "none";
	document.querySelector(`.re-reply-area-${replyId}`).innerHTML = '';
	
	const controller = document.querySelector(`.controller-no-${replyId}`);
	const str = '<p class="more-reply" onclick="getReReply(' + replyId + ')">▼ 답글 보기</p>';
	
	controller.innerHTML = str;
	
} // clearReReply

// 아이디 마스킹
const maskingId = (userId) => {
	if( userId == undefined || userId === '' ) return '';
	
	const pattern = /.{3}$/;
	return userId.replace(pattern, "***");
} // maskingId

// 글 작성 페이지로 이동
const goModify = () => {
    location.href = "/board/new?commId=" + commId;
} // goModify

// 게시글 삭제
const deleteBoard = () => {
	
	$.ajax({
        url: "/board/api/" + commId,
        type: "DELETE",
        success: () => {
	
			$('#delModal').modal('show');
        } // success
    }); // .ajax

} // deleteBoard

// 댓글 채택
const selectReply = (replyId, userId) => {

    $.ajax({
        url: "/board/api/reply/select/" + replyId + "?userId=" + userId,
        type: "PUT",
        success: data => {
            if(data.data.result == "SUCCESS") {
                alert('댓글을 채택하였습니다.');
                getBoard();

                return;
            } // if

            alert('처리 중 오류가 발생하였습니다. 다시 시도해 주세요');
        } // success
    }); // .ajax
} // voteReply

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

// textarea 자동 크기조절
const resize = (e) => {
    e.currentTarget.style.height = '1px';
    e.currentTarget.style.height = (12 + e.currentTarget.scrollHeight) + 'px';
} // resize


// ================ 이벤트 리스너 ========================== //

// 하트버튼에 onclick 이벤트
const clickLike = () => {
	if(heart.checked === false) vote();
    else voteCancel(); // if-else
    
    getBoard();
}; // onclick

increaseViewCount();


