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
    <section id="commWrite">
        <form id="boardForm" onsubmit="return false;">
        	<input type="hidden" name="commId" value="${param.commId}">
        	<input type="hidden" name="userId" value="${__USER__.userId}">
        	
            <br style="clear: both">
            <h3 style="margin-bottom: 10px;">커뮤니티 글 작성</h3>
            <div class="write-info">
                <p>헬스에 관해 궁금했던 점이 있나요? 자유롭게 질문하세요!</p>
				
				<c:if test="${param.commId eq null}">
	                <button id="tmpsave" name="tmpsave" class="btn btn-primary" data-bs-target="#tmpsaveModal"
	                    data-bs-toggle="offcanvas" onclick="getTmpList()">임시저장</button>
				</c:if>
            </div>

            <small>제목</small>
            <div class="form-group">
                <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력하세요.(최대 30자)"
                    maxLength="30" required>
            </div>

            <small>내용</small>
            <div class="form-group">
                <textarea class="form-control" id="summernote" name="content" placeholder="content" maxlength="140"
                    rows="7" required></textarea>
            </div>

            <div class="btn-area">
                <button id="comm-cancel" name="cancel" class="btn btn-primary">취소하기</button>
                <a class="btn btn-primary" data-bs-toggle="modal" href="#regConfirmModal" role="button">등록하기</a>
            </div>
        </form>
    </section>

    <div class="offcanvas offcanvas-end" data-bs-scroll="true" id="tmpsaveModal" tabindex="-1" aria-labelledby="offcanvasRightLabel">
           	<div id="tmpAlert"></div>
            <div class="offcanvas-header">
                <h5 class="offcanvas-title" id="offcanvasRightLabel">임시저장 목록</h5>
                <div class="btn-area">
	                <button type="button" id="tmpsave-btn" class="btn btn-primary" onclick="regBoard(1)">저장</button>
	                <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                </div>
            </div>
            <div class="offcanvas-body"></div>
    </div>

    <div class="modal fade" id="regConfirmModal" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body">
                    <p>게시물을 등록 하시겠습니까?</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                    <button type="button" class="btn btn-primary" id="regConfirmBtn">네</button>
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
                    <button type="button" class="btn btn-primary" onclick="completeReg()">확인</button>
                </div>
            </div>
        </div>
    </div>



    <script src="/resources/js/board/commWrite.js"></script>
</body>

<jsp:include page="/WEB-INF/views/include/footer.jsp" />

</html>