<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>

<%@page import="java.util.Calendar"%>
<%@page import="com.eagle.men_in_black.model.MainDto"%>
<%@ page import="com.eagle.men_in_black.model.UserMypageDto"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	MainDto dto = (MainDto) request.getSession().getAttribute("LoginInfo");
	UserMypageDto qnaDto = (UserMypageDto) request.getAttribute("qnaDto");
	SimpleDateFormat df = new SimpleDateFormat("yy/MM/dd");
	Date date = new Date(); // 현재 날짜 생성
	String today = df.format(date);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="../../../../../css/Mib.css">
<title>:::Q&ADetail:::</title>
<style type="text/css">
.layout {
	width: 790px;
	height: 530px;
	position: relative;
	margin-top: 10px;
	margin-left: 10px;
}

.thumbnail {
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
			<div align="center" style="height: 15%;">
				<h3>Q&A</h3>
			</div>

			<div style="width: 100%">
				<!-- 전체 -->
				<div style="width: 45%; float: left" align="left">
					<!-- 왼쪽  -->
					<p>
						공개설정 : <select name=secret size=1 disabled="disabled"
							style="width: 100%">
							<option value="" selected="selected"><%=qnaDto.getQNA_OPEN()%></option>
							<option value="공개">공개</option>
							<option value="비공개">비공개</option>
						</select>
					</p>
					<p>
						문의설정 : <select name=secret size=1 disabled="disabled"
							style="width: 100%">
							<option value="" selected="selected"><%=qnaDto.getQNA_TYPE()%></option>
							<option value="배송문의">배송문의</option>
							<option value="상품/교환/환불문의">상품/교환/환불문의</option>
						</select>
					</p>
					<p>
						작성자 : <input type="text" value="<%=qnaDto.getUSER_ID()%>"
							readonly="readonly" style="width: 100%">
					</p>
					<p>
						작성일 : <input type="text" value="<%=qnaDto.getQNA_TIME()%>"
							readonly="readonly" style="width: 100%">
					</p>
					<p>
						제목 : <input type="text" value="<%=qnaDto.getQNA_TITLE()%>"
							readonly="readonly" style="width: 100%"> <input
							type="hidden" id="QNA_SEQ" name="QNA_SEQ"
							value="<%=qnaDto.getQNA_SEQ()%>">

					</p>
					<p>
						내용

						<textarea style="width: 100%" rows="5px" cols="50px"
							readonly="readonly"><%=qnaDto.getQNA_CONTENT()%></textarea>
					</p>



				</div>
				<div style="width: 45%; float: left; margin-left: 5%" align="left">
					<!-- 오른쪽  -->
					<form>
						<p>
							공개설정 : <input type="text" id="secret" selected="selected" style="width: 100%;" value="<%=qnaDto.getQNA_OPEN()%>" readonly="readonly">
							
							
		
						</p>
						<p>
							문의설정 :<input type="text" id="secretz" selected="selected"  style="width: 100%;" value="<%=qnaDto.getQNA_TYPE()%>" readonly="readonly">
						</p>
						<p>
							작성자 : <input type="text" value="<%=dto.getUSER_ID()%>"
								readonly="readonly" style="width: 100%" id="USER_ID" name="USER_ID">
						</p>
						<p>
							작성일 : <input type="text" value="<%=today%>" style="width: 100%"
								readonly="readonly">
						</p>
						<p>
							제목 : <input type="text" value="" style="width: 100%" id="title" name="title"> 
							<input type="hidden" id="QNA_REF" name="QNA_REF" value="<%=qnaDto.getQNA_REF()%>">
							<input type="hidden" id="PRO_SEQ" name="PRO_SEQ" value="<%=qnaDto.getPRO_SEQ()%>">
						</p>
						<p>
							내용
							<textarea style="width: 100%" rows="5px" cols="50px" id="QNA_CONTENT" name="QNA_CONTENT"></textarea>
						</p>
					</form>
				</div>

				<div align="center" style="width: 100%;">
					<button class="btn btn-default" style="width: 85%;"
						onclick="reps()">답글저장</button>
					<button class="btn btn-default" style="width: 85%;"
						onclick="windowClose()">취소</button>
				</div>
			</div>


<script type="text/javascript">
	
function reps() {
	
	alert("답글을 저장하였습니다.");
	
	var secretz = $("#secretz").val();
	var secret = $("#secret").val();
	var QNA_REF =$("#QNA_REF").val();
	var title = $("#title").val();
	var QNA_CONTENT= $("#QNA_CONTENT").val();
	var USER_ID = $("#USER_ID").val();
	var PRO_SEQ =$("#PRO_SEQ").val();
	
	if(title==''||title==null){
		
		if(QNA_CONTENT==''||QNA_CONTENT==null){
			alert('제목과 내용을 입력해주세요');	
			
		}else{
		alert('제목을 입력해주세요');
	}
	}else if(QNA_CONTENT==''||QNA_CONTENT==null){
		alert('내용을 입력해주세요');
	}else{
	
	$.ajax({
		type : "POST",
		url : "qnareps.mib",
		async : true,
		dataType : "html",
		data : {
			"secretz" : secretz,
			"secret" : secret,
			"title" : title,
			"QNA_REF" : QNA_REF,
			"QNA_CONTENT" : QNA_CONTENT,
			"USER_ID" : USER_ID,
			"PRO_SEQ" : PRO_SEQ
		},
		success : function(data) {
			var flag = $.parseJSON(data);
			if(flag.result=='success'){
				opener.parent.location.reload();
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
};
function windowClose() {
	window.close();
}
</script>
</body>
</html>