<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SignUp</title>
</head>
<body>
   <script type="text/javascript" src="http://wcs.naver.net/wcslog.js">
      
   </script>
   <form id="signinForm" action="mib_SignUp.mib">
      <h1>MEN IN BLACK</h1>

      <div class="signup-container">
         <input type="submit" name="signup" id="singup" value="MIB 회원가입" >
      </div>
      <div class="social-login-types">
         <div>
         <a href="#"
            onclick="Common.hcLogTrace(208, 532); Common.openWindow('https://www.happycampus.com/oAuth/auth/?authType=naver&amp;parent=main', 444, 478, 'oAuth'); return false;">
            <img alt="네이버 아이디로 로그인" src="../images/naver.png">
         </a>
         </div>
         <br>
      <div>
         <a id="kakao">
            <!-- <img alt="카카오톡 아이디로 로그인" src="../images/Kakao.png">  -->
         </a>
         
      </div>
      <br>
      <div>
         <a href="#"
            onclick="Common.hcLogTrace(208, 532); Common.openWindow('https://www.happycampus.com/oAuth/auth/?authType=naver&amp;parent=main', 444, 478, 'oAuth'); return false;">
            <img alt="페이스북" src="../images/face.png">
         </a>
         </div>
      </div>
   </form>
   
   <!--  <a id="kakao-login-btn"></a>
	<a href="http://developers.kakao.com/logout"></a> -->

<script type='text/javascript'>
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