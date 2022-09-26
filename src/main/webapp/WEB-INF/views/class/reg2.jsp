<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>클래스 등록 페이지3</title>

    <link href="https://webfontworld.github.io/SCoreDream/SCoreDream.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/63eb3bc178.js" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="${path}/resources/css/class/reg2.css" />

    <!-- favicon -->
	<link rel="shortcut icon" href="${path}/resources/ico/favicon.ico" type="image/x-icon">
	<link rel="icon" href="${path}/resources/ico/favicon.ico" type="image/x-icon">



   <!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> --> 

   
</head>

<body>
    <%@ include file="/WEB-INF/views/include/header.jsp" %>

    <!-- ==================CONTENTS==================== -->
    <div class="contents">
        <div class="cont_bar">
            <h3>클래스 등록</h3>
            <div class="txt">
                <div class="c1">
                    <li>클래스 등록하기</li>
                    <li>></li>
                    <li>클래스 기본정보</li>
                    <li>></li>
                    <li>스케줄 및 부가정보</li>
                    <li>></li>
                    <li>커리큘럼</li>
                    <li>></li>
                    <li>헬스장정보</li>
                    <li>></li>
                    <li>등록완료</li>
                </div>
            </div>
            <div class="bar">
                <progress value="59" max="100"></progress>
            </div> 
        </div>

        <div class="con">
            <div class="class_submit">스케줄 등록<span>*</span>
                <div class="qmark">
                    <a href="#"><p>?</p>
                        <div class="schedule_explain">
                            <ul>
                                <li>시작일 선택: 클래스 개강일을 입력해주세요.</li><br>
                                <li>소요시간: 클래스가 진행되는 총 시간으로, 최소 1시간~최대 10시간 입력이 가능합니다.</li><br>
                                <li>강의요일: 클래스가 진행되는 요일을 선택해주세요.</li><br>
                                <li>수업 시작 시간: 클래스의 시작시간을 선택해 주세요.</li><br>
                                <li>회차: 클래스의 총 회차를 입력해 주세요.</li>
                            </ul>
                        </div>
                    </a>
                </div>
            </div>

			<!-- 스케줄 등록 모달 -->
            <div id="my_modal">
                <h3>스케줄 등록</h3>
                    <div class="modal_class_type"><a href="#">개인</a></div>
                    <div class="modal_box">
                        <div class="start_date">
                            <p>시작일을 선택해 주세요.</p><span>*</span>
                            <div class="modal_datepicker_div">
                                <input type="date" id="modal_datepicker" required>
                            </div>
                        </div>
                        <div class="class_time">
                            <p>수업 소요시간(시)</p><span>*</span>
                            <div class="class_time_div">
                                <input type="number" id="modal_class_time" required>
                            </div>
                        </div>
                        <div class="class_day">
                            <div class="class_day_title">
                                <p>강의요일(복수선택 가능)</p><span>*</span>
                            </div>
                            <div class="class_day_checkbox sun">
                                <input type="checkbox" data-name="일" class="checkbox">
                            </div>
                            <div class="class_day_checkbox mon">
                                <input type="checkbox" data-name="월" class="checkbox">
                            </div>
                            <div class="class_day_checkbox tue">
                                <input type="checkbox" data-name="화" class="checkbox">
                            </div>
                            <div class="class_day_checkbox wed">
                                <input type="checkbox" data-name="수" class="checkbox">
                            </div>
                            <div class="class_day_checkbox thu">
                                <input type="checkbox" data-name="목" class="checkbox">
                            </div>
                            <div class="class_day_checkbox fri">
                                <input type="checkbox" data-name="금" class="checkbox">
                            </div>
                            <div class="class_day_checkbox sat">
                                <input type="checkbox" data-name="토" class="checkbox">
                            </div>
                        </div>
                        <div class="class_start_time">
                            <p>수업 시작 시간</p><span>*</span>
                            <div class="class_start_time_div">
                                <input type="time" id="modal_timepicker"required>
                            </div>
                        </div>
                        <div class="class_count">
                            <p>회차</p>
                            <div class="class_count_div">
                                <input type="number" id="modal_timepicker">
                            </div>
                        </div>
                    </div>

                    <div class="modal_save">
                        <input type="submit" class="modal_save_btn">
                    </div>

                <a class="modal_close_btn"><i class="fa-solid fa-xmark"></i></a>
            </div>

            <button id="schedule_select">스케줄 선택&nbsp;&nbsp;+
            </button>


            <script>
                function modal(id) {
                    var zIndex = 9999;
                    var modal = document.getElementById(id);
    
                    // 모달 div 뒤에 허연 레이어
                    var bg = document.createElement('div');
                    bg.setStyle({
                        position: 'fixed',
                        zIndex: zIndex,
                        left: '0px',
                        top: '0px',
                        width: '100%',
                        height: '100%',
                        overflow: 'auto',
                        // 레이어 색깔
                        backgroundColor: 'rgba(0,0,0,0.4)'
                    });
                    document.body.append(bg);
    
                    // 닫기 버튼 처리, 까만 레이어와 모달 div 지우기
                    modal.querySelector('.modal_close_btn').addEventListener('click', function() {
                        bg.remove();
                        modal.style.display = 'none';
                    });

                    modal.querySelector('.modal_save').addEventListener('click', function() {
                        bg.remove();
                        modal.style.display = 'none';
                    });
    
                    modal.setStyle({
                        position: 'fixed',
                        display: 'block',
                        boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',
    
                        // 까만 레이어 보다 한칸 위에 보이기
                        zIndex: zIndex + 1,
    
                        // div center 정렬
                        top: '50%',
                        left: '50%',
                        transform: 'translate(-50%, -50%)',
                        msTransform: 'translate(-50%, -50%)',
                        webkitTransform: 'translate(-50%, -50%)'
                    });
                }
    
                // Element 에 style 한번에 오브젝트로 설정하는 함수 추가
                Element.prototype.setStyle = function(styles) {
                    for (var k in styles) this.style[k] = styles[k];
                    return this;
                };
    
                document.getElementById('schedule_select').addEventListener('click', function() {
                    // 모달창 띄우기
                    modal('my_modal');
                });

            </script>



            <div class="sort"><p>그룹</p></div>

            <div class="schedule_box_all">
                <div class="schedule_box">
                    <div class="box_contents">
                        <h3>상세 스케줄 내역</h3>
                        <ul>
                            <li>클래스 시작일 : </li>
                            <li>요일과 수업 시작시간 : </li>
                            <li>회차 : </li>
                            <li>수업소요시간 : </li>
                        
                    </div>
                    <a href="#"><i class="fa-solid fa-pen-to-square"></i></a>
                    <a href="#"><i class="fa-solid fa-xmark"></i></a>

                </div>
            </div>
            <div id="term_num">
                <div class="member_term">수강생 모집기간<span>*</span>
                    <div class="qmark">
                        <a href="#"><p>?</p>
                            <div class="recruit_explain">
                                <ul>
                                    <li>클래스 전체 스케줄에 대한 수강생 모집기간으로, 
                                        클래스 노출 기간을 설정해주세요.</li><br>
                                    <li>아직 참여 가능한 스케줄이 있더라도 모집가긴 종료시 해당 클래스는 마감 처리되어
                                        노출되지 않습니다.(예. 오늘자가 9월 1일이고, 10월 수강생 모집 클래스라면
                                        모짐기간은 9월 1일~ 10월 31일까지 설정해주세요.)
                                    </li>
                                </ul>
                            </div>
                        </a>
                    </div>
                    <div class="term">
                        <div class="datepicker">
                            <input type="date" id="datepicker" required>
                            <span>-</span>
                            <input type="date" id="datepicker" required>
                        </div>
                    </div>
                </div>
                
                <div class="member_num">클래스 모집인원<span>*</span>
                    <div class="qmark">
                        <a href="#"><p>?</p>
                            <div class="num_explain">
                                <ul>
                                    <li>클래스의 최소인원과 최대인원을 작성해주세요.</li>
                                </ul>
                            </div>
                        </a>
                    </div>
                    <div class="num">
                        <input type="text" id="datepicker" placeholder="인원" required>
                    </div>
                </div>
            </div>

            <div id="tag_tuition">
                <div class="tag">#태그입력
                    <div class="qmark">
                        <a href="#"><p>?</p>
                            <div class="tag_explain">
                                <ul>
                                    <li>태그는 최대 5개까지 등록 가능하며, 클래스 검색 시
                                        입력한 태그를 기반으로 노출됩니다.(5자 이내, 공백 불가).</li>
                                </ul>
                            </div>
                        </a>
                    </div>
                    <div class="tag_input">
                            <input type="text" placeholder="# 없이 태그 문구를 각각 입력해 주세요.">
                    </div>
                </div>
                
                <div class="tuition">클래스 수강료<span>*</span>
                    <div class="qmark">
                        <a href="#"><p>?</p>
                            <div class="tuition_explain">
                                <ul>
                                    <li>전체 회차의 수강료를 입력해 주세요.</li>
                                </ul>
                            </div>
                        </a>
                    </div>
                    <div class="class_tuition">
                        <input type="text" placeholder="금액입력(원)" required>
                    </div>
                </div>
            </div>


                <!-- ============== 수업사진 등록 ================ -->

            <div class="class_img">클래스 수업사진 등록
                <div class="qmark">
                    <a href="#"><p>?</p>
                       <div class="img_explain">
                            <ul>
                                <li>수업사진은 클래스 상세 페이지 하단에 노출됩니다.</li><br>
                                <li>수업사진은 회원들이 클래스 후기로 참고할 수 있습니다.</li>
                            </ul>
                        </div>
                    </a>
                </div> 
                <!-- <button class="class_img_select" onclick="팝업링크">사진등록</button>
                <button class="class_img_delete" onclick="팝업링크">전체삭제</button> -->
            </div>

            <!-- --------------------------------------- -->
            <div id='image_preview'>
                <input type='file' id='btnAtt' multiple='multiple'>
                <div id='att_zone' 
                      data-placeholder='파일을 첨부 하려면 파일 선택 버튼을 클릭하거나 파일을 드래그앤드롭 하세요'></div>
            </div>

            <script>
                ( /* att_zone : 이미지들이 들어갈 위치 id, btn : file tag id */
                  imageView = function imageView(att_zone, btn){
                
                    var attZone = document.getElementById(att_zone);
                    var btnAtt = document.getElementById(btn)
                    var sel_files = [];
                    
                    // 이미지와 체크 박스를 감싸고 있는 div 속성
                    var div_style = 'display:inline-block;position:relative;'
                                  + 'width:200px;height:120px;margin:5px;z-index:1';
                    // 미리보기 이미지 속성
                    var img_style = 'width:100%;height:100%;z-index:none';
                    // 이미지안에 표시되는 체크박스의 속성
                    var chk_style = 'width:20px;height:20px;position:absolute;font-size:24px;'
                                  + 'right:8px;bottom:90px;z-index:999;background-color:rgb(124, 124, 124);border:none;color:white;'
                                  + 'border-radius:30px;font-size:14px'
                  
                    btnAtt.onchange = function(e){
                      var files = e.target.files;
                      var fileArr = Array.prototype.slice.call(files)
                      for(f of fileArr){
                        imageLoader(f);
                      }
                    }  
                    
                  
                    // 탐색기에서 드래그앤 드롭 사용
                    attZone.addEventListener('dragenter', function(e){
                      e.preventDefault();
                      e.stopPropagation();
                    }, false)
                    
                    attZone.addEventListener('dragover', function(e){
                      e.preventDefault();
                      e.stopPropagation();
                      
                    }, false)
                  
                    attZone.addEventListener('drop', function(e){
                      var files = {};
                      e.preventDefault();
                      e.stopPropagation();
                      var dt = e.dataTransfer;
                      files = dt.files;
                      for(f of files){
                        imageLoader(f);
                      }
                      
                    }, false)
                    
                
                    
                    /*첨부된 이미지를을 배열에 넣고 미리보기 */
                    imageLoader = function(file){
                      sel_files.push(file);
                      var reader = new FileReader();
                      reader.onload = function(ee){
                        let img = document.createElement('img')
                        img.setAttribute('style', img_style)
                        img.src = ee.target.result;
                        attZone.appendChild(makeDiv(img, file));
                      }
                      
                      reader.readAsDataURL(file);
                    }
                    
                    /*첨부된 파일이 있는 경우 checkbox와 함께 attZone에 추가할 div를 만들어 반환 */
                    makeDiv = function(img, file){
                      var div = document.createElement('div')
                      div.setAttribute('style', div_style)
                      
                      var btn = document.createElement('input')
                      btn.setAttribute('type', 'button')
                      btn.setAttribute('value', 'x')
                      btn.setAttribute('delFile', file.name);
                      btn.setAttribute('style', chk_style);
                      btn.onclick = function(ev){
                        var ele = ev.srcElement;
                        var delFile = ele.getAttribute('delFile');
                        for(var i=0 ;i<sel_files.length; i++){
                          if(delFile== sel_files[i].name){
                            sel_files.splice(i, 1);      
                          }
                        }
                        
                        dt = new DataTransfer();
                        for(f in sel_files) {
                          var file = sel_files[f];
                          dt.items.add(file);
                        }
                        btnAtt.files = dt.files;
                        var p = ele.parentNode;
                        attZone.removeChild(p)
                      }
                      div.appendChild(img)
                      div.appendChild(btn)
                      return div
                    }
                  }
                )('att_zone', 'btnAtt')
                
                </script>

            <div id="img_detail">
                <ul>
                    <li>사진은 가로로 찍은 사진을 권장합니다. (가로 사이즈 최소 800px)</li>
                    <li>사진 용량은 사진 한 장당 10MB까지 등록 가능합니다.</li>
                    <li>사진은 최대 9장 까지 권장합니다.그 이상은 등록이 불가합니다.</li>
                </ul>
            </div>
                
            <div class="page_button">
                <button type="button" class="back" onclick="location.href='1'">이전</button>
                <button type="button" class="next" onclick="location.href='3'">다음</button>
            </div>
        </div>
        
        
    
    </div>    
    
    <!-- ==================FOOTER==================== -->
    <%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>

</html>