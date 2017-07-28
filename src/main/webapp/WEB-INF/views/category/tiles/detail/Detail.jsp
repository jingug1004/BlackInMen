<%@page import="com.eagle.men_in_black.util.StringUtil"%>
<%@page import="java.util.List"%>
<%@page import="com.eagle.men_in_black.model.DetailDto"%>
<%@page import="com.eagle.men_in_black.model.MainDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MainDto dto = (MainDto)request.getSession().getAttribute("LoginInfo");
	int PRO_SEQ = Integer.parseInt(request.getParameter("PRO_SEQ"));
	List<DetailDto> list = (List<DetailDto>)request.getAttribute("list");
	List<DetailDto> listColor = (List<DetailDto>)request.getAttribute("listColor");
	List<DetailDto> listSize = (List<DetailDto>)request.getAttribute("listSize");
	String rootPath = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>:::Detail:::</title>
<style type="text/css">
#outerH1{
margin-top: 150px;
}
.productExplain{
  margin-top : 130px;
  position: relative;
  width: 40%;
  height: 700px;
  float: right;
}
.slide-container{
  margin-top : 130px;
  position: relative;
  width: 60%;
  height: 600px;
  float: left;
}
.sub-slide{
	float: left;
	width: 30%;
	height: 95%;
	border-top: double gray 0.1px;
	border-left: double gray 0.1px;
}
.sub-photo{
	width: 100%;
	height: 33.333333333333333%;
	opacity: 1;
	border-bottom: double gray 0.1px;
}
.sub-photo:hover{
	opacity: 0.5;
}
.slide{
  width: 70%;
  height: 95%;
  float: right;
  border: double gray 0.1px;
}
.content, .content1, .content2, .content3{
	width: 100%;
	height: 100%;
}

/*1024해상도가 1200px임*/
@media (max-width: 1200px){
.productExplain{
	margin-top : 70px;
	position: relative;
	width: 40%;
	height: 700px;
	float: right;
}
.slide-container{
	margin-top : 70px;
	position: relative;
	width: 60%;
	height: 600px;
	float: left;
}
.sub-slide{
	float: left;
	width: 30%;
	height: 95%;
	border-top: double gray 0.1px;
	border-left: double gray 0.1px;
}
.sub-photo{
	width: 100%;
	height: 33.333333333333333%;
	opacity: 1;
	border-bottom: double gray 0.1px;
}
.sub-photo:hover{
	opacity: 0.5;
}
.slide{
	width: 70%;
	height: 95%;
	float: right;
	border: double gray 0.1px;
}
.content, .content1, .content2, .content3{
	width: 100%;
	height: 100%;
}
}

/* 베스트 상품 부분 스타일*/
.thumbnail{
 width: 90%;
 height: 100%;
 float: right;
}
/* /////////////////////////////상세/리뷰/Q&A/////////////////////////// */
/* .tab__content{
	width: 100%;
	text-align: center;
} */
.tab-wrap {
  -webkit-transition: 0.3s box-shadow ease;
  transition: 0.3s box-shadow ease;
  border-radius: 6px;
  max-width: 100%;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -ms-flex-wrap: wrap;
      flex-wrap: wrap;
  position: relative;
  list-style: none;
  background-color: #fff;
  margin: 40px 0;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
  width: 100%
}
.tab-wrap:hover {
  box-shadow: 0 12px 23px rgba(0, 0, 0, 0.23), 0 10px 10px rgba(0, 0, 0, 0.19);
}

.tab {
  display: none;
}
.tab:checked:nth-of-type(1) ~ .tab__content:nth-of-type(1) {
  opacity: 1;
  -webkit-transition: 0.5s opacity ease-in, 0.8s -webkit-transform ease;
  transition: 0.5s opacity ease-in, 0.8s -webkit-transform ease;
  transition: 0.5s opacity ease-in, 0.8s transform ease;
  transition: 0.5s opacity ease-in, 0.8s transform ease, 0.8s -webkit-transform ease;
  position: relative;
  top: 0;
  z-index: 1;
  -webkit-transform: translateY(0px);
          transform: translateY(0px);
  text-shadow: 0 0 0;
}
.tab:checked:nth-of-type(2) ~ .tab__content:nth-of-type(2) {
  opacity: 1;
  -webkit-transition: 0.5s opacity ease-in, 0.8s -webkit-transform ease;
  transition: 0.5s opacity ease-in, 0.8s -webkit-transform ease;
  transition: 0.5s opacity ease-in, 0.8s transform ease;
  transition: 0.5s opacity ease-in, 0.8s transform ease, 0.8s -webkit-transform ease;
  position: relative;
  top: 0;
  z-index: 1;
  -webkit-transform: translateY(0px);
          transform: translateY(0px);
  text-shadow: 0 0 0;
}
.tab:checked:nth-of-type(3) ~ .tab__content:nth-of-type(3) {
  opacity: 1;
  -webkit-transition: 0.5s opacity ease-in, 0.8s -webkit-transform ease;
  transition: 0.5s opacity ease-in, 0.8s -webkit-transform ease;
  transition: 0.5s opacity ease-in, 0.8s transform ease;
  transition: 0.5s opacity ease-in, 0.8s transform ease, 0.8s -webkit-transform ease;
  position: relative;
  top: 0;
  z-index: 1;
  -webkit-transform: translateY(0px);
          transform: translateY(0px);
  text-shadow: 0 0 0;
}
.tab:checked:nth-of-type(4) ~ .tab__content:nth-of-type(4) {
  opacity: 1;
  -webkit-transition: 0.5s opacity ease-in, 0.8s -webkit-transform ease;
  transition: 0.5s opacity ease-in, 0.8s -webkit-transform ease;
  transition: 0.5s opacity ease-in, 0.8s transform ease;
  transition: 0.5s opacity ease-in, 0.8s transform ease, 0.8s -webkit-transform ease;
  position: relative;
  top: 0;
  z-index: 1;
  -webkit-transform: translateY(0px);
          transform: translateY(0px);
  text-shadow: 0 0 0;
}
.tab:checked:nth-of-type(5) ~ .tab__content:nth-of-type(5) {
  opacity: 1;
  -webkit-transition: 0.5s opacity ease-in, 0.8s -webkit-transform ease;
  transition: 0.5s opacity ease-in, 0.8s -webkit-transform ease;
  transition: 0.5s opacity ease-in, 0.8s transform ease;
  transition: 0.5s opacity ease-in, 0.8s transform ease, 0.8s -webkit-transform ease;
  position: relative;
  top: 0;
  z-index: 1;
  -webkit-transform: translateY(0px);
          transform: translateY(0px);
  text-shadow: 0 0 0;
}
.tab:first-of-type:not(:last-of-type) + label {
  border-top-right-radius: 0;
  border-bottom-right-radius: 0;
}
.tab:not(:first-of-type):not(:last-of-type) + label {
  border-radius: 0;
}
.tab:last-of-type:not(:first-of-type) + label {
  border-top-left-radius: 0;
  border-bottom-left-radius: 0;
}
.tab:checked + label {
  background-color: #fff;
  box-shadow: 0 -1px 0 #fff inset;
  cursor: default;
}
.tab:checked + label:hover {
  box-shadow: 0 -1px 0 #fff inset;
  background-color: #fff;
}
.tab + label {
  box-shadow: 0 -1px 0 #eee inset;
  border-radius: 6px 6px 0 0;
  cursor: pointer;
  display: block;
  text-decoration: none;
  color: #333;
  -webkit-box-flex: 3;
      -ms-flex-positive: 3;
          flex-grow: 3;
  text-align: center;
  background-color: #f2f2f2;
  -webkit-user-select: none;
     -moz-user-select: none;
      -ms-user-select: none;
          user-select: none;
  text-align: center;
  -webkit-transition: 0.3s background-color ease, 0.3s box-shadow ease;
  transition: 0.3s background-color ease, 0.3s box-shadow ease;
  height: 50px;
  box-sizing: border-box;
  padding: 15px;
}
.tab + label:hover {
  background-color: #f9f9f9;
  box-shadow: 0 1px 0 #f4f4f4 inset;
}
.tab__content {
  padding: 10px 25px;
  background-color: transparent;
  position: absolute;
  width: 100%;
  z-index: -1;
  opacity: 0;
  left: 0;
  -webkit-transform: translateY(-3px);
          transform: translateY(-3px);
  border-radius: 6px;
}

/*이게 전체 크기 */
/* .container {
  margin: 0 auto;
  display: block;
  max-width: 1920px;
} */
.container > *:not(.tab-wrap) {
  padding: 0 80px;
}
a{
   color: black;
   cursor: pointer;
   text-decoration: none;
}
a:hover{
   text-decoration: underline;
}
table td{
  text-align: center;
}
td.organisationname{
	text-align: left;
}
td.actions{
	text-align: left;
}
table.layout{
  width: 100%;
  border-collapse: collapse;
}
table.display{
  margin: 1em 0;
}
table.display th,
table.display td{
  border-bottom: 1px solid #B3BFAA;
  padding: .5em 1em;
}

/* 클때 th,td색상 */
table.display th{ background: #D5E0CC; }
table.display td{ background: #fff; }

table.responsive-table{
  box-shadow: 0 1px 10px rgba(0, 0, 0, 0.2);
}
</style>
</head>
<body>
<script type="text/javascript">
$(document).ready(function () {
    $('.content1').hover(function () {
        $('#mainImage').attr("src", "..<%=rootPath %>/images/<%=list.get(0).getSTORED_NAME() %>");
    });
    $('.content2').hover(function () {
        $('#mainImage').attr("src", "..<%=rootPath %>/images/<%=list.get(1).getSTORED_NAME() %>");
    });
    $('.content3').hover(function () {
        $('#mainImage').attr("src", "..<%=rootPath %>/images/<%=list.get(2).getSTORED_NAME() %>");
    });
    $('#tab2').on('click',function(){
    	reviewPage(1);
    });
    $('#tab3').on('click',function(){
    	QnAPage(1);
    });
});
function reviewPage(page){
	var PRO_SEQ = <%=PRO_SEQ %>;
	var PAGE_NUM = page;
	var strInput = "";
	var strInput2 = "";
	$.ajax({
		type : "POST",
		url : "ReviewListAjax.mib",
		async : true,
		dataType : "html",
		data : {
			"PRO_SEQ" : PRO_SEQ,
			"PAGE_NUM" : PAGE_NUM
		},
		success : function(data) {
			var flag = $.parseJSON(data);
			var reviewBody = document.getElementById("reviewBody");
			var reviewPage = document.getElementById("reviewPage");
			var rootpath = $("#rootpath").val();
			reviewBody.innerHTML = "";
			reviewPage.innerHTML = "";
			for(var i=0;i<flag.length;i++){
				if(flag[i].USER_ID=="adm"){ 			        
					strInput = strInput + "<tr><td class='organisationnumber' width='20%'><img alt='' src='.."+rootpath+"/images/arrow.PNG' class='imgr' width='50px' height='50px'></td><td class='organisationname' width='60%'>"
					+"<a href='javascript:popup("+flag[i].REV_SEQ+")'><br><br><h4>"+flag[i].REV_TITLE+"</h4></a></td>"
					+"<td class='actions' width='20%'>작성자 : "+flag[i].USER_ID+"<br>작성일 : "+flag[i].REV_TIME+"</td></tr>";
				}else{
					strInput = strInput + "<tr><td class='organisationnumber' width='20%'><img alt='' src='.."+rootpath+"/images/"+flag[i].STORED_NAME+"' class='imgr' width='200px' height='200px'></td>"
					+"<td class='organisationname' width='60%'><a href='javascript:popup("+flag[i].REV_SEQ+")'>";
		       		if(flag[i].SCORE==1){
		       			strInput = strInput + "<img alt='...' src='.."+rootpath+"/images/scoreFull.png'>"
		       			+"<img alt='...' src='.."+rootpath+"/images/scoreEmpty.png'>"+"<img alt='...' src='.."+rootpath+"/images/scoreEmpty.png'>"
		       			+"<img alt='...' src='.."+rootpath+"/images/scoreEmpty.png'>"+"<img alt='...' src='.."+rootpath+"/images/scoreEmpty.png'>";
		       		}else if(flag[i].SCORE==2){
		       			strInput = strInput + "<img alt='...' src='.."+rootpath+"/images/scoreFull.png'>"
	       			+"<img alt='...' src='.."+rootpath+"/images/scoreFull.png'>"+"<img alt='...' src='.."+rootpath+"/images/scoreEmpty.png'>"
	       			+"<img alt='...' src='.."+rootpath+"/images/scoreEmpty.png'>"+"<img alt='...' src='.."+rootpath+"/images/scoreEmpty.png'>";
		       		}else if(flag[i].SCORE==3){
			       		strInput = strInput + "<img alt='...' src='.."+rootpath+"/images/scoreFull.png'>"
	       			+"<img alt='...' src='.."+rootpath+"/images/scoreFull.png'>"+"<img alt='...' src='.."+rootpath+"/images/scoreFull.png'>"
	       			+"<img alt='...' src='.."+rootpath+"/images/scoreEmpty.png'>"+"<img alt='...' src='.."+rootpath+"/images/scoreEmpty.png'>";
		       		}else if(flag[i].SCORE==4){
			       		strInput = strInput + "<img alt='...' src='.."+rootpath+"/images/scoreFull.png'>"
	       			+"<img alt='...' src='.."+rootpath+"/images/scoreFull.png'>"+"<img alt='...' src='.."+rootpath+"/images/scoreFull.png'>"
	       			+"<img alt='...' src='.."+rootpath+"/images/scoreFull.png'>"+"<img alt='...' src='.."+rootpath+"/images/scoreEmpty.png'>";
		       		}else if(flag[i].SCORE==5){
			       		strInput = strInput + "<img alt='...' src='.."+rootpath+"/images/scoreFull.png'>"
	       			+"<img alt='...' src='.."+rootpath+"/images/scoreFull.png'>"+"<img alt='...' src='.."+rootpath+"/images/scoreFull.png'>"
	       			+"<img alt='...' src='.."+rootpath+"/images/scoreFull.png'>"+"<img alt='...' src='.."+rootpath+"/images/scoreFull.png'>";
		       		}else{
		       			strInput = strInput + "<h4>평점 데이터가 없습니다.</h4>";
		       		}
		       		strInput = strInput + "<br><br><h4>"+flag[i].REV_TITLE+"</h4></a></td><td class='actions' width='20%'>작성자 : "+flag[i].USER_ID+"<br>작성일 : "+flag[i].REV_TIME+"</td></tr>";
				}
			}
			var PAGE_SIZE = 15;
			var pageCount = ((flag[0].TOT_CNT%PAGE_SIZE)==0 ? flag[0].TOT_CNT/PAGE_SIZE : ((flag[0].TOT_CNT/PAGE_SIZE)+1));
			for(var j=1;j<=pageCount;j++){
				strInput2 = strInput2 + "<a onclick='reviewPage("+j+")' class='btn btn-default' role='button'>"+j+"</a>";
			}
			reviewBody.innerHTML = strInput;
			reviewPage.innerHTML = strInput2;
		},
		complete : function(data) {
		},
		error : function(xhr, status, error) {
			alert("error");
		}
	});
}
function QnAPage(page){
	var PRO_SEQ = <%=PRO_SEQ %>;
	var PAGE_NUM = page;
	var strInput = "";
	var strInput2 = "";
	$.ajax({
		type : "POST",
		url : "QnAListAjax.mib",
		async : true,
		dataType : "html",
		data : {
			"PRO_SEQ" : PRO_SEQ,
			"PAGE_NUM" : PAGE_NUM
		},
		success : function(data) {
			var rootpath = $("#rootpath").val();
			var flag = $.parseJSON(data);
			var QnABody = document.getElementById("QnABody");
			var QnAPage = document.getElementById("QnAPage");
			QnABody.innerHTML = "";
			QnAPage.innerHTML = "";
			var openNum = -1;
			for(i=0;i<flag.length;i++){
				if(flag[i].QNA_OPEN=='비공개'){
					openNum = 0;
				}else{
					openNum = 1;
				}
				if(flag[i].USER_ID=="adm"){
					strInput = strInput + "<tr><td class='organisationnumber'>"+flag[i].QNA_OPEN+"</td><td>"+flag[i].QNA_TYPE+"</td>"
					+"<td class='organisationname'><a href='javascript:QnADetail("+flag[i].QNA_SEQ+",\""+flag[i].USER_ID+"\","+openNum+")'><img alt='' src='.."+rootpath+"/images/arrow.PNG' class='imgr' width='30px'>"+flag[i].QNA_TITLE+"</a></td>"
					+"<td>"+flag[i].USER_ID+"</td><td>"+flag[i].QNA_TIME+"</td></tr>";
				}else{
					strInput = strInput + "<tr><td class='organisationnumber'>"+flag[i].QNA_OPEN+"</td><td>"+flag[i].QNA_TYPE+"</td>"
					+"<td class='organisationname'><a href='javascript:QnADetail("+flag[i].QNA_SEQ+",\""+flag[i].USER_ID+"\","+openNum+")'>"+flag[i].QNA_TITLE+"</a></td>"
					+"<td>"+flag[i].USER_ID+"</td><td>"+flag[i].QNA_TIME+"</td></tr>";
				}
			}
			var PAGE_SIZE = 15;
			var pageCount = ((flag[0].TOT_CNT%PAGE_SIZE)==0 ? flag[0].TOT_CNT/PAGE_SIZE : ((flag[0].TOT_CNT/PAGE_SIZE)+1));
			for(var j=1;j<=pageCount;j++){
				strInput2 = strInput2 + "<a onclick='QnAPage("+j+")' class='btn btn-default' role='button'>"+j+"</a>";
			}
			QnABody.innerHTML = strInput;
			QnAPage.innerHTML = strInput2;
		},
		complete : function(data) {
		},
		error : function(xhr, status, error) {
			alert("error");
		}
	});
}
function popup(REV_SEQ){
	window.open("review.mib?REV_SEQ="+REV_SEQ,"pop","width=820 height=420 resizable=no location=no screenX=100 screenY=100 scrollbars=no");
}
function QnADetail(QNA_SEQ,USER_ID,QNA_OPEN){
	if(QNA_OPEN==0){ //비공개일때
		if($("#userIdlog").val()=='nolog' ){ //로그인 안했거나 글쓴이와 다를때 
			alert("비공개글입니다."); 
			return;
		}else if(USER_ID==$("#userIdlog").val() || $("#userIdlog").val()=='adm'){
			window.open("qnadetail.mib?QNA_SEQ="+QNA_SEQ,"pop","width=820 height=420 resizable=no location=no screenX=100 screenY=100 scrollbars=no");	
			return;
		}
		alert("비공개글입니다."); 
		return;
	}else{ // 공개일때 
		window.open("qnadetail.mib?QNA_SEQ="+QNA_SEQ,"pop","width=820 height=420 resizable=no location=no screenX=100 screenY=100 scrollbars=no");	
	} 
}
function QnAWrite(){
	window.open("QnAWrite.mib?PRO_SEQ=<%=PRO_SEQ %>","pop","width=820 height=420 resizable=no location=no screenX=100 screenY=100 scrollbars=no");	
}
function BuyPop(){
	window.open("BuyPop.mib?PRO_SEQ=<%=PRO_SEQ %>","pop","width=380 height=540 resizable=no location=no screenX=310 screenY=100 scrollbars=no");
}
function QnAWrite2(){
	alert("로그인을 하셔야합니다!");
}
</script>
<%if(dto!=null){ %>
<input type="hidden" id="userIdlog" value="<%=dto.getUSER_ID() %>" >
<%}else{ %>
<input type="hidden" id="userIdlog" value="nolog" >
<%} %>
<input type="hidden" id="rootpath" value="<%=rootPath %>">
<div>
<div class="toptotal">
	<div class="slide-container">
		<div class="sub-slide ">
			<div class="sub-photo">
				<div class="content1">
		    		<img src="..<%=rootPath %>/images/<%=list.get(0).getSTORED_NAME() %>" height="100%" width="100%">
		    	</div>
			</div>
			<div class="sub-photo">
				<div class="content2">
		    		<img src="..<%=rootPath %>/images/<%=list.get(1).getSTORED_NAME() %>" height="100%" width="100%">
		    	</div>
			</div>
			<div class="sub-photo">
				<div class="content3">
		    		<img src="..<%=rootPath %>/images/<%=list.get(2).getSTORED_NAME() %>" height="100%" width="100%">
		    	</div>
			</div>
		</div>
	  	<div class="slide">
		    <div class="content">
		    	<img src="..<%=rootPath %>/images/<%=list.get(0).getSTORED_NAME() %>" height="100%" width="100%" id="mainImage">
		    </div>
	  	</div>	
	</div>

	<div class="productExplain" align="center">
		<div class="" >
		    <div class="thumbnail">
		      <div class="caption">
		      	<div class="productName" style="height: 20%;">
					<h2><b><%=list.get(0).getPRO_NAME() %></b></h2>
				</div>
				<div class="productDeail" style="width: 80%; height: 80%;" align="left">
			        <h4><%=list.get(0).getPRO_CONTENT() %></h4>
			        <hr style="width: 100%;border: solid black 1px;">
			        <p><h3 align="center">판매가</h3></p>
			        <p><h4 align="center"><%=StringUtil.NumFomat(list.get(0).getPRO_PRICE()) %> Won</h4></p>
			        <br/>
		        	<p><ul>
		        	<li><h4>모델체형 : <%=list.get(0).getBODYTYPE() %></h4></li>
		        	<li><h4>색상 : 
		        	<%
		        		for(int i=0; i<listColor.size();i++){
		        	%>
		        		<%=listColor.get(i).getCOLOR() %>
		        	<%
		        			if(i!=listColor.size()-1){
		        	%>
		        		/
		        	<%
		        			}
		        		}
		        	%>
		        	</h4></li>
		        	<li><h4>사이즈 : 
		        	<%
		        		for(int i=0; i<listSize.size();i++){
		        	%>
		        		<%=listSize.get(i).getPRO_SIZE() %>
		        	<%
		        			if(i!=listSize.size()-1){
		        	%>
		        		/
		        	<%
		        			}
		        		}
		        	%>
		        	</h4></li>
		        	<li><h4>소재 : <%=list.get(0).getMATERIAL() %></h4></li>
		        	<li><h4>세탁방법 : <%=list.get(0).getWASH() %></h4></li>
		        	</ul></p>
			        <hr style="width: 100%;border: solid black 1px;">
			        <div class="score" align="center">
		        		<h4>평점</h4>
	        		<%
		        		if(list.get(0).getAVG_SCORE()==1){
		        	%>
		        		<img alt="..." src="..<%=rootPath %>/images/scoreFull.png">
		        		<img alt="..." src="..<%=rootPath %>/images/scoreEmpty.png">
		        		<img alt="..." src="..<%=rootPath %>/images/scoreEmpty.png">
		        		<img alt="..." src="..<%=rootPath %>/images/scoreEmpty.png">
		        		<img alt="..." src="..<%=rootPath %>/images/scoreEmpty.png">
	        		<%
		        		}else if(list.get(0).getAVG_SCORE()==2){
	        		%>
	        			<img alt="..." src="..<%=rootPath %>/images/scoreFull.png">
		        		<img alt="..." src="..<%=rootPath %>/images/scoreFull.png">
		        		<img alt="..." src="..<%=rootPath %>/images/scoreEmpty.png">
		        		<img alt="..." src="..<%=rootPath %>/images/scoreEmpty.png">
		        		<img alt="..." src="..<%=rootPath %>/images/scoreEmpty.png">
	        		<%
		        		}else if(list.get(0).getAVG_SCORE()==3){
	        		%>
	        			<img alt="..." src="..<%=rootPath %>/images/scoreFull.png">
		        		<img alt="..." src="..<%=rootPath %>/images/scoreFull.png">
		        		<img alt="..." src="..<%=rootPath %>/images/scoreFull.png">
		        		<img alt="..." src="..<%=rootPath %>/images/scoreEmpty.png">
		        		<img alt="..." src="..<%=rootPath %>/images/scoreEmpty.png">
	        		<%
		        		}else if(list.get(0).getAVG_SCORE()==4){
	        		%>
	        			<img alt="..." src="..<%=rootPath %>/images/scoreFull.png">
		        		<img alt="..." src="..<%=rootPath %>/images/scoreFull.png">
		        		<img alt="..." src="..<%=rootPath %>/images/scoreFull.png">
		        		<img alt="..." src="..<%=rootPath %>/images/scoreFull.png">
		        		<img alt="..." src="..<%=rootPath %>/images/scoreEmpty.png">
	        		<%
		        		}else if(list.get(0).getAVG_SCORE()==5){
	        		%>
	        			<img alt="..." src="..<%=rootPath %>/images/scoreFull.png">
		        		<img alt="..." src="..<%=rootPath %>/images/scoreFull.png">
		        		<img alt="..." src="..<%=rootPath %>/images/scoreFull.png">
		        		<img alt="..." src="..<%=rootPath%>/images/scoreFull.png">
		        		<img alt="..." src="..<%=rootPath%>/images/scoreFull.png">
		        	<%
		        		}else{
	        		%>
	        			<h4>평점 데이터가 없습니다.</h4>
	        		<%
		        		}
	        		%>
		        	</div>
		        	<div class="buy" align="center">
		        	<% 	 
					if(dto!=null && !dto.getUSER_ID().equals("adm")){
					%>
		        		<button class="btn btn-default" style="width: 80%; height: 50px; margin-top: 15px; margin-bottom: 15px;" onclick="BuyPop()">구매하기</button>
		        	<%
		        	}else if(dto!=null && dto.getUSER_ID().equals("adm")){ 
		        	%>
		        		
		        	<%
		        	}else{
		        	%>
		        	<a href="login.mib" data-toggle="modal" data-target="#modal-signup">
		        		<button class="btn btn-default" style="width: 80%; height: 50px; margin-top: 15px; margin-bottom: 15px;">
		        		구매하기
		        		</button>	
		        		</a>
		        	<%} %>
		        	</div>
		        </div>
		      </div>
		    </div>
	  	</div>
	</div>
</div>

<div>
<h1> </h1>
<br></br>
<hr style="border: solid black 1px; width: 100%;">
<br></br>
</div>

<div class="container">
	
  <div class="tab-wrap">
    <!-- active tab on page load gets checked attribute -->
    <input type="radio" id="tab1" name="tabGroup1" class="tab" checked>
    <label for="tab1">상품상세</label>

    <input type="radio" id="tab2" name="tabGroup1" class="tab">
    <label for="tab2">리뷰</label>

    <input type="radio" id="tab3" name="tabGroup1" class="tab">
    <label for="tab3">Q&A</label>

    <div class="tab__content">
     <center>
     <h1>상품상세 TEST</h1>
     <%=list.get(0).getPRO_DETAIL() %>
     </center>
    </div>

    <div class="tab__content">
      <table class="layout display responsive-table">
      <col width="20%"/><col width="60%"/><col width="20%"/>
    <thead>
        <tr>
            <th colspan="3" style="text-align: center; height: 100px;">평점 : 
            <%
        		if(list.get(0).getAVG_SCORE()==1){
        	%>
        		<img alt="..." src="..<%=rootPath%>/images/scoreFull.png">
        		<img alt="..." src="..<%=rootPath%>/images/scoreEmpty.png">
        		<img alt="..." src="..<%=rootPath%>/images/scoreEmpty.png">
        		<img alt="..." src="..<%=rootPath%>/images/scoreEmpty.png">
        		<img alt="..." src="..<%=rootPath%>/images/scoreEmpty.png">
       		<%
        		}else if(list.get(0).getAVG_SCORE()==2){
       		%>
       			<img alt="..." src="..<%=rootPath%>/images/scoreFull.png">
        		<img alt="..." src="..<%=rootPath%>/images/scoreFull.png">
        		<img alt="..." src="..<%=rootPath%>/images/scoreEmpty.png">
        		<img alt="..." src="..<%=rootPath%>/images/scoreEmpty.png">
        		<img alt="..." src="..<%=rootPath%>/images/scoreEmpty.png">
       		<%
        		}else if(list.get(0).getAVG_SCORE()==3){
       		%>
       			<img alt="..." src="..<%=rootPath%>/images/scoreFull.png">
        		<img alt="..." src="..<%=rootPath%>/images/scoreFull.png">
        		<img alt="..." src="..<%=rootPath%>/images/scoreFull.png">
        		<img alt="..." src="..<%=rootPath%>/images/scoreEmpty.png">
        		<img alt="..." src="..<%=rootPath%>/images/scoreEmpty.png">
       		<%
        		}else if(list.get(0).getAVG_SCORE()==4){
       		%>
       			<img alt="..." src="..<%=rootPath%>/images/scoreFull.png">
        		<img alt="..." src="..<%=rootPath%>/images/scoreFull.png">
        		<img alt="..." src="..<%=rootPath%>/images/scoreFull.png">
        		<img alt="..." src="..<%=rootPath%>/images/scoreFull.png">
        		<img alt="..." src="..<%=rootPath%>/images/scoreEmpty.png">
       		<%
        		}else if(list.get(0).getAVG_SCORE()==5){
       		%>
       			<img alt="..." src="..<%=rootPath%>/images/scoreFull.png">
        		<img alt="..." src="..<%=rootPath%>/images/scoreFull.png">
        		<img alt="..." src="..<%=rootPath%>/images/scoreFull.png">
        		<img alt="..." src="..<%=rootPath%>/images/scoreFull.png">
        		<img alt="..." src="..<%=rootPath%>/images/scoreFull.png">
        	<%
        		}else{
       		%>
       			평점 데이터가 없습니다.
       		<%
        		}
       		%>
            </th>
        </tr>
    </thead>
    <tbody id="reviewBody">
 	
    </tbody>
	</table>
	<div id="reviewPage" align="center">
		
	</div>
	</div>
	
    <!-- QNA -->
    <div class="tab__content">
     <table class="layout display responsive-table">
       <col width="15%"/><col width="15%"/><col width="40%"/><col width="15%"/><col width="15%"/>
    <thead>
        <tr>
            <th style="text-align: center;">공개/비공개</th>
            <th style="text-align: center;">구분</th>
            <th style="text-align: center;">제목</th>
            <th style="text-align: center;">작성자</th>
            <th style="text-align: center;">작성일</th>
        </tr>
    </thead>
    <tbody id="QnABody">
       
    </tbody>
	</table>
		<div align="center">
			<div align="center" id="QnAPage">
			</div>
			<div align="right" style="margin-right: 30px;">
			<%
				if(dto!=null && !dto.getUSER_ID().equals("adm")){
			%>
				<button class="btn btn-default" style="width: 10%;" onclick="QnAWrite()">글쓰기</button>
			
			   <%}else if(dto!=null && dto.getUSER_ID().equals("adm")){ %>
			
			
			
			
			<%
				}else{
			%>
				<button class="btn btn-default" style="width: 10%;" onclick="QnAWrite2()">글쓰기</button>
			<%
				}
			%>
			</div>
		</div>
    </div>
	</div>
</div>
</div>
</body>
</html>