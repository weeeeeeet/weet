<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>클래스 등록 페이지5</title>

    <link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/63eb3bc178.js" crossorigin="anonymous"></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>

   <link rel="stylesheet" href="${path}/resources/css/classes/reg4.css" />

    <script src="/js/weet_class_reg2_4.js"></script>
    <script src="/js/loadHTML.js"></script>

   <!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> --> 

   
   <!-- 카카오 주소검색 API -->
   <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

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
                <progress value="90" max="100"></progress>
            </div> 
        </div>

        <div class="con">
            <div class="facilities">기타 제공사항 선택(복수 선택 가능)</div>

            <div class="facil_check">
                <div class="checkbox1">
                    <input type="checkbox" id="apple">
                    <label for="apple">샤워실</label>
                    <br><br>
                    <input type="checkbox" id="banana">
                    <label for="banana">개인 사물함</label>
                </div>
                <div class="checkbox2">
                    <input type="checkbox" id="apple">
                    <label for="apple">타올</label>
                    <br><br>
                    <input type="checkbox" id="banana">
                    <label for="banana">주차공간</label>
                </div>
                <div class="checkbox3">
                    <input type="checkbox" id="apple">
                    <label for="apple">운동복</label>
                    <br><br>
                    <input type="checkbox" id="banana">
                    <label for="banana">와이파이</label>
                </div>
            </div>

            <div class="location">위치정보<span>*</span></div>

            <div class="location_search">
                <input type="text" id="address_kakao" name="address" readonly placeholder="검색창을 클릭하여 도로명을 검색해주세요." required>
                <!-- <button class="road" onclick="도로명 검색">도로명 검색</button> -->
                <div class="detail_location"><input type="text" name="address_detail" placeholder="상세 주소를 입력해주세요." required></div>
            </div>
            
        </div>


        <div class="page_button">
            <button type="button" class="back" onclick="location.href='3'">이전</button>
            <button type="submit" class="next" onclick="location.href='fin'">다음</button>
        </div>
    
    </div>    
    
    <!-- ==================FOOTER==================== -->
    <%@ include file="/WEB-INF/views/include/footer.jsp" %>
    
</body>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
window.onload = function(){
    document.getElementById("address_kakao").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("address_kakao").value = data.address; // 주소 넣기
                document.querySelector("input[name=address_detail]").focus(); //상세입력 포커싱
            }
        }).open();
    });
}
</script>

</html>