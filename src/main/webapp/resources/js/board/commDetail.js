const commId = location.href.substring(location.href.lastIndexOf("/") + 1);

const getBoard = () => {
	
    $.ajax({

        url: "/board/api/" + commId,
        type: "GET",
        success: data => {
            console.log(data);
            const boardData = data.data.result.board;
            
            document.querySelector('.board-title>h3').innerHTML = boardData.commPostTitle;          // 글제목
            document.querySelector('.user-profile').innerHTML                                       // 글 정보(닉네임, ID, 업로드일, 수정일, 조회수)
                = "<p>" + boardData.userNickname + " <span>" + maskingId(boardData.userId) + "</span></p>"
                + "<p>작성 " + boardData.commPostInsertTs + " | 마지막 수정 " + boardData.commPostUpdateTs + " | 조회 " + boardData.commViewCount + "</p>";
            document.querySelector('.board-contents>p').innerHTML = boardData.commPostContents;     // 글내용
        }

    })
	

} // getBoard

const maskingId = (userId) => {
	if( userId == undefined || userId === '' ) return '';
	
	const pattern = /.{3}$/;
	return userId.replace(pattern, "***");
} // maskingId

const goModify = () => {
    location.href = "/board/new?commId=" + commId;
} // goModify

getBoard();
