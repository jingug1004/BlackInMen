<%@page import="com.eagle.men_in_black.util.StringUtil"%>
<%@page import="com.eagle.men_in_black.model.CeoMypageDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% List<CeoMypageDto> list = (List<CeoMypageDto>)request.getAttribute("list"); 
String rootPath = request.getContextPath();%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
  	
<style type="text/css">
td, th {
	text-align: center;
}
#table{
	margin-left: 7%;
	width: 80%;
}
</style>
</head>
<body>
<input type="hidden" id="listsize" value="<%=list.size()%>">
<div id="total" >
		<div id="table" >

			
			<form name="f1" method="post" enctype="multipart/form-data">
				<table class="table">
					
					<col width="9%">
					<col width="50%">
					<col width="10%">
					<tr>
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
						<td rowspan="2">
						<img alt="not found" src="..<%=rootPath %>/images/<%=list.get(i).getSTORED_NAME() %>" style="width: 100px; height: 100px">
						<input type="hidden" name="pro_seq<%=i%>" value="<%=list.get(i).getPRO_SEQ()%>">
						</td>
						<td><%=list.get(i).getPRO_NAME()%> : <%=list.get(i).getPRO_CONTENT() %></td>
						<td rowspan="2" id="price<%=i%>"><%=StringUtil.NumFomat(list.get(i).getPRO_PRICE())%></td>
					</tr>
					<tr>
						<td><%=list.get(i).getITEM()%> : <%=list.get(i).getSUB_ITEM()%></td>
					</tr>
					<tr>
						<td colspan="9999" style="border-top: 1px solid black;border-bottom:1px solid black; ">
							<input type="file" id="file<%=i%>" name="file<%=i%>">
						</td>
					</tr>
					<tr>
						<td colspan="9999">
						<div  id="imgdiv<%=i %>" ></div>
						</td>
					</tr>
					<%
						}
						}
					%>
		
				</table>
		
			</form>

		</div>
		<div align="right">
			<input type="button" id="addBanner"  align="right" value="등록하기" 
			onclick="closeSelf()" class="btn btn-default" style="width: 80%; margin-right: 13%">
		</div>
	</div>
	
	<script type="text/javascript">
	// 파일 업로드 이미지 미리보기 	
	$(function() {
	        $("#file0").on('change', function(){
	            readURL(this,'one');
	        });
	        $("#file1").on('change', function(){
	            readURL(this,'two');
	        });
	        $("#file2").on('change', function(){
	            readURL(this,'three');
	        });
	    });

	    function readURL(input,num) {
	    	if(num=='one'){
	    		$("#imgdiv0").css('width','1200px');
	    		$("#imgdiv0").css('height','600px');
	    		$("#imgdiv0").html('<img id="oneblah" src="#" width="100%" height="100%"/>')	
	    	if (input.files && input.files[0]) {
	        var reader = new FileReader();
		    reader.onload = function (e) {
	        		
	                $('#oneblah').attr('src', e.target.result);
	            }

	          reader.readAsDataURL(input.files[0]);
	        }
	        }else if(num=='two'){
	        	$("#imgdiv1").css('width','1200px');
	    		$("#imgdiv1").css('height','600px');
	        	$("#imgdiv1").html('<img id="twoblah" src="#" width="100%" height="100%"/>')	
	        	if (input.files && input.files[0]) {
	            var reader = new FileReader();
	    	    reader.onload = function (e) {
	        	
	                $('#twoblah').attr('src', e.target.result);
	            }

	          reader.readAsDataURL(input.files[0]);
	        }        	
	        }else if(num=='three'){
	        	$("#imgdiv2").css('width','1200px');
	    		$("#imgdiv2").css('height','600px');
	        	$("#imgdiv2").html('<img id="threeblah" src="#" width="100%" height="100%"/>')	
	        	if (input.files && input.files[0]) {
	            var reader = new FileReader();
	    	    reader.onload = function (e) {
	         		
	                 $('#threeblah').attr('src', e.target.result);
	             }

	           reader.readAsDataURL(input.files[0]);
	        }
	    }
	    }
	    
	    function closeSelf(){
	    	
	    	var listsize = $("#listsize").val();
	    	
			var formData = new FormData(); 
			
			for(i=0; i<listsize; i++){
			formData.append("pro_seq"+i, $("input[name=pro_seq"+i+"]").val()); 
			formData.append("file"+i, $("input[name=file"+i+"]")[0].files[0]);
			}
			$.ajax({
	 			type : "POST",
	 			url : "mainbannerWrite.mib",
	 			async : true,
	 			dataType : "html",
	 			data : formData,
	 			processData: false,
	 			contentType: false,
	 			success : function(data) {
	 				//alert("success " + data);
	 				var flag = $.parseJSON(data);
	 				
	 				if(flag.result=='OK'){
	 					window.close();
	 				}else{
	 					alert("리뷰등록실패");
	 				}
	 			},
	 			complete : function(data) {
	 			},
	 			error : function(xhr, status, error) {
	 				alert("error");
	 			}
	 		});		

	}
	    
	</script>

</body>
</html>