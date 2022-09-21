<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>1대1 문의 작성</title>

    <!-- favicon -->
	<link rel="shortcut icon" href="${path}/resources/ico/favicon.ico" type="image/x-icon">
	<link rel="icon" href="${path}/resources/ico/favicon.ico" type="image/x-icon">
    <!-- icon -->
    <script src="https://kit.fontawesome.com/63eb3bc178.js" crossorigin="anonymous"></script>
    <!-- font -->
    <link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet">

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.0/jquery-migrate.min.js" integrity="sha512-QDsjSX1mStBIAnNXx31dyvw4wVdHjonOwrkaIhpiIlzqGUCdsI62MwQtHpJF+Npy2SmSlGSROoNWQCOFpqbsOg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <link rel="stylesheet" href="${path}/resources/css/help/inquiryWrite.css">
    <script src="loadHTML.js"></script>

 	<script type="text/javascript">
 	
	 function fnSubmit() {
	 		if(confirm("문의글을 등록하시겠습니까?") == true) {
	 			alert("문의글이 등록되었습니다.");
	 		}
	 		else {
	 			return;
	 		}
	 }

 	</script>
</head>

<body>

    <div class="wrap">

    <!-- ==================HEADER==================== -->
     <%@ include file="/WEB-INF/views/include/header.jsp" %>

        
    <section class="FAQ_search_bar">
        <div class="FAQ_box">
            <p class="FAQ_text">무엇을 도와 드릴까요?</p>

            <div class="banner_search">
                <input type="text" name="search"placeholder="질문을 검색해 주세요" autocomplete="off" />
                <a href="#" class="fa-solid fa-magnifying-glass" target="_self"></a>
            </div>
        </div>
        <br>
    </section>

 
    <div class="inner">

        <section class="contents">

            <nav class="inquiry_menu">
                <h1 class="inquiry_home">1:1 문의</h1>
                 
            </nav>

            <form action="/help/inquiry/register" method="post" onsubmit="return fnSubmit()">
            
		        <div class="inquiry_box1">
	               <div class="inquiry_inner">
	                   
	                   <!-- 카테고리 -->
	                   <div class="board_categories">
	                       <p class="subject boardcategories">문의유형</p>
	                       <select name="inquiryType" class="">
	                           <option value="1">결제문의</option>
	                           <option value="2">계정문의</option>
	                           <option value="3">오류신고</option>
	                           <option value="4">건의사항</option>
	                           <option value="5">클래스환불</option>
	                       </select>
	                   </div>
	                   
	                    <!-- 답변받을 전화번호 -->
	                   <div class="board_phone">
	                       <p class="subject boardcategories">답변을 받을 전화번호</p>
	                       <div class="phone_number">
	                           <input type="tel" class="form-control" name="inquiryPhone" id="phone"
	                               placeholder="010-0000-0000 ('-' 없이 입력)" pattern="\d*" minlength="10" maxlength="11"
	                               required>
	                           <div class="invalid-feedback">
	                               올바른 전화번호를 입력해주세요.
	                           </div>
	                       </div>
	                   </div>
	   
	                       
                       <div class="boardtitle_box">
                           <label class="subject boardtitle">제목</label>
                           <input type="text" name="csTitle" placeholder="&nbsp제목을 입력해주세요" required>
                       </div>
	                       
                       <div class="board_contents_box">
                           <label class="subject boardtitle">내용</label>
                           <textarea id="content" name="csContent" title="내용" cols="89" rows="10"  required>
                           </textarea>
                       </div>
						
             
                       <hr>
                       
                       <!-- 약관동의 -->
                       <div class="agreement">
                           <input type="hidden" name="kboard_option_info" value="0">
                           <label><input type="checkbox" name="inquiry_agmt_yn" value="1" id="info" required>
                               &nbsp개인정보 수집 및 이용에 동의합니다. 1:1문의를 위한 최소한의 개인정보만을 수집하고 있습니다. 개인정보는 '개인정보 처리방침'에 근거하여 관리합니다.(필수)
                         	</label>
                       </div>
                       
                       <!-- 하단 버튼 -->
	                   <div id="inquiry_button">
				           <!-- <button id="writeSave" type="button">임시저장</button> -->
				           <button id="writeUpload" type="submit">접수하기</button>
	                   </div>
	                   
	               </div>
		         </div>
             </form>
        </section>


    </div>



    </div>

   	<!-- ==================FOOTER==================== -->
    
    <%@ include file="/WEB-INF/views/include/footer.jsp" %>
    
    <script>includeHTML();</script>

</body>

</html>