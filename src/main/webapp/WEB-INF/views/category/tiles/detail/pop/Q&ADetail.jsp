<%@page import="com.eagle.men_in_black.model.MainDto"%>
<%@ page import="com.eagle.men_in_black.model.UserMypageDto" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
       pageEncoding="UTF-8"%>
<%
   MainDto dto = (MainDto)request.getSession().getAttribute("LoginInfo");
   UserMypageDto qnaDto = (UserMypageDto)request.getAttribute("qnaDto");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="../../../../../css/Mib.css">
<title>:::Q&ADetail:::</title>
<style type="text/css">
.layout{
   width: 800px;
   height: 390px;
   position: relative;
   margin-top: 10px;
   margin-left: 10px;
}
.thumbnail{
   width: 100%;
   height: 100%;
   text-align: center;
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

<div class="layout">
   <div class="thumbnail">
      <div align="center" style="height: 15%;">
         <h3>Q&A</h3>
      </div>
      <div align="center" style="height: 10%; width: 100%;">
         <div style="float: left; width: 50%; height: 100%;" align="left">
            <p style="margin-left: 30px;">
            공개설정 : 
            <select name=secret size=1 disabled="disabled">
                 <option value="" selected="selected"><%=qnaDto.getQNA_OPEN()%></option>
                 <option value="공개">공개</option>
                 <option value="비공개">비공개</option>
             </select>
             </p>
         </div>
         <div style="float: right; width: 50%; height: 100%;" align="left">
            <p style="margin-left: 30px;">
            문의설정 : 
            <select name=secret size=1 disabled="disabled">
                 <option value="" selected="selected"><%=qnaDto.getQNA_TYPE()%></option>
                 <option value="배송문의">배송문의</option>
                 <option value="상품/교환/환불문의">상품/교환/환불문의</option>
             </select>
             </p>
         </div>
      </div>
      <div style="height: 10%; width: 100%;">
         <div style="height: 100%; width: 50%; float: left;">
            <p align="left" style="margin-left: 30px;">
               작성자 : <input style="margin-left: 14px" type="text" value="<%=qnaDto.getUSER_ID()%>" readonly="readonly">
            </p>
         </div>
         <div style="height: 100%; width: 50%; float: right;">
            <p align="left" style="margin-left: 30px;">
               작성일 : <input style="margin-left: 14px" type="text" value="<%=qnaDto.getQNA_TIME()%>" readonly="readonly">
            </p>
         </div>
      </div>
      <div style="height: 10%; width: 100%;">
         <p align="left" style="margin-left: 30px;">
            제목 : <input style="margin-left: 28px" type="text" value="<%=qnaDto.getQNA_TITLE()%>" readonly="readonly">
               <input type="hidden" id="QNA_SEQ" name="QNA_SEQ" value="<%=qnaDto.getQNA_SEQ()%>" >
         </p>
      </div>
      <div style="height: 35%; width: 100%;">
         <p><h5 align="left" style="margin-left: 30px;">내용</h5></p>
         <textarea rows="5px" cols="100px" readonly="readonly"><%=qnaDto.getQNA_CONTENT()%></textarea>
      </div>
      <%if(dto!=null && dto.getUSER_ID().equals(qnaDto.getUSER_ID())){ %>
      <div class="btn" align="center" style="height: 10%; width:100%;">
         <div style="float: left; width: 50%;">
            <button style="width: 50%; height: 100%;" class="btn btn-default" onclick="update(<%=qnaDto.getQNA_SEQ()%>)">수정하기</button>
         </div>
         <div style="float: right; width: 50%;">
            <button style="width: 50%; height: 100%;" class="btn btn-default" onclick="del(<%=qnaDto.getQNA_SEQ()%>)">삭제하기</button>
         </div>
      </div>
      
      <%}else if(dto!=null && dto.getUSER_ID().equals("adm")){ %>
      
      <div align="center">
            <button style="width: 92%; height: 100%;"class="btn btn-default" onclick="rep(<%=qnaDto.getQNA_SEQ()%>)">답글달기</button>
         </div>
      <%} %>
      
   </div>
</div>
<script type="text/javascript">
function update(QNA_SEQ){
   location.href="qnaup.mib?QNA_SEQ="+QNA_SEQ,"pop","width=900 height=420 resizable=no location=no screenX=400 screenY=300 scrollbars=no";
   window.colse();
};
function rep(QNA_SEQ){
   location.href="qnarep.mib?QNA_SEQ="+QNA_SEQ,"pop","width=900 height=420 resizable=no location=no screenX=400 screenY=300 scrollbars=no";
   window.colse();
};

function del(QNA_SEQ) {
   var formData = new FormData();
    formData.append("QNA_SEQ",QNA_SEQ);
    $.ajax({
        type: "POST",
        url: "qnadelete.mib",
        async: true,
        data: formData,
        dataType: "html",
        processData: false,
        contentType: false,
        success: function (data) {
            var flag = $.parseJSON(data);

            if (flag.result == 'success') {
               opener.location.reload();
               alert("삭제되었습니다");
                window.close();
            } else {
                alert("error");
            }
        },
        complete: function (data) {
        },
        error: function (xhr, status, error) {
            alert("error");
        }
    });
}

function windowClose(){
   window.close();
}
</script>
</body>
</html>