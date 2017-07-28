<%@page import="com.eagle.men_in_black.util.StringUtil"%>
<%@page import="com.eagle.men_in_black.model.UserMypageDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<UserMypageDto> couponList = (List<UserMypageDto>) request.getAttribute("couponList");
	List<UserMypageDto> pointList = (List<UserMypageDto>) request.getAttribute("pointList");
	UserMypageDto mypageDto = (UserMypageDto) request.getAttribute("point");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>::쿠폰 & 적립금::</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<style type="text/css">
body {
	font-family: "Lato", sans-serif;
}

#contain {
	margin: 0 auto;
	width: 100%;
	height: 500px;
	margin-top: 70px;
}

#divl {
	width: 45%;
	height: 100%;
	display: inline-block;
	border: 2px solid rgba(39, 44, 48, 0.36);
	float: left;
	margin-left: 45px;
	
}

#divl .head {
	font-weight: 900;
	font-size: 30px;
	text-transform: uppercase;
	text-align: center;
	min-height: 60px;
	line-height: 50px;
}

.head{
float: left;
width: 100%;
}

.contentDiv{
width: 100%;
height:81.5%;
float: left;
}

.paging {
	width: 100%;
	height: 35px;
	margin: 0;
	text-align: center;
	text-transform: uppercase;
	line-height: 30px;
	font-size: 15px;
	font-weight: 900;
	background-color: #D5D5D5;
	clear: left
}

.gray {
	border-bottom: 5px solid #696969;
}
#mypageheada{
margin-right: 100px
}	
/*1024해상도가 1200px임*/
@media ( max-width : 1200px) { 
#divl{
width: 43%;
height: 90%
}
#boardone, .boardone {
		display: none;
		visibility: hidden;
	}
.ty{
	margin-top: 30px;
	}
#mypagehead{
margin-left: 30px;
}
#mypageheada{
margin-right: -20px;
}	
#contain{
height: 600px
}
.contentDiv{
height:82.5%;
}	
	
}

</style>
</head>
<body>
	<div class="ty">
	<center>
		<div id="mypagehead">
			<h4 id="mypageheada" align="right">
				<a href="meninblack.mib">홈</a> > <a href="mymain.mib">MY PAGE</a> > <a
					href="coupon_Mileage.mib">쿠폰&적립금</a>
			</h4>
			<h3>MY Order</h3>
			<p>회원님이 M.I.B에서 받으신 쿠폰 및 적립 내역입니다.</p>
		</div>
	</center>


	<div id="contain">
		<div id="divl">
			<div class="head gray">사용가능한 쿠폰</div>
			<div class=contentDiv>
			<div class="offer" align="center">
				<table class="ta" style="text-align: center; width: 90%">
					<col width="30%">
					<col width="25">
					<col width="25%">
					<col width="25%">
					<tr style="height: 30px">
						<th style="text-align: center; margin-top: 10px">쿠폰명</th>
						<th style="text-align: center; margin-top: 10px">할인 금액</th>
						<th style="text-align: center; margin-top: 10px">사용 기한</th>
						<th style="text-align: center; margin-top: 10px">사용조건</th>
					</tr>
					<%
						if (couponList == null || couponList.size() == 0) {
					%>
					<tr>
						<td colspan="4" style="text-align: center; height: 100px;">내역이 없습니다.</td>
					</tr>
					<%
						} else {
					%>
					<%
						for (int i = 0; i < couponList.size(); i++) {
					%>
					<tr><td style="height:10px; " colspan="99999"></td></tr>
					<tr>
						<td><%=couponList.get(i).getCOUP_NAME()%></td>
						<td><%=StringUtil.NumFomat(couponList.get(i).getCOUP_PRICE())%>원</td>
						<td><%=couponList.get(i).getCOUP_LIMIT()%></td>
						<td><%=StringUtil.NumFomat(couponList.get(i).getCONDITION()) %>원</td>
					</tr>
					<%
						}
						}
					%>


				</table>
			</div>
			</div>
			<%
					if (couponList == null || couponList.size() == 0) {
				%>
				
				<%
					} else {
				%>
				<div class="paging">
					<%
						// 페이징 및 날짜 선택 
							String PAGE_NUMC = (request.getParameter("PAGE_NUMC") == null
									|| request.getParameter("PAGE_NUMC") == "") ? "1" : request.getParameter("PAGE_NUMC");
							String PAGE_SIZEC = (request.getParameter("PAGE_SIZEC") == null
									|| request.getParameter("PAGE_SIZEC") == "") ? "10" : request.getParameter("PAGE_SIZEC");

							int page_numc = Integer.parseInt(PAGE_NUMC);
							int page_sizec = Integer.parseInt(PAGE_SIZEC);

							int pageCountc = couponList.get(0).getTOT_CNT() % page_sizec == 0
									? couponList.get(0).getTOT_CNT() / page_sizec
									: (couponList.get(0).getTOT_CNT() / page_sizec) + 1;
					%>
					<div class="row" align="center">
						<p>
							<%
								for (int i = 1; i <= pageCountc; i++) {
							%>
							<a href="coupon_Mileage.mib?PAGE_NUMC=<%=i%>&"
								class="btn btn-default" role="btn btn-default"><%=i%></a>
							<%
					}%>
						</p>
					</div>

				</div>
				<%
					}
					
				%>
			
			<div>
				<!--페이징 -->
			</div>
		</div>
		
		
		
		
		
		
		<div id="divl" align="center">
			<div class="head gray">적립금</div>
			<div class=contentDiv>
			<p align="center">
				<%
						if (mypageDto == null) {
					%>
				
				<%
						} else {
					%>
				사용가능 포인트 <STRONG style="font-size: 20px;"><%=StringUtil.NumFomat(mypageDto.getPOINT_FINAL())%></STRONG> POINT
				<%} %>
			</p>
			<table class="ta" style="text-align: center; width: 90%">
		
				<tr>
					<th style="text-align: center; margin-top: 5px; width: 20%" class="boardone">날짜</th>
					<th style="text-align: center; margin-top: 5px; width: 40%">사유</th>
					<th style="text-align: center; margin-top: 5px; width: 20%">금액</th>
					<th style="text-align: center; margin-top: 5px; width: 20%">최종</th>
				</tr>
				<%
					if (pointList == null || pointList.size() == 0) {
				%>
				<tr>
					<td colspan="9999" style="text-align: center; height: 100px;">내역이 없습니다.</td>
				</tr>
				<%
					} else {

						for (int i = 0; i < pointList.size(); i++) {
				%>

				<tr><td style="height:10px; " colspan="99999"></td></tr>
				<tr style="height: 27px">
					<td class="boardone"><%=pointList.get(i).getPOINT_TIME()%></td>
					<td><%=pointList.get(i).getPOINT_REASON()%></td>
					<%
						if (pointList.get(i).getINCREASE().equals("PLUS")) {
					%>
					<td style="color: #002266"><b>+<%=StringUtil.NumFomat(pointList.get(i).getPOINT_PRICE())%></b></td>
					<%
						} else {
					%>
					<td style="color: #750028;"><b>-<%=StringUtil.NumFomat(pointList.get(i).getPOINT_PRICE())%></b></td>
					<%
						}
					%>
					<td><%=StringUtil.NumFomat(pointList.get(i).getPOINT_FINAL())%></td>
				</tr>
				<%
					}
					}
				%>



			</table>
			</div>
			<%
				if (pointList == null || pointList.size() == 0) {
			%>
			
			<%
				} else {
			%>
			<div class="paging">
				<%
					// 페이징 및 날짜 선택 
						String PAGE_NUM = (request.getParameter("PAGE_NUM") == null || request.getParameter("PAGE_NUM") == "")
								? "1" : request.getParameter("PAGE_NUM");
						String PAGE_SIZE = (request.getParameter("PAGE_SIZE") == null
								|| request.getParameter("PAGE_SIZE") == "") ? "10" : request.getParameter("PAGE_SIZE");

						int page_num = Integer.parseInt(PAGE_NUM);
						int page_size = Integer.parseInt(PAGE_SIZE);

						int pageCount = pointList.get(0).getTOT_CNT() % page_size == 0
								? pointList.get(0).getTOT_CNT() / page_size : (pointList.get(0).getTOT_CNT() / page_size) + 1;
				%>
				<div class="row" align="center">
					<p>
						<%
							for (int i = 1; i <= pageCount; i++) {
						%>
						<a href="coupon_Mileage.mib?PAGE_NUM=<%=i%>&"
							class="btn btn-default" role="button"><%=i%></a>
						<%
							}
							
						%>
					</p>
				</div>
				
				
				<% }%>
				
			</div>
		</div>
		
	</div>
	</div>
	
	
	</div>
	
	
</body>
</html>