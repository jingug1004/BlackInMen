<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
#sign_email_Btn {
	padding: 10px 103px;
	border: 1px solid rgba(0, 0, 0, 0.4);
	text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.4);
	box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.3), inset 0 10px 10px
		rgba(255, 255, 255, 0.1);
	border-radius: 0.3em;
	background: #FFFFFF;
	float: right;
	font-weight: bold;
	cursor: pointer;
	font-size: 13px;
}
</style>
<title>Insert title here</title>
</head>
<body>
<%
	String randomNum = (String)request.getAttribute("randomNum");
	String sign_email = (String)request.getAttribute("sign_email");
	String signupdate = (String)request.getAttribute("signupdate")==null?"":(String)request.getAttribute("signupdate");
	
	//System.out.println("ㅇㅣ메일쳌쳌"+randomNum+sign_email+signupdate);
%>
<input type="hidden" id="signupdate" value="<%=signupdate%>">

<form action="" name="signinForm" id="signinForm">
 <div class="modal-header">
        <button type="button" id="close_Btn" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
</div>
  <h1>MEN IN BLACK</h1>
  <div class="inset">
  <p style="margin-bottom: -13px; margin-top: 20px">
    <input type="text" placeholder="인증번호입력" name="email_check" id="email_check">
    <input type="hidden" name="randomNum" id="randomNum" value="<%=randomNum%>">
    <input type="hidden" name="sign_email" id="sign_email" value="<%=sign_email%>">
    <input type="hidden" name="upda" id="upda" value="">
    <input type="hidden" name="success" id="success" value="">
  </p>
   </div>
  <p class="signin-container">
    <input type="button" name="sign_email_Btn" id="sign_email_Btn" value="인증확인">
  </p>
 
</form>
<script type="text/javascript">
	$(document).ready(function() { 
		
		if($("#signupdate").val()=='update'){ // 회원 정보수정에서 
		
			$("#sign_email_Btn").click(function() {
				if($("#email_check").val()==$("#randomNum").val()){
			
					$("#success").val('success');
					$("#upda").val('OK');
					$("#signinForm").attr('action','userup.mib');
					$("#signinForm").submit();
				}else{
					alert("인증번호 틀림");
					$("#success").val('fail');
					$("#signinForm").attr('action','userup.mib');
					$("#signinForm").submit();	
				
				}
			});
		
		
			$("#close_Btn").click(function() {
			
				alert("인증번호 틀림");
				$("#success").val('fail');
				$("#signinForm").attr('action','userup.mib');
				$("#signinForm").submit();	
				
			
			});
	}else{ // 회원가입때 
			
			$("#sign_email_Btn").click(function() {
					if($("#email_check").val()==$("#randomNum").val()){
				
						$("#success").val('success');
						$("#signinForm").attr('action','mib_SignUp.mib');
						$("#signinForm").submit();
					}else{
						alert("인증번호 틀림");
						$("#success").val('fail');
						$("#signinForm").attr('action','mib_SignUp.mib');
						$("#signinForm").submit();	
					
					}
			});
			$("#close_Btn").click(function() {
				
					alert("인증번호 틀림");
				$("#success").val('fail');
				$("#signinForm").attr('action','mib_SignUp.mib');
				$("#signinForm").submit();	
					
				
			});
		
	}
	});
</script>

</body>
</html>