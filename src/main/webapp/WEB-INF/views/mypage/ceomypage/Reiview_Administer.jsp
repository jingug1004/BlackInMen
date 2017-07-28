<%@page import="com.eagle.men_in_black.model.CeoMypageDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%

List<CeoMypageDto> outerlist = (List<CeoMypageDto>)request.getAttribute("outerlist");

List<CeoMypageDto> toplist = (List<CeoMypageDto>)request.getAttribute("toplist");

List<CeoMypageDto> pantslist = (List<CeoMypageDto>)request.getAttribute("pantslist");

List<CeoMypageDto> shoeslist = (List<CeoMypageDto>)request.getAttribute("shoeslist");

List<CeoMypageDto> baglist = (List<CeoMypageDto>)request.getAttribute("baglist");

 
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<title>리뷰관리 페이지</title>
<style type="text/css">
.table th,td{
	text-align: center;
}

@media ( max-width : 1200px) { 
.ty{
margin-top: 30px;
}
}

</style>
</head>
<body>

<center class="ty">
		<div id="mypagehead">
			<h4 align="right" style="margin-right: 100px">
				<a href="meninblack.mib">홈</a> > <a href="ceoMypage_Main.mib">MY PAGE</a> >
				<a href="reiview_Administer.mib">리뷰관리</a>
			</h4>
			<h3>리뷰관리</h3>
			<h5 style="margin-bottom: 50px">답변이 필요한 리뷰들을 보여줍니다</h5>
		</div>
	</center>
	<br><br>

	
			<span class="mypage-link" style="font-size: 19px;"><a
				href='reiview_Administer_dt.mib?ITEM=OUTER'>OUTER</a></span>
			<table class="table">
				<col width="10%" /><col width="20%" /><col width="40%" /><col width="15%" /><col width="15%" />
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
					if(outerlist==null || outerlist.size()==0){
					%>
						<tr><td colspan="99999">내역이 없습니다.</td></tr>
					<%
					}else{
						for(int i=0; i<outerlist.size(); i++){ %>
					
					<tr>
						<td><%=outerlist.get(i).getREV_SEQ() %></td>
						<td><%=outerlist.get(i).getPRO_NAME() %></td>
						<td style="cursor: pointer;" onclick="goreview(<%=outerlist.get(i).getREV_SEQ()%>)">
						<%=outerlist.get(i).getREV_TITLE() %></td>
						<td><%=outerlist.get(i).getREV_TIME() %></td>
						<td><%=outerlist.get(i).getSCORE() %></td>
					</tr>
					<%} %>					

				</tbody>
				
				<%if(outerlist.get(0).getTOT_CNT()>5){ %>
				<tfoot>
					<tr>
						
						<td colspan="6" align="center" style="cursor: pointer;"><span class="mypage-link"><a
								href='reiview_Administer_dt.mib?ITEM=OUTER'>더 보기</a></span></td>
					</tr>
				</tfoot>
				<%} 
				}%>
			</table>

			<br> <br> <br> <br>


			<span class="mypage-link" style="font-size: 19px;"><a
				href='reiview_Administer_dt.mib?ITEM=TOP'>TOP</a></span>
			<table class="table">
				<col width="10%" /><col width="20%" /><col width="40%" /><col width="15%" /><col width="15%" />
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
					if(toplist==null || toplist.size()==0){
					%>
						<tr><td colspan="99999">내역이 없습니다.</td></tr>
					<%
					}else{
						for(int i=0; i<toplist.size(); i++){ %>
					
					<tr>
						<td><%=toplist.get(i).getREV_SEQ() %></td>
						<td><%=toplist.get(i).getPRO_NAME() %></td>
						<td style="cursor: pointer;" onclick="goreview(<%=toplist.get(i).getREV_SEQ()%>)">
						<%=toplist.get(i).getREV_TITLE() %>
						</td>
						<td><%=toplist.get(i).getREV_TIME() %></td>
						<td><%=toplist.get(i).getSCORE() %></td>
					</tr>
					<%} %>					

				</tbody>
				
				<%if(toplist.get(0).getTOT_CNT()>5){ %>
				<tfoot>
					<tr>
						
						<td colspan="6" align="center">
						<span class="mypage-link">
						<a href='reiview_Administer_dt.mib?ITEM=TOP' style="cursor: pointer;">더 보기</a>
						</span>
						</td>
					</tr>
				</tfoot>
				<%} 
				}%>
			</table>

			<br> <br> <br> <br>

				<span class="mypage-link" style="font-size: 19px;"><a
				href='reiview_Administer_dt.mib?ITEM=PANTS'>PANTS</a></span>
			<table class="table">
				<col width="10%" /><col width="20%" /><col width="40%" /><col width="15%" /><col width="15%" />
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
					if(pantslist==null || pantslist.size()==0){
					%>
						<tr><td colspan="99999">내역이 없습니다.</td></tr>
					<%
					}else{
						for(int i=0; i<pantslist.size(); i++){ %>
					
					<tr>
						<td><%=pantslist.get(i).getREV_SEQ() %></td>
						<td><%=pantslist.get(i).getPRO_NAME() %></td>
						<td style="cursor: pointer;" onclick="goreview(<%=pantslist.get(i).getREV_SEQ()%>)">
						<%=pantslist.get(i).getREV_TITLE() %></td>
						<td><%=pantslist.get(i).getREV_TIME() %></td>
						<td><%=pantslist.get(i).getSCORE() %></td>
					</tr>
					<%} %>					

				</tbody>
				
				<%if(pantslist.get(0).getTOT_CNT()>5){ %>
				<tfoot>
					<tr>
						
						<td colspan="6" align="center" style="cursor: pointer;">
						<span class="mypage-link"><a href='reiview_Administer_dt.mib?ITEM=PANTS'>더 보기</a>
						</span>
						</td>
					</tr>
				</tfoot>
				<%} 
				}%>
			</table>

			<br> <br> <br> <br>
		
			<span class="mypage-link" style="font-size: 19px;"><a
				href='reiview_Administer_dt.mib?ITEM=SHOES'>SHOES</a></span>
			<table class="table">
				<col width="10%" /><col width="20%" /><col width="40%" /><col width="15%" /><col width="15%" />
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
					if(shoeslist==null || shoeslist.size()==0){
					%>
						<tr><td colspan="99999">내역이 없습니다.</td></tr>
					<%
					}else{
						for(int i=0; i<shoeslist.size(); i++){ %>
					
					<tr>
						<td><%=shoeslist.get(i).getREV_SEQ() %></td>
						<td><%=shoeslist.get(i).getPRO_NAME() %></td>
						<td style="cursor: pointer;" onclick="goreview(<%=shoeslist.get(i).getREV_SEQ()%>)">
						<%=shoeslist.get(i).getREV_TITLE() %></td>
						<td><%=shoeslist.get(i).getREV_TIME() %></td>
						<td><%=shoeslist.get(i).getSCORE() %></td>
					</tr>
					<%} %>					

				</tbody>
				
				<%if(shoeslist.get(0).getTOT_CNT()>5){ %>
				<tfoot>
					<tr>
						<td colspan="6" align="center" style="cursor: pointer;">
						<span class="mypage-link"><a href='reiview_Administer_dt.mib?ITEM=SHOES'>더 보기</a>
						</span>
						</td>
					</tr>
				</tfoot>
				<%} 
				}%>
			</table>
			<br> <br> <br> <br>


			<span class="mypage-link" style="font-size: 19px;"><a
				href='reiview_Administer_dt.mib?ITEM=BAGnACC'>BAC&ACC</a></span>
			<table class="table">
				<col width="10%" /><col width="20%" /><col width="40%" /><col width="15%" /><col width="15%" />
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
					if(baglist==null || baglist.size()==0){
					%>
						<tr><td colspan="99999">내역이 없습니다.</td></tr>
					<%
					}else{
						for(int i=0; i<baglist.size(); i++){ %>
					
					<tr>
						<td><%=baglist.get(i).getREV_SEQ() %></td>
						<td><%=baglist.get(i).getPRO_NAME() %></td>
						<td style="cursor: pointer;" onclick="goreview(<%=baglist.get(i).getREV_SEQ()%>)">
						<%=baglist.get(i).getREV_TITLE() %></td>
						<td><%=baglist.get(i).getREV_TIME() %></td>
						<td><%=baglist.get(i).getSCORE() %></td>
					</tr>
					<%} %>					

				</tbody>
				
				<%if(baglist.get(0).getTOT_CNT()>5){ %>
				<tfoot>
					<tr>
						
						<td colspan="6" align="center"  style="cursor: pointer;">
						<span class="mypage-link"><a href='reiview_Administer_dt.mib?ITEM=BAGnACC'>더 보기</a></span></td>
					</tr>
				</tfoot>
				<%} 
				}%>
			</table>
			<br> <br> <br> <br>


			<script type="text/javascript">
			function goreview(rseq) {
				 window.open(
							"review.mib?REV_SEQ=" + rseq,+
							"pop",
							"width=800 height=520 resizable=no location=no screenX=100 screenY=100 scrollbars=no");
		}
			</script>

</body>
</html>