<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>클래스 등록 페이지4</title>

    <link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/63eb3bc178.js" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="${path}/resources/css/class/reg3.css" />

    <script src="/js/weet_class_reg2_4.js"></script>
    <script src="/js/loadHTML.js"></script>

   <!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> --> 

   <!-- favicon -->
	<link rel="shortcut icon" href="${path}/resources/ico/favicon.ico" type="image/x-icon">
	<link rel="icon" href="${path}/resources/ico/favicon.ico" type="image/x-icon">
   
</head>

<body>
    <%@ include file="/WEB-INF/views/include/header.jsp" %>

    <!-- ==================CONTENTS==================== -->
    <div class="contents">
        <div class="cont_bar">
            <h3>클래스 등록</h3>
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
                <progress value="73" max="100"></progress>
            </div> 
        </div>

        <div class="con">
            <div class="class_curriculum">커리큘럼 등록
                <div class="qmark">
                    <a href="#"><p>?</p>
                       <div class="curriculum_explain">
                            <ul>
                                <li>클래스 교육과정(커리큘럼)을 구분에 맞게 단계별로 작성 후
                                    '+' 버튼을 눌러주세요.</li>
                            </ul>
                        </div>
                    </a>
                </div> 
            </div>

            <div class="step">
                <div class="step1"><p>1단계</p></div>
                <h1>타이틀</h1>
                <p>스쿼트, 런지, 크로스핏, 브릿지, 플랭크, 푸시업의 자세를 배웁니다.</p>
                <button class="edit" onclick="수정">수정</button>
                <button class="delete" onclick="삭제">삭제</button>
            </div>
            <div class="step">
                <div class="step1"><p>1단계</p></div>
                <h1>타이틀</h1>
                <p>스쿼트, 런지, 크로스핏, 브릿지, 플랭크, 푸시업의 자세를 배웁니다.</p>
                <button class="edit" onclick="수정">수정</button>
                <button class="delete" onclick="삭제">삭제</button>
            </div>
            <div class="curri_write">
                <p>타이틀</p>
                <a href="추가"><i class="fa-solid fa-circle-plus"></i></a>
                <input type="text" placeholder="커리큘럼 제목을 입력해주세요.">
                <p>세부내용</p>
                <input type="text" placeholder="커리큘럼의 세부내용을 적어주세요.">
            </div>


        </div>
            
        <div class="page_button">
            <button type="button" class="back" onclick="location.href='2'">이전</button>
            <button type="button" class="next" onclick="location.href='4'">다음</button>
        </div>
    
    </div>    
    
    <!-- ==================FOOTER==================== -->
    <%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>

</html>