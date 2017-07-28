<%@page import="com.eagle.men_in_black.util.StringUtil"%>
<%@page import="com.eagle.men_in_black.model.MainDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%

String rootPath = request.getContextPath();
String loginInfo = (String)request.getAttribute("LoginInfo")==null?"asd":(String)request.getAttribute("LoginInfo");
String insert = (String)request.getAttribute("insert")==null?"noinsert":(String)request.getAttribute("insert");
List<MainDto> list = (List<MainDto>)request.getAttribute("list");
List<MainDto> outerlist = (List<MainDto>)request.getAttribute("outerlist");
List<MainDto> toplist = (List<MainDto>)request.getAttribute("toplist");
List<MainDto> pantslist = (List<MainDto>)request.getAttribute("pantslist");
String updateResult = (request.getAttribute("updateResult")==null || request.getAttribute("updateResult")=="")?"asd":(String)request.getAttribute("updateResult");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
/* 베스트 상품 부분, 카테고리부분 */
.thumbnail{
 width: 100%;
 height: 600px;
}
.thumbnail{
	opacity: 1;
}
.thumbnail:hover{
	opacity: 0.5;
}
/*1024해상도가 1200px임*/
@media ( max-width : 1200px) { 
	.thumbnail{
		width: 100%;
	 	height: 300px;
	}
}
</style>
</head>
<body>
<%
if(updateResult.equals("OK")){
%>
<script type="text/javascript"> alert("회원정보수정 완료! 다시로그인해주세요"); </script>
<%}
%>


<% if(insert.equals("insert")){ %>
<script type="text/javascript"> alert("회원가입 성공!") </script>
 <%} %> 


<% if(loginInfo.equals("success")){ %>
	<script type="text/javascript"> alert("로그인성공"); </script>
<%}else if(loginInfo.equals("NotPwd")){ %>
	<script type="text/javascript"> alert("비밀번호틀림"); </script>
<%}else if(loginInfo.equals("NoMember")){ %>
	<script type="text/javascript"> alert("ID가없음"); </script>
<%}else if(loginInfo.equals("logout")){ %>
<script type="text/javascript"> alert("로그아웃"); </script>
<%} %>

<div class="main-slide-container">
  
    
<%if(list!=null){ 
	for(int i=0; i<3;i++){
%>
	<div class="main-slide" >
	<div class="main-slide-content">
    <img src="..<%=rootPath %>/images/<%=list.get(i).getSTORED_NAME() %>" height="100%" width="100%" onclick="detail(<%=list.get(i).getPRO_SEQ() %>)">
    </div>
    </div>
<%}
	}%>
  
  <div class="prev" onclick="plus(-1)">&#10094;</div>
  <div class="next" onclick="plus(1)">&#10095;</div>

  <div class="main-pagers">
    <div class="main-pagers-active" onclick="current(0)"></div>
    <div onclick="current(1)"></div>
    <div onclick="current(2)"></div>
  </div>
</div>

<h1 style="font-size: 50px; font-weight: bold; " id="main-best-h1"  > OUTER </h1>
<div class="row" align="center">
  <%for(int i=0;i<outerlist.size();i++){ %>
  <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4" onclick="detail(<%=outerlist.get(i).getPRO_SEQ()%>)">
    <div class="thumbnail">
      <img src="..<%=rootPath %>/images/<%=outerlist.get(i).getSTORED_NAME()%>" alt="..." style="width: 100%; height: 80%;">
      <div class="caption">
        <h5><%=outerlist.get(i).getPRO_NAME()%></h5>
        <p><%=StringUtil.NumFomat(outerlist.get(i).getPRO_PRICE())%>원</p>
      </div>
    </div>
  </div>
  <%} %>
</div>

<hr style="border: solid black 2px;">

<h1 style="font-size: 50px; font-weight: bold; " > TOP </h1>
<div class="row" align="center">
   <%for(int i=0;i<toplist.size();i++){ %>
  <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4" onclick="detail(<%=toplist.get(i).getPRO_SEQ()%>)">
    <div class="thumbnail">
      <img src="..<%=rootPath %>/images/<%=toplist.get(i).getSTORED_NAME()%>" alt="..." style="width: 100%; height: 80%;">
      <div class="caption">
        <h5><%=toplist.get(i).getPRO_NAME()%></h5>
        <p><%=StringUtil.NumFomat(toplist.get(i).getPRO_PRICE())%>원</p>
      </div>
    </div>
  </div>
  <%} %>
</div>

<hr style="border: solid black 2px;">


<h1 style="font-size: 50px; font-weight: bold; " > PANTS </h1>
<div class="row" align="center">
   <%for(int i=0;i<pantslist.size();i++){ %>
  <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4" onclick="detail(<%=pantslist.get(i).getPRO_SEQ()%>)">
    <div class="thumbnail">
      <img src="..<%=rootPath %>/images/<%=pantslist.get(i).getSTORED_NAME()%>" alt="..." style="width: 100%; height: 80%;">
      <div class="caption">
        <h5><%=pantslist.get(i).getPRO_NAME()%></h5>
        <p><%=StringUtil.NumFomat(pantslist.get(i).getPRO_PRICE())%>원</p>
      </div>
    </div>
  </div>
  <%} %>
</div>

<hr style="border: solid black 2px;">


<script type="text/javascript">
var slide = document.getElementsByClassName('main-slide'),
pager = document.querySelectorAll('.main-pagers div'),
i,
slideIndex = 0;
/* for (i = 0; i < slide.length; i = i + 1) {
slide[i].style.background = "#94" + i;
} */

//auto slide
function showSlide() {
"use strict";
for (i = 0; i < slide.length; i = i + 1) {
slide[i].style.display = "none";
pager[i].classList.remove('main-pagers-active');
}

if (slideIndex >= slide.length) {slideIndex = 0; }
slide[slideIndex].style.display = "block";
pager[slideIndex].classList.add('main-pagers-active');
slideIndex = slideIndex + 1;

}

showSlide();
setInterval(showSlide,2000);
function clickshow(n) {
"use strict";
var slide = document.getElementsByClassName('main-slide'),
  pager = document.querySelectorAll('.main-pagers div');
for (i = 0; i < slide.length; i = i + 1) {
slide[i].style.display = "none";
pager[i].classList.remove("main-pagers-active");
}
if (slideIndex >= slide.length) {slideIndex = 0; }
if (slideIndex < 0) {slideIndex = slide.length - 1; }
slide[slideIndex].style.display = "block";
pager[slideIndex].classList.add("main-pagers-active");
}

function plus(n) {
"use strict";
clickshow(slideIndex += n);
}
function current(n) {
"use strict";
clickshow(slideIndex = n);
}

function detail(pro_seq) {
	addCookie(pro_seq);
	location.href = 'detail.mib?PRO_SEQ='+pro_seq;
}

function setCookie(cookie_name, value, exdays) {
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookie_value = escape(value) + ((exdays == null) ? "" : "; expires=" + exdate.toUTCString());
    document.cookie = cookie_name + "=" + cookie_value;
}
/*------------------------------------------------겟쿠키*/
function getCookie(cookie_name) {

    var i, x, y, z = document.cookie.split(";");

    for (i = 0; i < z.length; i++) {
        x = z[i].substr(0, z[i].indexOf("="));
        y = z[i].substr(z[i].indexOf("=") + 1);
        x = x.replace(/^s+|s+$/g, "");
        x = x + 's'
        if (x == cookie_name) {
            return unescape(y);
        }
    }
}
/* ----------------------------------------쿠키 값 추가*/
function addCookie(pd_no) {
    var maxitem = 7; // 최대 유지할 수 있는 상품 개수-2개
    var prev_pd_no = getCookie('recentitems');
    if ((prev_pd_no == '') || (prev_pd_no == null)) {
        setCookie('recentitems', ',' + pd_no);
    }else {
        if (getCookie('recentitems').split(',').length > maxitem + 1) {
            prev_pd_no = prev_pd_no.substring(prev_pd_no.indexOf(',') + 1);
        }
        if (prev_pd_no.match(','+pd_no)) {
            console.log(pd_no); // 이미 존재하는 경우 console에만 출력하고 실제 반영되지 않음
        }else{
            setCookie('recentitems', prev_pd_no + ',' + pd_no);
        }
    }
}


</script>
</body>
</html>