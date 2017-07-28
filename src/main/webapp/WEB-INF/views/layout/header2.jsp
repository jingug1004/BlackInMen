<%@page import="java.util.List"%>
<%@page import="com.eagle.men_in_black.model.MainDto"%>
<%@ page pageEncoding="UTF-8" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
request.setCharacterEncoding("UTF-8");
%>
<%

String rootPath = request.getContextPath();
//System.out.println("패쓰" + rootPath);
		MainDto dto = (MainDto) request.getSession().getAttribute("LoginInfo");
		List<MainDto> subitemheader = (List<MainDto>)request.getSession().getAttribute("subitemheader");
		
	%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<script>
</script>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothiccoding.css);
/* General Styles for Menu  */
.dud1{
margin-right: 50px; 
float: left;
}

.dud2{
float: left;  
margin-right: 80px;
}

.menuBackground {
	background: black;
	text-align: center;
	height: 81px;
	top: 0;
	position: fixed;
	width: 100%;
	z-index: 100;
}
.dropDownMenu,
.cate {
	list-style: none;
	margin: 0;
	padding: 0;
	margin-top: 10px;
}

/*a링크들 글자색 */
.cateA {
	padding: 10px 20px;
	display: block;
	text-decoration: none;
	color: white;
	font-size: 20px;
	font-family:  Nanum Gothic Coding;
	font-weight: bold;
}

.cateA:hover {
	/* background: #000; */
	color:red;
	text-decoration: none;
}

.subA{
	left: 0;
	position: relative;
	top: 0px;
	display: block;
	color : white;
	/* background-color: gray; */
	z-index: 999999999999;
	padding: 15px 20px 20px 20px;
	margin-left: -40px;
	width: 130px;
	font-family:  Nanum Gothic Coding;
	font-size: 13px;
	background-color: black;
}

.subA:hover{
	/* background: black; */
	color: red;
	text-decoration: none;
}


/* Level 1 Drop Down */
/* 카테고리 부분  */
.cate {
	margin-top:15px;
	display: inline-block;
	vertical-align: top;
	margin-left: 20px;
	width: 130px;
	position: relative;
	margin-right: 15px; 
	/* background-color: orange; */
	/* solve the 4 pixels spacing between list-items */
}
/* NEW 아이템 부분 */
.dropDownMenu > li:first-child {
	margin-top:15px;
	margin-left: 20px;
}

/* Level 2 */
/* .dropDownMenu ul {
	box-shadow: 2px 2px 15px 0 rgba(0,0,0, 0.5);
} */
/*서브메뉴*/
.dropDownMenu > li > ul {
	
	display: none;
	/* background:transparent; */
	position:fixed;
	position: absolute;
	top:100%;
	z-index: 999999; /* if you have YouTube iframes, is good to have a bigger z-index so the video can appear above the video */
	padding-top: 0px; 
	margin-top: 0px; 
	padding-bottom: 0px; 
	margin-bottom: 0px;
	background-color: transparent; 
	list-style: none;
	width: 130px;	
	height: 300px;
	
}

.logsi{
text-align: right; 
width: 100%;
}

.icon-name{
	color: #fff;
   	font-size: 2em;
   	background-color: black;
   	width: 200px;
   	height: 40px;
   	cursor: pointer;
   	display: none;
   	margin: 10px auto;
  
   	
   	
}
.icon-name:HOVER {
	background-color: red;
}

.dropac{
	display: none;
	list-style: none;
	margin: 0;
	padding: 0;
	top:100%;
	background-color: black;
	color: white;
	width: 1000px;
	margin-left: -400px;
}

.dropacli{
display:block;
border-bottom-color:gray;
height: 40px; 
padding: 15px 20px 20px 20px;
top:100%;
z-index: 999999;
width: 100%;

}

@media ( max-width : 1400px) { /* 최소 768 사이즈때 보이는 크기 */
	.cate{
	width: 8%;
	/* background-color: green; */
	}
}
/*1024가 1200px임*/
@media ( max-width : 1200px) { /* 최소 768 사이즈때 보이는 크기 */
	.dropDownMenu > li:first-child {
	margin-top:15px;
	margin-left: 5px;
	}
	.cate{
	margin-left: 8px;
	margin-right: 8px;
	/* background-color: cyan; */
	}
	.dud1{
	margin-right: 30px;
	}
	.dud2{
	margin-right: 30px;
	}
	
	
	.subouter{
	}
	
	.outerul{
	margin-left: -22px;
	}
	
	.topul{
	margin-left: -24px;
	}
	
	.pantsul{
	margin-left: -24px;
	}
	.shoesul{
	margin-left: -24px;
	}
	.bagul{
	margin-left: -18px;
	}
	.logsi{
	margin-left: 20px;
	}
	
}

@media ( max-width : 1100px) {
.cateA {
	font-size: 16px;
	padding: 10px 10px 0px -10px;
}
}


@media ( max-width : 990px) { /* 최소 768 사이즈때 보이는 크기 */
	.cate{ 
	margin-left: 5px;
	margin-right: 5px; 
	/* background-color: blue; */
	
	}
	.logsi{
	
	margin-bottom: 30px;
	}
	.dropDownMenu > li:first-child {
	margin-left: -100px;
	}
	
	.topA{
	padding: 10px 0px 0px 30px;
	}
	.lologo{
	display: none;
	}
	
	
}

@media ( max-width : 800px) { /* 최소 768 사이즈때 보이는 크기 */
	
	.logsi{
	display: none;
	}
	.lologo{
	display: none;
	}
	.icon-name{
	display: block;
	}
	.menuBackground{
	height: 70px;
	
	}
	.ac{
	display: none;
	}
	
}

.loginma{

}

</style>
</head>
<body>

<div class="menuBackground">

<div class="logsi"> 
	<div class="loglog" style=" float: right; margin-top: 10px;">
		<div class="dud1" >
			<li style="list-style: none; " >
			
			<%
			if (dto != null) {
			%> <a href="logout.mib" class="loginma" style="color: white; font-size: 13px;">로그아웃</a> <%
 			} else {
 			%> <a href="login.mib" class="loginma" data-toggle="modal" data-target="#modal-login" style="color: white; font-size: 13px;">로그인</a>
			<%
			}
			%>
			</li> 
		</div>
		<div class="dud2" >
			<li style="list-style: none;">
			<%
							if (dto != null) {
								if (dto.getUSER_ID().equals("adm")) {
								%> <a href="ceoMypage_Main.mib" class="loginma" style="color: white;font-size: 13px;">마이페이지</a> <%
 								} else {
 								%> <a href="mymain.mib" class="loginma" style="color: white;font-size: 13px;">마이페이지</a> <%
 								}
 						} else {
 						%> 
 						<a href="mib_SignUp.mib" class="loginma" style="color: white;font-size: 13px;">회원가입</a>
						<%
							}
						%>			
			</li>
		</div>
		
	</div>
	
</div>

<div class="lologo" style="width: 180px; height: 80px; float: left; " >
<a href="meninblack.mib">
<img alt="" src="..<%=rootPath %>/images/MIBlogo.png" style="float: left; margin-left: 20px;" width="100%" height="100%">
</a>
</div>


<div class="center myMenu">

<nav class="ac" id="navdrop">
 
<ul class="dropDownMenu">
			<li class="cate"><a href="NewCategory.mib" class="cateA">NEW</a></li>
			<li class="cate "><a href="category.mib?ITEM=OUTER" class="cateA">OUTER</a>
				<ul class="outerul">
				<%
					for(int i=0; i<subitemheader.size();i++){ 
					if(subitemheader.get(i).getITEM().equals("OUTER")){
				%>	
					<li><a  href="category.mib?ITEM=<%=subitemheader.get(i).getITEM() %>&SUB_ITEM=<%=subitemheader.get(i).getSUB_ITEM() %>" class="subA"><%=subitemheader.get(i).getSUB_ITEM()%></a></li>
				<%} 
				}%>	
				</ul>
			</li>
			<li class="cate TOPli"><a href="category.mib?ITEM=TOP" class="cateA topA">TOP</a>
				<ul class="topul">
				<%for(int i=0; i<subitemheader.size();i++){ 
				  if(subitemheader.get(i).getITEM().equals("TOP")){
				%>	
					<li class="sub"><a href="category.mib?ITEM=<%=subitemheader.get(i).getITEM() %>&SUB_ITEM=<%=subitemheader.get(i).getSUB_ITEM() %>" class="subA"><%=subitemheader.get(i).getSUB_ITEM()%></a></li>
				<%} 
				}%>	
				</ul>
			</li>
			<li class="cate PANTli"><a href="category.mib?ITEM=PANTS" class="cateA ">PANTS</a>
				<ul class="pantsul">
					<%
					for(int i=0; i<subitemheader.size();i++){ 
					if(subitemheader.get(i).getITEM().equals("PANTS")){
					%>	
					<li class="sub"><a href="category.mib?ITEM=<%=subitemheader.get(i).getITEM() %>&SUB_ITEM=<%=subitemheader.get(i).getSUB_ITEM() %>" class="subA"><%=subitemheader.get(i).getSUB_ITEM()%></a></li>
					<%} 
					}%>
				</ul>
			</li>
			<li class="cate SHOESli"><a href="category.mib?ITEM=SHOES" class="cateA ">SHOES</a>
				<ul class="shoesul">
					<%for(int i=0; i<subitemheader.size();i++){ 
					if(subitemheader.get(i).getITEM().equals("SHOES")){
					%>
					<li class="sub"><a href="category.mib?ITEM=<%=subitemheader.get(i).getITEM() %>&SUB_ITEM=<%=subitemheader.get(i).getSUB_ITEM() %>" class="subA"><%=subitemheader.get(i).getSUB_ITEM()%></a></li>
					<%} 
					}%>
				</ul>
				</li>
			<li class="cate BAGli"><a href="category.mib?ITEM=BAGnACC" class="cateA ">BAG&ACC</a>
				<ul class="bagul">
					<%for(int i=0; i<subitemheader.size();i++){ 
					if(subitemheader.get(i).getITEM().equals("BAGnACC")){
					%>
					<li class="sub"><a href="category.mib?ITEM=<%=subitemheader.get(i).getITEM() %>&SUB_ITEM=<%=subitemheader.get(i).getSUB_ITEM() %>" class="subA"><%=subitemheader.get(i).getSUB_ITEM()%></a></li>
					<%} 
					}%>
				</ul>
			</li>
				
		</ul>
	</nav>
		
	</div>
	
	<!-- 줄어들었을때 -->


		<nav style="position: relative; width: 100%">
			<div class="icon-name" id="menusize">
				MENU
				<ul class=dropac>


					<li class="dropacli"><a href="#" style="color: white; font-size: 20px;">NEW</a></li>
					<li class="dropacli"><a href="#" style="color: white; font-size: 20px;">OUTER</a></li>
					<li class="dropacli"><a href="#" style="color: white; font-size: 20px;">TOP</a></li>
					<li class="dropacli"><a href="#" style="color: white; font-size: 20px;">PANTS</a></li>
					<li class="dropacli"><a href="#" style="color: white;font-size: 20px;">SHOES</a></li>
					<li class="dropacli"><a href="#" style="color: white;font-size: 20px;">BAG&ACC</a></li>
			
			</ul>
			</div>
		</nav>
	</div>
	

	<!-- Modal Login -->
	<div class="modal fade bs-example-modal-sm" id="modal-login"
		tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content"></div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<!-- Modal signup -->
	<div class="modal fade bs-example-modal-sm" id="modal-signup"
		tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content"></div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<!-- Modal signup -->
	<div class="modal fade bs-example-modal-sm" id="modal-email"
		tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content"></div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->


<script type="text/javascript">
$(document).ready(function() {
    $('nav .dropDownMenu li').hover(function() {
       $(this).children('ul').addClass('fadeInUp animated ').css({'display' : 'block'});
    },function() {
       $(this).children('ul').removeClass('fadeInUp animated ').css({'display' : 'none'});
			
    });
    
    $("#menusize").hover(function() {
  	
    	$(".dropac").addClass('fadeInUp animated ').css({'display' : 'block'});
    	
    },function() {
    		$(".dropac").removeClass('fadeInUp animated ').css({'display' : 'none'});
    				
    	    });
    
}); 
</script>
</body>
</html>