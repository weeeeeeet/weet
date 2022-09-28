
//휴대폰 번호 인증
	let code2 = "";
	$("#phoneChk").click(function(){
		alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주세요.");
		let user_phone = $("#user_phone").val();
		$.ajax({
	        type:"GET",
	        url:"/auth/phoneCheck?user_phone=" + user_phone,
	        cache : false,
	        success:function(data){
	        	if(data == "error"){
	        		alert("휴대폰 번호가 올바르지 않습니다.");
					$(".successPhoneChk").text("유효한 번호를 입력해주세요.");
					$(".successPhoneChk").css("color","red");
					$("#user_phone").attr("autofocus",true);
	        	}else{	        		
	        		$("#user_phone2").attr("disabled",false);
	        		$("#phoneChk2").css("display","inline-block");
	        		$(".successPhoneChk").text("인증번호를 입력한 뒤 본인인증을 눌러주세요.");
	        		$(".successPhoneChk").css("color","green");
	        		$("#user_phone").attr("readonly",true);
	        		code2 = data;
	        	}
	        }
	    });
	});
	
		
	//휴대폰 인증번호 대조
	$("#phoneChk2").click(function(){
		if($("#user_phone2").val() == code2){
			$(".successPhoneChk").text("인증번호가 일치합니다.");
			$(".successPhoneChk").css("color","green");
			$("#phoneDoubleChk").val("true");
			$("#user_phone2").attr("disabled",true);
		}else{
			$(".successPhoneChk").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.");
			$(".successPhoneChk").css("color","red");
			$("#phoneDoubleChk").val("false");
			$(this).attr("autofocus",true);
		}
	});
	
	