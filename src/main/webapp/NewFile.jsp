<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- <script>
  window.fbAsyncInit = function() {
    FB.init({
      appId      : '1134544013358802',
      xfbml      : true,
      version    : 'v2.8'
    });
    FB.AppEvents.logPageView();
  };

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "//connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));
</script> -->
<script>
  // 이것은 FB.getLoginStatus()의 결과로 호출됩니다.
  function statusChangeCallback(response) {
    console.log('statusChangeCallback');
    console.log(response);
    // 응답 객체는 상태 필드와 함께 반환되어
    // app은 그 사람의 현재 로그인 상태를 알고 있습니다.
    // 응답 객체의 전체 문서는 설명서에서 찾을 수 있습니다.
    // for FB.getLoginStatus().
    if (response.status === 'connected') {
      // 앱과 Facebook에 로그인되었습니다.
      testAPI();
    } else {
      // 사용자가 앱에 로그인하지 않았거나 Google에서 알 수 없습니다..
      document.getElementById('status').innerHTML = 'Please log ' +
        'into this app.';
    }
  }

  // 이 함수는 누군가 Login으로 끝날 때 호출됩니다.
  // Button. 샘플에 첨부 된 onlogin 처리기를 참조하십시오.
  // 아래 코드
  function checkLoginState() {
    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
    });
  }

  window.fbAsyncInit = function() {
  FB.init({
    appId      : '1134544013358802',
    cookie     : true,  // 서버가 액세스 할 수 있도록 쿠키 활성화
                        // 세션
    xfbml      : true,  // 이 페이지에서 소셜 플러그인을 분석하십시오.
    version    : 'v2.8' // 그래프 API 버전 2.8 사용
  });

  // JavaScript SDK를 초기화 했으므로 이제
  // FB.getLoginStatus (). 이 함수는
  // 이 페이지를 방문한 사람은 세 가지 상태 중 하나를 반환 할 수 있습니다.
  // 제공하는 콜백. 그들은 할 수있다:
  //
  // 1. 앱에 로그인되었습니다 ( '연결됨').
  //  2. Facebook에 로그인되었지만 앱이 아닌 경우 ( 'not_authorized')
  // 3.  Facebook에 로그인하지 않았고 로그인했는지 여부를 알 수 없습니다.
  //   귀하의 앱인지 여부
  //
  // 이 세 가지 경우는 콜백 함수에서 처리됩니다.

  FB.getLoginStatus(function(response) {
    statusChangeCallback(response);
  });

  };

  //SDK를 비동기 적으로로드하십시오.
  (function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));

  // 여기서 우리는 로그인 후 그래프 API에 대한 간단한 테스트를 실행합니다.
  // 성공한. 이 호출이 발생하면 statusChangeCallback ()을 참조하십시오.
  function testAPI() {
    console.log('Welcome!  Fetching your information.... ');
    FB.api('/me', function(response) {
      console.log('Successful login for: ' + response.name);
      document.getElementById('status').innerHTML =
        '환영합니다!  ' + response.name + '  님!';
    });
  }
</script>

<!--
 아래에는 로그인 버튼 소셜 플러그인이 포함되어 있습니다. 이 버튼은
  트리거하는 그래픽 로그인 버튼을 표시하는 JavaScript SDK
  클릭하면 FB.login () 함수가 호출됩니다.
-->

<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.8&appId=1134544013358802";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
<div class="fb-login-button" data-max-rows="1" data-size="xlarge" data-show-faces="false" data-auto-logout-link="true"value="페이스북으로로그인"></div>
<div id="status">
</div>

</body>
</html>
</body>
</html>