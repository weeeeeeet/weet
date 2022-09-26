<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>loginPost</title>

    <!-- favicon -->
    <link rel="shortcut icon" href="/resources/ico/favicon.ico" type="image/x-icon">
    <link rel="icon" href="/resources/ico/favicon.ico" type="image/x-icon">
</head>
<body>
	<c:if test="${userId eq null}">
        <a href="">
            <img src="/img/kakao_account_login_btn_medium_wide_ov.png">
        </a>
    </c:if>
    <c:if test="${userId ne null}">
        <h1>로그인 성공입니다</h1>
    </c:if>
    
	<script>
		setTimeout(function () {
	        self.location = "/coupons/book";
	    }, 3000);
		
	        
    </script>

</body>
</html>