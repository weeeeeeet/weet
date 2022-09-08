  let IMP = window.IMP; // 생략 가능
  IMP.init("{imp13984691}"); // 예: imp00000000
  
  
  IMP.certification(
//파라미터 생략시 빈 object는 입력해줘야한것 같음. 제거 시 모듈 동작 안함.
        {},
        function (rsp) {
            //본인인증 성공 프로세스
            if (rsp.success) {
            
            }
            //본인인증 실패 프로세스
            else{
                alert("인증에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
            }
        }
    );
  
IMP.certification(
  function (rsp) { 
  	//인증 성공시
    if (rsp.success) { 
      // jQuery로 본인 웹서버로 요청
      $.ajax({
      	type: 'POST',
       	url: '/user/tr/join',
       	dataType: 'json',
       	data: {'imp_uid' : rsp.imp_uid},
      });
    }else{
      alert("인증에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
    }
  });
  
  
  //callback rsp 인자 값
 {
      error_code: null
      error_msg: null
      imp_uid: "고유인증값"
      merchant_uid: "주문번호(신경안써도됌)"
      pg_provider: "danal" //PG사
      pg_type: "certification" //PG타입(본인인증)
      success: true // 성공
}
