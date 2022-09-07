<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin 쿠폰</title>

    <!-- #### common ####-->
    <!-- favicon -->
    <link rel="shortcut icon" href="/resources/ico/favicon.ico" type="image/x-icon">
    <link rel="icon" href="/resources/ico/favicon.ico" type="image/x-icon">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.0/jquery-migrate.min.js"></script>
    <!-- icon -->
    <script src="https://kit.fontawesome.com/63eb3bc178.js" crossorigin="anonymous"></script>
    <script src="https://code.iconify.design/2/2.1.0/iconify.min.js"></script>
    <!-- font -->
    <link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet">
    
    <!-- bootstrap v5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>

     <!-- #### style ####-->
    <!-- css -->
    <link href="/resources/css/lightsalt/adminHome.css" rel="stylesheet">
    <link href="/resources/css/lightsalt/adminModalCoupon.css" rel="stylesheet">
  

</head>

<body>
    <div class="wrap">
        <!-- header s -->
        <%@ include file= "/WEB-INF/views/include/adminHeader.jsp" %>
        <!-- header e -->

        <div id="content-body">
            <!-- side s -->
            <%@ include file= "/WEB-INF/views/include/adminAside.jsp" %>
            <!-- side e -->

            <!-- 컨텐츠 (게시글) -->
            <div class="content-container">
                <div class="inner">
                    <h3>쿠폰 관리</h3>
                    <div class="select-box">
                        <form action="">
                            <div class="searchDate-box">
                                <ul>
                                    <li><span class="search-title">검색기간</span>:</li>
                                    <li><input type="datetime-local" class="searchDate" id="startD"> ~
                                    <li><input type="datetime-local" class="searchDate" id="endD">
                                </ul>
                            </div>
                            <div calss="search-box">
                                <ul>
                                    <li><span class="search-title">검색어 </span>:</li>
                                    <li>
                                        <div class="search-bar">
                                            <select class="search-select" name="search-type">
                                                <option value="couponNum">쿠폰코드</option>
                                                <option value="couponName">쿠폰명</option>
                                                <option value="couponExp">쿠폰설명</option>
                                                <option value="couponPer">할인금액</option>
                                            </select>
                                            <input type="text" name="search" placeholder="검색어 입력">
                                            <button class="search_btn" name="search">검색</button>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </form>
                    </div>
                    <form id="boardForm" name="boardForm">
                        <input type="hidden" id="function_name" name="function_name" value="getBoardList" />
                        <input type="hidden" id="current_page_no" name="current_page_no" value="1" />

                        <div class="tb_top">
                            <div class="page_info">
                                <ul>
                                    <li><span id="new_count">신규</span>/<span>전체</span> : </li>
                                    <li><span id="new_count">32</span>/<span id="total_count">9999</span></li>
                                    <li>검색결과 : </li>
                                    <li><span id="search_conut">0</span></li>
                                </ul>
                            </div>
                            <div class="btns-box">
                                <button class="btns registbtn" data-bs-toggle="modal" id="newcouponPop">등록</button>
                                <button class="btns deletebtn">삭제</button>
                            </div>
                        </div>
                        <div class="table-box">
                            <table class="table table-striped">
                                <colgroup>
                                    <col width="5%" />
                                    <col width="12%" />
                                    <col width="17%" />
                                    <col width="23%" />
                                    <col width="12%" />
                                    <col width="18%" />
                                    <col width="13%" />
                                </colgroup>
                                <thead id="theader" class="theader">
                                    <tr>
                                        <th><input type="checkbox" name="checked" id="checked"></th>
                                        <th>쿠폰코드</th>
                                        <th>쿠폰명</th>
                                        <th>상세내용</th>
                                        <th>할인금액</th>
                                        <th>사용기간</th>
                                        <th>파일명</th>
                                    </tr>
                                </thead>
                                <tbody id="tbody" class="tbody">
                                    <tr>
                                        <th><input type="checkbox" name="checked" id="checked"></th>
                                        <th>SIN23034</th>
                                        <th>7월 신규가입 할인 쿠폰</th>
                                        <th>7월 신규가입시 첫결제 사용 가능</th>
                                        <th>20%</th>
                                        <th>2022-07-01 ~ 2022-07-31 </th>
                                        <th>julyCoupon.png</th>
                                    </tr>
                                    <tr>
                                        <th><input type="checkbox" name="checked" id="checked"></th>
                                        <th>SU1291Q</th>
                                        <th>여름방학 프로모션 쿠폰</th>
                                        <th>기간안에 사용시 할인 가능</th>
                                        <th>23%</th>
                                        <th>2022-06-21 ~ 2022-08-31 </th>
                                        <th>summerCoupon.png</th>
                                    </tr>
                                    <tr>
                                        <th><input type="checkbox" name="checked" id="checked"></th>
                                        <th>SIN23034</th>
                                        <th>7월 신규가입 할인 쿠폰</th>
                                        <th>7월 신규가입시 첫결제 사용 가능</th>
                                        <th>20%</th>
                                        <th>2022-07-01 ~ 2022-07-31 </th>
                                        <th>julyCoupon.png</th>
                                    </tr>
                                    <tr>
                                        <th><input type="checkbox" name="checked" id="checked"></th>
                                        <th>SU1291Q</th>
                                        <th>여름방학 프로모션 쿠폰</th>
                                        <th>기간안에 사용시 할인 가능</th>
                                        <th>23%</th>
                                        <th>2022-06-21 ~ 2022-08-31 </th>
                                        <th>summerCoupon.png</th>
                                    </tr>
                                    <tr>
                                        <th><input type="checkbox" name="checked" id="checked"></th>
                                        <th>SIN23034</th>
                                        <th>7월 신규가입 할인 쿠폰</th>
                                        <th>7월 신규가입시 첫결제 사용 가능</th>
                                        <th>20%</th>
                                        <th>2022-07-01 ~ 2022-07-31 </th>
                                        <th>julyCoupon.png</th>
                                    </tr>
                                    <tr>
                                        <th><input type="checkbox" name="checked" id="checked"></th>
                                        <th>SU1291Q</th>
                                        <th>여름방학 프로모션 쿠폰</th>
                                        <th>기간안에 사용시 할인 가능</th>
                                        <th>23%</th>
                                        <th>2022-06-21 ~ 2022-08-31 </th>
                                        <th>summerCoupon.png</th>
                                    </tr>
                                    <tr>
                                        <th><input type="checkbox" name="checked" id="checked"></th>
                                        <th>SIN23034</th>
                                        <th>7월 신규가입 할인 쿠폰</th>
                                        <th>7월 신규가입시 첫결제 사용 가능</th>
                                        <th>20%</th>
                                        <th>2022-07-01 ~ 2022-07-31 </th>
                                        <th>julyCoupon.png</th>
                                    </tr>
                                    <tr>
                                        <th><input type="checkbox" name="checked" id="checked"></th>
                                        <th>SU1291Q</th>
                                        <th>여름방학 프로모션 쿠폰</th>
                                        <th>기간안에 사용시 할인 가능</th>
                                        <th>23%</th>
                                        <th>2022-06-21 ~ 2022-08-31 </th>
                                        <th>summerCoupon.png</th>
                                    </tr>
                                    <tr>
                                        <th><input type="checkbox" name="checked" id="checked"></th>
                                        <th>SIN23034</th>
                                        <th>7월 신규가입 할인 쿠폰</th>
                                        <th>7월 신규가입시 첫결제 사용 가능</th>
                                        <th>20%</th>
                                        <th>2022-07-01 ~ 2022-07-31 </th>
                                        <th>julyCoupon.png</th>
                                    </tr>
                                    <tr>
                                        <th><input type="checkbox" name="checked" id="checked"></th>
                                        <th>SU1291Q</th>
                                        <th>여름방학 프로모션 쿠폰</th>
                                        <th>기간안에 사용시 할인 가능</th>
                                        <th>23%</th>
                                        <th>2022-06-21 ~ 2022-08-31 </th>
                                        <th>summerCoupon.png</th>
                                    </tr>
                                    <tr>
                                        <th><input type="checkbox" name="checked" id="checked"></th>
                                        <th>SIN23034</th>
                                        <th>7월 신규가입 할인 쿠폰</th>
                                        <th>7월 신규가입시 첫결제 사용 가능</th>
                                        <th>20%</th>
                                        <th>2022-07-01 ~ 2022-07-31 </th>
                                        <th>julyCoupon.png</th>
                                    </tr>
                                    <tr>
                                        <th><input type="checkbox" name="checked" id="checked"></th>
                                        <th>SU1291Q</th>
                                        <th>여름방학 프로모션 쿠폰</th>
                                        <th>기간안에 사용시 할인 가능</th>
                                        <th>23%</th>
                                        <th>2022-06-21 ~ 2022-08-31 </th>
                                        <th>summerCoupon.png</th>
                                    </tr>
                                    <tr>
                                        <th><input type="checkbox" name="checked" id="checked"></th>
                                        <th>SIN23034</th>
                                        <th>7월 신규가입 할인 쿠폰</th>
                                        <th>7월 신규가입시 첫결제 사용 가능</th>
                                        <th>20%</th>
                                        <th>2022-07-01 ~ 2022-07-31 </th>
                                        <th>julyCoupon.png</th>
                                    </tr>
                                    <tr>
                                        <th><input type="checkbox" name="checked" id="checked"></th>
                                        <th>SU1291Q</th>
                                        <th>여름방학 프로모션 쿠폰</th>
                                        <th>기간안에 사용시 할인 가능</th>
                                        <th>23%</th>
                                        <th>2022-06-21 ~ 2022-08-31 </th>
                                        <th>summerCoupon.png</th>
                                    </tr>
                                    <tr>
                                        <th><input type="checkbox" name="checked" id="checked"></th>
                                        <th>SIN23034</th>
                                        <th>7월 신규가입 할인 쿠폰</th>
                                        <th>7월 신규가입시 첫결제 사용 가능</th>
                                        <th>20%</th>
                                        <th>2022-07-01 ~ 2022-07-31 </th>
                                        <th>julyCoupon.png</th>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="paging-box">
                            <ul class="pagination">
                                <li class="page-item"><a class="page-link move" href="#"><i
                                            class="fas fa-angle-left"></i>
                                        이전</a></li>
                                <li class="page-item"><a class="page-link" href="#">1</a></li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item"><a class="page-link" href="#">4</a></li>
                                <li class="page-item"><a class="page-link" href="#">5</a></li>
                                <li class="page-item"><a class="page-link" href="#">6</a></li>
                                <li class="page-item"><a class="page-link" href="#">7</a></li>
                                <li class="page-item"><a class="page-link" href="#">8</a></li>
                                <li class="page-item"><a class="page-link" href="#">9</a></li>
                                <li class="page-item"><a class="page-link" href="#">10</a></li>
                                <li class="page-item"><a class="page-link move" href="#">다음 <i
                                            class="fas fa-angle-right"></i></a></li>
                            </ul>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    
    <!-- 쿠폰등록 모달 -->

    <script>
        $(() => {
            $('#newcouponPop').click((e) => {
                e.preventDefault();
                $('#newcouponModal').modal("show");
            });
            $('#newcoupon-close').click(() => $('#newcouponModal').modal("hide"));
            $('#newcoupon-submit').click(() => $('#newcouponModal').modal("hide"));
        }) // .jq
    </script>
    
    <div class="modal fade" id="newcouponModal" tabindex="-1" aria-labelledby="newcouponLabel" aria-hidden="true">
        <div class="modal-dialog" >
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="newcouponLabel">쿠폰 등록</h5>
              <button type="button" id="newcoupon-close" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              <form>
                <div class="mb-3">
                  <label for="newcoupon-name" id="coupon" class="col-form-label">쿠폰 이름</label>
                  <input type="text" class="form-control" id="couponName" placeholder="">
                </div>
                <div class="mb-3">
                  <label for="newcoupon-code" class="col-form-label">쿠폰 코드</label>
                  <input type="text" class="form-control" id="couponNum">
                </div>
                <div class="mb-3">
                  <label for="newcoupon-pct" class="col-form-label">할인율(원)</label>
                  <input type="number" class="form-control" id="couponPer">
                </div>
                <div class="mb-3">
                  <label for="newcoupon-date" class="col-form-label">사용기한</label>
                  <input type="datetime-local" class="form-control" id="couponSdate">
                  <input type="datetime-local" class="form-control" id="couponEdate">
                </div>
                <div class="mb-3">
                  <label for="message-text" class="col-form-label">상세내용</label>
                  <textarea class="form-control" id="message-text"></textarea>
                </div>
              </form>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="newcoupon-close">닫기</button>
              <button id="newcoupon-submit" type="submit" class="btn btn-primary">등록</button>
            </div>
          </div>
        </div>
      </div>
      <script>includeHTML();</script>
</body>

</html>