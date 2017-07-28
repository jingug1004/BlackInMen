<%@page import="com.eagle.men_in_black.model.MainDto"%>
<%@page import="com.eagle.men_in_black.model.DetailDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	MainDto dto = (MainDto)request.getSession().getAttribute("LoginInfo");
	int REV_SEQ = Integer.parseInt(request.getParameter("REV_SEQ"));
	DetailDto detailDto = (DetailDto)request.getAttribute("detaildto");
	String rootPath = request.getContextPath();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../../../../../css/Mib.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
	<script
			src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<title>:::Review:::</title>

<style type="text/css">
.layout{
	width: 790px;
	height: 390px;
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
.fullLayout{
	float: right;
	width: 100%;
	height: 100%;
	position: relative;
}
.thumbnail{
 width: 100%;
 height: 115%;
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
	<%if(!detailDto.getSTORED_NAME().equals("none")){ %>
	<div class="leftLayout">
		<img alt="..." src="..<%=rootPath %>/images/<%=detailDto.getSTORED_NAME()%>" width="100%">
	</div>
	<div class="rightLayout">
	<%
	}else{
	%>
	<div class="fullLayout">
	<%} %>
		<div class="thumbnail">
			<div class="score" align="center" style="height: 20%"> 
			<%
				if(detailDto.getUSER_ID().equals("adm")){
			%>
			<%
				}else{
			%>
			평점 
			<%
				}
			%>
				<%
	        		if(detailDto.getSCORE()==1){
	        	%>
	        		<img alt="..." src="..<%=rootPath %>/images/scoreFull.png">
	        		<img alt="..." src="..<%=rootPath %>/images/scoreEmpty.png">
	        		<img alt="..." src="..<%=rootPath %>/images/scoreEmpty.png">
	        		<img alt="..." src="..<%=rootPath %>/images/scoreEmpty.png">
	        		<img alt="..." src="..<%=rootPath %>/images/scoreEmpty.png">
	        		<hr style="border: solid black 1px; width: 70%;">
        		<%
	        		}else if(detailDto.getSCORE()==2){
        		%>
        			<img alt="..." src="..<%=rootPath %>/images/scoreFull.png">
	        		<img alt="..." src="..<%=rootPath %>/images/scoreFull.png">
	        		<img alt="..." src="..<%=rootPath %>/images/scoreEmpty.png">
	        		<img alt="..." src="..<%=rootPath %>/images/scoreEmpty.png">
	        		<img alt="..." src="..<%=rootPath %>/images/scoreEmpty.png">
	        		<hr style="border: solid black 1px; width: 70%;">
        		<%
	        		}else if(detailDto.getSCORE()==3){
        		%>
        			<img alt="..." src="..<%=rootPath %>/images/scoreFull.png">
	        		<img alt="..." src="..<%=rootPath %>/images/scoreFull.png">
	        		<img alt="..." src="..<%=rootPath %>/images/scoreFull.png">
	        		<img alt="..." src="..<%=rootPath %>/images/scoreEmpty.png">
	        		<img alt="..." src="..<%=rootPath %>/images/scoreEmpty.png">
	        		<hr style="border: solid black 1px; width: 70%;">
        		<%
	        		}else if(detailDto.getSCORE()==4){
        		%>
        			<img alt="..." src="..<%=rootPath %>/images/scoreFull.png">
	        		<img alt="..." src="..<%=rootPath %>/images/scoreFull.png">
	        		<img alt="..." src="..<%=rootPath %>/images/scoreFull.png">
	        		<img alt="..." src="..<%=rootPath %>/images/scoreFull.png">
	        		<img alt="..." src="..<%=rootPath %>/images/scoreEmpty.png">
	        		<hr style="border: solid black 1px; width: 70%;">
        		<%
	        		}else if(detailDto.getSCORE()==5){
        		%>
        			<img alt="..." src="..<%=rootPath %>/images/scoreFull.png">
	        		<img alt="..." src="..<%=rootPath %>/images/scoreFull.png">
	        		<img alt="..." src="..<%=rootPath %>/images/scoreFull.png">
	        		<img alt="..." src="..<%=rootPath %>/images/scoreFull.png">
	        		<img alt="..." src="..<%=rootPath %>/images/scoreFull.png">
	        		<hr style="border: solid black 1px; width: 70%;">
	        	<%
	        		}else{
        		%>
        			
        		<%
	        		}
        		%>
				
			</div>
			<div class="title" align="center" style="height: 20%; width: 100%;">
				<h3><%=detailDto.getREV_TITLE() %></h3>
			</div>
			<div class="info" style="height: 15%; width: 100%; text-align: right;">
				<h5>작성자:<%=detailDto.getUSER_ID() %><br/>작성날짜:<%=detailDto.getREV_TIME() %></h5>
			</div>
			<div class="content" align="center" style="height: 28%; width: 100%; text-align: left;">
			<%if(!detailDto.getSTORED_NAME().equals("none")){ %>
				<textarea  rows="5px" cols="50px" readonly="readonly"><%=detailDto.getREV_CONTENT() %></textarea>
			<%}else{ %>
			<textarea rows="5px" cols="100px" readonly="readonly" style="margin-left: 20px;"><%=detailDto.getREV_CONTENT() %></textarea>
			<%} %>
			</div>
			<div class="btn" align="center" style="height: 10%; width:100%;">
				
				<%
					if(dto!=null && dto.getUSER_ID().equalsIgnoreCase("adm") && dto.getUSER_ID().equals(detailDto.getUSER_ID()) ){
				%>
				<button class="btn btn-default"  style="width: 100%; height: 100%;" onclick="reviewUpdate(<%=detailDto.getREV_SEQ() %>)">수정하기</button>
				<%
					}else if(dto!=null && dto.getUSER_ID().equalsIgnoreCase("adm")){
				%><button class="btn btn-default" style="width: 100%; height: 100%;" onclick="reviewReplyPop(<%=detailDto.getREV_SEQ() %>)">답글달기</button>
				
				<%} %>
				
				<%if(dto!=null&&dto.getUSER_ID().equals(detailDto.getUSER_ID()) && !dto.getUSER_ID().equalsIgnoreCase("adm")){ %>
				<button  class="btn btn-default" style="width: 50%; height: 100%;" onclick="reviewUpdate(<%=detailDto.getREV_SEQ() %>)">수정하기</button>
				<input type="button"  class="btn btn-default" value="삭제하기" style="width: 50%; height: 100%;" onclick="closeSelf(<%=detailDto.getREV_SEQ() %>)">
	
				<%} %>
				
				
				
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
function reviewReplyPop(REV_SEQ){
	location.href="reviewReply.mib?REV_SEQ="+REV_SEQ;
}
function reviewUpdate(REV_SEQ){
	location.href = "reviewupdate.mib?REV_SEQ="+REV_SEQ;
}

function closeSelf(REV_SEQ) {
    var REV_SEQs = REV_SEQ;

    var formData = new FormData();

    formData.append("REV_SEQ",REV_SEQs);
    $.ajax({
        type: "POST",
        url: "reviewDel.mib",
        async: true,
        data: formData,
        dataType: "html",
        processData: false,
        contentType: false,
        success: function (data) {
            var flag = $.parseJSON(data);

            if (flag.result == 'success') {
                alert("삭제되었습니다");
                opener.parent.location.reload();
                window.close();
            } else {
                alert("error");
            }
        },
        complete: function (data) {
        },
        error: function (xhr, status, error) {
            alert("error");
        }
    });
}
</script>
</body>
</html>