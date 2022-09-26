<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>클래스 등록 페이지1</title>

    <link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/63eb3bc178.js" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="${path}/resources/css/class/reg1.css" />

   <!-- favicon -->
	<link rel="shortcut icon" href="${path}/resources/ico/favicon.ico" type="image/x-icon">
	<link rel="icon" href="${path}/resources/ico/favicon.ico" type="image/x-icon">
</head>

<body>
    <%@ include file="/WEB-INF/views/include/header.jsp" %>

    <!-- ==================CONTENTS==================== -->
    <div class="contents">
        <h3>클래스 등록</h3>

        <div class="cont_bar">
            <div class="txt">
                <div class="c1">
                    <li>클래스 등록하기</li>
                    <li>></li>
                    <li>클래스 기본정보</li>
                    <li>></li>
                    <li>스케줄 및 부가정보</li>
                    <li>></li>
                    <li>커리큘럼</li>
                    <li>></li>
                    <li>헬스장정보</li>
                    <li>></li>
                    <li>등록완료</li>
                </div>
            </div>
            <div class="bar">
                <progress value="37" max="100"></progress>
            </div> 
        </div>
        <div class="con">
        <form action="<c:url value='1' />" method="post">
            <div class="cla1">클래스 구분</div>
            <select name="classType" class="tag">
                <option value="1">개인</option>
                <option value="2">그룹</option>
            </select>
            
                <div class="cla2">클래스 대표 사진 등록<span>*</span> 
                    <div class="qmark">
                        <a href="#"><p>?</p>
                            <div class="photo_explain">
                                <ul>
                                    <li>대표 사진으로 지정되어 클래서 및 상세 페이지에서 썸네일로 노출됩니다.</li><br>
                                    <li>고화질의 가로형 사진을 권장합니다.</li>
                                </ul>
                            </div>
                        </a>
                    </div>
            </div>
          
            <div class="picAndText g">
                <!-- 사진 첨부파일 -->
                <div class="image-container g">
                    <!-- 이미지 미리보기 -->
                    <p class="g">
                        <li>사진은 가로로 찍은 사진을 권장합니다.(가로 사이즈 최소 800px)</li>
                        <li>사진 용량은 사진 한 장당 10MB까지 등록 가능합니다.</li>
                        <li>사진은 대표사진 1장만 첨부 가능합니다.</li>
                    </p>
                    <p>
                        <img class="g" style="width: 150px;" id="preview-image"
                            src="https://dummyimage.com/300x300/ffffff/000000.png&text=preview+image">
                    </p>

                    <!-- 파일선택 버튼 -->
                    <div class="image-select-btn g">
                        <p><input style="display: block;" type="file" id="input-image" onchange="checkSize(this)"></p>
                    </div>
                </div>
                
                <script>
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

                    function checkSize(input) {
                        if (input.files && input.files[0].size > (20 * 1024 * 1024)) {
                            alert("파일 사이즈가 20mb 를 넘습니다.");
                            input.value = null;
                        }
                    }
                </script>

                <div class="cla3">클래스 제목<span>*</span> 
                    <div class="qmark">
                        <a href="#"><p>?</p>
                            <div class="title_explain">
                                <ul>
                                    <li>Wee.T 클래스 리스트, 상세페이지에 가장 먼저 노출되는 제목으로,
                                        단순한 제목보다는 유니크한 나만의 클래스 제목으로 노출해보세요.</li>
                                </ul>
                            </div>
                        </a>
                    </div>
                    <div>
                        <input type="text" name="classTitle" class="ct_input" placeholder="&nbsp&nbsp클래스 제목을 입력해주세요" required>
                    </div>
                </div>
        
                <div class="cla4">클래스 소개 입력<span>*</span>
                    <div class="qmark">
                        <a href="#"><p>?</p>
                            <div class="introduce_explain">
                                <ul>
                                    <li>클래스 상세 정보에 노출되는 소개글로 커리큘럼을 제외한 클래스 정보를
                                        작성해주세요.
                                    </li>
                                </ul>
                            </div>
                        </a>
                    </div>
                    <div>
                        <input type="text" name="classIntro" class="ct_input" placeholder="&nbsp&nbsp클래스 소개를 입력해주세요" required>
                    </div>
                </div>
        
                <div class="cla5">동영상 소개
                    <div class="qmark">
                        <a href="#"><p>?</p>
                            <div class="video_explain">
                                <ul>
                                    <li>클래스 소개를 위한 동영상이 있다면 링크를 입력해주세요.
                                    </li>
                                </ul>
                            </div>
                        </a>
                    </div>
                    <div>
                        <input type="text" name="classVideoUrl" class="ct_video" placeholder="&nbsp&nbsp유튜브 패널 영상이 있다면 URL을 입력해주세요">
                    </div>
                </div>    
            
            <div class="page_button">
                <button type="submit" class="next" >다음</button>
            </div>
            
            </form>
            
            
        </div>
    	</div>

	</div>

    
    <!-- ==================FOOTER==================== -->

    <%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>

</html>