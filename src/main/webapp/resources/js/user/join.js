
// ==========================================
//          아이디 중복 체크
//===========================================

function checkId() {
  var id = $('#user_id').val(); //id값이 "id"인 입력란의 값을 저장
  $.ajax({
    url: '/user/tr/idCheck', //Controller에서 요청 받을 주소
    type: 'post', //POST 방식으로 전달
    data: { user_id: id },
    dataType: "json",
    success: function (cnt) { //컨트롤러에서 넘어온 cnt값을 받는다 
      if (cnt == 0) { //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
        $('.id_ok').css("display", "inline-block");
        $('.id_already').css("display", "none");
      } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
        $('.id_already').css("display", "inline-block");
        $('.id_ok').css("display", "none");
        alert("아이디를 다시 입력해주세요");
        $('#user_id').val('');
      }
    },
    error: function () {
      alert("에러입니다");
    }
  });
};

// ==========================================
//          약관 동의 체크박스
//===========================================

$(document).ready(function(){
    // 전체 체크박스 클릭 시
    $("#agreeAll").click(function() {
if($("#agreeAll").is(":checked")) $("input[name=agreechk]").prop("checked", true);
else $("input[name=agreechk]").prop("checked", false);
});

$("input[name=agreechk]").click(function() {
const total = $("input[name=agreechk]").length;
const checked = $("input[name=agreechk]:checked").length;

if(total != checked) $("#agreeAll").prop("checked", false);
else $("#agreeAll").prop("checked", true); 
});
});


// ==========================================
//  joinform_check 함수로 유효성 검사
//===========================================


function joinform_check() {
    //변수에 담아주기
    var id = document.getElementById("user_id");
    var pwd = document.getElementById("user_pwd");
    var pwd2 = document.getElementById("user_pwd2");
    var pweCheck = document.getElementById("pweCheck");
    var userEmail = document.getElementById("user_email");
    var userPhone = document.getElementById("user_phone");
    var uname = document.getElementById("user_name");
    var female = document.getElementById("female");
    var male = document.getElementById("male");
    var trIntro = document.getElementById("user_intro");
    var bNo = document.getElementById("bNo");
    var pNm = document.getElementById("pNm");
    var startDt = document.getElementById("start_dt");
    var SvcUse = document.getElementById("SvcUse");
    var SvcPCY = document.getElementById("SvcPCY");

	var checkBox = function(target){
		let cnt = 0;
		if(target != undefined){
			for(var i=0; i < target.length; i++){
				if(target[i].checked) cnt++;
			}
		}
		return cnt;
	}

	// 아이디 입력 확인
    if (id.value == "") { //해당 입력값이 없을 경우 같은말: if(!uid.value)
      alert("아이디를 입력하세요.");
      id.focus(); //focus(): 커서가 깜빡이는 현상, blur(): 커서가 사라지는 현상
      return false; //return: 반환하다 return false:  아무것도 반환하지 말아라 아래 코드부터 아무것도 진행하지 말것
    };


	// 비밀번호 입력 확인
    if (pwd.value == "") {
      alert("비밀번호를 입력하세요.");
      pwd.focus();
      return false;
    };

    //비밀번호 영문자+숫자+특수조합(8~25자리 입력) 확인
    var pwdExpression = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,14}$/;

    if (!pwdExpression.test(pwd.value)) {
      alert("비밀번호는 영문자+숫자+특수문자 조합으로 8~14자리 사용해야 합니다.");
      pwd.focus();
      return false;
    };

	// 비밀번호 일치여부 확인
    if (pwd2.value == pwd.value) {
      pweCheck.innerHTML='비밀번호가 일치합니다.'  /* innerHTML : HTML 내부에 추가적인 내용을 넣을 때 사용하는 것. */
      pweCheck.style.color='blue';
    } else {
      pweCheck.innerHTML='비밀번호가 일치하지 않습니다.';
      pweCheck.style.color='red';
      alert("비밀번호가 일치하지 않습니다.");
      pwd2.focus();
      return false;
    };

	// 이메일 입력 및 형식 확인
    if(!regExpTest(/^[\w]{4,}@[\w]+(\.[\w]+){1,3}$/, email, "이메일 형식에 어긋납니다."))
      return false;
    
    if (userEmail.value == "") {
      alert("이메일 주소를 입력하세요.");
      userEmail.focus();
      return false;
    }
    
    // 핸드폰번호 입력 및 형식 확인 - 인증을 따로 하는 데, 필요있을까...
    var reg = /^[0-9]+/g; //숫자만 입력하는 정규식

    if (!reg.test(userPhone.value)) {
      alert("전화번호는 숫자만 입력할 수 있습니다.");
      userPhone.focus();
      return false;
    }
    
  	 // 이름입력 및 형식 확인
     // 한글2글자 이상만 허용. [가-힣] 으로 해도되긴 하지만 자음만(ㄱㄴㄷㄹ)있으면 필터링이 안됨
     var regExp3 = /^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]{2,}$/;
 
     if(!regExpTest(regExp3,userName,"한글2글자이상 입력하세요."))
     return false;

    /* 성별 검사 */
    // 조건식에 함수 호출, 배열 꺼내어 개수확인-> 
    if(checkBox(f.userGender) == 0){
      alert('성별을 선택하세요');
      f.userGender[0].focus();
      return;
    }

	// 트레이너 소개 입력 확인
	if (trIntro.value == "") {
      alert("트레이너 소개를 입력하세요");
      userEmail.focus();
      return false;
    }
    
	// 사업자 번호 입력 확인
    if (bNo.value == "") {
      alert("사업자 번호를 입력하세요.");
      userEmail.focus();
      return false;
    }
    
	// 사업자 개업일자 입력 확인
    if (pNm.value == "") {
      alert("사업자 개업일자를 입력하세요.");
      userEmail.focus();
      return false;
    }
    
	// 대표자 성명 입력 확인
    if (startDt.value == "") {
      alert("대표자 성명을 입력하세요.");
      userEmail.focus();
      return false;
    }

    if (!SvcUse.checked) { //체크박스 미체크시
      alert("이용 약관 동의를 체크하세요.");
      SvcUse.focus();
      return false;
    }
    if (!SvcPCY.checked) { //체크박스 미체크시
      alert("개인정보 약관 동의를 체크하세요.");
      SvcPCY.focus();
      return false;
    }

    //입력 값 전송
    document.join_form.submit(); //유효성 검사의 포인트   
  }

