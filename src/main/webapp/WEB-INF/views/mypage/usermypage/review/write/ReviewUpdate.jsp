<%@page import="java.util.Calendar"%>
<%@page import="com.eagle.men_in_black.model.DetailDto"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.eagle.men_in_black.model.MainDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	MainDto userdto = (MainDto) request.getAttribute("userdto");
	Date now = new Date();
	SimpleDateFormat fm = new SimpleDateFormat("yy-MM-dd");
	String time = fm.format(now);
	String rootPath = request.getContextPath();
	Calendar cal = Calendar.getInstance();
	int tyear = cal.get(Calendar.YEAR);
	int tmonth = cal.get(Calendar.MONTH)+1;
	int tday = cal.get(Calendar.DATE);
	String today = "";

	if(tmonth<10){
		if(tday<10){
			today = tyear+"-0"+tmonth+"-0"+tday;
		}else{
			today = tyear+"-0"+tmonth+"-"+tday;
		}
	}else{
		if(tday<10){
			today = tyear+"-"+tmonth+"-0"+tday;
		}else{
			today = tyear+"-"+tmonth+"-"+tday;
		}
	}
	
	//리뷰읽기에서 끌거온거
	int REV_SEQ = Integer.parseInt(request.getParameter("REV_SEQ"));
	DetailDto detailDto = (DetailDto)request.getAttribute("detaildto");
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../../../../../css/Mib.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<title>:::Review:::</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<style type="text/css">
.layout {
	width: 790px;
	height: 390px;
	position: relative;
	margin-top: 10px;
}

.photoLayout {
	width: 370px;
	height: 250px;
	margin-top: -40px;
}

.leftLayout {
	float: left;
	width: 49.5%;
	height: 490px;
	position: relative;
	margin-left: 5px;
}

.rightLayout {
	float: right;
	width: 49.5%;
	height: 490px;
	position: relative;
}

.thumbnail {
	width: 100%;
	height: 490px;
	text-align: center;
}

.non {
	border: none;
	border-right: 0px;
	border-top: 0px;
	boder-left: 0px;
	boder-bottom: 0px;
}
input, select, textarea {
   border: 1px solid #ccc;
   display: inline-block;
   border-radius: 3px;
   box-shadow: inset 0px 1px 1px rgba(0, 0, 0, 0.075);
}
</style>
</head>
<body>
	<% String PRO_SEQ = request.getParameter("PRO_SEQ"); 
   String DEL_SEQ = request.getParameter("DEL_SEQ"); 
%>

	<% if(userdto.getUSER_ID().equals("adm")){ %>
	<div class="layout">
		<div class="leftLayout">
			<div class="thumbnail">
				<div class="score" align="center" style="height: 20%">
					평점
					<%
	        		if(detailDto.getSCORE()==1){
	        	%>
					<img alt="..." src="..<%=rootPath%>/images/scoreFull.png"> <img alt="..."
						src="..<%=rootPath%>/images/scoreEmpty.png"> <img alt="..."
						src="..<%=rootPath%>/images/scoreEmpty.png"> <img alt="..."
						src="..<%=rootPath%>/images/scoreEmpty.png"> <img alt="..."
						src="..<%=rootPath%>/images/scoreEmpty.png">
					<%
	        		}else if(detailDto.getSCORE()==2){
        		%>
					<img alt="..." src="..<%=rootPath%>/images/scoreFull.png"> <img alt="..."
						src="..<%=rootPath%>/images/scoreFull.png"> <img alt="..."
						src="..<%=rootPath%>/images/scoreEmpty.png"> <img alt="..."
						src="..<%=rootPath%>/images/scoreEmpty.png"> <img alt="..."
						src="..<%=rootPath%>/images/scoreEmpty.png">
					<%
	        		}else if(detailDto.getSCORE()==3){
        		%>
					<img alt="..." src="..<%=rootPath%>/images/scoreFull.png"> <img alt="..."
						src="..<%=rootPath%>/images/scoreFull.png"> <img alt="..."
						src="..<%=rootPath%>/images/scoreFull.png"> <img alt="..."
						src="..<%=rootPath%>/images/scoreEmpty.png"> <img alt="..."
						src="..<%=rootPath%>/images/scoreEmpty.png">
					<%
	        		}else if(detailDto.getSCORE()==4){
        		%>
					<img alt="..." src="..<%=rootPath%>/images/scoreFull.png"> <img alt="..."
						src="..<%=rootPath%>/images/scoreFull.png"> <img alt="..."
						src="..<%=rootPath%>/images/scoreFull.png"> <img alt="..."
						src="..<%=rootPath%>/images/scoreFull.png"> <img alt="..."
						src="..<%=rootPath%>/images/scoreEmpty.png">
					<%
	        		}else if(detailDto.getSCORE()==5){
        		%>
					<img alt="..." src="..<%=rootPath%>/images/scoreFull.png"> <img alt="..."
						src="..<%=rootPath%>/images/scoreFull.png"> <img alt="..."
						src="..<%=rootPath%>/images/scoreFull.png"> <img alt="..."
						src="..<%=rootPath%>/images/scoreFull.png"> <img alt="..."
						src="..<%=rootPath%>/images/scoreFull.png">
					<%
	        		}else{
        		%>
					<h4>평점 데이터가 없습니다.</h4>
					<%
	        		}
        		%>
					<hr style="border: solid black 1px; width: 70%;">
				</div>
				<div class="title" align="center" style="height: 20%; width: 100%;">
					<h5><%=detailDto.getREV_TITLE() %></h5>
				</div>
				<div class="info"
					style="height: 15%; width: 100%; text-align: left; margin-top: -70px; ">
					<h6 >
						작성자:<%=detailDto.getUSER_ID() %><br>
						작성날짜:<%=detailDto.getREV_TIME() %></h6>
				</div>
				<%if(!detailDto.getSTORED_NAME().equals("none")){ %>

				<div class="photoLayout">
					<img alt="..." src="..<%=rootPath %>/images/<%=detailDto.getSTORED_NAME()%>"
						style="float: left; width: 48%; height: 100%;">
					<textarea rows="5px" cols="10px" readonly="readonly" 
						style="float: left; width: 52%; height: 100%;"><%=detailDto.getREV_CONTENT() %></textarea>
				</div>

				<%
			}else{
			%>
				<div class="content" align="center"
					style="height: 28%; width: 100%; text-align: left;">
					<textarea rows="5px" cols="50px" readonly="readonly" ></textarea>
				</div>
				<%} %>


				<div class="btn btn-default" align="center" style="height: 10%; width: 100%;">
				</div>
			</div>
		</div>
		<div class="rightLayout">
			<div class="thumbnail">
				<div class="score" align="center" style="height: 20%">
					<h4>< 답글 ></h4>
					<hr style="border: solid black 1px; width: 70%;">
				</div>
				<div class="title" align="center" style="height: 20%; width: 100%;">
					제목 : <input type="text" id="review_title" size="30px" 
						value="<%=detailDto.getREV_TITLE() %>" />
				</div>
				<div class="info"
					style="height: 15%; width: 100%; text-align: right;">
					<h5>
						작성자:<%=userdto.getUSER_ID() %>
						<br/>작성날짜:<%=today %></h5>
				</div>
				<div class="content" align="center"
					style="height: 28%; width: 100%; text-align: left;">
					<textarea id="review_content"  rows="5px" cols="50px"><%=detailDto.getREV_CONTENT() %></textarea>
				</div>
				<div class="btn" align="center" style="height: 10%; width: 100%;">
					<button class="btn btn-default" style="width: 50%; height: 100%;" id="admup">수정하기</button>
				</div>
			</div>
		</div>
	</div>
	<%}else{ %>

	<input type="hidden" value="<%=detailDto.getSCORE()%>" class="scqqq">
	<form id="f1" action="reviewWrite.mib" method="post"
		enctype="multipart/form-data">
		<div class="layout">
			<div class="leftLayout">
				<div class="thumbnail">
					<div class="panel panel-default"
						style="margin-left: 40px; margin-bottom: 30px">
						<input type="file"  name="onefile" id="onefile"> <img
							class="PP" alt="여기냐" src="..<%=rootPath %>/images/<%=detailDto.getSTORED_NAME()%>"
							width="100%">
							<%-- <script type="text/javascript">
							alert("<%=detailDto.getSTORED_NAME()%>");
							</script> --%>

						<div
							style="width: 100%; height: 100%; float: left; margin-top: 1%"
							id="imgone-div"></div>


					</div>
				</div>
			</div>

			<div class="rightLayout">
				<input type="hidden" value="<%=detailDto.getSCORE()%>" class="scqqq">
				<div class="thumbnail">
					<div class="score" align="center" style="height: 20%">
						평점 <img alt="..." src="..<%=rootPath%>/images/scoreEmpty.png" id="star1"
							onclick="star1()"> <img alt="..."
							src="..<%=rootPath%>/images/scoreEmpty.png" id="star2" onclick="star2()">
						<img alt="..." src="..<%=rootPath%>/images/scoreEmpty.png" id="star3"
							onclick="star3()"> <img alt="..."
							src="..<%=rootPath%>/images/scoreEmpty.png" id="star4" onclick="star4()">
						<img alt="..." src="..<%=rootPath%>/images/scoreEmpty.png" id="star5"
							onclick="star5()">

						<hr style="border: solid black 1px; width: 70%;">
					</div>




					<input type="hidden" name="score" id="score">


					<div class="title" align="center" style="height: 10%; width: 100%;">
						제목 : <input  type="text" name="title" 
							value="<%=detailDto.getREV_TITLE()%>"> <input
							type="hidden" name="DEL_SEQ" value="<%=DEL_SEQ%>"> <input
							type="hidden" name="REV_SEQ" value="<%=detailDto.getREV_SEQ()%>">
					</div>
					<div class="info"
						style="height: 10%; width: 100%; text-align: right;">
						작성자 :<input type="text" id="id" name="id"
							value="<%=userdto.getUSER_ID()%>님" size="7" readonly="readonly"
							class="non"> 작성일
						<%=time%>

					</div>
					<div class="content" align="center"
						style="height: 38%; width: 100%; text-align: left;">
						<input type="text" class="btn btn-default " name="content"
							style="width: 100%; height: 100px"
							value="<%=detailDto.getREV_CONTENT()%>">
					</div>
					<div class="btn" align="center" style="height: 10%; width: 100%;">

						<input type="button" class="btn btn-default" value="수정 하기"
							onclick="closeSelf()"> <input type="button" class="btn btn-default"
							value="닫기" onclick="window.close()">
					</div>

				</div>

			</div>
		</div>
	</form>
	<%} %>


	<script type="text/javascript">
    var sc = $(".scqqq").val();
        var score = 0;

    if(sc==1){
        $("#star1").attr("src", "..<%=rootPath%>/images/scoreFull.png");
        $("#star2").attr("src", "..<%=rootPath%>/images/scoreEmpty.png");
        $("#star3").attr("src", "..<%=rootPath%>/images/scoreEmpty.png");
        $("#star4").attr("src", "..<%=rootPath%>/images/scoreEmpty.png");
        $("#star5").attr("src", "..<%=rootPath%>/images/scoreEmpty.png");
        score = 1;
        $("#score").val(score);

    }else if(sc==2){
        $("#star1").attr("src", "..<%=rootPath%>/images/scoreFull.png");
        $("#star2").attr("src", "..<%=rootPath%>/images/scoreFull.png");
        $("#star3").attr("src", "..<%=rootPath%>/images/scoreEmpty.png");
        $("#star4").attr("src", "..<%=rootPath%>/images/scoreEmpty.png");
        $("#star5").attr("src", "..<%=rootPath%>/images/scoreEmpty.png");
        score = 2;
        $("#score").val(score);

    }else if(sc==3){
        $("#star1").attr("src", "..<%=rootPath%>/images/scoreFull.png");
        $("#star2").attr("src", "..<%=rootPath%>/images/scoreFull.png");
        $("#star3").attr("src", "..<%=rootPath%>/images/scoreFull.png");
        $("#star4").attr("src", "..<%=rootPath%>/images/scoreEmpty.png");
        $("#star5").attr("src", "..<%=rootPath%>/images/scoreEmpty.png");
        score = 3;
        $("#score").val(score);

    }else if(sc==4){
        $("#star1").attr("src", "..<%=rootPath%>/images/scoreFull.png");
        $("#star2").attr("src", "..<%=rootPath%>/images/scoreFull.png");
        $("#star3").attr("src", "..<%=rootPath%>/images/scoreFull.png");
        $("#star4").attr("src", "..<%=rootPath%>/images/scoreFull.png");
        $("#star5").attr("src", "..<%=rootPath%>/images/scoreEmpty.png");
        score = 4;
        $("#score").val(score);

    }else if(sc==5){
        $("#star1").attr("src", "..<%=rootPath%>/images/scoreFull.png");
        $("#star2").attr("src", "..<%=rootPath%>/images/scoreFull.png");
        $("#star3").attr("src", "..<%=rootPath%>/images/scoreFull.png");
        $("#star4").attr("src", "..<%=rootPath%>/images/scoreFull.png");
        $("#star5").attr("src", "..<%=rootPath%>/images/scoreFull.png");
        score = 5;
        $("#score").val(score);
    }


    $(function() {
        $("#star1").click(function() {

            $("#star1").attr("src", "..<%=rootPath%>/images/scoreFull.png");
            $("#star2").attr("src", "..<%=rootPath%>/images/scoreEmpty.png");
            $("#star3").attr("src", "..<%=rootPath%>/images/scoreEmpty.png");
            $("#star4").attr("src", "..<%=rootPath%>/images/scoreEmpty.png");
            $("#star5").attr("src", "..<%=rootPath%>/images/scoreEmpty.png");
            score = 1;
            $("#score").val(score);
        });

        $("#star2").click(function() {
            $("#star1").attr("src", "..<%=rootPath%>/images/scoreFull.png");
            $("#star2").attr("src", "..<%=rootPath%>/images/scoreFull.png");
            $("#star3").attr("src", "..<%=rootPath%>/images/scoreEmpty.png");
            $("#star4").attr("src", "..<%=rootPath%>/images/scoreEmpty.png");
            $("#star5").attr("src", "..<%=rootPath%>/images/scoreEmpty.png");
            score = 2;
            $("#score").val(score);
        });
        $("#star3").click(function() {
            $("#star1").attr("src", "..<%=rootPath%>/images/scoreFull.png");
            $("#star2").attr("src", "..<%=rootPath%>/images/scoreFull.png");
            $("#star3").attr("src", "..<%=rootPath%>/images/scoreFull.png");
            $("#star4").attr("src", "..<%=rootPath%>/images/scoreEmpty.png");
            $("#star5").attr("src", "..<%=rootPath%>/images/scoreEmpty.png");
            score = 3;
            $("#score").val(score);
        });
        $("#star4").click(function() {
            $("#star1").attr("src", "..<%=rootPath%>/images/scoreFull.png");
            $("#star2").attr("src", "..<%=rootPath%>/images/scoreFull.png");
            $("#star3").attr("src", "..<%=rootPath%>/images/scoreFull.png");
            $("#star4").attr("src", "..<%=rootPath%>/images/scoreFull.png");
            $("#star5").attr("src", "..<%=rootPath%>/images/scoreEmpty.png");
            score = 4;
            $("#score").val(score);
        });
        $("#star5").click(function() {

            $("#star1").attr("src", "..<%=rootPath%>/images/scoreFull.png");
            $("#star2").attr("src", "..<%=rootPath%>/images/scoreFull.png");
            $("#star3").attr("src", "..<%=rootPath%>/images/scoreFull.png");
            $("#star4").attr("src", "..<%=rootPath%>/images/scoreFull.png");
            $("#star5").attr("src", "..<%=rootPath%>/images/scoreFull.png");
            score = 5;
            $("#score").val(score);
        });

    });



    // 파일 업로드 이미지 미리보기

    $(function() {
        $("#onefile").on('change', function() {
            readURL(this);
            $(".PP").remove();
        });
    });

    function readURL(input) {

        $("#imgone-div").html(
            '<img id="oneblah" src="#" width="100%" height="100%"/>');
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {

                $('#oneblah').attr('src', e.target.result);
            };

            reader.readAsDataURL(input.files[0]);
        };

    };

    function closeSelf(){

        var formData = new FormData();

        formData.append("title", $("input[name=title]").val());
        formData.append("content", $("input[name=content]").val());
        formData.append("score", $("input[name=score]").val());
        if($("#onefile")==null){
            formData.append("DEL_SEQ", $("input[name=DEL_SEQ]").val());
            formData.append("REV_SEQ", $("input[name=REV_SEQ]").val());

        }else{
            formData.append("onefile", $("input[name=onefile]")[0].files[0]);
            formData.append("DEL_SEQ", $("input[name=DEL_SEQ]").val());
            formData.append("REV_SEQ", $("input[name=REV_SEQ]").val());
        }

        $.ajax({
            type : "POST",
            url : "reviewUpdate.mib",
            async : true,
            dataType : "html",
            data : formData,
            processData: false,
            contentType: false,
            success : function(data) {
                var flag = $.parseJSON(data);

                if(flag.result=='OK'){
                    alert("수정되었습니다");
                    window.close();

                }else if(flag.result=='NO'){
                    alert("리뷰등록실패");
                }
            },
            complete : function(data) {
            },
            error : function(xhr, status, error) {
                alert("사진, 평점, 제목, 내용을 빠짐없이 채워주세요");
            }
        });

	}
		
    $(document).ready(function() {
		$("#admup").click(function() {
			var REV_TITLE = $('#review_title').val();
			var REV_CONTENT = $('#review_content').val();
			var REV_SEQ = <%=detailDto.getREV_SEQ() %>;
			var PRO_SEQ = <%=detailDto.getPRO_SEQ() %>;
			
			
				$.ajax({
		 			type : "POST",
		 			url : "reviewadmup.mib",
		 			async : true,
		 			dataType : "html",
		 			data : {
		 				"REV_TITLE" : REV_TITLE,
		 				"REV_CONTENT" : REV_CONTENT,
		 				"REV_SEQ" : REV_SEQ,
		 				"PRO_SEQ" : PRO_SEQ
		 			},
		 			success : function(data) {
		 				var flag = $.parseJSON(data);
		 				//console.log(flag);
		 				if(flag>0){
		 					alert("수정되었습니다");
		 					window.close();
		 				}else{
		 					alert("리뷰수정실패");
		 				}
		 			},
		 			complete : function(data) {
		 			},
		 			error : function(xhr, status, error) {
		 				alert("에러발생");
		 			}
		 		});
			
		});
	});
    
	</script>
</body>
</html>