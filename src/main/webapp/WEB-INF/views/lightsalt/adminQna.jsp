<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Weet</title>
    
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
    <link href="/resources/css/lightsalt/adminModalQna.css" rel="stylesheet">
    <!-- java script -->
    <script src="/resources/js/lightsalt/admin_chk.js"></script>


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
                    <h3>1:1 문의</h3>
                    <div class="select-box">
                        <div class="check-box">
                            <ul>
                                <li><span class="search-title">문의유형 </span>:</li>
                                <li><input type="checkbox" name="boardtype_chkAll" id="boardtype_chkAll" value="boardtype_chkAll" checked> 전체
                                </li>
                                <li><input type="checkbox" name="boardtype_chk" value="qnaType1" checked> 일반문의</li>
                                <li><input type="checkbox" name="boardtype_chk" value="qnaType2" checked> 클래스등록</li>
                                <li><input type="checkbox" name="boardtype_chk" value="qnaType3" checked> 환불문의</li>
                                <li><input type="checkbox" name="boardtype_chk" value="qnaType4" checked> 결제문의</li>
                            </ul>
                            <ul>
                                <li><span class="search-title">문의상태 </span>:</li>
                                <li><input type="checkbox" name="status_chkAll" id="status_chkAll" value="status_chkAll" checked> 전체
                                </li>
                                <li><input type="checkbox" name="status_chk" value="qnaState1" checked> 답변완료</li>
                                <li><input type="checkbox" name="status_chk" value="qnaState2" checked> 답변대기</li>
                            </ul>
                        </div>
                        <div calss="search-box">
                            <ul>
                                <li><span class="search-title">검색어 </span>:</li>
                                <li>
                                    <div class="search-bar">
                                        <select class="search-select" name="search-type">
                                            <option value="adminTitle">글제목</option>
                                            <option value="adminCon">내용</option>
                                        </select>
                                        <input type="text" name="search" placeholder="검색어 입력">
                                        <button class="search_btn" name="search">검색</button>
                                    </div>
                                </li>
                            </ul>
                        </div>

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
                            <div class="delete-btn">
                                <button class="btns deletebtn">삭제</button>
                            </div>
                        </div>
                        <div class="table-box">
                            <table class="table table-striped">
                                <colgroup>
                                    <col width="5%" />
                                    <col width="6%" />
                                    <col width="10%" />
                                    <col width="20%" />
                                    <col width="25%" />
                                    <col width="10%" />
                                    <col width="15%" />
                                    <col width="9%" />
                                </colgroup>
                                <thead id="theader" class="theader">
                                    <tr>
                                        <th><input type="checkbox" name="checked" id="checked"></th>
                                        <th>No</th>
                                        <th>문의유형</th>
                                        <th>문의제목</th>
                                        <th>내용</th>
                                        <th>아이디</th>
                                        <th>작성일</th>
                                        <th>답변상태</th>
                                    </tr>
                                </thead>
                                <tbody id="tbody" class="tbody">
                                    <tr>
                                        <th><input type="checkbox" name="checked" id="checked"></th>
                                        <th>1233</th>
                                        <th>일반문의</th>
                                        <th>문의합니다.</th>
                                        <th>환불 신청한지 일주일이나 됐는데 환불이 ...</th>
                                        <th>helloweet</th>
                                        <th>2022-06-12 19:14:01</th>
                                        <th><button class="btns answerbtn" data-bs-toggle="modal" id="qnaReplyPop" type="submit" >답변대기</button></th>
                                    </tr>
                                    <tr>
                                        <th><input type="checkbox" name="checked" id="checked"></th>
                                        <th>1234</th>
                                        <th>클래스 등록</th>
                                        <th>클래스 등록 시 궁금한 점이 있습니다.</th>
                                        <th>안녕하세요. 강남역 KH피티샵 트레이너 입 ...</th>
                                        <th>hioweet1</th>
                                        <th>2022-06-12 19:14:01</th>
                                        <th><button class="btns answerbtn" data-bs-toggle="modal" id="qnaReplyPop" type="submit" >답변대기</button></th>
                                    </tr>
                                    <tr>
                                        <th><input type="checkbox" name="checked" id="checked"></th>
                                        <th>1233</th>
                                        <th>일반문의</th>
                                        <th>문의합니다.</th>
                                        <th>환불 신청한지 일주일이나 됐는데 환불이 ...</th>
                                        <th>helloweet</th>
                                        <th>2022-06-12 19:14:01</th>
                                        <th><button class="btns answerbtn" data-bs-toggle="modal" id="qnaReplyPop" type="submit" >답변대기</button></th>
                                    </tr>
                                    <tr>
                                        <th><input type="checkbox" name="checked" id="checked"></th>
                                        <th>1234</th>
                                        <th>클래스 등록</th>
                                        <th>클래스 등록 시 궁금한 점이 있습니다.</th>
                                        <th>안녕하세요. 강남역 KH피티샵 트레이너 입 ...</th>
                                        <th>hioweet1</th>
                                        <th>2022-06-12 19:14:01</th>
                                        <th><button class="btns answerbtn r_end" type="submit"><a href="#">답변완료</a></button>
                                        </th>
                                    </tr>
                                    <tr>
                                        <th><input type="checkbox" name="checked" id="checked"></th>
                                        <th>1233</th>
                                        <th>일반문의</th>
                                        <th>문의합니다.</th>
                                        <th>환불 신청한지 일주일이나 됐는데 환불이 ...</th>
                                        <th>helloweet</th>
                                        <th>2022-06-12 19:14:01</th>
                                        <th><button class="btns answerbtn r_end" type="submit"><a href="#">답변완료</a></button>
                                        </th>
                                    </tr>
                                    <tr>
                                        <th><input type="checkbox" name="checked" id="checked"></th>
                                        <th>1234</th>
                                        <th>클래스 등록</th>
                                        <th>클래스 등록 시 궁금한 점이 있습니다.</th>
                                        <th>안녕하세요. 강남역 KH피티샵 트레이너 입 ...</th>
                                        <th>hioweet1</th>
                                        <th>2022-06-12 19:14:01</th>
                                        <th><button class="btns answerbtn r_end" type="submit"><a href="#">답변완료</a></button>
                                        </th>
                                    </tr>
                                    <tr>
                                        <th><input type="checkbox" name="checked" id="checked"></th>
                                        <th>1233</th>
                                        <th>일반문의</th>
                                        <th>문의합니다.</th>
                                        <th>환불 신청한지 일주일이나 됐는데 환불이 ...</th>
                                        <th>helloweet</th>
                                        <th>2022-06-12 19:14:01</th>
                                        <th><button class="btns answerbtn r_end" type="submit"><a href="#">답변완료</a></button>
                                        </th>
                                    </tr>
                                    <tr>
                                        <th><input type="checkbox" name="checked" id="checked"></th>
                                        <th>1234</th>
                                        <th>클래스 등록</th>
                                        <th>클래스 등록 시 궁금한 점이 있습니다.</th>
                                        <th>안녕하세요. 강남역 KH피티샵 트레이너 입 ...</th>
                                        <th>hioweet1</th>
                                        <th>2022-06-12 19:14:01</th>
                                        <th><button class="btns answerbtn r_end" type="submit"><a href="#">답변완료</a></button>
                                        </th>
                                    </tr>
                                    <tr>
                                        <th><input type="checkbox" name="checked" id="checked"></th>
                                        <th>1233</th>
                                        <th>일반문의</th>
                                        <th>문의합니다.</th>
                                        <th>환불 신청한지 일주일이나 됐는데 환불이 ...</th>
                                        <th>helloweet</th>
                                        <th>2022-06-12 19:14:01</th>
                                        <th><button class="btns answerbtn r_end" type="submit"><a href="#">답변완료</a></button>
                                        </th>
                                    </tr>
                                    <tr>
                                        <th><input type="checkbox" name="checked" id="checked"></th>
                                        <th>1234</th>
                                        <th>클래스 등록</th>
                                        <th>클래스 등록 시 궁금한 점이 있습니다.</th>
                                        <th>안녕하세요. 강남역 KH피티샵 트레이너 입 ...</th>
                                        <th>hioweet1</th>
                                        <th>2022-06-12 19:14:01</th>
                                        <th><button class="btns answerbtn r_end" type="submit"><a href="#">답변완료</a></button>
                                        </th>
                                    </tr>
                                    <tr>
                                        <th><input type="checkbox" name="checked" id="checked"></th>
                                        <th>1233</th>
                                        <th>일반문의</th>
                                        <th>문의합니다.</th>
                                        <th>환불 신청한지 일주일이나 됐는데 환불이 ...</th>
                                        <th>helloweet</th>
                                        <th>2022-06-12 19:14:01</th>
                                        <th><button class="btns answerbtn r_end" type="submit"><a href="#">답변완료</a></button>
                                        </th>
                                    </tr>
                                    <tr>
                                        <th><input type="checkbox" name="checked" id="checked"></th>
                                        <th>1234</th>
                                        <th>클래스 등록</th>
                                        <th>클래스 등록 시 궁금한 점이 있습니다.</th>
                                        <th>안녕하세요. 강남역 KH피티샵 트레이너 입 ...</th>
                                        <th>hioweet1</th>
                                        <th>2022-06-12 19:14:01</th>
                                        <th><button class="btns answerbtn r_end" type="submit"><a href="#">답변완료</a></button>
                                        </th>
                                    </tr>
                                    <tr>
                                        <th><input type="checkbox" name="checked" id="checked"></th>
                                        <th>1233</th>
                                        <th>일반문의</th>
                                        <th>문의합니다.</th>
                                        <th>환불 신청한지 일주일이나 됐는데 환불이 ...</th>
                                        <th>helloweet</th>
                                        <th>2022-06-12 19:14:01</th>
                                        <th><button class="btns answerbtn r_end" type="submit"><a href="#">답변완료</a></button>
                                        </th>
                                    </tr>
                                    <tr>
                                        <th><input type="checkbox" name="checked" id="checked"></th>
                                        <th>1234</th>
                                        <th>클래스 등록</th>
                                        <th>클래스 등록 시 궁금한 점이 있습니다.</th>
                                        <th>안녕하세요. 강남역 KH피티샵 트레이너 입 ...</th>
                                        <th>hioweet1</th>
                                        <th>2022-06-12 19:14:01</th>
                                        <th><button class="btns answerbtn r_end" type="submit"><a href="#">답변완료</a></button>
                                        </th>
                                    </tr>
                                    <tr>
                                        <th><input type="checkbox" name="checked" id="checked"></th>
                                        <th>1233</th>
                                        <th>일반문의</th>
                                        <th>문의합니다.</th>
                                        <th>환불 신청한지 일주일이나 됐는데 환불이 ...</th>
                                        <th>helloweet</th>
                                        <th>2022-06-12 19:14:01</th>
                                        <th><button class="btns answerbtn r_end" type="submit"><a href="#">답변완료</a></button>
                                        </th>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="paging-box">
                            <ul class="pagination">
                                <li class="page-item"><a class="page-link" href="#"><i
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


    <script>
        $(() => {
            $('#qnaReplyPop').click((e) => {
                e.preventDefault();
                $('#qnaReplyModal').modal("show");
            });
            $('#qnaReply-close').click(() => $('#qnaReplyModal').modal("hide"));
            $('#qnaReply-submit').click(() => $('#qnaReplyModal').modal("hide"));
        }) // .jq
    </script>

    <div class="modal fade" id="qnaReplyModal" tabindex="-1" aria-labelledby="newcouponLabel" aria-hidden="true">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="newcouponLabel">1:1 문의 답변 등록</h5>
            <button type="button" id="qnaReply-close" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <span>No.3141 </span>
            <!-- <colgroup>
                <col width="25%">
                <col width="25%">
                <col width="25%">
                <col width="25%">
            </colgroup> -->
            <table>
                <tr>
                    <td class="sbj">제목</td>
                    <td colspan="3">클래스 환불 가능 문의</td>
                </tr>
                <tr>
                    <td class="sbj">문의 유형</td>
                    <td>환불문의</td>
                    <td class="sbj">작성일자</td>
                    <td>2022.06.12 19:22</td>
                </tr>
                <tr>
                    <td class="sbj">아이디</td>
                    <td>hellowworld@naver.com</td>
                    <td class="sbj">연락처</td>
                    <td>010-1234-5678</td>
                </tr>
                <tr>
                    <td colspan="4"><p>클래스 시작해서 12회 중 3회를 어쩌고 저쩌고 대충 문의하는 내용 블라블라
                        그랬고 저랬고 레잇고~~~~~~~~~~~~~

                       Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptates dolores laudantium consequatur corporis sunt ipsa quis exercitationem laborum accusantium excepturi. Aperiam quidem aliquid iusto facilis laudantium saepe, deserunt ea suscipit unde, doloribus incidunt molestiae quia reiciendis omnis ipsum molestias provident commodi corrupti, tempora quae. Tempora, culpa rem. Dolores, aliquid laborum.</p> 
                        
                    </td>
                </tr>
            </table>
            <form>
              <div class="mb-3">
                <label for="qna-name" class="col-form-label">제목</label>
                <input type="text" class="form-control" id="couponNum">
              </div>
              <div class="mb-3">
                <label for="qna-text" class="col-form-label">본문</label>
                <textarea class="form-control" id="message-text"></textarea>
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="qnaReply-close">닫기</button>
            <button id="qnaReply-submit" type="submit" class="btn btn-primary">등록</button>
          </div>
        </div>
      </div>
    </div>
</body>

</html>