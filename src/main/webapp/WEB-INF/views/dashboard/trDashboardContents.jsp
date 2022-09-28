<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>트레이너 공지사항, 코칭계획 작성창 trDashboardContents</title>

     <!-- favicon -->
     <link rel="shortcut icon" href="/resources/ico/favicon.ico" type="image/x-icon">
     <link rel="icon" href="/resources/ico/favicon.ico" type="image/x-icon">
 
     <!-- Bootstrap CSS -->
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
         integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
 
     <!-- 외부 스타일 시트 연결 -->
     <!-- 트레이너 글쓰기 팝업창 css -->
    <!-- <link href="css/weet_admin_home.css" rel="stylesheet"> -->
    <link href="/resources/css/dashboard/trDashboardContents.css" rel="stylesheet">

     <!-- 폰트어썸 설정 -->
     <script src="https://kit.fontawesome.com/63eb3bc178.js" crossorigin="anonymous"></script>
 
     <!-- 외부 JS 연결 -->
 
    <!-- jquery -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.0/jquery-migrate.min.js"></script>

</head>
<body>

       <!-- Bootstrap JS -->
       <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
       integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
       crossorigin="anonymous"></script>


   <!-- header 불러오기 -->
   <%@ include file="/WEB-INF/views/include/header.jsp" %>
   
   <!-- contents -->
   <section class="wrap">

       <!-- sidebar 불러오기 -->
         <%@ include file="/WEB-INF/views/include/sidebarTr.jsp" %>

       <!--대시보드 -->
       <div class="dash g">

           <div class="g">
               <h1>트레이너 대시보드</h1>
           </div>

          <!-- 공지사항 컨텐츠 대시보드 -->
          <div class="notice-content-dash g">

            <div class="g">
                <h2>클래스 공지사항</h2>
            </div>

            <c:if test="${not empty __NOTICECONTENTS__}">
                <div class="g n_contents_box">
                    <!--공지사항 제목 -->
                    <div class="g contents_title">
                        제목 : <c:out value="${__NOTICECONTENTS__.n_title}"/>
                    </div> 

                    <!-- 공지사항 날짜 -->
                    <div class="g contents_date">
                        <fmt:formatDate pattern="yyyy/MM/dd" value="${__NOTICECONTENTS__.n_ts}" />
                    </div>

                    <!-- 공지사항 내용 -->
                    <div class="g contents">
                        <c:out value="${__NOTICECONTENTS__.n_content}"/>
                    </div>
                </div>
            </c:if>

            <c:if test="${not empty __COACHINGCONTENTS__}">
                <div class="g c_contents_box">
                    <!-- 코칭계획 제목 -->
                    <div class="g contents_title">
                        제목 : <c:out value="${__COACHINGCONTENTS__.n_title}"/>
                    </div> 

                    <!-- 코칭계획 날짜 -->
                    <div class="g contents_date">
                        <fmt:formatDate pattern="yyyy/MM/dd" value="${__COACHINGCONTENTS__.n_ts}" />
                    </div>

                    <!-- 코칭계획 내용 -->
                    <div class="g contents">
                        <c:out value="${__COACHINGCONTENTS__.n_content}"/>
                    </div>
                </div>
            </c:if>
            


            <div class="g btn_box">
                    <a href="/dashboard/tr/noticeplan" target="self"><h4 class="list g">목록</h4></a>
                 <a href="#" target="self"><h5 class="update g">수정</h4></a>
                 <a href="#" target="self"><h4 class="delete g">삭제</h4></a>
            </div>
             
     
        </div>

       
   </section>


   <!-- footer 불러오기 -->
   <%@ include file="/WEB-INF/views/include/footer.jsp" %>

     
</body>
</html>