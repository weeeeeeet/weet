
const checkBusinessMan = () => {

    // input value 수집
    const b_no = document.querySelector('input[name="userBiz"]').value;
    const start_dt = document.querySelector('input[name="startDt"]').value;
    const p_nm = document.querySelector('input[name="pNm"]').value;

    // 보낼 데이터 가공(api에서 요구하는 데이터 이름에 맞추어서)
    const data = {
	  "businesses": [
	    {
	      "b_no": b_no,
	      "start_dt": start_dt,
	      "p_nm": p_nm,
	      "p_nm2": "",
	      "b_nm": "",
	      "corp_no": "",
	      "b_sector": "",
	      "b_type": ""
	    }
	  ]
	}

    // api 호출
    $.ajax({
        url: "https://api.odcloud.kr/api/nts-businessman/v1/validate?serviceKey=YV6Lu58%2B3GhH6YSCp7nNw03F21B%2B7VnovsaIj%2BFpiMfYfP8ObytznJPyAvEdwcBdylUYhOlq43lBAEc3OQqhbw%3D%3D",  // serviceKey 값을 xxxxxx에 입력
        type: "POST",
        data: JSON.stringify(data), // json 을 string으로 변환하여 전송
        dataType: "JSON",
        contentType: "application/json",
        accept: "application/json",
        success: function (result) {
            console.log(result);
			if( result.data[0].valid === '01'){
            	alert('사업자확인이 완료되었습니다.');
	        	$("#bizDoubleChk").attr('value',"true")
			} else {
				alert("사업자 정보를 확인할 수 없습니다.");
			}
            // 성공했을 시 로직을 작성하는 곳
        },
        error: function (result) {
            console.log(result.responseText); //responseText의 에러메세지 확인        
            alert('사업자정보를 다시 확인해주세요.');
            // 실패했을 때
        }
    }); // .ajax
     
} // checkBusinessMan