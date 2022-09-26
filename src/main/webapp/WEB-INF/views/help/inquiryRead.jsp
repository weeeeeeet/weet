<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>1대1 문의</title>

	<!-- css -->
    <link rel="stylesheet" href="${path}/resources/css/help/inquiryRead.css">
    <link rel="stylesheet" href="/resources/vendors/bootstrap/bootstrap.min.css">
    
    <!-- favicon -->
	<link rel="shortcut icon" href="${path}/resources/ico/favicon.ico" type="image/x-icon">
	<link rel="icon" href="${path}/resources/ico/favicon.ico" type="image/x-icon">
	
    <!-- icon -->
    
    <script src="https://kit.fontawesome.com/63eb3bc178.js" crossorigin="anonymous"></script>
    
    <!-- font -->
    <link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet">


    <script src="loadHTML.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>


	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.0/jquery-migrate.min.js" integrity="sha512-QDsjSX1mStBIAnNXx31dyvw4wVdHjonOwrkaIhpiIlzqGUCdsI62MwQtHpJF+Npy2SmSlGSROoNWQCOFpqbsOg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    
    <script>

    	$(function() {
    		
    		$('#modifyBtn').on('click', () => { 
    			self.location = "/help/inquiry/modify?serviceNo=${_INQUIRY_.serviceNo}";
    		}); // .onclick
    		
    		$('#deleteBtn').on('click', () => { 
				let formObj = $('form');
				
				// formObj.attr(속성이름, 속성값);
				// formObj.submit(); => 요청전송
                formObj.attr('action', '/help/inquiry/remove?serviceNo=${_INQUIRY_.serviceNo}');
                formObj.attr('method', 'post');
                
				if(confirm("문의글을 삭제하시겠습니까?") == true) {
		 			alert("문의글이 삭제되었습니다.");
		 			
                	formObj.submit();
                
		 		}
                else {
    	 			return;
    	 		}
                
    		}); // .onclick
    	});
    	
    </script>
</head>

<body>

    <div class="wrap">

    <!-- ==================HEADER==================== -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
        
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

           <div class="inquiry_box1">
                <div class="inquiry_inner">
                    
                    <div class="question">
                        <i class="inquiry_confirmation_q fas fa-q" ></i>
                        <div class="question_inner">
                            <div class="cate_phone">
                                <div class="board_categories" name="inquiryType">
                                  <c:if test="${_INQUIRY_.inquiryType eq '1'}">
						<p>결제문의</p>
					  </c:if>
					  <c:if test="${_INQUIRY_.inquiryType eq '2'}">
						<p>계정문의</p>
					  </c:if> 
					  <c:if test="${_INQUIRY_.inquiryType eq '3'}">
						<p>오류신고</p>
					  </c:if> 
					  <c:if test="${_INQUIRY_.inquiryType eq '4'}">
						<p>건의사항</p>
					  </c:if> 
					  <c:if test="${_INQUIRY_.inquiryType eq '5'}">
						<p>클래스환불</p>
					  </c:if> 
                                </div>
                            </div>
                            
                            <div class="boardtitle_box">
                                <div class="title" name="csTitle"><p>${_INQUIRY_.csTitle}</p></div>
                            </div>
                            
                            <div class="inquiry_date" name="csTs">
                                <p>${_INQUIRY_.csTs}</p>
                            </div>
                        </div>
                        
                    </div>
					
					<!-- 질문 내용 박스 -->
                    <div class="board_contents_box" name="csContent"><p>${_INQUIRY_.csContent}</p> </div>
					
					<div class="inquiry_phone" name="inquiry_phone">
                    	<p>전화번호: ${_INQUIRY_.inquiryPhone}</p>
                    </div>
					
                    <c:if test="${_INQUIRY_.inquiryReplyTitle != null}" >       
                    <div class="answer">
                        <i class="answer_confirmation_q fa-solid fa-a" ></i>
                        <div class="answer_inner">
                            <div class="answertitle_box">
                                <div class="title"><p>${_INQUIRY_.inquiryReplyTitle}</p></div>
                            </div>
                            
                            <div class="answer_date">
                                <p><fmt:formatDate pattern = "yyyy-MM-dd HH:mm:ss" value="${_INQUIRY_.inquiryReplyTs}"/></p>
                            </div>
                        </div>
                    </div>

					<!-- 답변내용 박스 -->
                    <div class="answer_contents_box"><p>${_INQUIRY_.inquiryReplyContent}</p></div>
					</c:if>
				
					<!-- 하단 버튼 -->
					<div class=list_delete_btn>
                         <button type="button" onclick="location.href='${path}/help/inquiry'" class="inquiry_list"><p>목록</p></button>
                         <c:if test="${_INQUIRY_.inquiryReplyTitle eq null}">
                         	<button type="button" id="modifyBtn" class="inquiry_modify"><p>수정</p></button>
                         </c:if>
                         <button type="button"  id="deleteBtn" class="inquiry_delete"><p>삭제</p></button>
                    </div>
                </div>
                
            </div>
            
           
        </section>


        </div>


        <!-- ==================FOOTER==================== -->

        		<%@ include file="/WEB-INF/views/include/footer.jsp"%>

	<script>
		includeHTML();
	</script>

    </div>


</body>

</html>