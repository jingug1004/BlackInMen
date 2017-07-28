<%@page import="com.eagle.men_in_black.model.CeoMypageDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
List<CeoMypageDto> list = (List<CeoMypageDto>)request.getAttribute("list");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.table th,td{
	text-align: center;
}
</style>
</head>
<body>
<center>
		<div id="mypagehead">
			<h4 align="right" style="margin-right: 100px">
				<a href="meninblack.mib">홈</a> > <a href="ceoMypage_Main.mib">MY PAGE</a> >
				<a href="qnA_Administer.mib">문의글관리</a>
			</h4>
			<h3><%=list.get(0).getITEM() %></h3>
			</div>
	</center>
	<br><br>
	
			<table class="table">
				<col width="10%" /><col width="20%" /><col width="40%" /><col width="15%" /><col width="15%" />
				<thead>
					<tr>
						<th>글번호</th>
						<th>상품명</th>
						<th>글제목</th>
						<th>문의타입</th>
						<th>날짜</th>
					</tr>
				</thead>
				<tbody>
					<%
						if (list == null || list.size() == 0) {
					%>
					<tr>
						<td colspan="5" style="text-align: center;">내역이 없습니다.</td>
					</tr>
					<%
						} else {
					%>
					<%for(int i = 0; i < list.size(); i++){ %>
					<tr>
						<td><%=i+1%></td>
						<td><%=list.get(i).getPRO_NAME() %></td>
						<td style="cursor: pointer;" onclick="goqna(<%=list.get(i).getQNA_SEQ()%>)"><%=list.get(i).getQNA_TITLE() %></td>
						<td><%=list.get(i).getQNA_TYPE() %></td>
						<td><%=list.get(i).getQNA_TIME() %></td>
				</tr>
					<%}
					} %>
				</tbody>

			</table>

			<div class="row" align="center">
			<%
						if (list == null || list.size() == 0) {
					%>
					<div class="row" align="center"></div>
					<%
						} else {
				
						// 페이징 및 날짜 선택 
						String PAGE_NUM = (request.getParameter("PAGE_NUM") == null || request.getParameter("PAGE_NUM") == "") ? "1"
								: request.getParameter("PAGE_NUM");
						String PAGE_SIZE = (request.getParameter("PAGE_SIZE") == null || request.getParameter("PAGE_SIZE") == "")
								? "10" : request.getParameter("PAGE_SIZE");

						int page_num = Integer.parseInt(PAGE_NUM);
						int page_size = Integer.parseInt(PAGE_SIZE);

						int pageCount = list.get(0).getTOT_CNT() % page_size == 0 ? list.get(0).getTOT_CNT() / page_size
								: (list.get(0).getTOT_CNT() / page_size) + 1;
					%>
				<div class="row" align="center">
					<p>
						<%
							for (int i = 1; i <= pageCount; i++) {
						%>
						<a href="qnA_Administer_dt.mib?PAGE_NUM=<%=i%>&ITEM=<%=list.get(0).getITEM() %>" class="btn btn-default"
							role="button"><%=i%></a>
						<%
							}}
						%>
					
				</div>
			</div>
			
			<script type="text/javascript">
			function goqna(qseq) {
				 window.open(
							"qnadetail.mib?QNA_SEQ=" + qseq,+
							"pop",
							"width=800 height=520 resizable=no location=no screenX=400 screenY=300 scrollbars=no");
			}
			</script>
			
</body>
</html>