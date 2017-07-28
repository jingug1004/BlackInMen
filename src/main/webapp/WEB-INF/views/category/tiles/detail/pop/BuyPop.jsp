<%@page import="com.eagle.men_in_black.model.MainDto"%>
<%@page import="java.util.List"%>
<%@page import="com.eagle.men_in_black.model.DetailDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	int count = 1;
	int PRO_SEQ = Integer.parseInt(request.getParameter("PRO_SEQ"));
	List<DetailDto> detailDtoList = (List<DetailDto>)request.getAttribute("list");
	List<DetailDto> listColor = (List<DetailDto>)request.getAttribute("listColor");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="../../../../../css/Mib.css">
<title>:::BuyPop:::</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
</head>
<body>
<!-- <script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script> -->
<script type="text/javascript">
$(function() {
var stockLimit;
var color;
var size;
var bas_pro_num;
	$('#plus').on('click',function(){		
		var num = $('#number').val();
		num = Number(num);
		if(num<stockLimit)num = num+1;
		$('#number').val(num);
	});
	$('#minus').on('click',function(){		
		var num = $('#number').val();
		num = Number(num);
		if(num>1)num = num-1;
		$('#number').val(num);
	});
	$('#colorSelect').change(function(){
		color = $('#colorSelect option:selected').val();
		if(color=='no'){
			$('#sizeSelect').attr('disabled',true);
			$('#minus').attr('disabled',true);
			$('#plus').attr('disabled',true);
		}else{
			$('#sizeSelect').attr('disabled',false);
			//아작스사용해야한다.
			$.ajax({
	 			type : "POST",
	 			url : "selectSize.mib",
	 			async : true,
	 			dataType : "html",
	 			data : {
	 				"PRO_SEQ" : <%=PRO_SEQ %>,
	 				"COLOR" : color
	 			},
	 			success : function(data) {
	 				var flag = $.parseJSON(data);
	 				
	 				$("#sizeSelect").find("option").remove();
	 				$("#sizeSelect").append("<option value='no' selected='selected'>사이즈선택</option>");

	 				for(i=0;i<flag.length;i++){
	 					$("#sizeSelect option:eq(0)").after("<option value="+flag[i].PRO_SIZE+'>'+flag[i].PRO_SIZE+'</option>');
	 				}
	 			},
	 			complete : function(data) {
	 			},
	 			error : function(xhr, status, error) {
	 				alert("에러발생");
	 			}
	 		});
		}
	});
	$('#sizeSelect').change(function(){
		color = $('#colorSelect option:selected').val();
		size = $('#sizeSelect option:selected').val();
		if(size=='no'){
			$('#minus').attr('disabled',true);
			$('#plus').attr('disabled',true);
		}else{
			$('#minus').attr('disabled',false);
			$('#plus').attr('disabled',false);
			//아작스사용해야한다.
			$.ajax({
	 			type : "POST",
	 			url : "stockLimit.mib",
	 			async : true,
	 			dataType : "html",
	 			data : {
	 				"PRO_SEQ" : <%=PRO_SEQ %>,
	 				"COLOR" : color,
	 				"PRO_SIZE" : size
	 			},
	 			success : function(data) {
	 				var flag = $.parseJSON(data);
	 				stockLimit = flag;
	 			},
	 			complete : function(data) {
	 			},
	 			error : function(xhr, status, error) {
	 				alert("에러발생");
	 			}
	 		});
		}
	});
	
	$('#basketBtn').on('click',function(){
		color = $('#colorSelect option:selected').val();
		size = $('#sizeSelect option:selected').val();
		bas_pro_num = $('#number').val();
		if((color!="no"&&color!=null)&&(size!="no"&&size!=null)){
			$.ajax({
	 			type : "POST",
	 			url : "BuyPopAjax.mib",
	 			async : true,
	 			dataType : "html",
	 			data : {
	 				"PRO_SEQ" : <%=PRO_SEQ %>,
	 				"PRO_SIZE" : size,
	 				"COLOR" : color,
	 				"BAS_PRO_NUM" : bas_pro_num
	 			},
	 			success : function(data) {
	 				var flag = $.parseJSON(data);
	 				if(flag>0){
	 					alert("장바구니에 등록하였습니다!");
	 					window.close();
	 				}else{
	 					alert("장바구니 등록 실패 다시 시도해주세요");
	 				}
	 			},
	 			complete : function(data) {
	 			},
	 			error : function(xhr, status, error) {
	 				alert("에러발생 잠시 후 다시 시도해주세요");
	 			}
	 		});
		}else{
			alert("옵션과 수량을 다시 한번 확인해주십시오.");
		}
	});
	
	$('#buyBtn').on('click',function(){
		color = $('#colorSelect option:selected').val();
		size = $('#sizeSelect option:selected').val();
		bas_pro_num = $('#number').val();
		if((color!="no"&&color!=null)&&(size!="no"&&size!=null)){
			$.ajax({
	 			type : "POST",
	 			url : "BuyPopAjax.mib",
	 			async : true,
	 			dataType : "html",
	 			data : {
	 				"PRO_SEQ" : <%=PRO_SEQ %>,
	 				"PRO_SIZE" : size,
	 				"COLOR" : color,
	 				"BAS_PRO_NUM" : bas_pro_num
	 			},
	 			success : function(data) {
	 				var flag = $.parseJSON(data);
	 				if(flag>0){
	 					opener.location = 'basketlist.mib';
	 					window.close();
	 				}else{
	 					alert("error");
	 				}
	 			},
	 			complete : function(data) {
	 			},
	 			error : function(xhr, status, error) {
	 				alert("error");
	 			}
	 		});
		}else{
			alert("error");
		}
	});
});
</script>
<div align="center" style="text-align: center;">
	<div class="thumbnail" align="center" style="text-align: center;">
		<div class="score" align="center" style="height: 20%; width: 100%; text-align: center;">
			<div style="height: 60%; text-align: center; width: 100%" align="center">
				<h3><%=detailDtoList.get(0).getPRO_NAME() %></h3>
			</div>
			<div style="height: 40%; text-align: center; width: 100%" align="center">
				<h6>옵션과 수량을 선택해주세요.</h6>
			</div>
			<hr style="border: solid black 1px; width: 80%;">
		</div>
		<div align="center" style="height: 15%; width: 100%; text-align: center;">
			<h5>색상</h5>
			<select name=color size=1 id="colorSelect">
		        <option value="no" selected="selected">칼라선택</option>
		        <%
		        	for(int i=0;i<listColor.size();i++){
		        %>
		        	<option value="<%=listColor.get(i).getCOLOR() %>"><%=listColor.get(i).getCOLOR() %></option>
		        <%
		        	}
		        %>
	    	</select>
		</div>
		<div class="info" style="height: 15%; width: 100%; text-align: center;">
			<h5>사이즈</h5><br>
			<select name=size size=1 id="sizeSelect" disabled="disabled">
		        <option value="no" selected="selected">사이즈선택</option>
	    	</select>
		</div>
		<div style="height: 15%; width: 100%; text-align: center;" align="center">
			<h5>수량</h5><br>
			<button class="btn btn-default" id="minus" type="submit" style="width: 15%; height: 100%;" disabled="disabled">-</button>
			<input type="text" id="number" size="5px" value="<%=count %>" style="text-align: center;" readonly="readonly"/>
			<button class="btn btn-default" id="plus" style="width: 15%; height: 100%;" disabled="disabled">+</button>
		</div>
		<div class="btn" align="center" style="height: 35%; width:80%; text-align: center;">
			<button type="button" class="btn btn-default" id="basketBtn" style="width: 100%; height: 50%;">장바구니담기</button>
			<br><br>
			<button type="button" class="btn btn-default" id="buyBtn" style="width: 100%; height: 50%;">구매하기</button>
		</div>
	</div>
</div>
</body>
</html>