<%@page import="com.eagle.men_in_black.util.StringUtil"%>
<%@page import="com.eagle.men_in_black.model.CeoMypageDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	List<CeoMypageDto> list = (List<CeoMypageDto>)request.getAttribute("list");
	String rootPath = request.getContextPath();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<style type="text/css">
/*체크박스 싸이즈 크게*/
.chbox {
	width: 20px;
	height: 20px
}

td, th {
	text-align: center;
}

#total{
margin-top: 150px;
margin-left: 100px;
}
#mypagehead{
margin-left: 80px;
}

@media ( max-width : 1200px) { 
.ty{
margin-top: 30px;
}
#mypagehead{
margin-left: 60px;
}
#total{
margin-left: 80px;
margin-top:  100px;
}

}



</style>
</head>
<body>
<body>
	<input type="hidden" value="<%=list.size()%>" id="list">
	<center class="ty">
		<div id="mypagehead" >
			<h4 align="right" style="margin-right: 100px" >
				<a href="meninblack.mib">홈</a> > <a href="ceoMypage_Main.mib">MY PAGE</a> >
				<a href="register_MainBanner.mib">메인배너등록</a>
			</h4>
			<h3>메인배너등록</h3>
			<h4>신상품리스트중 메인이미지 3개를 등록합니다.</h4>
		</div>
	</center>
	
	
	
	
	<div id="total" >
		<div id="table" style="width: 90%">

			
			<form name="f1">
				<table class="table">
					<col width="5%">
					<col width="5%">
					<col width="9%">
					<col width="50%">
					<col width="10%">
					<tr>
						<th>&nbsp</th>
						<th>번호</th>
						<th>이미지</th>
						<th>상품정보</th>
						<th>가격</th>
					</tr>
					<%
						if (list == null || list.size() == 0) {
					%>
					<tr>
						<td colspan="9999">내역이 없습니다.</td>
					</tr>
					<%
						} else {
					%>

					<%
						for (int i = 0; i < list.size(); i++) {
					%>
					<tr>
						<td rowspan="2"><input type="checkbox" onclick="check(<%=list.get(i).getPRO_SEQ()%> )"
						value="<%=list.get(i).getPRO_SEQ()%>" name="ch" id="check<%=list.get(i).getPRO_SEQ()%>" class="chbox" style="width: 20px; height: 20px"></td>

						<td rowspan="2"><%=i + 1%>
						<td rowspan="2"><img alt="not found" src="..<%=rootPath %>/images/<%=list.get(i).getSTORED_NAME() %>"
							style="width: 100px; height: 100px"></td>
						<td><%=list.get(i).getPRO_NAME()%> : <%=list.get(i).getPRO_CONTENT() %></td>
						<td rowspan="2" id="price<%=i%>" style="vertical-align: middle"><%=StringUtil.NumFomat(list.get(i).getPRO_PRICE())%></td>
					</tr>
					<tr>
						<td><%=list.get(i).getITEM()%> : <%=list.get(i).getSUB_ITEM()%></td>
					</tr>
					<%
						}
						}
					%>

				</table>

			</form>

		</div>
		<div align="right">
			<input type="button" id="addBanner"  align="right" value="배너등록" 
				class="btn btn-default" style="width: 15%; font-weight:bold; margin-right: 10.5%">
		</div>
	</div>
	<script type="text/javascript">
		
	

	
	function check(num) {
		
		if($('input:checkbox[name="ch"]:checked').length>3){
			alert("3개까지 선택 가능합니다.");
			
			$("#check"+num).prop("checked",false);
			
		}
		
		
	}
		
	
	$(document).ready(function() {
		
		$("#addBanner").click(function() {
		
			if( $('input:checkbox[name=ch]:checked').length==0) return;
			
			var chval = "";
		      $('input:checkbox[name=ch]:checked').each(function() {
		    	  
		    	  chval += $(this).val()+",";
		    	});
		     
		  window.open('mainBPT.mib?PRO_SEQ_A='+chval.slice(0,-1),
					  'pop',
					  'width=1500, height=800,toolbar=no,location=no,directories=no,status=no,menubar=no,resizable=no,scrollbars=no,copyhistory=no');
		      
		     // 
		      
		      
		});
		
		
	});
	
	
	</script>




</body>
</html>