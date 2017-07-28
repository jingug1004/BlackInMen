<%@page import="com.eagle.men_in_black.model.MainDto"%>
<%@page import="com.eagle.men_in_black.model.UserMypageDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	UserMypageDto qnaDto = (UserMypageDto) request.getAttribute("qnaDto");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../../../../../css/Mib.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<title>:::Q&AUpdate:::</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<style type="text/css">
.layout{
	width: 790px;
	height: 390px;
	position: relative;
	margin-top: 10px;
	margin-left: 10px;
}
.thumbnail{
	width: 100%;
	height: 100%;
	text-align: center;
}
input, select, textarea {
	border: 1px solid #ccc;
	display: inline-block;
	border-radius: 3px;
	box-shadow: inset 0px 1px 1px rgba(0, 0, 0, 0.075);
}
</style>
</head>
<body>

<div class="layout">
	<div class="thumbnail">
		<form id="form1">
		<div align="center" style="height: 15%;">
			<h3>Q&A 수정</h3>
		</div>
		<div align="center" style="height: 10%; width: 100%;">
			<div style="float: left; width: 50%; height: 100%;" align="left">
				<p style="margin-left: 30px;">
				공개설정 : 
				<select name=secret size=1 id="secret">
			        <option  value="<%=qnaDto.getQNA_OPEN()%>"  ><%=qnaDto.getQNA_OPEN()%></option>	   
			        <option value="공개">공개</option>
			        <option value="비공개">비공개</option>
		    	</select>
		    	</p>
			</div>
			<div style="float: right; width: 50%; height: 100%;" align="left">
				<p style="margin-left: 30px;">
				문의설정 : 
				<select name=secretz size=1 id="secretz">
			        <option value="<%=qnaDto.getQNA_TYPE()%>"><%=qnaDto.getQNA_TYPE()%></option>
			        <option value="배송문의">배송문의</option>
			        <option value="상품/교환/환불문의">상품/교환/환불문의</option>
		    	</select>
		    	</p>
			</div>
		</div>
		<div style="height: 10%; width: 100%;">
			<div style="height: 100%; width: 50%; float: left;">
				<p align="left" style="margin-left: 30px;">
				
					작성자 : <input style="margin-left: 14px" type="text" value="<%=qnaDto.getUSER_ID()%>" readonly="readonly">
					
				</p>
			</div>
			<div style="height: 100%; width: 50%; float: right;">
				<p align="left" style="margin-left: 30px;">
				
					작성일 : <input style="margin-left: 14px" type="text" value="<%=qnaDto.getQNA_TIME()%>" readonly="readonly">
					
				</p>
			</div>
		</div>
		<div style="height: 10%; width: 100%;">
			<p align="left" style="margin-left: 30px;">
			
				제목 : <input style="margin-left: 28px" type="text"  name="title" id="title" value="<%=qnaDto.getQNA_TITLE()%>">
				
				<input type="hidden" name="QNA_SEQ" id="QNA_SEQ" value=<%=qnaDto.getQNA_SEQ()%>>
			</p>
		</div>
		<div style="height: 35%; width: 100%;">
			<p><h5 align="left" style="margin-left: 30px;" >내용</h5></p>
			
			<textarea name="QNA_CONTENT" id="QNA_CONTENT" rows="5px" cols="100px" ><%=qnaDto.getQNA_CONTENT()%></textarea>
			
		</div>
		<div class="btn" align="center" style="height: 10%; width:100%;">
			<div style="float: left; width: 50%;">
			
				<button style="width: 50%;  height: 100%;" class="btn btn-default"onclick="update()" type="button">수정저장</button>
				
			</div>
			<div style="float: right; width: 50%;">
				<button style="width: 50%; height: 100%;"  class="btn btn-default" onclick="windowClose()">취소하기</button>
			</div>
		</div>
		</form>
	</div>
</div>

<script type="text/javascript">
function update() {
	var QNA_SEQ =$("#QNA_SEQ").val();
	var title = $("#title").val();
	var QNA_CONTENT= $("#QNA_CONTENT").val();
	var secretz = $("#secretz").find(":selected").val();
	var secret = $("#secret").find(":selected").val();
	$.ajax({
		type : "POST",
		url : "qnaupdate.mib",
		async : true,
		dataType : "html",
		data : {
			"secretz" : secretz,
			"secret" : secret,
			"QNA_SEQ" : QNA_SEQ,
			"title" : title,
			"QNA_CONTENT" : QNA_CONTENT
		},
		success : function(data) {
			var flag = $.parseJSON(data);
			if(flag.result=='success'){
				opener.location.reload();
				alert("수정되었습니다");
				windowClose();
			} 	
		},
		complete : function(data) {
		},
		error : function(xhr, status, error) {
			alert("error");
		}
	});	
}
function windowClose(){
	window.close();
}
</script>
</body>
</html>