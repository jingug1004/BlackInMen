<%@page import="com.eagle.men_in_black.model.ServiceDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	ServiceDto serviceDto = (ServiceDto) request.getAttribute("update");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>:::공지사항 글쓰기:::</title>
<style type="text/css">

.wrap {
	width: 30%;
	text-align: center;
	margin-left: 35%;
}

.mat-label {
	display: block;
	font-size: 16px;
	transform: translateY(25px);
	color: #e2e2e2;
	transition: all 0.5s;
}

.mat-input {
	position: relative;
	background: transparent;
	width: 100%;
	border: none;
	text-align: center;
	outline: none;
	padding: 8px 0;
	font-size: 16px;
}

.mat-div {
	padding: 30px 0 0 0;
	position: relative;
}

/* 밑줄 before */
.mat-div:after, .mat-div:before {
	content: "";
	position: absolute;
	display: block;
	width: 100%;
	height: 2px;
	background-color: #d1d1d1;
	bottom: 0;
	left: 0;
	transition: all 0.5s;
}
/* 밑줄 */
.mat-div::after {
	background-color: #000000;
	transform: scaleX(0);
}

.is-active::after {
	transform: scaleX(1);
}
/* 밑줄라벨 */
.is-active .mat-label {
	color: #000000;
}
.is-completed .mat-label {
	font-size: 12px;
	transform: translateY(0);
}

@media ( max-width : 1200px) { 
.ty{
margin-top: 30px;
}
}
</style>
<body>
	<center class="ty">
		<div id="noticehead">
			<h4 align="right" style="margin-right: 100px">
				<a href="meninblack.mib">홈</a> > <a href="servicenotice.mib">공지사항</a>
			</h4>
		</div>
	</center>
	<h3>공지사항을 작성해주세요</h3>

	<form <%if(serviceDto==null){ %>action="servicereg.mib"<%}else{ %>action="serviceupdate.mib"<%} %> method="post"
		name="form" enctype="multipart/form-data">
		<%if(serviceDto!=null){ %>
		
		<input type="hidden" name="seq" value="<%=serviceDto.getNOTICE_SEQ()%>">
		<%} %>
		<div class="wrap">

			<div class="mat-div">
				<label for="first-name" class="mat-label">제목</label>
				 <input type="text" class="mat-input" name="noticetitle" id="notice_title"
				 	<%if(serviceDto!=null){ %>value="<%=serviceDto.getNOTICE_TITLE() %>" <%} %>
				 >
			</div>
		</div>
		<br> <br>
		<textarea rows="10" cols="80" name="editor" id="editor1">
			<%if(serviceDto!=null){ %> <%=serviceDto.getNOTICE_CONTENT()%>  <%} %>
	</textarea>
		<script>
			CKEDITOR.replace("editor", {

				/* 이미파일 저장할 경로 */
				filebrowserImageUploadUrl : 'CkeditorImgUpload.mib',

				filebrowserWindowWidth : '500',

				filebrowserWindowHeight : '380',

				height : '600px'

			});
		</script>
		<!-- <input type="submit" class="btn btn-primary" value="등록"> -->
		<p align="right">
			<input type="button" id="write"  class="btn btn-default" onclick="check();" value="등록"> <a
				class="btn btn-default" href="servicenotice.mib" role="button">취소</a>
		</p>

	</form>


	<!--공지사항제목 스크립트  -->
	<script type="text/javascript">
	
    function check() {
  		if($("#notice_title").val()==""||$("#editor1").val()=="") {
  			alert("제목과 내용을 입력하세요");
  		} else {
  			form.submit();
  		}
	}
	
		$(".mat-input").focus(function() {
			$(this).parent().addClass("is-active is-completed");
		});

		$(".mat-input").focusout(function() {
			if ($(this).val() === "")
				$(this).parent().removeClass("is-completed");
			$(this).parent().removeClass("is-active");
		});
		
		 $(document).ready(function() {

		      if($(".mat-input").val()===''){
		    	  }else{
		    		  $(".mat-input").parent().addClass("is-active is-completed");
		    	      
		      }
				  	
		      
		      });
	</script>
</body>
</html>