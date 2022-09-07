/* <script type='text/javascript'>
Kakao.init('본인 앱키');


$("#kakao-login-btn").on("click", function(){
    //1. 로그인 시도
    Kakao.Auth.login({
        success: function(authObj) {

          //2. 로그인 성공시, API 호출
          Kakao.API.request({
            url: '/v2/user/me',
            success: function(res) {
              console.log(res);
              var id = res.id;
              scope : 'account_email';
            alert('로그인성공');
              location.href="callback주소";



        }
          })
          console.log(authObj);
          var token = authObj.access_token;
        },
        fail: function(err) {
          alert(JSON.stringify(err));
        }
      })

}) 


</script> */