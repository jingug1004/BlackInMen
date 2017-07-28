<%@page import="java.util.HashMap"%>
<%@page import="com.eagle.men_in_black.util.StringUtil"%>
<%@page import="java.util.List"%>
<%@page import="com.eagle.men_in_black.model.UserMypageDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	UserMypageDto mypageDto = (UserMypageDto) request.getAttribute("point");
	List<UserMypageDto> coupon = (List<UserMypageDto>) request.getAttribute("coupon");
	List<UserMypageDto> buy = (List<UserMypageDto>) request.getAttribute("buy");
	List<UserMypageDto> qna = (List<UserMypageDto>) request.getAttribute("qna");
	List<UserMypageDto> basket = (List<UserMypageDto>) request.getAttribute("basket");
	List<UserMypageDto> point5 = (List<UserMypageDto>) request.getAttribute("point5");
	HashMap<String, String> prophomap = (HashMap<String, String>)request.getAttribute("prophomap");
	String rootPath = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>::마이 페이지::</title>
<style type="text/css">
body {
	font-family: "Lato", sans-serif;
}

#contain {
	margin: 0 auto;
	width: 100%;
	height: 330px;
	margin-top: 100px;
}

#divl {
	width: 45%;
	height: 300px;
	display: inline-block;
	float: left;
	margin-left: 5%;
	border: 2px solid rgba(39, 44, 48, 0.36);
}

#divr {
	width: 45%;
	height: 300px;
	display: inline-block;
	float: left;
	margin-left: 5%;
	border: 2px solid rgba(39, 44, 48, 0.36);
}

#boarddiv {
	width: 100%;
	display: inline-block;
	float: left; //
	background: #171A1D;
	margin-left: 45px;
	margin-top: 50px
}

#divl .head {
	font-weight: 900;
	font-size: 30px;
	text-transform: uppercase;
	text-align: center;
	min-height: 60px;
	line-height: 50px;
}

#divr .head {
	font-weight: 900;
	font-size: 30px;
	text-transform: uppercase;
	text-align: center;
	min-height: 60px;
	line-height: 50px;
}

.parea {
	border-bottom: 5px solid #696969;
}
#mypagehead{
margin-left: 90px;
}

td, th {
	text-align: center;
	vertical-align: middle;
}

/* @media only screen and (max-width: 1400px) {
	#boardone, .boardone {
		display: none;
		visibility: hidden;
	}
}

@media only screen and (max-width: 1100px) {
	#boardone, .boardone {
		display: none;
		visibility: hidden;
	}
	#boardtwo, .boardtwo {
		display: none;
		visibility: hidden;
	}
}

@media only screen and (max-width: 900px) {
	#boardone, .boardone {
		display: none;
		visibility: hidden;
	}
	#boardtwo, .boardtwo {
		display: none;
		visibility: hidden;
	}
	#boardthree, .boardthree {
		display: none;
		visibility: hidden;
	}
} */
/*1024해상도가 1200px임*/
@media ( max-width : 1200px) { 
.ty{
margin-top: 30px;
margin-left: -50px;

}   
#버튼{
margin-right: 33px;

}   
#mypagehead{
margin-left: 50px;
}  
#boarddiv{
width: 94.5%
}
}


</style>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
</head>
<body>
<div class="ty">
	<center>
		<div id="mypagehead">
			<h4 align="right" style="margin-right: 70px">
				<a href="meninblack.mib">홈</a> > <a href="mymain.mib">MY PAGE</a>
			</h4>
			<h3>MY Order</h3>
			<h4>회원님의 마이페이지입니다.</h4>
		</div>
	</center>

	<div>
		<div id="contain">
			<!--onclick="location.href='coupon_Mileage.mib'"-->
			<div id="divl">
				<div class="head parea">사용가능한 쿠폰</div>

				<div align="center">
					<table style="text-align: center;">
						<col width="200px">
						<col width="200px">
						<tr>
						<th style="text-align: center;">쿠폰이름</th>
						<th style="text-align: center;">쿠폰가격</th>						
						</tr>
						<tr>
						<td style="height: 10px;"></td>
						<td></td>
						</tr>
						<%
							if (coupon == null || coupon.size() == 0) {
						%>
						<tr>
							<td colspan="2" style="text-align: center;">내역이 없습니다.</td>
						</tr>
						<%
							} else {
						%>
						<%
							for (int i = 0; i < coupon.size(); i++) {
						%>
						<tr>
							<td style="text-align: center;"><%=coupon.get(i).getCOUP_NAME()%></td>
							<td style="text-align: center;"><%=StringUtil.NumFomat(coupon.get(i).getCOUP_PRICE())%></td>
						</tr>
						<%
							}
							}
						%>


					</table>
				</div>

			</div>
			<div id="divr" align="center" style="position: relative;">
				<div class="head parea">적립금</div>
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
				<table style="text-align: center;">
					<tr>
						<th style="text-align: center; width: 20%">날짜</th>
						<th style="text-align: center; width: 45%">사유</th>
						<th style="text-align: center; width: 20%">금액</th>
						<th style="text-align: center; width: 15%">최종</th>
					</tr>
					<tr>
					<td colspan="9999" style="height: 10px;"></td>
					</tr>
					<col width="200px">
					<%
					if (point5 == null || point5.size() == 0) {
				%>
				<tr>
					<td colspan="9999" style="text-align: center; height: 100px;">내역이 없습니다.</td>
				</tr>
				<%
					} else {

						for (int i = 0; i < point5.size(); i++) {
				%>

				
				<tr style="height: 27px">
					<td class="boardone"><%=point5.get(i).getPOINT_TIME()%></td>
					<td><%=point5.get(i).getPOINT_REASON()%></td>
					<%
						if (point5.get(i).getINCREASE().equals("PLUS")) {
					%>
					<td style="color: #002266"><b>+<%=StringUtil.NumFomat(point5.get(i).getPOINT_PRICE())%></b></td>
					<%
						} else {
					%>
					<td style="color: #750028;"><b>-<%=StringUtil.NumFomat(point5.get(i).getPOINT_PRICE())%></b></td>
					<%
						}
					%>
					<td><%=StringUtil.NumFomat(point5.get(i).getPOINT_FINAL())%></td>
				</tr>
				<%
					}
					}
				%>



				</table>
			</div>
			<div id="버튼">
			<button  class="btn btn-default" type="button" onclick="location.href='coupon_Mileage.mib'"
				style="margin-left: 95.5%; margin-top: 5px" class="btn btn-default">더보기</button>
			</div>	
		</div>



		<div id="boarddiv">
			<!--onclick="location.href='buyList.mib'"-->
			<p style="background-color: #696969">주문내용</p>
			<table class="table">
	
				<tr height="40px">
					<th  class="boardone" style="width: 9%;text-align: center;">이미지</th>
					<th style="width: 23%;text-align: center;">상품이름</th>
					<th class="boardone"style="width: 8%;text-align: center;">수량</th>
					<th class="boardtwo"style="width: 8%;text-align: center;">쿠폰사용</th>
					<th class="boardtwo"style="width: 8%;text-align: center;">적립금사용</th>
					<th style="width: 9%;text-align: center;">결제금액</th>
					<th class="#boardthree"style="width: 12%;text-align: center;">구매일</th>
					<th style="width: 7%;text-align: center;">상태</th>
				</tr>
				<%
					if (buy == null || buy.size() == 0) {
				%>
				<tr>
					<td colspan="11" style="text-align: center;">내역이 없습니다.</td>
				</tr>
				<%
					} else {
				%>
				<%
				    
					for (int i = 0; i < buy.size(); i++) {
						int conum = Integer.parseInt(prophomap.get("count"+i))-1;
				%>
				<tr height="40px" style="cursor: pointer;" onclick="open_win(<%=buy.get(i).getDEL_SEQ()%>,'<%=buy.get(i).getPRO_SEQ_st()%>')">
					<td class="boardone" ><img alt="not found" src="..<%=rootPath %>/images/<%=prophomap.get("STOREDNAME"+i)%>" style="width: 100px; height: 100px"></td>
					<td class="boardone" style="vertical-align: middle;"><%=prophomap.get("PRO_NAME"+i)%>  <%if(conum>0){ %> 외  <%=conum %>개<%} %> </td>
					<td class="boardone"  style="vertical-align: middle;"><%=prophomap.get("count"+i) %>개</td>
					<td class="boardtwo"  style="vertical-align: middle;"><%=StringUtil.NumFomat(buy.get(i).getCOUPON())%></td>
					<td class="boardtwo"  style="vertical-align: middle;"><%=StringUtil.NumFomat(buy.get(i).getPOINT())%></td>
					<td style="vertical-align: middle;"><%=StringUtil.NumFomat(buy.get(i).getFINAL_PRICE())%></td>
					<td class="#boardthree"  style="vertical-align: middle;"><%=buy.get(i).getDEL_TIME()%></td>
					<td style="vertical-align: middle;"><%=buy.get(i).getDEL_STEP()%></td>
				</tr>
		
				<%
					}
					}
				%>
			</table>

			<div id="버튼">
			<button class="btn btn-default" type="button" onclick="location.href='buylist.mib'"
				style="margin-left: 95%" class="btn btn-default">더보기</button>
			</div>
		</div>
		<br> <br> <br> <br> <br> <br>


		<div id="boarddiv">
			<!--onclick="location.href='basketlist.mib'"-->
			<p style="background-color: #696969">장바구니</p>
			<table class="table">
				<col width="5%">
				<col width="5%">
				<col width="50%">
				<col width="10%">
				<col width="10%">
				<col width="10%">
				<tr>
					<th style="text-align: center;">이미지</th>
					<th style="text-align: center;">분류</th>
					<th style="text-align: center;">상품이름</th>
					<th style="text-align: center;">수량</th>
					<th style="text-align: center;">금액</th>
				</tr>
				<%
					if (basket == null || basket.size() == 0) {
				%>
				<tr>
					<td colspan="6" style="text-align: center;">내역이 없습니다.</td>
				</tr>
				<%
					} else {
				%>
				<%
					for (int i = 0; i < basket.size(); i++) {
				%>

				<tr>

					<td  rowspan="2" rowspan="2"><a href="detail.mib?PRO_SEQ=<%=basket.get(i).getPRO_SEQ()%>"><img
						alt="not found" src="..<%=rootPath %>/images/<%=basket.get(i).getSTORED_NAME()%>"
						style="width: 100px; height: 100px"></a></td>
					<td  rowspan="2" rowspan="2"><%=basket.get(i).getSUB_ITEM()%></td>
					<td><a href="detail.mib?PRO_SEQ=<%=basket.get(i).getPRO_SEQ()%>"><%=basket.get(i).getPRO_NAME()%></a></td>
					<td  rowspan="2" rowspan="2"><%=basket.get(i).getBAS_PRO_NUM()%></td>
					<td  rowspan="2" rowspan="2"><%=StringUtil.NumFomat(basket.get(i).getPRO_PRICE())%></td>
				</tr>
				<tr>
					<td><%=basket.get(i).getPRO_SIZE()%> : <%=basket.get(i).getCOLOR()%></td>
				</tr>
				<%
					}
					}
				%>
			</table>
			<div id="버튼">
			<button type="button" onclick="location.href='basketlist.mib'"
				style="margin-left: 95%" class="btn btn-default">더보기</button>
			</div>	
		</div>



		<div id="boarddiv">
			<!--onclick="location.href='myboard.mib'"-->
			<p style="background-color: #696969">Q&A</p>
			<table class="table">

				<tr >
					<th style="text-align: center;">번호</th>
					<th style="text-align: center;">상품명</th>
					<th style="text-align: center;">제목</th>
					<th style="text-align: center;">날짜</th>
					<th >답변여부</th>
				</tr>
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
				<tr>
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
					}
					}
				%>
			</table>
			<div id="버튼">
			<button type="button" class="btn btn-default" onclick="location.href='myboard.mib'"
				style="margin-left: 95%" class="btn btn-default">더보기</button>
			</div>
		</div>

	</div>
	</div>
	
	<script type="text/javascript">
	function open_win(SEQ,st)
    {
        var DEL_SEQ = SEQ;
        var pro_seq_st = st;

        cw=screen.availWidth;     //화면 넓이
        ch=screen.availHeight;    //화면 높이

        sw=700;    //띄울 창의 넓이
        sh=400;    //띄울 창의 높이

        ml=(cw-sw)/2;        
        mt=(ch-sh)/2;         


        window.open("buydetlist.mib?DEL_SEQ="+DEL_SEQ+"&pro_seq_st="+pro_seq_st,"pop", 'width='+sw+',height='+sh+',top='+mt+',left='+ml+', toolbar=no, location=no, directories=no, status=no, menubar=no, resizable=no, scrollbars=no, copyhistory=no');
    }
	
	</script>
</body>
</html>