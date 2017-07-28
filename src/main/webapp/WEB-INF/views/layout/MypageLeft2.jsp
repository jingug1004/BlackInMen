<%@page import="com.eagle.men_in_black.model.MainDto"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
MainDto dto = (MainDto)request.getSession().getAttribute("LoginInfo");

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
/*삼색선 */
span.bar {
  display: block;
  width: 30px;
  height: 5px;
  margin-top: 5px;
  background:black;
  border-radius: 2px;
}
/*삼색선 표시되는거 */
#togg_menu {
  
  border: none;
  outline: none;
  background: transparent;
  cursor: pointer;
 }
.mypagemenu .megaMenu {
  transition: all 0.3s ease-in-out;
  -ms-transition: all 0.3s ease-in-out;
  -o-transition: all 0.3s ease-in-out;
  -webkit-transition: all 0.3s ease-in-out;
  -moz-transition: all 0.3s ease-in-out;
  list-style-type: none;
  padding: 0;
  margin: 0;
  top: 0;
  left: 0;
  background: #fff;
  position: fixed;
  width: 180px;
  height: 100%;
  padding-top: 10px;
  margin-top:80px;
  z-index: 9999;
  opacity: .99;
  
  border-right: 2px solid #ddd;
  box-shadow: 2px 2px 50px 3px #000;
  -ms-box-shadow: 2px 2px 50px 3px #000;
  -o-box-shadow: 2px 2px 50px 3px #000;
  -webkit-box-shadow: 2px 2px 50px 3px #000;
  -moz-box-shadow: 2px 2px 50px 3px #000;
}
/*삼선눌렀을때 튀어나오는거 */
.push{
  transform: translateX(-180px);
  -ms-transform: translateX(-180px);
  -o-transform: translateX(-180px);
  -webkit-transform: translateX(-180px);
  -moz-transform: translateX(-180px);
}
.mypagemenu .megaMenu li {

  z-index: 9999;
  transition: all 0.3s ease-in-out;
  -ms-transition: all 0.3s ease-in-out;
  -o-transition: all 0.3s ease-in-out;
  -webkit-transition: all 0.3s ease-in-out;
  -moz-transition: all 0.3s ease-in-out;
  border-left: 5px solid transparent;
}
.mypagemenu .megaMenu li a {

  z-index: 9999;
  text-align: center;
  padding: 15px 0;
  width: 90%;
  font-family: Helvetica,sans-serif;
  color: #888;
  text-decoration: none;
  display: inline-block;
  transition: all 0.3s ease-in-out;
  -ms-transition: all 0.3s ease-in-out;
  -o-transition: all 0.3s ease-in-out;
  -webkit-transition: all 0.3s ease-in-out;
  -moz-transition: all 0.3s ease-in-out;
}
.mypagemenu .megaMenu li a:hover {
  color: #51e980;
}
.mypagemenu .megaMenu li:hover {
  border-left: 5px solid #51e980;
}
#close:hover{
color:red;
cursor: pointer;
}

/*1024가 1200px임*/
@media ( max-width : 1200px) { /* 최소 768 사이즈때 보이는 크기 */

#togg_menu{
	margin-top: 10px;
}
	
	
}

</style>
</head>
<body>

	<div style="width: 10%; position: fixed;" align="left">
	<button id='togg_menu'>
	<span class='bar'></span>
	<span class='bar'></span>
	<span class='bar'></span>
	</button>
<div class="mypagemenu">
 <div style="position: relative; z-index: 1200;">	
	<ul class='megaMenu push'>
	<%if(dto.getUSER_ID().equals("adm")){ %>
  		<li><p id="close" style="text-align: right; padding-right: 10px; font-size: 15px;">x</p></li>
		
		<li>
		<p style="text-align: center; font-size: 2em; cursor: pointer;" onclick="location.href='ceoMypage_Main.mib'">MY PAGE</p>
		</li>
		<li>
		<a href='register_Good.mib' >제품등록</a>
		</li>
		<li>
		<a href='ceoMypage_Main.mib'>판매내역</a>
		</li>
		<li>
		<a href='register_MainBanner.mib'>메인 배너등록</a>
		</li>
		<li>
		<a href='qnA_Administer.mib'>문의게시판 관리</a>
		</li>
		<li>
		<a href='reiview_Administer.mib'>리뷰관리</a>
		</li>
		<li>
		<a href='notiwri.mib'>공지사항 글쓰기</a>
		</li>
		<li>
		<a href='eventwri.mib'>이벤트 글쓰기</a>
		</li>
		<li>
		<a href='couwri.mib'>쿠폰등록하기</a>
		</li>
	<%}else{
	%>	
		<li><p id="close" style="text-align: right; padding-right: 10px; font-size: 15px;">x</p></li>
		<li>
		<p style="text-align: center;cursor: pointer; font-size: 2em;" onclick="location.href='mymain.mib'">MY PAGE</p>
		</li>
		<li>
		<a href='userup.mib'>정보수정</a>
		</li>
		<li>
		<a href='buylist.mib'>구매내역</a>
		</li>
		<li>
		<a href='basketlist.mib'>장바구니</a>
		</li>
		<li>
		<a onclick='movegoods()' style="cursor: pointer;">오늘본 상품</a>
		</li>
		<li>
		<a href='myboard.mib'>내가 쓴 게시물</a>
		</li>
		<li>
		<a href='coupon_Mileage.mib'>쿠폰 & 적립금</a>
		</li>
	<%} %>
	</ul>
	</div>
</div>
</div>

<script type="text/javascript">
$("#togg_menu").click(function() {
	
	$(".megaMenu").toggleClass('push');
});

$("#close").click(function() {

	$(".megaMenu").toggleClass('push');
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