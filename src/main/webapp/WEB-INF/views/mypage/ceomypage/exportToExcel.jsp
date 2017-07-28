<%@page import="com.eagle.men_in_black.model.CeoMypageDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
List<CeoMypageDto> list = (List<CeoMypageDto>)request.getAttribute("list");

String START_DATE = (request.getParameter("START_DATE")==null||request.getParameter("START_DATE")=="")?"":request.getParameter("START_DATE");
String END_DATE = (request.getParameter("END_DATE")==null || request.getParameter("END_DATE")=="")?"":request.getParameter("END_DATE");
String search = (request.getParameter("search")==null || request.getParameter("search")=="")?"":request.getParameter("search");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<table border="1">
<tr>
<th>시작날짜</th>
<th>끝날짜</th>
<th>검색</th>
<tr>
<td><c:out value="#{STRART_DATE}" escapeXml="false"/></td>
<td><c:out value="${END_DATE}" escapeXml="false"/></td>
<td><c:out value="${search}" escapeXml="false"/></td>
</tr>

</table>
</body>
</html>