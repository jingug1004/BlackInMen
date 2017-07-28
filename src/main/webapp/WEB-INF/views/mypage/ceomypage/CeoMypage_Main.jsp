<%@page import="com.eagle.men_in_black.util.StringUtil"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.eagle.men_in_black.model.CeoMypageDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	List<CeoMypageDto> list = (List<CeoMypageDto>)request.getAttribute("list");
	HashMap<String,String> prophomap= (HashMap<String,String>)request.getAttribute("prophomap");
	String rootPath = request.getContextPath();
	String START_DATE = (request.getParameter("START_DATE")==null||request.getParameter("START_DATE")=="")?"":request.getParameter("START_DATE");
	String END_DATE = (request.getParameter("END_DATE")==null || request.getParameter("END_DATE")=="")?"":request.getParameter("END_DATE");
	String search = (request.getParameter("search")==null || request.getParameter("search")=="")?"":request.getParameter("search");
	String PAGE_NUM = (request.getParameter("PAGE_NUM")==null || request.getParameter("PAGE_NUM")=="")?"1":request.getParameter("PAGE_NUM");
	String PAGE_SIZE = (request.getParameter("PAGE_SIZE")==null || request.getParameter("PAGE_SIZE")=="")?"10":request.getParameter("PAGE_SIZE");

	System.out.println("시작 데이트 = " +START_DATE);
	System.out.println("끝 search  = " +search);
	
		Calendar cal = Calendar.getInstance();
		int tyear = cal.get(Calendar.YEAR);
		int tmonth = cal.get(Calendar.MONTH)+1;
		int tday = cal.get(Calendar.DATE);
	
	if(START_DATE.equals("")){
	
		if(tmonth<10){
			if(tday<10){
				START_DATE = tyear+"-0"+tmonth+"-0"+tday;
				END_DATE = tyear+"-0"+tmonth+"-0"+tday;
			}else{
				START_DATE = tyear+"-0"+tmonth+"-"+tday;
				END_DATE = tyear+"-0"+tmonth+"-"+tday;
			}
		}else{
			if(tday<10){
				START_DATE = tyear+"-"+tmonth+"-0"+tday;
				END_DATE = tyear+"-"+tmonth+"-0"+tday;
			}else{
				START_DATE = tyear+"-"+tmonth+"-"+tday;
				END_DATE = tyear+"-"+tmonth+"-"+tday;
			}
		}
	}else{
		END_DATE = tyear +"-"+ END_DATE.substring(2,4) +"-"+ END_DATE.substring(4, 6);
		
		
		String yyear = tyear+"";
		String endyear = START_DATE.substring(0, 2);
				
		if(!yyear.substring(2,4).equals(endyear)){
			START_DATE = (tyear-1) +"-"+ START_DATE.substring(2,4) +"-"+ START_DATE.substring(4, 6);
			
		}else{
			START_DATE = tyear +"-"+ START_DATE.substring(2,4) +"-"+ START_DATE.substring(4, 6);
		}
		
		
	}
	
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
td, th {
	text-align: center;
}

/*작은화면*/
@media screen and (max-width: 50em) {
	.datediv input {
		height: 30px;
		width: 150px;
	}
}

.search {
	width: 28%;
	height: 36px;
	margin: 0px auto;
	background: #dedede;
	border-radius: 3px;
	border: 1px solid #fff;
}

.search input {
	width: 370px;
	padding: 10px 5px;
	float: left;
	color: #000000;
	border: 0;
	background: transparent;
	border-radius: 3px 0 0 3px;
}

.search input:focus {
	outline: 0;
	background: transparent;
}
@media ( max-width : 1200px) { 
.ty{
margin-top: 30px;
}
}


</style>
<script type="text/javascript">
$(document).ready(function(){
    $('#start_date').change(function(){
    	var date1 = $('#start_date').val();
    	var date2 = $('#end_date').val();
    	
    	$("#end_date").attr( 'min', date1 );
    	//$("#start_date").attr( 'max', date2 );
    	$("#end_date").val(date1);
    	
	}); 
	
    $('#dateBtn').click(function(){
    	var date1 = $('#start_date').val();
    	var date2 = $('#end_date').val();
    	
    	strat_date = date1.split('-').join('').substring(2,8);
    	end_date = date2.split('-').join('').substring(2,8);
    	
    	location.href='ceoMypage_Main.mib?START_DATE='+strat_date+"&END_DATE="+end_date;
    });  
    
    
	$('#week').click(function(){
    	var now = new Date();
        var year= now.getFullYear();
        var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
        var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
              
        var fullDate = year + mon + day;
        
        var weekDate = year+''+mon+''+(day-7);
        
        // 오늘날짜가 7일보다 작을때 
		for(i=1;i<=7;i++){
			if(day==i){
				var lastDay = ( new Date( year, (mon-1), 0) ).getDate();
				lastDay = (lastDay+i)-7;
				weekDate = year+''+(mon-1)+''+lastDay;
				if(mon<10){
					weekDate = year+'0'+(mon-1)+''+lastDay;
				}
				
			}
		}
        
		if((day-7)<10){
        	day = '0'+(day-7);
        	weekDate = year+''+mon+''+(day);
        }
		
		fullDate = fullDate.substring(2,8);
		weekDate = weekDate.substring(2,8);
		
		//alert(fullDate);
		//alert(weekDate);
		
		location.href='ceoMypage_Main.mib?START_DATE='+weekDate+"&END_DATE="+fullDate;
		
	});
	
	$('#month').click(function(){
		var now = new Date();
		var year= now.getFullYear();
		var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
        var monthdate_mon = (now.getMonth())>9 ? ''+(now.getMonth()) : '0'+(now.getMonth());
        var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
        
        var fullDate = year + mon + day;
        var monthDate = year+monthdate_mon+day;
		
		var monthdate_lastDay = ( new Date( year, (monthdate_mon-1), 0) ).getDate();
		
		// 전에 한달의 마지막 날보다 지금 날이 클경우 
		// 연도 도 고려 
		if(mon==0){ //1월일때 
			year = year-1;
			monthdate_mon = 12;
			monthDate = year +''+ monthdate_mon + day;
		}
		
		if(monthdate_lastDay<day && mon!=0){ // 1월이아니고 전달보다 지금이 클때 
			monthdate_mon;
			if(monthdate_mon>9){
			monthDate = year+''+(monthdate_mon)+monthdate_lastDay;
			}else{
			monthDate = year+'0'+(monthdate_mon)+monthdate_lastDay;
			}
		}

		fullDate = fullDate.substring(2,8);
		monthDate = monthDate.substring(2,8);
		//alert(fullDate);
		//alert(monthDate);	
		location.href='ceoMypage_Main.mib?START_DATE='+monthDate+"&END_DATE="+fullDate;
        
	});
	$('#threeMonth').click(function(){
		var now = new Date();
		var year= now.getFullYear();
		var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
		var monthdate_mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
		var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
                
        var fullDate = year + mon + day;
        var monthDate = year+monthdate_mon+day;
	             
        if(monthdate_mon>2){        
		var monthdate_lastDay = ( new Date( year, (monthdate_mon-3), 0) ).getDate();
        }
        
        if(mon>2 && monthdate_lastDay<day){
        	monthdate_mon = monthdate_mon-3;
        	if(monthdate_mon==0){
				monthdate_mon = 1;
				monthDate = year +'0'+ monthdate_mon + monthdate_lastDay;
			}else{
				monthDate = year +'0'+ monthdate_mon + monthdate_lastDay;
			}
						
		}else{
			monthdate_mon = monthdate_mon-3;
				if(monthdate_mon==0){
					monthdate_mon = 1;
					monthDate = year +'0'+ monthdate_mon + day;
				}else{
					monthDate = year +'0'+ monthdate_mon + day;
				}
			
		}
		
		for(i=1;i<=2;i++){ // 1,2,월일때 연도,월 바꿔줌 
			if(mon==i){
				year = year-1;
				//alert(year);
				monthdate_mon = 10+i;
				monthDate = year +''+ monthdate_mon + day;
				//alert(monthDate);
			}
		}
				
		
		
		fullDate = fullDate.substring(2,8);
		monthDate = monthDate.substring(2,8);
		//alert(fullDate);
		//alert(monthDate);	
		location.href='ceoMypage_Main.mib?START_DATE='+monthDate+"&END_DATE="+fullDate;
	});
	
});
//배송상태 버튼 눌렀을 때
function delStep(SEQ) {
	$.ajax({
			type : "POST",
			url : "del_step.mib",
			async : true,
			dataType : "html",
			data : {
				"SEQ" : SEQ
			},
			success : function(data) {
				//alert("success " + data);
				var flag = $.parseJSON(data);
				//alert(flag.check); 	
				 $("#dels"+SEQ).html(flag.check);
				if(flag.check=='배송완료'){
					$("#deltd"+SEQ).html('배송완료');	
				}
				 
			},
			complete : function(data) {
			},
			error : function(xhr, status, error) {
				alert("error");
			}
		});		
}

// 엑셀다운 아작스
$(document).ready(function() {
	$("#exexldown").click(function() {
		var PAGE_NUMexel = $("#PAGE_NUMexel").val();
		var START_DATEexel = $("#START_DATEexel").val();
		var END_DATEexel = $("#END_DATEexel").val();
		var searchexel = $("#searchexel").val();
		
		$.ajax({
			type : "GET",
			url : "excel.mib",
			async : true,
			dataType : "html",
			data : {
				"PAGE_NUMexel" : PAGE_NUMexel,
				"START_DATEexel" : START_DATEexel,
				"END_DATEexel" : END_DATEexel,
				"searchexel" : searchexel
			},
			success : function(data) {
				
				 
			},
			complete : function(data) {
			},
			error : function(xhr, status, error) {
				alert("error");
			}
		});		
	});
});

</script>
</head>
<body>
	<center class="ty">
		<div id="mypagehead">
			<h4 align="right" style="margin-right: 100px">
				<a href="meninblack.mib">홈</a> > <a href="ceoMypage_Main.mib">MY PAGE</a> >
				<a href="ceoMypage_Main.mib">판매내역</a>
			</h4>
			<h4>MIB 판매 내역과 매출현황입니다.</h4>
		</div>


		<div class="datediv">
			
			<br><br>
				<h5>날짜별 검색</h5>
				<button class="btn btn-default" id="week">1주</button> 
				<button class="btn btn-default" id="month">1개월</button> 
				<button class="btn btn-default" id="threeMonth">3개월</button> <br> <br>
				<span class="glyphicon glyphicon-calendar" aria-hidden="true"></span> 
		<input type="date" name="start_date" id="start_date" height="50px" value="<%=START_DATE %>" > ~
		<span class="glyphicon glyphicon-calendar" aria-hidden="true"></span> 
		<input type="date" name="end_date" id="end_date" value="<%=END_DATE %>" min="<%=END_DATE%>" >
		<button type="button" id="dateBtn" class="btn btn-default">검색</button>
				<br>
		
		</div>
<%
START_DATE = START_DATE.substring(2,4) + START_DATE.substring(5,7) + START_DATE.substring(8, 10);

END_DATE = END_DATE.substring(2,4) + END_DATE.substring(5,7) + END_DATE.substring(8, 10);

%>

	</center>
	<!--엑셀로 다운받기-->
	
	<input type="hidden" id="PAGE_NUMexel" value="1">
	<input type="hidden" id="START_DATEexel" value="<%=START_DATE%>">
	<input type="hidden" id="END_DATEexel" value="<%=END_DATE%>">
	<input type="hidden" id="searchexel" value="<%=search%>">
	
	<div align="right">
	<a href="excel.mib?START_DATE=<%=START_DATE%>&END_DATE=<%=END_DATE%>&search=<%=search%>&PAGE_NUM=<%=PAGE_NUM%>" role="button" class="btn btn-default" >엑셀다운</a>
	<!-- <input type="button" class="btn btn-default" id="exexldown" value="Excel다운" style= "font-weight:bold"> -->
	<!-- <a  class="btn btn-success" href="exceldown.mib" role="button">엑셀 다운로드<span class="glyphicon glyphicon-download-alt"
				aria-hidden="true"></span></a> -->
	</div>
	
	
	<!--검색(유저ID,상품이름)-->
	<form class="search" action="ceoMypage_Main.mib">
		<input type="search" placeholder="유저ID" name="search" value="<%=search%>">
		<input type="hidden" name="START_DATE" value="<%=START_DATE %>">
		<input type="hidden" name="END_DATE" value="<%=END_DATE %>">
		<button type="submit" class="btn btn-default" >검색</button>
	</form>

	<!--수량 총매출액 순이익 -->

	<div>
	<div style="width: 100%; padding-left: 690px">

		<table class="table table-condensed">
			<tr>
				<th>수량</th>
				<th>총매출</th>
			</tr>
			<!--데이터 받아오는부분  -->
			<tr>
				<th><%=list.size() %></th>
				<% int propricesum=0; int finalpricesum=0;
				for(int i=0; i<list.size();i++){ 
					propricesum += list.get(i).getFINAL_PRICE();
					}%>
				<td><%=StringUtil.NumFomat(propricesum) %></td>
				
				
			</tr>
		</table>
	</div>


	<!--판매내역 테이블  -->
	<div id="total" style="margin-top: 50px">
		<div id="table" style="width: 100%">
			<form name="f1">
				<table class="table">
					<col width="5%">
					<col width="20%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<tr>
						<th>상품</th>
						<th>상품이름</th>
						<th>구매자</th>
						<th>수량</th>
						<th>쿠폰사용</th>
						<th>적립금사용</th>
						<th>결제금액</th>
						<th>판매일</th>
						<th>상태</th>
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
					int conum = Integer.parseInt(prophomap.get("count"+i))-1;
				%>
					<tr >
						<td onclick="detail(<%=list.get(i).getDEL_SEQ()%>,'<%=list.get(i).getPRO_SEQ_st()%>')" style="cursor: pointer;"><img alt="not found" src="..<%=rootPath %>/images/<%=prophomap.get("STOREDNAME"+i) %>"
							style="width: 100px; height: 100px"></td>
						<td onclick="detail(<%=list.get(i).getDEL_SEQ()%>,'<%=list.get(i).getPRO_SEQ_st()%>')" style="cursor: pointer;">
						<%=prophomap.get("PRO_NAME"+i) %> 
						<%if(conum>0){ %>
						 외 <br> <%=conum %>개
						 <%} %>
						</td>
						<td onclick="detail(<%=list.get(i).getDEL_SEQ()%>,'<%=list.get(i).getPRO_SEQ_st()%>')" style="cursor: pointer;"><%=list.get(i).getUSER_ID() %></td>
						<td onclick="detail(<%=list.get(i).getDEL_SEQ()%>,'<%=list.get(i).getPRO_SEQ_st()%>')" style="cursor: pointer;"><%=prophomap.get("count"+i) %></td>
						<td onclick="detail(<%=list.get(i).getDEL_SEQ()%>,'<%=list.get(i).getPRO_SEQ_st()%>')" style="cursor: pointer;"><%=StringUtil.NumFomat(list.get(i).getCOUPON()) %></td>
						<td onclick="detail(<%=list.get(i).getDEL_SEQ()%>,'<%=list.get(i).getPRO_SEQ_st()%>')" style="cursor: pointer;"><%=StringUtil.NumFomat(list.get(i).getPOINT()) %></td>
						<td onclick="detail(<%=list.get(i).getDEL_SEQ()%>,'<%=list.get(i).getPRO_SEQ_st()%>')" style="cursor: pointer;"><%=StringUtil.NumFomat(list.get(i).getFINAL_PRICE()) %></td>
						<td onclick="detail(<%=list.get(i).getDEL_SEQ()%>,'<%=list.get(i).getPRO_SEQ_st()%>')" style="cursor: pointer;"><%=list.get(i).getDEL_TIME() %></td>
						<%if(list.get(i).getDEL_STEP().equals("배송완료") || list.get(i).getDEL_STEP().equals("구매확정")|| list.get(i).getDEL_STEP().equals("반품완료")){ %>
						<td><%=list.get(i).getDEL_STEP() %></td>
						<%}else if(list.get(i).getDEL_STEP().equals("리뷰완료")){%>
						<td>구매확정</td>
						<%}else if(list.get(i).getDEL_STEP().equals("변경사항 처리중")){ %>
						<td  onclick="open_win(<%=list.get(i).getDEL_SEQ()%>,'<%=list.get(i).getPRO_SEQ_st()%>')">
						<button type="button" class="btn btn-default" id="dels<%=list.get(i).getDEL_SEQ()%>"><%=list.get(i).getDEL_STEP() %></button></td>
						
						
						<%}else{ %>
						<td id="deltd<%=list.get(i).getDEL_SEQ()%>">
						<button type="button" class="btn btn-default" onclick="delStep(<%=list.get(i).getDEL_SEQ() %>)" id="dels<%=list.get(i).getDEL_SEQ()%>"><%=list.get(i).getDEL_STEP() %></button></td>
						<%} %>
					</tr>
				<%}
				
				%>	
				
				</table>

			</form>

		</div>

	</div>
</div>
<%  
				// 페이징 및 날짜 선택 
	
	
	int page_num = Integer.parseInt(PAGE_NUM);
	int page_size = Integer.parseInt(PAGE_SIZE);
	//System.out.println("페이지 넘버 = " +PAGE_NUM);
	//System.out.println("페이지 사이즈 = " +PAGE_SIZE);
	
	int pageCount = list.get(0).getTOT_CNT()%page_size==0?list.get(0).getTOT_CNT()/page_size:(list.get(0).getTOT_CNT()/page_size)+1; 
	//System.out.println(list.get(0).getTOT_CNT());
	//System.out.println("페이지 카운트 = " +pageCount);
%>
	<div class="row" align="center">
		<p><%
			
			for(int i=1; i<=pageCount; i++){  %>
			<a href="ceoMypage_Main.mib?PAGE_NUM=<%=i%>&START_DATE=<%=START_DATE %>&END_DATE=<%=END_DATE %>&search=<%=search %>" class="btn btn-default" role="button"><%=i %></a> 
			<%} 
			%>
			
		</p>
	</div>
	<%
				}
	%>
	
	<script type="text/javascript">
	 function detail(SEQ,st)
     {
         var DEL_SEQ = SEQ;
		 var pro_seq_st = st;
         cw=screen.availWidth;     //화면 넓이
         ch=screen.availHeight;    //화면 높이

         sw=1080;    //띄울 창의 넓이
         sh=700;    //띄울 창의 높이

         ml=(cw-sw)/2;        
         mt=(ch-sh)/2;         


         window.open("ceoMypage_Maindetail.mib?del_seq="+DEL_SEQ+"&pro_seq_st="+pro_seq_st,"pop", 'width='+sw+',height='+sh+',top='+mt+',left='+ml+', toolbar=no, location=no, directories=no, status=no, menubar=no, resizable=no, scrollbars=no, copyhistory=no');
     }
	
	 function open_win(SEQ,st)
     {
         var DEL_SEQ = SEQ;
         var pro_seq_st = st;
         cw=screen.availWidth;     //화면 넓이
         ch=screen.availHeight;    //화면 높이

         sw=1080;    //띄울 창의 넓이
         sh=700;    //띄울 창의 높이

         ml=(cw-sw)/2;        
         mt=(ch-sh)/2;         


         window.open("buyCancelceo.mib?del_seq="+DEL_SEQ+"&pro_seq_st="+pro_seq_st,"pop", 'width='+sw+',height='+sh+',top='+mt+',left='+ml+', toolbar=no, location=no, directories=no, status=no, menubar=no, resizable=no, scrollbars=no, copyhistory=no');
     }
	 
	 
	 
	</script>

</body>
</html>