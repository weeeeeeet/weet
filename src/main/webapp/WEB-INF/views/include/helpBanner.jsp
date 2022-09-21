<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자주 묻는 질문</title>
    <link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/63eb3bc178.js" crossorigin="anonymous"></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>
        
    <!-- favicon -->
	<link rel="shortcut icon" href="${path}/resources/ico/favicon.ico" type="image/x-icon">
	<link rel="icon" href="${path}/resources/ico/favicon.ico" type="image/x-icon">
	
    <link rel="stylesheet" href="${path}/resources/css/include/helpBanner.css">
    <script src="loadHTML.js"></script>
    
    <script>

		
		$(".banner_search button").on("click", function(e){
	        e.preventDefault();
	        let val = $("input[name='keyword']").val();
	        moveForm.find("input[name='keyword']").val(val);
	        moveForm.find("input[name='pageNum']").val(1);
	        moveForm.submit();
	    });
		
    </script>
</head>

<body>
    <!-- ==================COMM==================== -->
	<form method="get"  id="listForm" action="/help/qna">

    <section class="FAQ_search_bar">
        <div class="FAQ_box">
            <p class="FAQ_text">무엇을 도와 드릴까요?</p>

            <div class="banner_search">
                <input type="text" name="keyword" value="${pageMaker.cri.keyword}"
						placeholder="질문을 검색해 주세요"
						autocomplete="off"> 
						<button>버튼</button>
				<a href="#" id="searchicon" class="fa-solid fa-magnifying-glass"></a>
            </div>

        </div>
        <br>
    </section>


</body>

</html>