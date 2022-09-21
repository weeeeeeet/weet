<jsp:include page="/WEB-INF/views/include/header.jsp" />

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Community Detail</title>

    <!-- font -->
    <link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet">

    <!-- font awesome -->
    <script src="https://kit.fontawesome.com/63eb3bc178.js" crossorigin="anonymous"></script>

    <!-- google fonts -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined" rel="stylesheet">

    <!-- favicon -->
    <link rel="shortcut icon" href="ico/favicon.ico" type="image/x-icon">
    <link rel="icon" href="ico/favicon.ico" type="image/x-icon">

    <!-- bootstrap v5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>

    <!-- css -->
    <link href="/resources/css/board/commDetail.css" rel="stylesheet">

    <!-- jQuery -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.0/jquery-migrate.min.js"></script>

    <link rel="stylesheet" type="text/css"
        href="https://cdn.jsdelivr.net/gh/kenwheeler/slick@1.8.1/slick/slick-theme.css" />
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
</head>

<body>

    <section id="commDetail">
    	<input type="hidden" name="userId" value="${ __LOGIN__.userId }">
    	<input type="hidden" name="userType" value="T">
        <div class="board-area">
            <div class="board-title">
                <h3>제목이에요</h3>
            </div>
            <div class="board-header">
                <div class="user-profile">
                    <p>새우새우 <span>user***</span></p>
                    <p>작성 2022.09.11 01:33 | 최근 수정 2022.09.11 03.22 | 조회 32</p>
                </div>

                
            </div>
            <hr>
            <div class="board-contents">
                <p>내용이에요내용이에요내용이에요내용이에요내용이에요내용이에요내용이에요내용이에요내용이에요</p>
            </div>
        </div>

        <div class="board-controller">
            <input type="checkbox" class="checkbox" id="heartCheck" onclick="clickLike(); return false;"/>
            <label for="heartCheck" onclick="clickLike(); return false;">
                <svg id="heart-svg" viewBox="467 392 58 57" xmlns="http://www.w3.org/2000/svg">
                    <g id="Group" fill="none" fill-rule="evenodd" transform="translate(467 392)">
                        <path
                            d="M29.144 20.773c-.063-.13-4.227-8.67-11.44-2.59C7.63 28.795 28.94 43.256 29.143 43.394c.204-.138 21.513-14.6 11.44-25.213-7.214-6.08-11.377 2.46-11.44 2.59z"
                            id="heart" fill="#AAB8C2" />
                        <circle id="main-circ" fill="#E2264D" opacity="0" cx="29.5" cy="29.5" r="1.5" />

                        <g id="heartgroup7" opacity="0" transform="translate(7 6)">
                            <circle id="heart1" fill="#9CD8C3" cx="2" cy="6" r="2" />
                            <circle id="heart2" fill="#8CE8C3" cx="5" cy="2" r="2" />
                        </g>

                        <g id="heartgroup6" opacity="0" transform="translate(0 28)">
                            <circle id="heart1" fill="#CC8EF5" cx="2" cy="7" r="2" />
                            <circle id="heart2" fill="#91D2FA" cx="3" cy="2" r="2" />
                        </g>

                        <g id="heartgroup3" opacity="0" transform="translate(52 28)">
                            <circle id="heart2" fill="#9CD8C3" cx="2" cy="7" r="2" />
                            <circle id="heart1" fill="#8CE8C3" cx="4" cy="2" r="2" />
                        </g>

                        <g id="heartgroup2" opacity="0" transform="translate(44 6)">
                            <circle id="heart2" fill="#CC8EF5" cx="5" cy="6" r="2" />
                            <circle id="heart1" fill="#CC8EF5" cx="2" cy="2" r="2" />
                        </g>

                        <g id="heartgroup5" opacity="0" transform="translate(14 50)">
                            <circle id="heart1" fill="#91D2FA" cx="6" cy="5" r="2" />
                            <circle id="heart2" fill="#91D2FA" cx="2" cy="2" r="2" />
                        </g>

                        <g id="heartgroup4" opacity="0" transform="translate(35 50)">
                            <circle id="heart1" fill="#F48EA7" cx="6" cy="5" r="2" />
                            <circle id="heart2" fill="#F48EA7" cx="2" cy="2" r="2" />
                        </g>

                        <g id="heartgroup1" opacity="0" transform="translate(24)">
                            <circle id="heart1" fill="#9FC7FA" cx="2.5" cy="3" r="2" />
                            <circle id="heart2" fill="#9FC7FA" cx="7.5" cy="2" r="2" />
                        </g>
                    </g>
                </svg>

                <span class="heartCount">좋아요 150</span>
            </label>

            <div class="btn-area">
                <button id="comm-modify" name="modify" class="btn btn-primary" onclick="goModify()">수정</button>
                <button id="comm-delete" name="delete" class="btn btn-primary" data-bs-toggle="modal" href="#delConfirmModal">삭제</button>
            </div>
        </div>

        <hr>

        <div class="reply-write-area">
            <p><span>2</span>개의 댓글</p>
            
            <textarea id="reply-text" placeholder="댓글을 입력해 주세요." required></textarea>
            <button id="comm-reply" name="reply" class="btn btn-primary" onclick="regReply()">댓글달기</button>
            <c:if test="${ __USER__.userType == 'N' }">
	            <textarea id="reply-text" placeholder="트레이너만 댓글 작성이 가능합니다." disabled></textarea>
            </c:if>
        </div>
        <div class="reply-content-area">

            <div class="item item-selected">
                <div class="reply-header">
                    <div class="user-profile">
                        <p>새우새우 <span>user***</span></p>
                        <p>2022.09.11 01:33</p>
                    </div>

                    <div class="reply-selected">
                        <small>채택</small>
                        <i class="fas fa-circle-check"></i>
                    </div>
                </div>

                <p>
                    댓글댓글
                </p>
                
                <div class="re-reply-controller">
                    <p class="more-reply">▼ 1개의 답글</p>
                    <p class="hide-reply">▲ 답글 접기</p>
                    <p class="write-re-reply">답글 쓰기</p>
                </div>
            </div>
            
            <div class="item">
                <div class="reply-header">
                    <div class="user-profile">
                        <p>새우새우 <span>user***</span></p>
                        <p>2022.09.11 01:33</p>
                    </div>

                    <div class="reply-select">
                        <small>채택</small>
                        <i class="fas fa-circle-check"></i>
                    </div>
                </div>

                <p>
                    댓글댓글
                </p>
                
                <div class="re-reply-controller">
                    <p class="more-reply">▼ 1개의 답글</p>
                    <p class="hide-reply">▲ 답글 접기</p>
                    <p class="write-re-reply">답글 쓰기</p>
                </div>
            </div>
            <div class="item-reply">
                <div class="reply-write-area">
                    <textarea id="reply-text" placeholder="댓글을 입력해 주세요."></textarea>
                    <button id="comm-reply" name="reply" class="btn btn-primary">댓글달기</button>
                </div>
                <div class="item re-reply-area">
                    <div class="reply-header">
                        <div class="user-profile">
                            <p>새우새우 <span>user***</span></p>
                            <p>2022.09.11 01:33</p>
                        </div>
                    </div>
    
                    <p>
                        댓글댓글
                    </p>
                </div>
                <div class="item re-reply-area">
                    <div class="reply-header">
                        <div class="user-profile">
                            <p>새우새우 <span>user***</span></p>
                            <p>2022.09.11 01:33</p>
                        </div>
                    </div>
    
                    <p>
                        댓글댓글
                    </p>
                </div>
                
            </div>
            
        </div>


    </section>

    <div class="modal" id="delConfirmModal" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body">
                    <p>게시물을 삭제 하시겠습니까?</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                    <button type="button" class="btn btn-primary">네</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal" id="delModal" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body">
                    <p>삭제가 완료되었습니다.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary">확인</button>
                </div>
            </div>
        </div>
    </div>
    
    <div class="modal" id="replyModal" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body">
                    <p>댓글이 등록되었습니다.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="window.location.reload()">확인</button>
                </div>
            </div>
        </div>
    </div>

    <script src="/resources/js/board/commDetail.js"></script>
</body>

<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</html>