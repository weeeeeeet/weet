<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>회원 식단 피드백 내용</title>

     <!-- favicon -->
     <link rel="shortcut icon" href="/resources/ico/favicon.ico" type="image/x-icon">
     <link rel="icon" href="/resources/ico/favicon.ico" type="image/x-icon">
 
     <!-- Bootstrap CSS -->
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
         integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
 
     <!-- 외부 스타일 시트 연결 -->
     <!-- 유저 대시보드 css -->
     <link href="/resources/css/dashboard/userFeedbackContents.css" rel="stylesheet" />
 
     <!-- 폰트어썸 설정 -->
     <!-- <link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet"> -->
     <script src="https://kit.fontawesome.com/63eb3bc178.js" crossorigin="anonymous"></script>
 
     <!-- 외부 JS 연결 -->


</head>
<body>
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous">
    </script>

    <section class="wrap">

        <!-- 날짜 & 회원 이름 -->
        <div class="title g">
            <h1>2022년 08월 01일</h1>
            <h2>Darlene Robertson 회원님의 식단입니다.</h2>
        </div>

        <!-- 취소 버튼 -->
        <div class="cancel">
            <button class="cancel_btn g" name="writeCancel">
                <i class="fas fa-x"></i>
            </button>
        </div>
        
        <!-- 식단 사진 & 내용 -->
        <div class="g">
            <!-- 식단 사진 -->
            <div class="contents g">
                <img src="https://picsum.photos/id/493/600/400" class="card-img-top" alt="">
            </div>
    
            <!-- 식단 내용 -->
            <div>
                <p>아침 : 생선구이, 방울토마토 샐러드, 현미밥</p>
            </div>
        </div>

        <div class="g">
            <!-- 식단 사진 -->
            <div class="contents g">
                <img src="https://picsum.photos/id/493/600/400" class="card-img-top" alt="">
            </div>
    
            <!-- 식단 내용 -->
            <div>
                <p>점심 : 고구마, 리코타 치즈 샐러드, 계란</p>
            </div>
        </div>

        <!-- 트레이너 피드백 -->
        <div class="g">
            <!-- 트레이너 프로필 사진 -->
            <div>
                <img src="https://picsum.photos/id/550/200/200" alt="">
            </div>

            <div class="g">
                <h3>김운동 트레이너</h3>
            </div>

            <!-- 피드백 내용 -->
            <div class="g">
                <p>
                    안녕하세요 회원님 ^^
                    오늘도 식단 잘하셨습니다. 단백질을 50g정도 더 챙겨드시면 좋을 것 같습니다!
                    화이팅입니다!
                </p>
            </div>
        </div>

    </section>

</body>
</html>l