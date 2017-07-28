<%@page import="java.util.Calendar"%>
<%@page import="com.eagle.men_in_black.model.MainDto"%>
<%@page import="com.eagle.men_in_black.model.DetailDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	MainDto dto = (MainDto)request.getSession().getAttribute("LoginInfo");
	DetailDto detailDto = (DetailDto)request.getAttribute("detailDto");
	String rootPath = request.getContextPath();
	
	Calendar cal = Calendar.getInstance();
	int tyear = cal.get(Calendar.YEAR);
	int tmonth = cal.get(Calendar.MONTH)+1;
	int tday = cal.get(Calendar.DATE);
	String today = "";

	if(tmonth<10){
		if(tday<10){
			today = tyear+"-0"+tmonth+"-0"+tday;
		}else{
			today = tyear+"-0"+tmonth+"-"+tday;
		}
	}else{
		if(tday<10){
			today = tyear+"-"+tmonth+"-0"+tday;
		}else{
			today = tyear+"-"+tmonth+"-"+tday;
		}
	}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<title>:::ReviewReply:::</title>

<link rel="stylesheet" href="../../../../../css/Mib.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<style type="text/css">
.photoLayout{
	width: 370px;
	height: 250px;
	margin-top: -40px;
	
}
.layout{
	width: 780px;
	height: 450px;
	position: relative;
	margin-top: 10px;
}
.leftLayout{
	float: left;
	width: 49.5%;
	height: 100%;
	position: relative;
	margin-left: 5px;
}
.rightLayout{
	float: right;
	width: 49.5%;
	height: 100%;
	position: relative;
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
<script type="text/javascript">
$(function() {
	$('#reply').on('click',function(){
		var REV_TITLE = $('#review_title').val();
		var REV_CONTENT = $('#review_content').val();
		var REV_REF = <%=detailDto.getREV_REF() %>;
		var PRO_SEQ = <%=detailDto.getPRO_SEQ() %>;
		if((REV_TITLE!=""&&REV_TITLE!=null)&&(REV_CONTENT!=""&&REV_CONTENT!=null)){
			$.ajax({
	 			type : "POST",
	 			url : "ReviewReplyAjax.mib",
	 			async : true,
	 			dataType : "html",
	 			data : {
	 				"REV_TITLE" : REV_TITLE,
	 				"REV_CONTENT" : REV_CONTENT,
	 				"REV_REF" : REV_REF,
	 				"PRO_SEQ" : PRO_SEQ
	 			},
	 			success : function(data) {
	 				var flag = $.parseJSON(data);
	 				if(flag>0){
	 					window.close();
	 					opener.parent.location.reload();
	 				}else{
	 					alert("리뷰답글달기실패");
	 				}
	 			},
	 			complete : function(data) {
	 			},
	 			error : function(xhr, status, error) {
	 				alert("error");
	 			}
	 		});
		}else{
			alert("제목과 내용을 입력하시오.");
		}
	});
});
</script>
<div class="layout">
	<div class="leftLayout">
		<div class="thumbnail">
			<div class="score" align="center" style="height: 20%"> 평점 
				<%
	        		if(detailDto.getSCORE()==1){
	        	%>
	        		<img alt="..." src="..<%=rootPath %>/images/scoreFull.png">
	        		<img alt="..." src="..<%=rootPath %>/images/scoreEmpty.png">
	        		<img alt="..." src="..<%=rootPath %>/images/scoreEmpty.png">
	        		<img alt="..." src="..<%=rootPath %>/images/scoreEmpty.png">
	        		<img alt="..." src="..<%=rootPath %>/images/scoreEmpty.png">
        		<%
	        		}else if(detailDto.getSCORE()==2){
        		%>
        			<img alt="..." src="..<%=rootPath %>/images/scoreFull.png">
	        		<img alt="..." src="..<%=rootPath %>/images/scoreFull.png">
	        		<img alt="..." src="..<%=rootPath %>/images/scoreEmpty.png">
	        		<img alt="..." src="..<%=rootPath %>/images/scoreEmpty.png">
	        		<img alt="..." src="..<%=rootPath %>/images/scoreEmpty.png">
        		<%
	        		}else if(detailDto.getSCORE()==3){
        		%>
        			<img alt="..." src="..<%=rootPath %>/images/scoreFull.png">
	        		<img alt="..." src="..<%=rootPath %>/images/scoreFull.png">
	        		<img alt="..." src="..<%=rootPath %>/images/scoreFull.png">
	        		<img alt="..." src="..<%=rootPath %>/images/scoreEmpty.png">
	        		<img alt="..." src="..<%=rootPath %>/images/scoreEmpty.png">
        		<%
	        		}else if(detailDto.getSCORE()==4){
        		%>
        			<img alt="..." src="..<%=rootPath %>/images/scoreFull.png">
	        		<img alt="..." src="..<%=rootPath %>/images/scoreFull.png">
	        		<img alt="..." src="..<%=rootPath %>/images/scoreFull.png">
	        		<img alt="..." src="..<%=rootPath %>/images/scoreFull.png">
	        		<img alt="..." src="..<%=rootPath %>/images/scoreEmpty.png">
        		<%
	        		}else if(detailDto.getSCORE()==5){
        		%>
        			<img alt="..." src="..<%=rootPath %>/images/scoreFull.png">
	        		<img alt="..." src="..<%=rootPath %>/images/scoreFull.png">
	        		<img alt="..." src="..<%=rootPath %>/images/scoreFull.png">
	        		<img alt="..." src="..<%=rootPath %>/images/scoreFull.png">
	        		<img alt="..." src="..<%=rootPath %>/images/scoreFull.png">
	        	<%
	        		}else{
        		%>
        			<h4>평점 데이터가 없습니다.</h4>
        		<%
	        		}
        		%>
				<hr style="border: solid black 1px; width: 70%;">
			</div>
			<div class="title" align="center" style="height: 20%; width: 100%;">
				<h5><%=detailDto.getREV_TITLE() %></h5>
			</div>
			<div class="info" style="height: 15%; width: 100%; text-align: right; margin-top: -70px;">
				<h6>작성자:<%=detailDto.getUSER_ID() %><br/>작성날짜:<%=detailDto.getREV_TIME() %></h6>
			</div>
			<%if(!detailDto.getSTORED_NAME().equals("none")){ %>
			
			<div class="photoLayout" >
				<img alt="..." src="..<%=rootPath %>/images/<%=detailDto.getSTORED_NAME()%>" style="float: left; width: 48%; height: 100%;">
				<textarea  rows="5px" cols="10px" readonly="readonly" style="float: left; width: 52%; height: 100%;"><%=detailDto.getREV_CONTENT() %></textarea>
			</div>
			<%
			}else{
			%>
			<div class="content" align="center" style="height: 28%; width: 100%; text-align: left;">
            <textarea rows="5px" cols="50px" readonly="readonly"></textarea>
        	</div>
			<%} %>
			<div class="btn" align="center" style="height: 10%; width:100%;">
			</div>
		</div>
	</div>
	<div class="rightLayout">
		<div class="thumbnail">
			<div class="score" align="center" style="height: 20%"> 
			<h4>답글</h4>
				<hr style="border: solid black 1px; width: 70%;">
			</div>
			<div class="title" align="center" style="height: 20%; width: 100%;">
				제목 : <input type="text" id="review_title" size="30px"/>
			</div>
			<div class="info" style="height: 15%; width: 100%; text-align: right;">
				<h5>작성자:<%=dto.getUSER_ID() %><br/>작성날짜:<%=today %></h5>
			</div>
			<div class="content" align="center" style="height: 28%; width: 100%; text-align: left;">
				<textarea id="review_content" rows="5px" cols="50px"></textarea>
			</div>
			<div class="btn" align="center" style="height: 10%; width:100%;">
				<button class="btn btn-default" style="width: 50%; height: 100%;" id="reply">답글달기</button>
			</div>
		</div>
	</div>
</div>

</body>
</html>