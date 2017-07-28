<%@page import="com.eagle.men_in_black.model.MainDto"%>
<%@ page pageEncoding="UTF-8" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
request.setCharacterEncoding("UTF-8");
String rootPath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
</head>
<body>
<%
MainDto dto = (MainDto)request.getSession().getAttribute("LoginInfo");

%>

<div class="mypage-side-menu ">
 		 
  <%if(dto.getUSER_ID().equals("adm")){ %>
  <nav class="side-menusize" >
         <img src="..<%=rootPath%>/images/mymenu.PNG" width="100%" height="100%" style="cursor: pointer;">
  </nav>
 
 <ul>
 	<li><a href="ceoMypage_Main.mib" style="color: black; font-size: 30px;">MyPage</a></li>
    
    <li onclick="location.href='register_Good.mib'">제품등록</li>
    
    <li onclick="location.href='ceoMypage_Main.mib'">판매내역</li>
   
    <li onclick="location.href='register_MainBanner.mib'">메인 배너등록</li>
    
    <li onclick="location.href='qnA_Administer.mib'">문의게시판 관리</li>
    
    <li onclick="location.href='reiview_Administer.mib'">리뷰관리</li>
    
    <li onclick="location.href='notiwri.mib'">공지사항 글쓰기</li>
    
    <li onclick="location.href='eventwri.mib'">이벤트 글쓰기</li>
    
    <li onclick="location.href='couwri.mib'">쿠폰등록하기</li>
    
    
    
  </ul>
  <%}else{ %>
  <span class="mypage-logo"><a href="mymain.mib">MyPage</a></span>
 
  <ul>
    
    <li onclick="location.href='userup.mib'">정보수정</li>
    
    <li onclick="location.href='buylist.mib'"> 구매내역</li>
   
    <li onclick="location.href='basketlist.mib'"> 장바구니</li>
    
    <li onclick="movegoods()"> 오늘본 상품</li>
      
    <li onclick="location.href='myboard.mib'"> 내가 쓴 게시물</li>
     
    <li onclick="location.href='coupon_Mileage.mib'">쿠폰 & 적립금</li>
   
  </ul>
  <%} %>
  
 
</div>

<script>
$(function() {
   //Side MENU
      var $sidebarWidth = $('.mypage-side-menu').width();
      $('.mypage-side-menu').toggleClass('active');
});

$(document).ready(function () {
   $(".side-menusize").click(function(){
	  $(".mypage-side-menu").toggleClass('mypage-side-menu-click');
   });
});

function movegoods() {
    if ((document.cookie == '') || (document.cookie == null)) {
        location.href='todayGoods.mib?pro_seq=nocookie';
    }
    var pro_seq = getCookie('recentitems');
    pro_seq = pro_seq.substring(1);
    location.href='todayGoods.mib?pro_seq='+pro_seq;
}



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
</script>

</body>
</html>