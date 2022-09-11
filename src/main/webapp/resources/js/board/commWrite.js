
// 섬머노트 세팅
const readySummernote = () => {
    $('#summernote').summernote({
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
    $.ajax({
        url: "/img/new",
        type: "POST",
        data: form_data,
        enctype: "multipart/form-data",
        processData: false,
        cache: false,
        contentType: false,
        success: function (data) {

            // console.log(data.data.fileUrl);

            $(el).summernote('insertImage', data.data.fileUrl, function ($image) {
                $image.css('width', "100%");
            });
        } // success
    }) // .ajax
} // sendFile

// 임시저장 등록 알림창
const alert = (message, type) => {
    const alertArea = document.querySelector('#tmpAlert');

    const str = `<div class="alert alert-${type} alert-dismissible d-flex align-items-center" role="alert">`
        + `<svg class="bi flex-shrink-0 me-2" role="img" aria-label="Success:">`
        + `<use xlink:href="#check-circle-fill" />`
        + `</svg>`
        + `<div>${message}</div></div>`

    alertArea.innerHTML += str;

    setTimeout(() => alertArea.innerHTML = '', 2000);
} // alert

const regBoard = (tmpSave) => {
    const userId = "user2";	// 나중에 수정 필요
    const title = document.querySelector('#title').value;
    const content = document.querySelector('#summernote').value;

    const params = {
        "userId": userId,
        "commPostTitle": title,
        "commPostContents": content,
        "commTempsave": tmpSave
    }

    $.ajax({

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
            } // if-else
        } // success
    }) // .ajax
} // regBoard

const getTmpList = () => {
    const params = {
        "userId": "user2"
    }

    $.ajax({

        url: "/board/api/tmp",
        type: "GET",
        data: params,
        async: false,
        success: data => {
            console.log(data.data.result);

            const listArea = document.querySelector('#tmpsaveModal .modal-body');
            let str = '';

            if (data.data.result.length == 0) {
                str += '<p>임시저장된 글이 없습니다.</p>';
            } else {

                $.each(data.data.result, (i, e) => {
                    str += '<div class="tmpList">'
                        + '<small>' + e.commPostInsertTs + '</small>'
                        + '<p>' + e.commPostTitle + '</p>'
                        + '<i class="fas fa-trash" onclick="deleteTmpSave(' + e.commId + ')"></i></div>';
                })
            } // if-else

            listArea.innerHTML = str;
        } // success
    }) // .ajax
} // getTmpList

const deleteTmpSave = (commId) => {

    $.ajax({

        url: "/board/api/" + commId,
        type: "DELETE",
        success: () => {
            alert('임시저장 삭제가 완료되었습니다.', 'danger');
            getTmpList();
        } // success
    }) // .ajax
} // deleteTmpSave

readySummernote();
