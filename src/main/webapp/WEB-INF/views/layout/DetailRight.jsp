<%@page import="com.eagle.men_in_black.model.MainDto"%>
<%@ page pageEncoding="UTF-8" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
request.setCharacterEncoding("UTF-8");
String rootPath = request.getContextPath();
%>

<%
MainDto dto = (MainDto)request.getSession().getAttribute("LoginInfo");

%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
</head>
<body>
<!-- 앞에 튀어나와있는 < 이부분  -->
<input type="checkbox" name="right-toggle" id="right-toggle" />
<aside id="right-aside">
      <article id="right-art">
            <div class="right-box">
                  <span class="right-spacer"></span>
                  <div class="right-content">
                        <nav id="right-nav">
                              <ul>
                              <%if(dto!=null){ 
                            	  if (dto.getUSER_ID().equals("adm")) {
                              %>
                                    <li><a href="ceoMypage_Main.mib" >마이페이지</a></li>
                              <%  }else {
   							  %>    <li><a href="mymain.mib">마이페이지</a></li> 
   								<%
   								  }
                               }else{ %>
                              		<li><a href="login.mib" data-toggle="modal" data-target="#modal-signup">마이페이지</a></li>
                              <%} %>
                                    <li><a href="event.mib" >이벤트</a></li>
                                    <li><a href="servicenotice.mib" >공지사항</a></li>
                                     <%if(dto!=null){ 
                            	  if (dto.getUSER_ID().equals("adm")) {
                              %>
                                    <li><a href="ceoMypage_Main.mib">판매내역</a></li>
                              <%  }else {
   							  %>    <li><a onclick="movegoods()" style="cursor: pointer;">오늘본상품</a></li> 
   								<%
   								  }
                               }else{ %>
                              		<li><a href="login.mib" data-toggle="modal" data-target="#modal-signup">오늘본상품</a></li>
                              <%} %> 
                              
                              <%if(dto!=null){ 
                            	  if (dto.getUSER_ID().equals("adm")) {
                              %>
                                    <li><a href="qnA_Administer.mib">문의글관리</a></li>
                              <%  }else {
   							  %>    <li><a href="myboard.mib">내가쓴게시물</a></li> 
   								<%
   								  }
                               }else{ %>
                              		<li><a href="login.mib" data-toggle="modal" data-target="#modal-signup">내가쓴게시물</a></li>
                              <%} %>
                               <%if(dto!=null){ 
                            	  if (!dto.getUSER_ID().equals("adm")) {
                              %>
                              <li><a href="basketlist.mib">장바구니</a></li>
                              <%
                            	  }
                            	  }else{
                              %>
                              <li><a href="login.mib" data-toggle="modal" data-target="#modal-signup">장바구니</a></li>
                              <%
                              }
                              %>
                              </ul>
                        </nav>
                        
                  </div>
            </div>
            <!-- 앞에 <이거부분 -->
            <label class="opener" for="right-toggle" ></label>
      </article>
      </aside>
					<% 	 
					if(dto!=null && !dto.getUSER_ID().equals("adm")){
					%>
		        		<aside id="buyaside" class="buyaside" onclick="BuyPop()">
   						<img alt="" src="..<%=rootPath%>/images/buybtn.png" width="50px" height="50px">
						</aside>
		        	
		        	<%}else if(dto!=null && dto.getUSER_ID().equals("adm")){ %>
		        	
		        	
		        	
		        	
		        	
		        	<%
		        	}else{ 
		        	%>
		        	<aside id="buyaside" class="buyaside" >
		        		<a href="login.mib" data-toggle="modal" data-target="#modal-signup">
		        		<img alt="" src="..<%=rootPath%>/images/buybtn.png" width="50px" height="50px">	
		        		</a>
		        	</aside>
		        	<%
		        	}
		        	%>

<script type="text/javascript">
$(document).ready(function() {

   $("#right-toggle").click(function(){
   if($("#right-toggle").prop("checked")) {
   
      $("#buyaside").css('margin-top','480px');
   
   }else{
      
         $("#buyaside").css('margin-top','200px');
   
   }
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