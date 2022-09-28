/*유효성검사 */
function findpwd_check() {
    //변수에 담아주기
    let userId = document.getElementById("userId");
    let userName = document.getElementById("userName");
    let userPhone = document.getElementById("user_phone");
    let phoneDoubleChk = document.getElementById("phoneDoubleChk");

	// 아이디 입력 및 형식 확인
     if(userId.value=""){
      alert("아이디를 입력하세요.");
      userId.focus();
      return false;
     } 

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
	
	//입력 값 전송
	document.findpwd_form.submit();
}

function changePwd_form() {
	let userId = document.getElementById("userId");
	let pwd = document.getElementById("user_pwd");
    let pwd2 = document.getElementById("user_pwd2");
	
	if(userId.value=""){
      alert("전 단계에서 본인인증 해주세요");
      userId.focus();
      return false;
     } 
	
	//비밀번호 영문자+숫자+특수조합(8~25자리 입력) 확인
    let pwdExpression = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,14}$/;

    if (!pwdExpression.test(pwd.value)) {
      alert("비밀번호는 영문자+숫자+특수문자 조합으로 8~14자리 사용해야 합니다.");
      pwd.focus();
      return false;
    };

	// 비밀번호 일치여부 확인
    if (pwd2.value == pwd.value) {

      pwdCheck.innerHTML='비밀번호가 일치합니다.';  /* innerHTML : HTML 내부에 추가적인 내용을 넣을 때 사용하는 것. */
      pwdCheck.style.color='green';

    } else {
      pwdCheck.innerHTML='비밀번호가 일치하지 않습니다.';
      pwdCheck.style.color='red';
      alert("비밀번호가 일치하지 않습니다.");
      pwd2.focus();
      return false;
    };
    
	//입력 값 전송
	document.findpwd_form.submit();
    
}