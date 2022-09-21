
// 파일첨부 & 이미지 미리보기============================================
function readImage(input) {
    // 인풋 태그에 파일이 있는 경우
    if(input.files && input.files[0]) {
        // 이미지 파일인지 검사 (생략)
        // FileReader 인스턴스 생성
        const reader = new FileReader()
        // 이미지가 로드가 된 경우
        reader.onload = e => {
            const previewImage = document.getElementById("preview-image")
            previewImage.src = e.target.result
        }
        // reader가 이미지 읽도록 하기
        reader.readAsDataURL(input.files[0])
    }
}
// input file에 change 이벤트 부여
const inputImage = document.getElementById("input-image")
inputImage.addEventListener("change", e => {
    readImage(e.target)
})

// 텍스트 입력 (추가할 수 있는 버전)========================================================================
const add_textbox = () => {
    const box = document.getElementById("box");
    const newP = document.createElement('p');
    newP.innerHTML = "<input type='text'> <input type='button' value='삭제' onclick='remove(this)'>";
    box.appendChild(newP);
}
const remove = (obj) => {
    document.getElementById('box').removeChild(obj.parentNode);
}