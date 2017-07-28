<%@ page import="com.eagle.men_in_black.model.UserMypageDto"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<UserMypageDto> reviewlist = (List<UserMypageDto>) request.getAttribute("reviewlist");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>::리뷰::</title>
<style type="text/css">
#mypageheada {
	margin-right: 100px 
	
@media ( max-width : 1200px) { 

#mypageheada {

margin-right: -30px;
}
#mypagehead{
margin-top:30px;
}
}
</style>
</style>
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

	<h3 style="width: 95%; margin-left: 5%">상품 리뷰</h3>
	<table class="table" style="width: 95%; margin-left: 5%">
		<col width="15%">
		<col width="15%">
		<col width="40%">
		<col width="15%">
		<col width="15%">
		<thead>
			<tr>
				<th>글번호</th>
				<th>게시판</th>
				<th>글제목</th>
				<th>날짜</th>
				<th>추천</th>
			</tr>
		</thead>
		<tbody>
			<%
				if (reviewlist == null || reviewlist.size() == 0) {
			%>
			<tr>
				<td colspan="5" style="text-align: center;">내역이 없습니다.</td>
			</tr>
			<%
				} else {
			%>
			<%
				for (int i = 0; i < reviewlist.size(); i++) {
			%>
			<tr style="cursor: pointer;" onclick="goreview(<%=reviewlist.get(i).getREV_SEQ()%>)">
				<td><%=reviewlist.get(i).getREV_SEQ()%></td>
				<td>리뷰</td>
				<td><%=reviewlist.get(i).getREV_TITLE()%></td>
				<td><%=reviewlist.get(i).getREV_TIME()%></td>
				<td><%=reviewlist.get(i).getSCORE()%></td>
			</tr>
			<%
				}
				}
			%>
		</tbody>
	</table>
	<%
		if (reviewlist == null || reviewlist.size() == 0) {
	%>
	<div class="row" align="center"></div>
	<%
		} else {
	%>
	<div class="row" align="center">

		<%
			// 페이징 및 날짜 선택 
				String PAGE_NUM = (request.getParameter("PAGE_NUM") == null || request.getParameter("PAGE_NUM") == "")
						? "1"
						: request.getParameter("PAGE_NUM");
				String PAGE_SIZE = (request.getParameter("PAGE_SIZE") == null
						|| request.getParameter("PAGE_SIZE") == "") ? "10" : request.getParameter("PAGE_SIZE");

				int page_num = Integer.parseInt(PAGE_NUM);
				int page_size = Integer.parseInt(PAGE_SIZE);

				int pageCount = reviewlist.get(0).getTOT_CNT() % page_size == 0
						? reviewlist.get(0).getTOT_CNT() / page_size
						: (reviewlist.get(0).getTOT_CNT() / page_size) + 1;
		%>
		<div class="row" align="center">
			<p>
				<%
					for (int i = 1; i <= pageCount; i++) {
				%>
				<a href="myboardreview.mib?PAGE_NUM=<%=i%>&" class="btn btn-default"
					role="button"><%=i%></a>
				<%
					}
					}
				%>
			
		</div>
	</div>
</div>
	<script type="text/javascript">
	function goreview(rseq) {
		 window.open(
					"review.mib?REV_SEQ=" + rseq,+
					"pop",
					"width=800 height=520 resizable=no location=no screenX=400 screenY=300 scrollbars=no");
}
			
			
			</script>

</body>
</html>