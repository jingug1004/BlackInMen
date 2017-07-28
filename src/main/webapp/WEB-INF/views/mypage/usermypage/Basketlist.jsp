<%@page import="com.eagle.men_in_black.util.StringUtil"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.eagle.men_in_black.model.UserMypageDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String rootPath = request.getContextPath();	
List<UserMypageDto> basketlist = (List<UserMypageDto>) request.getAttribute("basketlist");

DecimalFormat df = new DecimalFormat("#,##0");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style type="text/css">
/*체크박스 싸이즈 크게*/
.chbox {
	width: 20px;
	height: 20px
}

td, th {
	text-align: center;
}
#mypageheada{
 style="margin-right: 70px"
}
@media ( max-width : 1200px) { 
.ty{
margin-top: 30px;
}
#mypagehead{
width: 94.5%
}
#mypageheada{
margin-right: -20px
}
#budiv{
margin-right: -5px;



}
}
</style>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<title>::장바구니::</title>
</head>
<body>
	<div class="ty">
	<input type="hidden" value="<%=basketlist.size()%>" id="list">
	<center>
		<div id="mypagehead"  style="margin-left: 40px;">
			<h4 id="mypageheada" align="right">
				<a href="meninblack.mib">홈</a> > <a href="mymain.mib">MY PAGE</a> >
				<a href="basketlist.mib">장바구니</a>
			</h4>
			<h3>MY Order</h3>
			<p style="margin-bottom: 50px">회원님의 장바구니 입니다.</p>
		</div>
	</center>



	<div id="total" style="height: margin-top: 150px;margin-left: 3%">
		<div>
			<div align="left">
			<input type="checkbox" id="allCheck" class="chbox"
				style="width: 20px; height: 20px; background-color: white;" >
				</div>
			<form name="f1">
				<table class="table">
					<col width="5%">
					<col width="6%">
					<col width="9%">
					<col width="50%">
					<col width="10%">
					<col width="15%">
					<tr>
						<th style="text-align: center;">&nbsp</th>
						<th style="text-align: center;">번호</th>
						<th style="text-align: center;">이미지</th>
						<th style="text-align: center;">상품정보</th>
						<th style="text-align: center;">수량</th>
						<th style="text-align: center;">가격</th>	
					</tr>
					<%
						if (basketlist == null || basketlist.size() == 0) {
					%>
					<tr>
						<td colspan="9999">내역이 없습니다.</td>
					</tr>
					
					
					<tr height="200px"></tr>
					<%
						} else {
					%>

					<%
						for (int i = 0; i < basketlist.size(); i++) {
					%>
					<tr>
						<td rowspan="2"><input type="checkbox" onclick="ty(<%=i%>)"
							value="<%=basketlist.get(i).getBAS_SEQ()%>" id="ch1"
							class="chbox" style="width: 20px; height: 20px"></td>
						<td rowspan="2"><%=i + 1%>
						<td rowspan="2"><a href="detail.mib?PRO_SEQ=<%=basketlist.get(i).getPRO_SEQ()%>">
						<img alt="<%=basketlist.get(i).getSTORED_NAME()%>" src="..<%=rootPath %>/images/<%=basketlist.get(i).getSTORED_NAME()%>"style="width: 100px; height: 100px"></a></td>
						<td><a href="detail.mib?PRO_SEQ=<%=basketlist.get(i).getPRO_SEQ()%>"><%=basketlist.get(i).getPRO_NAME()%></a></td>
						<td rowspan="2" id="num<%=i%>" valign="middle"><%=basketlist.get(i).getBAS_PRO_NUM()%></td>
						<td rowspan="1" id="price<%=i%>"><%=StringUtil.NumFomat(basketlist.get(i).getPRO_PRICE())%></td> 
					</tr>
					<tr>
						<td><%=basketlist.get(i).getPRO_SIZE()%> : <%=basketlist.get(i).getCOLOR()%></td>
						<td>총:<%=StringUtil.NumFomat(basketlist.get(i).getPRO_PRICE()*basketlist.get(i).getBAS_PRO_NUM())%></td>
					</tr>
					<%
						}
						}
					%>

				</table>

				<table width="50%" align="center" class="table"
					style="margin-top: 100px">

					<tr>
						<td>상품가격</td>
						<td>+</td>
						<td>택배비(5만원이상 무료)</td>
						<td>=</td>
						<td>총가격</td>
					</tr>
					<tr>
						<td><input type="text" id="pay" value="" readonly="readonly" class="form-control" style="text-align: center;">
						</td>
						<td>+</td>
						<td><input type="text" id="tag" value="" readonly="readonly" class="form-control" style="text-align: center;">
						</td>
						<td>=</td>
						<td><input type="text" id="top" svalue="" readonly="readonly" class="form-control" style="text-align: center;">
						</td>
					</tr>
				</table>


			</form>

		</div>
		<div align="right" id="budiv" >
			<input type="button" id="delete"  value="삭제하기" onclick="deletes()" class="btn btn-default"
				style="width: 14.35%; margin-right: 1% ">
		
			<input type="button" id="buy"  align="right" value="결제하기" onclick="buy()"
				class="btn btn-default" style="width: 14.4%; margin-right: 8px">
		</div>
	</div>
	<script type="text/javascript">
		var b = 0;
		var sum = 0;
		var list = $("#list").val();
		var tax =2500;
		Number.prototype.format = function(){
		    if(this==0) return 0;
		 
		    var reg = /(^[+-]?\d+)(\d{3})/;
		    var n = (this + '');
		 
		    while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');
		 
		    return n;
		};

		
		
		function ty(n) {
			if (document.f1.elements[n].checked == true) {
				var number1 =document.getElementById('num'+[n]).childNodes[0].nodeValue;
				number1=number1.replace(/,/gi, ""); 
				var number2 =document.getElementById('price'+[n]).childNodes[0].nodeValue
				number2=number2.replace(/,/gi, ""); 
				
				b += Number(Number(number1)*Number(number2));
				
				document.getElementById('pay').value = (b).format();
				if (b < 50000) {
					document.getElementById('top').value = (b + tax).format();
					document.getElementById('tag').value = (tax).format();
				} else {
					document.getElementById('top').value = (b).format();
					document.getElementById('tag').value = "무료";
				}

			} else if (document.f1.elements[n].checked == false) {
				var number1 =document.getElementById('num'+[n]).childNodes[0].nodeValue;
				number1=number1.replace(/,/gi, ""); 
				var number2 =document.getElementById('price'+[n]).childNodes[0].nodeValue
				number2=number2.replace(/,/gi, ""); 
				
				b -= Number(Number(number1)*Number(number2));
					/* Number(document.getElementById('price'+[n]).childNodes[0].nodeValue) */;
				document.getElementById('pay').value = (b).format();
				if (b < 50000) {
					document.getElementById('top').value = (b + tax).format();
					document.getElementById('tag').value = (tax).format();
				} else {
					document.getElementById('top').value = (b).format();
					document.getElementById('tag').value = "무료";
				}
			}
		}

		$(function() {
			$("#allCheck").click(function() {
				b = 0;
				if ($("#allCheck").prop("checked")) {
					$(".chbox").prop("checked", true);
				} else if ($("#allCheck").prop("checked", false)) {
					$(".chbox").prop("checked", false);
				}
				for (var i =0 ; i < list; i++) {
					if (document.f1.elements[i].checked == true) {
						var number3 =document.getElementById('num'+[i]).childNodes[0].nodeValue;
						number3=number3.replace(/,/gi, ""); 
						
						var number4 =document.getElementById('price'+[i]).childNodes[0].nodeValue
						number4=number4.replace(/,/gi, ""); 
						
						b += Number(Number(number3)*Number(number4));
						document.getElementById('pay').value = (b).format();
						if (b < 50000) {
							document.getElementById('top').value = (b + tax).format();
							document.getElementById('tag').value = (tax).format();
						} else {
							document.getElementById('top').value = (b).format();
							document.getElementById('tag').value = "무료";
						}
					} else {
						document.getElementById('pay').value = 0;
						document.getElementById('top').value = 0;
						document.getElementById('tag').value = 0;

					}
				}
			})

		});
		
		$(function() {
			$(".chbox").click(function(){		
			if(document.getElementById('pay').value == 0){
				document.getElementById('pay').value = 0;
				document.getElementById('top').value = 0;
				document.getElementById('tag').value = 0;
			}			
						
					}
				)
			});


        function deletes() {
            var BAS_SEQ = "";
            var list = $("#list").val();

            for (var i = 0; i < list; i++) {

                if (document.f1.elements[i].checked == true) {
                    BAS_SEQ += document.f1.elements[i].value + ",";
                }

            }
            
            if(BAS_SEQ==null || BAS_SEQ == ""){
            	alert("삭제할 상품이 없습니다.");
            }else{
            
            
            
            BAS_SEQ = BAS_SEQ.slice(0,-1);
            document.location.href='basketdelete.mib?BAS_SEQ='+BAS_SEQ;
            }

        }
        
        function buy() {
            var BAS_SEQ = "";
            var FINAL_PRICE = document.getElementById('top').value;
            FINAL_PRICE=FINAL_PRICE.replace(/,/gi, ""); 
            
            var list = $("#list").val();

            for (var i = 0; i < list; i++) {

                if (document.f1.elements[i].checked == true) {
                	BAS_SEQ += document.f1.elements[i].value + ",";
                }

            }
            if(BAS_SEQ == null || BAS_SEQ == ""){
            	alert("결제할 상품이 없습니다.");
            }else{
            
            BAS_SEQ = BAS_SEQ.slice(0,-1);
            document.location.href='Detail_Buy_Info.mib?BAS_SEQ='+BAS_SEQ+'&FINAL_PRICE='+FINAL_PRICE;

        }
        }
		


	</script>



</div>
</body>
</html>