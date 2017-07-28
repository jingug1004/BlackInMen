<%@page import="com.eagle.men_in_black.model.MainDto"%>
<%@page import="com.eagle.men_in_black.model.ServiceDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	ServiceDto serviceDto = (ServiceDto) request.getAttribute("eventdetail");
	MainDto userdto = (MainDto) request.getSession().getAttribute("LoginInfo");
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>:::EVENT DETAIL:::</title>
<style type="text/css">
@media ( max-width : 1200px) { 
.ty{
margin-top: 30px;
}
}

</style>
</head>
<body>
	<center class="ty">
		<div id="noticehead">
			<h4 align="right" style="margin-right: 100px">
				<a href="meninblack.mib">홈</a> > <a href="event.mib">이벤트</a>
			</h4>
		</div>
	</center>
	<h3>EVENT DETAIL</h3>

	<div class="jumbotron">
		<h3><%=serviceDto.getEVENT_TITLE()%></h3>
		<br> <br>
		<div style="width: 80%" align="center">
			<h4><%=serviceDto.getEVENT_CONTENT()%></h4>
		</div>


		<p align="right">
			<%
				if (userdto != null && userdto.getUSER_ID().equals("adm")) {
			%>
			<a class="btn btn-default btn-sm"
				href="eventwrite.mib?seq=<%=serviceDto.getEVENT_SEQ()%>"
				role="button">수정</a> <a class="btn btn-default btn-sm"
				href="eventdelete.mib?seq=<%=serviceDto.getEVENT_SEQ()%>"
				role="button">삭제</a>
			<%
				}
			%>
			<a class="btn btn-default btn-sm" href="event.mib" role="button">목록가기</a>
		</p>

	</div>


</body>
</html>