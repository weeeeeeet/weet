/*유효성검사 */
function findId_form() {
    //변수에 담아주기
    let userName = document.getElementById("userName");
    let userPhone = document.getElementById("user_phone");
    let phoneDoubleChk = document.getElementById("phoneDoubleChk");
    
    // 이름입력 및 형식 확인
     if(userName.value=""){
      alert("이름을 입력하세요.");
      userName.focus();
      return false;
     } 
     
     // 핸드폰번호 입력 및 형식 확인
    let num = /^[0-9]+/g; //숫자만 입력하는 정규식

    if (!num.test(userPhone.value)) {
      alert("전화번호는 숫자만 입력할 수 있습니다.");
      userPhone.focus();
      return false;
    }
     
     if(phoneDoubleChk.value != "true"){
	  $(".successPhoneChk").text("휴대폰 인증을 완료해주세요 :)");
	  $(".successPhoneChk").css("color", "red");	    	
	  return false;	
	}
	
	document.findId.submit();
};



