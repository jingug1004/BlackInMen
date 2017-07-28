<%@page import="com.eagle.men_in_black.model.UserMypageDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
		List<UserMypageDto> qnaList= (List<UserMypageDto>)request.getAttribute("qnaList");
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
#mypageheada{
margin-right: 100px
}
@media ( max-width : 1200px) { 
.ty{
	margin-top: 30px;
	}
#mypageheada{
margin-right: -30px	
}

}


</style>
<title>::Q&A::</title>
</head>
<body>
<div class="ty">
	<center>
		<div id="mypagehead">
			<h4 id="mypageheada" align="right" >
				<a href="meninblack.mib">홈</a> > <a href="mymain.mib">MY PAGE</a> >
				<a href="myboard.mib">내가 쓴 게시물</a>
			</h4>
			<h3>My Post</h3>
			<p style="margin-bottom: 50px">회원님님의 게시물 작성 리스트 입니다</p>
		</div>
	</center>

	
			<h3 style="width: 95%; margin-left: 5%">Q&A</h3>


			<table class="table"style="width: 95%; margin-left: 5%"> 
				<col width="15%">
				<col width="15%">
				<col width="40%">
				<col width="15%">
				<col width="15%">
				<thead>
					<tr>
						<th>글번호</th>
						<th>상품명</th>
						<th>글제목</th>
						<th>날짜</th>
						<th>추천</th>
					</tr>
				</thead>
				<tbody>
					<%
						if (qnaList == null || qnaList.size() == 0) {
					%>
					<tr>
						<td colspan="5" style="text-align: center; height: 300px">내역이 없습니다.</td>
					</tr>
					<%
						} else {
					%>
					<%for(int i = 0; i < qnaList.size(); i++){ %>
					<tr style="cursor: pointer;" onclick="goqna(<%=qnaList.get(i).getQNA_SEQ()%>)" >
						<td><%=i+1%></td>
						<td><%=qnaList.get(i).getPRO_NAME() %></td>
						<td><%=qnaList.get(i).getQNA_TITLE()%></td>
						<td><%=qnaList.get(i).getQNA_TIME()%></td>
						<%if(qnaList.get(i).getQNA_STEP()=="Y"){ %>
						<td>답변완료</td>
						<%}else{ %>
						<td>답변중</td>
						<%} %>
					</tr>
					<%}} %>
				</tbody>

			</table>

			<div class="row" align="center">
			<%
						if (qnaList == null || qnaList.size() == 0) {
					%>
					<div class="row" align="center"></div>
					<%
						} else {
					%>
				<%
						// 페이징 및 날짜 선택 
						String PAGE_NUM = (request.getParameter("PAGE_NUM") == null || request.getParameter("PAGE_NUM") == "") ? "1"
								: request.getParameter("PAGE_NUM");
						String PAGE_SIZE = (request.getParameter("PAGE_SIZE") == null || request.getParameter("PAGE_SIZE") == "")
								? "10" : request.getParameter("PAGE_SIZE");

						int page_num = Integer.parseInt(PAGE_NUM);
						int page_size = Integer.parseInt(PAGE_SIZE);

						int pageCount = qnaList.get(0).getTOT_CNT() % page_size == 0 ? qnaList.get(0).getTOT_CNT() / page_size
								: (qnaList.get(0).getTOT_CNT() / page_size) + 1;
					%>
				<div class="row" align="center">
					<p>
						<%
							for (int i = 1; i <= pageCount; i++) {
						%>
						<a href="myboardqna.mib?PAGE_NUM=<%=i%>&" class="btn btn-default"
							role="button"><%=i%></a>
						<%
							}}
						%>
					
				</div>
			</div>
	</div>
</body>

<script type="text/javascript">
function goqna(qseq) {
	 window.open(
				"qnadetail.mib?QNA_SEQ=" + qseq,+
				"pop",
				"width=800 height=520 resizable=no location=no screenX=400 screenY=300 scrollbars=no");
}
</script>
</html>