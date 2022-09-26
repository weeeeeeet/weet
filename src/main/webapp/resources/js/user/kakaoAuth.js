Kakao.init('256f2b3b781dec69babbbfe1bfa606eb');
console.log(Kakao.isInitialized()); // sdk초기화여부판단

//카카오로그인
$("#kakao-login-btn").on("click", function () {

  //1. 로그인 시도
  Kakao.Auth.login({
    success: function (authObj) {

      //2. 로그인 성공시, API 호출
      Kakao.API.request({
        url: '/v2/user/me',
        success: function (res) {
          console.log(res);
          var id = res.id;
          scope: 'account_email';
          alert('로그인성공');
          location.href = "callback주소";


        }
      })
      console.log(authObj);
      var token = authObj.access_token;
    },
    fail: function (err) {
      alert(JSON.stringify(err));
    }
  });

})

function loginWithKakao() {
    Kakao.Auth.login({
        success: function (authObj) {
            alert(JSON.stringify(authObj))
        },
        fail: function (err) {
            alert(JSON.stringify(err))
        },
    })
}
