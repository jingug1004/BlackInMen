<%@ page import="com.eagle.men_in_black.model.UserMypageDto"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	List<UserMypageDto> qna = (List<UserMypageDto>) request.getAttribute("qna");
	List<UserMypageDto> review = (List<UserMypageDto>) request.getAttribute("review");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<style type="text/css">
#mypageheada{
margin-right: 100px;

}

@media ( max-width : 1200px) { 
.ty{
margin-top: 30px;
}
#mypageheada{
margin-right: -5px;

}


    }
</style>
<title>::내가쓴 게시물::</title>
</head>
<body>
<div class="ty">
	<center>
		<div id="mypagehead" style="margin-left: 40px;">
			<p align="right" id="mypageheada">
				<a href="meninblack.mib">홈</a> > <a href="mymain.mib">MY PAGE</a> >
				<a href="myboard.mib">내가 쓴 게시물</a>
			</p>
			<h3>My Post</h3>
			<p style="margin-bottom: 80px">회원님님의 게시물 작성 리스트 입니다</p>
		</div>
	</center>

	
			<span class="mypage-link" style="font-size: 19px;width: 95%; margin-left: 5%"><a
				href='myboardreview.mib'>My Review</a></span>
			<table class="table" style="width: 95%; margin-left: 5%">
				<tfoot>
					<tr>
						<%
							if (review.size() >= 5) {
						%>
						<td colspan="5" align="center"><span class="mypage-link"><a
								href='myboardreview.mib'>더 보기</a></span></td>
						<%
							} else {
						%>
						<td colspan="5" align="center"></td>
						<%
							}
						%>
					</tr>
				</tfoot>
				<thead>
					<tr>
						<th>글번호</th>
						<th>상품명</th>
						<th>글제목</th>
						<th>날짜</th>
						<th>평점</th>
					</tr>
				</thead>

				<tbody id="board">
					<%
						if (review == null || review.size() == 0) {
					%>
					<tr>
						<td colspan="5" style="text-align: center;">내역이 없습니다.</td>
					</tr>
					<%
						} else {
					%>

					<%
						for (int i = 0; i < review.size(); i++) {
					%>
					<tr style="cursor: pointer;" onclick="goreview(<%=review.get(i).getREV_SEQ()%>)">
						<td><%=review.get(i).getREV_SEQ()%></td>
						<td><%=review.get(i).getPRO_NAME()%></td>
						<td><%=review.get(i).getREV_TITLE()%></td>
						<td><%=review.get(i).getREV_TIME()%></td>
						<td><%=review.get(i).getSCORE()%></td>
					
					</tr>
					<%
						}
						}
					%>

				</tbody>

			</table>

			<br> <br>


			<table class="table" style="width: 95%; margin-left: 5%">
				<tfoot>
					<tr>
						<%
							if (qna.size() >= 5) {
						%>
						<td colspan="5" align="center"><span class="mypage-link"><a
								href='myboardqna.mib'>더 보기</a></span></td>
						<%
							} else {
						%>
						<td colspan="5" align="center"></td>
						<%
							}
						%>
					</tr>
				</tfoot>

				<span class="mypage-link" style="font-size: 19px;width: 95%; margin-left: 5%"><a
					href='myboardqna.mib'>My Q&A</a></span>
				<thead>
					<tr>
						<th>글번호</th>
						<th>상품명</th>
						<th>글제목</th>
						<th>날짜</th>
						<th>답글</th>
					</tr>
				</thead>
				<tbody>
					<%
						if (qna == null || qna.size() == 0) {
					%>
					<tr>
						<td colspan="5" style="text-align: center;">내역이 없습니다.</td>
					</tr>
					<%
						} else {
					%>
					<%
						for (int i = 0; i < qna.size(); i++) {
					%>
					<tr style="cursor: pointer;" onclick="goqna(<%=qna.get(i).getQNA_SEQ()%>)">
						<td><%=i + 1%></td>
						<td><%=qna.get(i).getPRO_NAME()%></td>
						<td><%=qna.get(i).getQNA_TITLE()%></td>
						<td><%=qna.get(i).getQNA_TIME()%></td>
						<%
							if (qna.get(i).getQNA_STEP() == "Y") {
						%>
						<td>답변완료</td>
						<%
							} else {
						%>
						<td>답변중</td>
						<%
							}
						%>
					</tr>
					<%
						}}
					%>
				</tbody>

			</table>

<script type="text/javascript">
function goreview(rseq) {
		 window.open(
					"review.mib?REV_SEQ=" + rseq,+
					"pop",
					"width=800 height=520 resizable=no location=no screenX=100 screenY=100 scrollbars=no");
}


function goqna(qseq) {
	 window.open(
				"qnadetail.mib?QNA_SEQ=" + qseq,+
				"pop",
				"width=800 height=520 resizable=no location=no screenX=100 screenY=100 scrollbars=no");
}




</script>

	

</div>

</body>
</html>

