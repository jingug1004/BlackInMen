<%@page import="com.eagle.men_in_black.util.StringUtil"%>
<%@page import="com.eagle.men_in_black.model.MainDto"%>
<%@page import="com.eagle.men_in_black.model.CategoryDto"%>
<%@page import="java.util.List"%>
<%@page import="com.eagle.men_in_black.service.CategorySvc"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   MainDto userinfo  =(MainDto)session.getAttribute("LoginInfo");
   List<CategoryDto> list = (List<CategoryDto>)request.getAttribute("list");
   List<CategoryDto> listBtn = (List<CategoryDto>)request.getAttribute("listBtn");
   List<CategoryDto> listBest = (List<CategoryDto>)request.getAttribute("listBest");
   String SUB_ITEM = (request.getParameter("SUB_ITEM")==null||request.getParameter("SUB_ITEM").equals("") )?"ALL":request.getParameter("SUB_ITEM");
   String ITEM = request.getParameter("ITEM");
   String centerName = "";
   String ORDER = (String)request.getAttribute("ORDER");
   
   if(ITEM.equalsIgnoreCase("BAGnACC"))centerName="BAG&ACC";
   else centerName=ITEM;
   String rootPath = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>:::Outer:::</title>
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
<script type="text/javascript">
function movedetail(pd_no) {
    var pro_seq = pd_no;

         addCookie(pro_seq);
     location.href='detail.mib?PRO_SEQ='+pro_seq;
}
/*-------------------------------------------------쿠키만들기*/
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
        x = x + 's';
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
            //console.log(pd_no); // 이미 존재하는 경우 console에만 출력하고 실제 반영되지 않음
        }else{
            setCookie('recentitems', prev_pd_no + ',' + pd_no);
        }
    }
}
</script>
<br></br>
<h1 style="font-size: 50px; font-weight: bold; text-align: center; " > <%=centerName %> </h1>   
<br></br>

<div class="row" align="center">
<%
   for(int i=0;i<listBest.size();i++){
%>
  <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4" onclick="movedetail(<%=listBest.get(i).getPRO_SEQ()%>)">
    <div class="thumbnail">
      <img src="..<%=rootPath %>/images/<%=listBest.get(i).getSTORED_NAME()%>" alt="..." class="thumbnailImg" style="width: 100%; height: 80%;">
      <div class="caption">
        <h5><%=listBest.get(i).getPRO_NAME() %></h5>
        <p><%=StringUtil.NumFomat(listBest.get(i).getPRO_PRICE()) %> Won</p>
      </div>
    </div>
  </div>
<%
   }
%>
</div>

<hr style="border: solid black 2px;">

<div class="row" align="center">
   <div class="col-md-6 visible-md visible-lg" align="left">
   <p>
      <a href="category.mib?ITEM=<%=ITEM %>&SUB_ITEM=ALL" class="btn btn-default" role="button">전체보기</a>
      <%
         for(int i=0;i<listBtn.size();i++){
      %>
      <a href="category.mib?ITEM=<%=ITEM %>&SUB_ITEM=<%=listBtn.get(i).getSUB_ITEM() %>" class="btn btn-default" role="button" ><%=listBtn.get(i).getSUB_ITEM() %></a>
      <%
         }
      %>
   </p>
   </div>
   <div class="col-md-6 visible-md visible-lg" align="right">
   <p>
      <a href="category.mib?ITEM=<%=ITEM %>&ORDER=C.PRO_SEQ DESC&SUB_ITEM=<%=SUB_ITEM %>" class="btn btn-default" role="button" id="newor">신상품순</a>
      <a href="category.mib?ITEM=<%=ITEM %>&ORDER=C.PRO_PRICE ASC&SUB_ITEM=<%=SUB_ITEM %>" class="btn btn-default" role="button" id="lowor">낮은가격순</a>
      <a href="category.mib?ITEM=<%=ITEM %>&ORDER=C.SALE_CNT DESC&SUB_ITEM=<%=SUB_ITEM %>" class="btn btn-default" role="button" id="bestor">인기상품순</a>
      <a href="category.mib?ITEM=<%=ITEM %>&ORDER=REVIEW_CNT DESC&SUB_ITEM=<%=SUB_ITEM %>" class="btn btn-default" role="button" id="reor">리뷰수순</a>
   </p>
   </div>
   <br></br><br></br>
</div>

<div class="row" align="center">
<%
   for(int i=0; i<list.size(); i++){
%>
   <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4" onclick="movedetail(<%=list.get(i).getPRO_SEQ()%>)">
      <div class="thumbnail">
         <img src="..<%=rootPath %>/images/<%=list.get(i).getSTORED_NAME()%>" alt="..." class="thumbnailImg" style="width: 100%; height: 80%;">
         <div class="caption">
            <h5><%=list.get(i).getPRO_NAME() %></h5>
            <p><%=StringUtil.NumFomat(list.get(i).getPRO_PRICE()) %> Won</p>
         </div>
      </div>
   </div>
<%
   }
%>

</div>
<input type="hidden" id="ororder" value="<%=ORDER%>">
<input type="hidden" id="susubtem" value="<%=SUB_ITEM%>">
<%
	int PAGE_SIZE = 9;
	int pageCount = (list.get(0).getTOT_CNT() % PAGE_SIZE) == 0? list.get(0).getTOT_CNT() / PAGE_SIZE : (list.get(0).getTOT_CNT() / PAGE_SIZE) + 1;
%>

<div class="row" align="center">
   <p>
   <%
		for (int i = 1; i <= pageCount; i++) {
	%>
	<a onclick="pagemove(<%=i %>,'<%=ITEM%>')" class="btn btn-default" role="button"><%=i%></a>
	<%
		}
	%>
   </p>
</div>
<script type="text/javascript">
function pagemove(page_num,item){
	var ITEM = item;
	var ORDER = $("#ororder").val();
	var SUBITEM = $("#susubtem").val();
	location.href="category.mib?PAGE_NUM="+page_num+"&ITEM="+ITEM+"&ORDER="+ORDER+"&SUB_ITEM="+SUBITEM;
}

</script>


</body>
</html>