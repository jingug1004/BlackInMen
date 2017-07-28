<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%String rootPath = request.getContextPath(); %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <link rel="shortcut icon" type="image/x-icon" href="..<%=rootPath%>/images/favicon M4.png" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
@import url("https://fonts.googleapis.com/css?family=Oswald:200,300");
@import url("https://fonts.googleapis.com/css?family=Montserrat:100,200,300,400");
body {
  display: block; 
  font-family: "Oswald", sans-serif;
  background: #121212;
  font-weight: 200;
  margin: 0;
  padding: 0;
}
.wrap {
  position: absolute;
  background-image: linear-gradient(to top, #000 0%, #323232 100%);
  width: 100%;
  height: 100%;

}
.content {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translateX(-50%) translateY(-50%);
  text-align: center;
  cursor: pointer;
}
.content .drift {
  white-space: nowrap;
  color: #FFF;
}
.content .drift span {
  transition: all 0.4s cubic-bezier(0.065, 1, 0.39, 1);
  position: relative;
  display: inline-block;
  font-size: 50px;
  margin-right: 35px;
  transform-origin: center 60%;
}
.content .drift span:after {
  position: absolute;
  content: "";
  display: block;
  background: transparent;
  width: 400%;
  height: 100%;
  top: 0;
  left: -200%;
  z-index: 1;
}
.content .drift span:hover {
  transform: rotate(-20deg) !important;
}
.content h3 {
  font-family: "Montserrat", sans-serif;
  font-size: 13px;
  text-transform: uppercase;
  letter-spacing: 0.1em;
  font-weight: 300;
  color: #666;
  position: relative;
}              
</style>
</head>
<body>
<div class="wrap" >
<div class="content" onclick="location.href='meninblack.mib'">
 <div class="drift">MEN IN BLACK</div>
  <h3>sist 5eagles Y.J,SI,TY,IB,CG,'s third project, since 2017/03/16</h3>
</div>
</div>
<script type="text/javascript">
"use strict";

var letters = $(".drift").text().split("");
var max = 70;
var factor = 1.3;
var lenght = letters.length;
var ratio = max / Math.pow(factor, lenght - 1);

$(".drift").html("");

$(letters).each(function (i, element) {
  var rotation = Math.pow(factor, i) * ratio;
  var span = $("<span>" + element + "</span>");
  $(".drift").append(span);
  (function (index) {
    if (index > 0) {
      setTimeout(function () {
        $(span).css({
          "transform": "rotate(" + Math.pow(factor, index) * ratio + "deg)"
        });
      }, 1000 + 50 * index);
    }
  })(i);
});
</script>

</body>
</html>