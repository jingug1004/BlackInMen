<%@page import="com.eagle.men_in_black.model.CeoMypageDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	List<CeoMypageDto> list = (List<CeoMypageDto>)request.getAttribute("list");
	String rootPath = request.getContextPath();

%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="../../../../../css/Mib.css">

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<style type="text/css">
td{
text-align: center;
}

</style>
<title>Insert title here</title>
</head>
<body>

	<table class="table" style="width: 100%">

					<tr >
						<th style="width: 7%;text-align: center;">상품</th>
						<th style="width: 20%;text-align: center;">상품이름</th>
						<th style="width: 8%;text-align: center;">구매사이즈</th>
						<th style="width: 8%;text-align: center;">구매색상</th>
						<th style="width: 8%;text-align: center;">수량</th>
						<th style="width: 8%;text-align: center;">쿠폰사용</th>
						<th style="width: 8%;text-align: center;">적립금사용</th>
						<th style="width: 8%;text-align: center;">결제금액</th>
					</tr>

				<%
				for(int i=0; i<list.size(); i++){ 
					
				%>
					<tr>
						<td style="vertical-align: middle;"><img alt="not found" src="..<%=rootPath %>/images/<%=list.get(i).getSTORED_NAME() %>"
							style="width: 100px; height: 100px"></td>
						<td style="vertical-align: middle;"><%=list.get(i).getPRO_NAME() %></td>
						<td style="vertical-align: middle;"><%=list.get(i).getSEL_SIZE() %></td>
						<td style="vertical-align: middle;"><%=list.get(i).getSEL_COLOR() %></td>
						<td style="vertical-align: middle;"><%=list.get(i).getSEL_NUM() %></td>
						<td style="vertical-align: middle;"><%=list.get(i).getCOUPON() %></td>
						<td style="vertical-align: middle;"><%=list.get(i).getPOINT() %></td>
						<td style="vertical-align: middle;"><%=list.get(i).getFINAL_PRICE() %></td>
					</tr>
						<%} %>
				
				</table>
				<div align="center">
				<input type="button" style="width: 30%; " onclick="window.close()" value="닫기" class="btn btn-default">
				</div>
<script type="text/javascript">


</script>
</body>
</html>