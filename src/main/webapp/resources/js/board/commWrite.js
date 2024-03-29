let commId = document.querySelector('input[name=commId]').value;
let userId = document.querySelector('input[name=userId]').value;
const $1 = jQuery.noConflict();

// 섬머노트 세팅
const readySummernote = () => {
	
    $1('#summernote').summernote({
        height: 500,                // 에디터 높이
        minHeight: 500,             // 최소 높이
        maxHeight: 800,             // 최대 높이
        focus: true,                // 에디터 로딩후 포커스를 맞출지 여부
        lang: "ko-KR",			    // 한글 설정
        placeholder: '내용을 입력하세요. 최대 2048자까지 쓸 수 있습니다.', 
        callbacks: {
            onImageUpload: function (files, editor, welEditable) {

                for (let file of files) {
                    sendFile(file, this);
                } // for of
            } // onImagaUpload

        } // callbacks
    }); // .summernote
} // readySummernote

// 이미지 업로드
const sendFile = (file, el) => {
	
    const form_data = new FormData();
    form_data.append('file', file);
    $1.ajax({
        url: "/img/new",
        type: "POST",
        data: form_data,
        enctype: "multipart/form-data",
        processData: false,
        cache: false,
        contentType: false,
        success: function (data) {

            // console.log(data.data.fileUrl);

            $1(el).summernote('insertImage', data.data.fileUrl, function ($image) {
                $image.css('width', "100%");
            });
        } // success
    }) // .ajax
} // sendFile

// 임시저장 등록 알림창
const alert = (message, type) => {
    const alertArea = document.querySelector('#tmpAlert');

    const str = `<div class="alert alert-${type} alert-dismissible d-flex align-items-center" role="alert">`
        + `<div>${message}</div></div>`

    alertArea.innerHTML += str;

    setTimeout(() => alertArea.innerHTML = '', 2000);
} // alert

// 게시글 등록
const regBoard = (tmpSave) => {
    const title = document.querySelector('#title').value;
    const content = document.querySelector('#summernote').value;

    const params = {
        "userId": userId,
        "commPostTitle": title,
        "commPostContents": content,
        "commTempsave": tmpSave
    }

    $1.ajax({

        url: "/board/api/new",
        type: "POST",
        data: params,
        success: data => {
            console.log(data);

            if (tmpSave == 1) {
                getTmpList();
                alert("임시저장 완료되었습니다.", "success");
            } else {
                $('#regConfirmModal').modal('hide');
                $('#regModal').modal('show');
                
                commId = data.data.commId;
            } // if-else
        } // success
    }) // .ajax
} // regBoard

// 게시글 수정
const modifyBoard = () => {
    const title = document.querySelector('input[name=title]').value;
    const content = document.querySelector('#summernote').value;
	
    const params = {
        "commId": commId,
        "commPostTitle": title,
        "commPostContents": content,
        "commTempsave": '0'
    }
    console.log(params);
    
    $1.ajax({

        url: "/board/api/" + commId,
        type: "PUT",
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(params),
        success: data => {
            console.log(data);

            $('#regConfirmModal').modal('hide');
            $('#regModal').modal('show');
        } // success
    }) // .ajax
} // modifyBoard

// 임시저장목록 조회
const getTmpList = () => {

    $1.ajax({

        url: "/board/api/tmp?userId=" + userId,
        type: "GET",
        async: false,
        success: data => {
            console.log(data.data.result);

            const listArea = document.querySelector('#tmpsaveModal .offcanvas-body');
            let str = '';

            if (data.data.result.length == 0) {
                str += '<p>임시저장된 글이 없습니다.</p>';
            } else {

                $1.each(data.data.result, (i, e) => {
                    str += '<div class="tmpList">'
                        + '<small>' + e.commPostInsertTs + '</small>'
                        + '<p onclick="getBoard(' + e.commId + ')">' + e.commPostTitle + '</p>'
                        + '<i class="fas fa-trash" onclick="deleteTmpSave(' + e.commId + ')"></i></div>';
                })
            } // if-else

            listArea.innerHTML = str;
        } // success
    }) // .ajax
} // getTmpList

// 임시저장 삭제
const deleteTmpSave = (commId) => {

    $1.ajax({

        url: "/board/api/" + commId,
        type: "DELETE",
        success: () => {
            getTmpList();
            alert('임시저장 삭제가 완료되었습니다.', 'danger');
        } // success
    }) // .ajax
} // deleteTmpSave

// 게시글 상세조회
const getBoard = (id) => {
    $1.ajax({

        url: "/board/api/" + id,
        type: "GET",
        success: data => {
            console.log(data);

            const board = data.data.result.board;

            commId = board.commId;
            document.querySelector('input[name=userId]').value = board.userId;
            document.querySelector('input[name=title]').value = board.commPostTitle;
            $1('#summernote').summernote('code', `${board.commPostContents}`);
        } // success
    }) // .ajax
} // getBoard

// 등록완료시 게시글상세조회 페이지로 넘어감
const completeReg = () => {
	location.href = "/board/" + commId;
} // completeReg


// ==============EVENT HANDLER=============== //

document.querySelector('#regConfirmBtn').addEventListener('click', () => {
    if(commId != '') modifyBoard();
    else regBoard(0);
}) // onclick

readySummernote();
if (commId != '') getBoard(commId);
