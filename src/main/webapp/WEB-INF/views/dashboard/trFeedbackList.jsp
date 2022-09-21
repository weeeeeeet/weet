<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>trFeedbackList</title>

    <!-- favicon -->
    <link rel="shortcut icon" href="/resources/ico/favicon.ico" type="image/x-icon">
    <link rel="icon" href="/resources/ico/favicon.ico" type="image/x-icon">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!-- 외부 스타일 시트 연결 -->
    <!-- 유저 대시보드 css -->
    <link href="/resources/css/dashboard/trFeedbackList.css" rel="stylesheet" />

    <!-- 폰트어썸 설정 -->
    <!-- <link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet"> -->
    <script src="https://kit.fontawesome.com/63eb3bc178.js" crossorigin="anonymous"></script>

    <!-- 외부 JS 연결 -->


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

        <!-- 회원목록 대시보드 -->
        <div class="user-list g">

            <!-- 회원목록 타이틀 & 문구 -->
            <div class="title-box g">
                <h2>회원목록</h2>
                <h3 class="text g">관리를 원하는 회원의 프로필을 선택해주세요.</h3>
            </div>

            <!-- 회원목록 리스트 테이블 박스 -->
            <div class="user-table-box g">

                <!-- 회원목록 테이블 -->
                <table class="user-table g">

                        <colgroup>
                            <col width="10%" />
                            <col width="10%" />
                            <col width="10%" />
                        </colgroup>

                    <thead class="theader">
                        <tr class="list-title g">    
                            <th class="g">이름</th>
                            <th class="g">스케쥴</th>
                            <th class="g">관리</th>
                        </tr>
                    </thead>

                        <!-- 회원 정보-->
                        <tbody class="tbody">
                            <tr class="user-info-list g">
    
                                <td class="name-box g">
                                    <div class="name">
                                            Darlene Robertson
                                    </div>
                                </td>
    
                                <td class="date g">
                                    월, 수, 금 오후 7:00
                                </td>
    
                                <td class="food-management g">
                                    <div class="food-bt-box g">
                                        <a class="food-link" href="/dashboard/tr/foodfb/manage" target="self">
                                            <div class="write-icon g">
                                                <i class="fas fa-pen-to-square"></i>
                                                <h4 class="text g">식단관리</h3>
                                            </div>
                                        </a>
                                    </div>
                                </td>
    
                            </tr>
                        </tbody>
                        
                        <!-- 회원 정보 2-->
                        <tbody class="tbody">
                            <tr class="user-info-list g">
    
                                <td class="name-box g">
                                    <div class="name">
                                        Marvin McKinney
                                    </div>
                                </td>
    
                                <td class="date g">
                                    월, 수, 금 오후 7:00
                                </td>
    
                                <td class="food-management g">
                                    <div class="food-bt-box g">
                                        <a class="food-link" href="/dashboard/tr/foodfb/manage" target="self">
                                            <div class="write-icon g">
                                                <i class="fas fa-pen-to-square"></i>
                                                <h4 class="text g">식단관리</h3>
                                            </div>
                                        </a>
                                    </div>
                                </td>
    
                            </tr>
                        </tbody>
    
                        <!-- 회원 정보 3-->
                        <tbody class="tbody">
                            <tr class="user-info-list g">
    
                                <td class="name-box g">
                                    <div class="name">
                                        Guy Hawkins
                                    </div>
                                </td>
    
                                <td class="date g">
                                    월, 수, 금 오후 7:00
                                </td>
    
                                <td class="food-management g">
                                    <div class="food-bt-box g">
                                        <a class="food-link" href="/dashboard/tr/foodfb/manage" target="self">
                                            <div class="write-icon g">
                                                <i class="fas fa-pen-to-square"></i>
                                                <h4 class="text g">식단관리</h3>
                                            </div>
                                        </a>
                                    </div>
                                </td>
    
                            </tr>
                        </tbody>
    
                        <!-- 회원 정보 4-->
                        <tbody class="tbody">
                            <tr class="user-info-list g">
    
                                <td class="name-box g">
                                    <div class="name">
                                        Devon Lane
                                    </div>
                                </td>
    
                                <td class="date g">
                                    월, 수, 금 오후 7:00
                                </td>
    
                                <td class="food-management g">
                                    <div class="food-bt-box g">
                                        <a class="food-link" href="/dashboard/tr/foodfb/manage" target="self">
                                            <div class="write-icon g">
                                                <i class="fas fa-pen-to-square"></i>
                                                <h4 class="text g">식단관리</h3>
                                            </div>
                                        </a>
                                    </div>
                                </td>
    
                            </tr>
                        </tbody>
    
                        <!-- 회원 정보 5-->
                        <tbody class="tbody">
                            <tr class="user-info-list g">
    
                                <td class="name-box g">
                                    <div class="name">
                                        Jenny Wilson
                                    </div>
                                </td>
    
                                <td class="date g">
                                    월, 수, 금 오후 7:00
                                </td>
    
                                <td class="food-management g">
                                    <div class="food-bt-box g">
                                        <a class="food-link" href="/dashboard/tr/foodfb/manage" target="self">
                                            <div class="write-icon g">
                                                <i class="fas fa-pen-to-square"></i>
                                                <h4 class="text g">식단관리</h3>
                                            </div>
                                        </a>
                                    </div>
                                </td>
    
                            </tr>
                        </tbody>
    
                        <!-- 회원 정보 6-->
                        <tbody class="tbody">
                            <tr class="user-info-list g">
    
                                <td class="name-box g">
                                    <div class="name">
                                        Cody Fisher
                                    </div>
                                </td>
    
                                <td class="date g">
                                    월, 수, 금 오후 7:00
                                </td>
    
                                <td class="food-management g">
                                    <div class="food-bt-box g">
                                        <a class="food-link" href="/dashboard/tr/foodfb/manage" target="self">
                                            <div class="write-icon g">
                                                <i class="fas fa-pen-to-square"></i>
                                                <h4 class="text g">식단관리</h3>
                                            </div>
                                        </a>
                                    </div>
                                </td>
    
                            </tr>
                        </tbody>
    
                        <!-- 회원 정보 7-->
                        <tbody class="tbody">
                            <tr class="user-info-list g">
    
                                <td class="name-box g">
                                    <div class="name">
                                        Ralph Edwards
                                    </div>
                                </td>
    
                                <td class="date g">
                                    월, 수, 금 오후 7:00
                                </td>
    
                                <td class="food-management g">
                                    <div class="food-bt-box g">
                                        <a class="food-link" href="/dashboard/tr/foodfb/manage" target="self">
                                            <div class="write-icon g">
                                                <i class="fas fa-pen-to-square"></i>
                                                <h4 class="text g">식단관리</h3>
                                            </div>
                                        </a>
                                    </div>
                                </td>
    
                            </tr>
                        </tbody>
    
                        <!-- 회원 정보 8-->
                        <tbody class="tbody">
                            <tr class="user-info-list g">
    
                                <td class="name-box g">
                                    <div class="name">
                                            Darlene Robertson
                                    </div>
                                </td>
    
                                <td class="date g">
                                    월, 수, 금 오후 7:00
                                </td>
    
                                <td class="food-management g">
                                    <div class="food-bt-box g">
                                        <a class="food-link" href="trainerFoodFeedback.html" target="self">
                                            <div class="write-icon g">
                                                <i class="fas fa-pen-to-square"></i>
                                                <h4 class="text g">식단관리</h3>
                                            </div>
                                        </a>
                                    </div>
                                </td>
    
                            </tr>
                        </tbody>
                        
                        <!-- 회원 정보 9-->
                        <tbody class="tbody">
                            <tr class="user-info-list g">
    
                                <td class="name-box g">
                                    <div class="name">
                                        Marvin McKinney
                                    </div>
                                </td>
    
                                <td class="date g">
                                    월, 수, 금 오후 7:00
                                </td>
    
                                <td class="food-management g">
                                    <div class="food-bt-box g">
                                        <a class="food-link" href="trainerFoodFeedback.html" target="self">
                                            <div class="write-icon g">
                                                <i class="fas fa-pen-to-square"></i>
                                                <h4 class="text g">식단관리</h3>
                                            </div>
                                        </a>
                                    </div>
                                </td>
    
                            </tr>
                        </tbody>
    
                        <!-- 회원 정보 10-->
                        <tbody class="tbody">
                            <tr class="user-info-list g">
    
                                <td class="name-box g">
                                    <div class="name">
                                        Guy Hawkins
                                    </div>
                                </td>
    
                                <td class="date g">
                                    월, 수, 금 오후 7:00
                                </td>
    
                                <td class="food-management g">
                                    <div class="food-bt-box g">
                                        <a class="food-link" href="trainerFoodFeedback.html" target="self">
                                            <div class="write-icon g">
                                                <i class="fas fa-pen-to-square"></i>
                                                <h4 class="text g">식단관리</h3>
                                            </div>
                                        </a>
                                    </div>
                                </td>
    
                            </tr>
                        </tbody> 
    
                        <!-- 회원 정보 11-->
                        <tbody class="tbody">
                            <tr class="user-info-list g">
    
                                <td class="name-box g">
                                    <div class="name">
                                            Darlene Robertson
                                    </div>
                                </td>
    
                                <td class="date g">
                                    월, 수, 금 오후 7:00
                                </td>
    
                                <td class="food-management g">
                                    <div class="food-bt-box g">
                                        <a class="food-link" href="trainerFoodFeedback.html" target="self">
                                            <div class="write-icon g">
                                                <i class="fas fa-pen-to-square"></i>
                                                <h4 class="text g">식단관리</h3>
                                            </div>
                                        </a>
                                    </div>
                                </td>
    
                            </tr>
                        </tbody>
                        
                        <!-- 회원 정보 12-->
                        <tbody class="tbody">
                            <tr class="user-info-list g">
    
                                <td class="name-box g">
                                    <div class="name">
                                        Marvin McKinney
                                    </div>
                                </td>
    
                                <td class="date g">
                                    월, 수, 금 오후 7:00
                                </td>
    
                                <td class="food-management g">
                                    <div class="food-bt-box g">
                                        <a class="food-link" href="trainerFoodFeedback.html" target="self">
                                            <div class="write-icon g">
                                                <i class="fas fa-pen-to-square"></i>
                                                <h4 class="text g">식단관리</h3>
                                            </div>
                                        </a>
                                    </div>
                                </td>
    
                            </tr>
                        </tbody>
    
                        <!-- 회원 정보 13-->
                        <tbody class="tbody">
                            <tr class="user-info-list g">
    
                                <td class="name-box g">
                                    <div class="name">
                                        Guy Hawkins
                                    </div>
                                </td>
    
                                <td class="date g">
                                    월, 수, 금 오후 7:00
                                </td>
    
                                <td class="food-management g">
                                    <div class="food-bt-box g">
                                        <a class="food-link" href="trainerFoodFeedback.html" target="self">
                                            <div class="write-icon g">
                                                <i class="fas fa-pen-to-square"></i>
                                                <h4 class="text g">식단관리</h3>
                                            </div>
                                        </a>
                                    </div>
                                </td>
    
                            </tr>
                        </tbody> 
    
                </table>
            </div>

        </div>
    </div>

    </section>

    <!-- footer 불러오기 -->
    <%@ include file="/WEB-INF/views/include/footer.jsp" %>

</body>

</html>