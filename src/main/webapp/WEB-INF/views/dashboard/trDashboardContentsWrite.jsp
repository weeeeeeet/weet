<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>트레이너 공지사항, 코칭계획 작성창 trDashboardContents</title>
    
    <!-- jquery -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.0/jquery-migrate.min.js"></script>

     <!-- favicon -->
     <link rel="shortcut icon" href="/resources/ico/favicon.ico" type="image/x-icon">
     <link rel="icon" href="/resources/ico/favicon.ico" type="image/x-icon">
 
     <!-- Bootstrap CSS -->
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
         integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
 
     <!-- 외부 스타일 시트 연결 -->
     <!-- 트레이너 글쓰기 팝업창 css -->
    <!-- <link href="css/weet_admin_home.css" rel="stylesheet"> -->
    <link href="/resources/css/dashboard/trDashboardContentsWrite.css" rel="stylesheet">

     <!-- 폰트어썸 설정 -->
     <script src="https://kit.fontawesome.com/63eb3bc178.js" crossorigin="anonymous"></script>
 
     <!-- 외부 JS 연결 -->
    
       <!-- Bootstrap JS -->
	   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	   integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	   crossorigin="anonymous"></script>

</head>
<body>


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

	       <!-- 글 작성 대시보드 -->
	       <div class="writerdash g">
		      	<!-- 글 작성창 불러오기 -->
		   		<%@ include file="/WEB-INF/views/include/trDashboardWrite.jsp" %>
	       </div>

       </div>
   </section>


   <!-- footer 불러오기 -->
   <%@ include file="/WEB-INF/views/include/footer.jsp" %>

     
</body>
</html>