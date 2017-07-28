<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="loginCheck.mib" id="signinForm">
  <h1>MEN IN BLACK</h1>
  <div class="inset">
  <p style="margin-bottom: -13px; margin-top: 0px">
    <input type="text" placeholder="아이디" name="id" id="email">
  </p>
  <p>
    <input type="password" placeholder="비밀번호" name="pwd" id="pwd">
  </p>
  </div>
  <p class="signin-container" style="margin-top: -23px;">
    <input class="btn btn-default" type="submit" name="go" id="go" value="로그인"style="width: 54%; float:left; border-radius: 0.3em; height:50px; margin-top: 5px; margin-bottom: 17px; margin-left: 18px">

  	<input type="button" class="btn btn-default" id="signup" value="회원가입" style="width: 31%; float:left; border-radius: 0.3em; height:50px; margin-top: 5px; margin-left: 5px; font-weight:bold">
  	<a id="kakao" style="margin-left: 18px"></a>
  	
  </p>
  
 
</form>
 
<script type='text/javascript'>
	
	$(document).ready(function() {
		$("#signup").click(function() {
			location.href='mib_SignUp.mib';
			
		});
	});

  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('4f7736c38c63aa2f666d7083b9ea4605');
    // 카카오 로그인 버튼을 생성합니다.
    Kakao.Auth.createLoginButton({
      container: '#kakao',
      success: function(authObj) {
        alert(JSON.stringify(authObj));
      },
      fail: function(err) {
         alert(JSON.stringify(err));
      }
    });
  //]]>
</script>     
      
</body>
</html>