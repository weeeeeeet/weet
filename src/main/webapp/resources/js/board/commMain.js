const getListTop10 = () => {
	
	let str = '';
	
    $.ajax({

        url: "/board/api/list/top",
        type: "GET",
        success: data => {
            $.each(data.data.result, (i, e) => {
				e.board.commPostContents = e.board.commPostContents.replace(/(<([^>]+)>)/ig, ""); // HTML 태그 제거
                console.log(e.reply);
                
                str += '<div class="card">'
                    + '<div class="card-body">'
                    + '<h4 class="card-title">'
                    + '<div class="row">'
                    + '<div class="col-sm-2">'
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
                    + '<div class="count-area" style="margin-top: 10px;">'
                    + '<div class="reply-count">'
                    + '<i class="commhome_comment fas fa-comment-dots" style="color: #2370DF;"></i>'
                    + '<span class="count"> ' + e.board.commReplyCount + '</span></div>'
                    + '<div class="like-count">'
                    + '<i class="commhome_heart fas fa-heart" style="color: #ff589b;"></i>'
                    + '<span class="count"> ' + e.board.commLikeNum + '</span></div>'
                    + '<div class="view-count">'
                    + '<i class="commhome_heart fas fa-eye" style="color: #777;"></i>'
                    + '<span class="count"> ' + e.board.commViewCount + '</span></div></div><hr>'
                    + '<div class="profile">';

                if(e.reply == null) {
                    str += '<p class="no-reply">아직 등록된 답변이 없습니다.</p></div></div></div></div>';
                } else {
                    str += '<p class="trainer-name">' + e.reply.trainerNickname + '</p>';
                    
                    switch(e.reply.trainerLevel) {
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

                    str += '<p class="reply-word">' + e.reply.replyContents + '</p></div></div></div>';
                } // if-else
            }) // .each

            document.querySelector('.board-popular>.items').innerHTML = str;
            boardSlider();
        } // success
    }) // .ajax
} // getListTop10

const getBoardList = () => {

    window.scrollTo(0, 0);
    let str = '';

    const params = {
        "amount": 5,
        "currPage": 1,
        "sort": "recent"
    }

    $.ajax({
        url: "/board/api/list",
        type: "GET",
        data: params,
        success: data => {
	
            console.log(data);

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
                    + '<div class="count-area" style="margin-top: 10px;">'
                    + '<div class="reply-count">'
                    + '<i class="commhome_comment fas fa-comment-dots" style="color: #2370DF;"></i>'
                    + '<span class="count"> ' + e.board.commReplyCount + '</span></div>'
                    + '<div class="like-count">'
                    + '<i class="commhome_heart fas fa-heart" style="color: #ff589b;"></i>'
                    + '<span class="count"> ' + e.board.commLikeNum + '</span></div>'
                    + '<div class="view-count">'
                    + '<i class="commhome_heart fas fa-eye" style="color: #777;"></i>'
                    + '<span class="count"> ' + e.board.commViewCount + '</span></div></div><hr>'
                    + '<div class="profile">';

                if(e.reply == null) {
                    str += '<p class="no-reply">아직 등록된 답변이 없습니다.</p></div></div></div>';
                } else {
                    str += '<p class="trainer-name">' + e.reply.trainerNickname + '</p>';
                    
                    switch(e.reply.trainerLevel) {
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

                    str += '<p class="reply-word">' + e.reply.replyContents + '</p></div></div></div>';
                } // if-else
            }) // .each
            
            document.querySelector(".board-list").innerHTML = str;
        } // success
    }) // .ajax
    
} // getBoardList

const boardSlider = () => {
	$.noConflict();

    $('.items').slick({
      dots: false,
      infinite: true,
      speed: 800,
      autoplay: true,
      autoplaySpeed: 2000,
      slidesToShow: 3,
      slidesToScroll: 3,
      responsive: [
        {
          breakpoint: 1024,
          settings: {
            slidesToShow: 3,
            slidesToScroll: 3,
            infinite: true,
            dots: true
          }
        },
        {
          breakpoint: 600,
          settings: {
            slidesToShow: 2,
            slidesToScroll: 2
          }
        },
        {
          breakpoint: 480,
          settings: {
            slidesToShow: 1,
            slidesToScroll: 1
          }
        }
  
      ]
    });
} // boardSlider

getListTop10();
getBoardList();

