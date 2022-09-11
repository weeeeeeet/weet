<jsp:include page="/WEB-INF/views/include/header.jsp" />

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>commWrite</title>

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
    <link href="/resources/css/board/commWrite.css" rel="stylesheet">

    <!-- jQuery -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.0/jquery-migrate.min.js"></script>

    <script src="/resources/js/board/summernote-lite.js"></script>
    <script src="/resources/js/board/summernote-ko-KR.js"></script>

    <link rel="stylesheet" href="/resources/css/board/summernote-lite.css">
</head>

<body>
    <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
        <symbol id="check-circle-fill" viewBox="0 0 16 16">
            <path
                d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z" />
        </symbol>
        <symbol id="info-fill" viewBox="0 0 16 16">
            <path
                d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z" />
        </symbol>
        <symbol id="exclamation-triangle-fill" viewBox="0 0 16 16">
            <path
                d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
        </symbol>
    </svg>

    <section id="commWrite">
        <form id="boardForm" onsubmit="return false;">
            <br style="clear: both">
            <h3 style="margin-bottom: 10px;">커뮤니티 글 작성</h3>
            <div class="write-info">
                <p>헬스에 관해 궁금했던 점이 있나요? 자유롭게 질문하세요!</p>

                <button id="tmpsave" name="tmpsave" class="btn btn-primary" data-bs-target="#tmpsaveModal"
                    data-bs-toggle="modal" onclick="getTmpList()">임시저장</button>
            </div>

            <small>제목</small>
            <div class="form-group">
                <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력하세요.(최대 30자)"
                    maxLength="30" required>
            </div>

            <small>내용</small>
            <div class="form-group">
                <textarea class="form-control" id="summernote" name="content" placeholder="content"
                    maxlength="140" rows="7" required></textarea>
            </div>

            <div class="btn-area">
                <button id="comm-cancel" name="cancel" class="btn btn-primary">취소하기</button>
                <a class="btn btn-primary" data-bs-toggle="modal" href="#regConfirmModal" role="button">등록하기</a>
            </div>
        </form>
    </section>

    <div class="modal fade" id="tmpsaveModal" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                
                    <h5 class="modal-title">임시저장 목록</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="tmpList">
                        <small>22.09.11</small>
                        <p>리스트</p>
                        <i class="fas fa-trash"></i>
                    </div>
                    <div class="tmpList">
                        <small>22.09.11</small>
                        <p>리스트</p>
                        <i class="fas fa-trash"></i>
                    </div>
                    <div class="tmpList">
                        <small>22.09.11</small>
                        <p>리스트</p>
                        <i class="fas fa-trash"></i>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                    <button type="button" class="btn btn-primary" onclick="regBoard(1)">임시저장하기</button>
                </div>

                <div id="tmpAlert"></div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="regConfirmModal" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body">
                    <p>게시물을 등록 하시겠습니까?</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                    <button type="button" class="btn btn-primary" onclick="regBoard(0)">네</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="regModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body">
                    <p>등록이 완료되었습니다.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary">확인</button>
                </div>
            </div>
        </div>
    </div>



    <script src="/resources/js/board/commWrite.js"></script>
</body>

<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</html>