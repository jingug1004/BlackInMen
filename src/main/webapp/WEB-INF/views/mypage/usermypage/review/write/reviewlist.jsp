<%@page import="com.eagle.men_in_black.model.CeoMypageDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	List<CeoMypageDto> list = (List<CeoMypageDto>)request.getAttribute("list");
	String rootPath = request.getContextPath();
	String DEL_SEQ = request.getParameter("del_seq");
	String pro_seq_st = request.getParameter("pro_seq_st");
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="../../../../../css/Mib.css">

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<style type="text/css">
td{
text-align: center;
}

</style>
<title>Insert title here</title>
</head>
<body>
<input type="hidden" value="<%=pro_seq_st %>" id="asd"> 
	<table class="table" style="width: 80%">

					<tr>
						<th style="width: 7%;text-align: center;">상품</th>
						<th style="width: 20%;text-align: center;">상품이름</th>
						<th style="width: 8%;text-align: center;">구매사이즈</th>
						<th style="width: 8%;text-align: center;">구매색상</th>
						<th style="width: 8%;text-align: center;">수량</th>
						<th style="width: 8%;text-align: center;">쿠폰사용</th>
						<th style="width: 8%;text-align: center;">적립금사용</th>
						<th style="width: 8%;text-align: center;">결제금액</th>
						<th style="width: 8%;text-align: center;">리뷰</th>
					</tr>

				<%
				
				if(list==null || list.size()==0){%>
				<tr>
					<td colspan="999999">내역이 없습니다.</td>
				</tr>
				</table>
				</form>
				</div>
				</div>
				<%}else{
				for(int i=0; i<list.size(); i++){ 
					
				%>
					<tr>
						<td><img alt="not found" src="..<%=rootPath %>/images/<%=list.get(i).getSTORED_NAME() %>"
							style="width: 100px; height: 100px"></td>
						<td><%=list.get(i).getPRO_NAME() %></td>
						<td><%=list.get(i).getSEL_SIZE() %></td>
						<td><%=list.get(i).getSEL_COLOR() %></td>
						<td><%=list.get(i).getSEL_NUM() %></td>
						<td><%=list.get(i).getCOUPON() %></td>
						<td><%=list.get(i).getPOINT() %></td>
						<td><%=list.get(i).getFINAL_PRICE() %></td>
					
						<%
						if(list.get(i).getREVIEW_SEQ().contains(",")){
						String strstr[] = list.get(i).getREVIEW_SEQ().split(",");
						
							if(Integer.parseInt(strstr[i])==(list.get(i).getPRO_SEQ())){
						%>
						
						<td><input type="button" value="리뷰쓰기" id="btn"class="btn btn-default" onclick="reviewopen(<%=DEL_SEQ%>,<%=list.get(i).getPRO_SEQ()%>)" style="cursor: pointer;"></td>
						</tr>
						
						
							<%}else{%>
				 			<td>리뷰작성완료</td>
							</tr>
							<%
							  }
						}else{%>
							<td><input type="button" value="리뷰쓰기" id="btn"class="btn btn-default" onclick="reviewopen(<%=DEL_SEQ%>,<%=list.get(i).getPRO_SEQ()%>)" style="cursor: pointer;"></td>
							</tr>
						<%	}
						}
				}
						%>	 
				
				</table>
			
				
<script type="text/javascript">
function reviewopen(DEL_SEQ, seq) {
	var PRO_SEQ = seq;
	var str = $("#asd").val(); 
	location.href='reveiwwrite.mib?PRO_SEQ= '+ PRO_SEQ +'&DEL_SEQ=' + DEL_SEQ + '&pro_seq_st='+str; 
}


</script>
</body>
</html>