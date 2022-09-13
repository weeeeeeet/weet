const getBoardList = (currPage) => {

    const keyword = document.querySelector("#searchInput").value;
    const sort = document.querySelector(".sort-select").value;
    let str = '';

    const params = {
        "amount": 10,
        "currPage": currPage,
        "keyword": keyword,
        "sort": sort
    }

    $.ajax({
        url: "/board/api/list",
        type: "GET",
        data: params,
        success: data => {
            document.querySelector('.keyword').style.display = 'block';
            console.log(data);

            document.querySelector('.sort-menu>p>span').innerHTML = data.data.paging.totalAmount;
            if(data.data.paging.cri.keyword != "") {
                document.querySelector('.keyword>span').innerHTML = '"' + data.data.paging.cri.keyword + '"';
            } else {
                document.querySelector('.keyword').style.display = 'none';
            }

            if(data.data.result.length == 0) {
                str += '<div class="error-area">'
                    + '<div class="text">'
                    + '<span class="material-icons-outlined md-96">search_off</span>'
                    + '<span>요청하신 키워드</span>'
                    + '<span id="user-keyword">"' + data.data.paging.cri.keyword + '"</span>'
                    + '<span>에 대한 검색결과가 없습니다.</span></div>'
                    + '<a href="/board/main"><input type="button" value="커뮤니티로 이동"></a></div>';

                document.querySelector(".board-list").innerHTML = str;
                return;
            } // if

            $.each(data.data.result, (i, e) => {
				e.board.commPostContents = e.board.commPostContents.replace(/(<([^>]+)>)/ig, ""); // HTML 태그 제거

                str += '<div class="card">'
                    + '<div class="card-body">'
                    + '<h4 class="card-title">'
                    + '<div class="row">'
                    + '<div class="col-sm-1">'
                    + '<img src="https://img.icons8.com/ultraviolet/30/000000/quote-left.png">'
                    + '</div>'
                    + '<div class="col-sm-5">'
                    + '<p class="user-nickname">' + e.board.userNickname + '</p>'
                    + '</div>'
                    + '<div class="col-sm-5">'
                    + '<p class="post-date">' + e.board.commPostInsertTs + '</p>'
                    + '</div></div></h4>'
                    + '<a href="/board/' + e.board.commId + '">'
                    + '<div class="template-demo">'
                    + '<p class="question-title">'+ e.board.commPostTitle + '</p>'
                    + '<p class="question-word">' + e.board.commPostContents + '</p>'
                    + '</div></a>'
                    + '<div class="row" style="margin-top: 10px;">'
                    + '<div class="col-sm-1">'
                    + '<i class="commhome_comment fas fa-comment-dots" style="color: #2370DF;"></i>'
                    + '<span class="count"> ' + e.board.commReplyCount + '</span></div>'
                    + '<div class="col-sm-1">'
                    + '<i class="commhome_heart fas fa-heart" style="color: #ff589b;"></i>'
                    + '<span class="count"> ' + e.board.commLikeNum + '</span></div></div><hr>'
                    + '<div class="profile">'
                    + '<div class="row">';

                if(e.reply == null) {
                    str += '<p class="no-reply">아직 등록된 답변이 없습니다.</p></div></div></div></div>';
                } else {
                    str += '<div class="col-sm-2">'
                        + '<p class="trainer-name">' + e.reply.trainerNickname + '</p></div>'
                        + '<div class="col-sm-1">';
                    
                    switch(e.reply.trainerLevel) {
                        case 1 :
                            str += '<div class="trainer-level level-1">lv.1</div></div></div>';
                            break;
                        case 2 :
                            str += '<div class="trainer-level level-2">lv.2</div></div></div>';
                            break;
                        case 3 :
                            str += '<div class="trainer-level level-3">lv.3</div></div></div>';
                            break;
                    } // switch

                    str += '<p class="reply-word">' + e.reply.replyContents + '</p></div></div></div>';
                } // if-else
            }) // .each

            document.querySelector(".board-list").innerHTML = str;
        } // success
    }) // .ajax
} // getBoardList

getBoardList(1);