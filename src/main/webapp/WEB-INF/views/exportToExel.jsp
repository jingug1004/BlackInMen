<%@page import="com.eagle.men_in_black.model.CeoMypageDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="application/vnd.ms-excel; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<% 

  String filename = request.getAttribute("filename").toString();
  /* response.setHeader("Content-Type", "application/vnd.ms-xls"); */
  response.setHeader("Content-Disposition", "inline; filename=Monitoring_" + filename + ".xls");
  List<CeoMypageDto> list = (List<CeoMypageDto>)request.getAttribute("list");
%>​ 

<title>Insert title here</title>
</head>
<body>
<table border="1">
<tr>
		<th>분류</th>
		<th>상품이름</th>
		<th>구매자</th>
		<th>수량</th>
		<th>재고</th>
		<th>가격</th>
		<th>판매일</th>
		<th>상태</th>
</tr>
<%for(int i=0; i<list.size(); i++){ %>
<tr>
<td><%=list.get(i).getITEM() %></td>
						<td>
						<p>상품이름 - <%= list.get(i).getPRO_NAME() %></p>
						컬러-<%=list.get(i).getSEL_COLOR() %>,사이즈-<%=list.get(i).getSEL_SIZE() %>
						</td>
						<td>구매한 사람  <%=list.get(i).getUSER_ID() %></td>
						<td><%=list.get(i).getSEL_NUM() %></td>
						<td><%=list.get(i).getSTOCK() %></td>
						<td><%=list.get(i).getFINAL_PRICE() %></td>
						<td><%=list.get(i).getSELTIME() %></td>
						<td><%=list.get(i).getDEL_STEP() %></td>
						<%}%>
					</tr>
</table>

</body>
</html>