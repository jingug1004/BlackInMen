<%--
  Created by IntelliJ IDEA.
  User: 35613
  Date: 2017-04-03
  Time: 오전 10:47
  To change this template use File | Settings | File Templates.
--%>

<%@page import="com.eagle.men_in_black.model.CeoMypageDto"%>
<%@page import="com.eagle.men_in_black.util.StringUtil"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.eagle.men_in_black.model.UserMypageDto" %>
<%@ page import="java.util.List" %>

<%
	List<CeoMypageDto> list = (List<CeoMypageDto>)request.getAttribute("list");
String DEL_SEQ = (String)request.getAttribute("DEL_SEQ");
	String rootPath = request.getContextPath();
%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="../../../../..<%=rootPath %>/css/Mib.css">

<script
        src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>


<h1 align="center">상품 교환&환불</h1>

<form>

    <div id="total" style="margin-top: 10px" align="center">
        <div id="table" style="width: 90%">
           <table class="table">
					<col width="8%">
					<col width="20%">
					<col width="15%">
					<col width="20%">
					<col width="20%">
					<col width="20%">
					<tr>
					<th style="border: 0;"></th>
				<th colspan="1" style="text-align: center;">쿠폰사용</th>
				<th colspan="1" style="text-align: center;">포인트사용</th>
				<th></th>
				<th colspan="1" style="text-align: center;">결제금액</th>
				<th style="border: 0;"></th>
				</tr>
				<tr>
				<th style="border: 0;"></th>
				<td colspan="1" style="text-align: center;"><%=list.get(0).getPOINT() %></td>
				<td colspan="1" style="text-align: center;"><%=list.get(0).getCOUPON() %></td>
				<td></td>
				<td colspan="1" style="text-align: center;"><%=list.get(0).getFINAL_PRICE() %></td>
				<th style="border: 0;"></th>
				</tr>
					<tr>
						<th>상품</th>
						<th>상품이름</th>
						<th>구매사이즈</th>
						<th>구매색상</th>
						<th>상품구매수량</th>
						<th>상품가격</th>
					</tr>

				<%
				
				if(list==null || list.size()==0){%>
				<tr>
					<td colspan="999999">내역이 없습니다.</td>
				</tr>
				</table>
				</form>
				</div>
				</div>
				<%}else{
				for(int i=0; i<list.size(); i++){ 
					
				%>
					<tr>
						<td><img alt="not found" src="..<%=rootPath %>/images/<%=list.get(i).getSTORED_NAME() %>"
							style="width: 100px; height: 100px"></td>
						
						<td><%=list.get(i).getPRO_NAME() %></td>
						<td><%=list.get(i).getSEL_SIZE() %></td>
						<td><%=list.get(i).getSEL_COLOR() %></td>
						<td><%=list.get(i).getSEL_NUM() %></td>
						<td><%=list.get(i).getPRO_PRICE() %></td>
					</tr>
				<%}
				}
				%>	
				
				</table>

        </div>
    </div>
    <hr style="border: solid black 1px;">
        
    <p align="center">    
    <select class='form-control' id="sel" onchange="selectForm(this.value);" style="width: 100px">
        
        <option value="반품">반품</option>
        <option value="교환">교환</option>
       
    </select>
    </p>
    <br>

    <div id="inputBox" align="center">


    </div>
<center>
    <input class="btn btn-default" type="button" value="확정" onclick="closeSelf()" style="margin-left: 2px" style="display: inline-block">
    <input class="btn btn-default" type="button" value="돌아가기" onclick="window.close()" style="display: inline-block">
    <input type="hidden" name="DEL_SEQ" value=<%=DEL_SEQ %>> 
    <input type="hidden" name="commend" value="">
</center>

</form>


<script type="text/javascript">

    $(document).ready(function () {
        selectForm($("#sel option:first").val());
    });


    function selectForm(commend) {
        var strInput = "";
        inputBox.innerHTML = "";

        if (commend == '교환') {
            strInput = "<div style='float: left; width: 48%;margin-left: 1%'>교환받을 옵션<textarea class='form-control' id ='RE_OPTION'  name='RE_OPTION' rows='10'></textarea></div>" +
                "<div style='float: left; width: 48%; margin-left: 1%'>교환 사유<textarea class='form-control' value='' name='RE_REASON'  id ='RE_REASON' rows='10'></textarea></div>";

        } else if (commend == '반품') {
            strInput = "<div><label>반품 사유<textarea class='form-control' id ='RE_REASON' name='RE_REASON' value='' rows='10' style='resize: none; wrap:hard;'></textarea> " +
                "<label>은행<select name='bank' id='bank' class='form-control' onclick='errorre()''>" +
                "<option value='' onclick='errorre()'>-선택-</option>" +
                "<option value='SC제일은행'>SC제일은행</option>" +
                "<option value='경남은행'>경남은행</option>" +
                "<option value='광주은행'>광주은행</option>" +
                "<option value='국민은행'>국민은행</option>" +
                "<option value='기업은행'>기업은행</option>" +
                "<option value='농협중앙회'>농협중앙회</option>" +
                "<option value='농협회원조합'>농협회원조합</option>" +
                "<option value='산업은행'>산업은행</option>" +
                "<option value='신한은행'>신한은행</option>" +
                "<option value='외환은행'>외환은행</option>" +
                "<option value='우리은행'>우리은행</option>" +
                "<option value='우리투자증권'>우리투자증권</option>" +
                "<option value='우체국'>우체국</option>" +
                "</select></label>" +
                "<label>환불 계좌<input class='form-control' name='CA_ACCOUNT' id='CA_ACCOUNT' type='text' onkeypress='onlyNumber()' onclick='error()'/></label></label></div>";


        } 
        document.getElementsByName('commend').value = commend;
        inputBox.innerHTML = strInput;
    }

    
    
    function error() {
		var bank = $("#bank").find(":selected").val();
		if (bank == '' || bank == null) {
			alert("환불받을 은행을 선택해주세요 ");
			return;
			};
		};
		

    function closeSelf() {
        var formData = new FormData();
        var commend = document.getElementsByName('commend').value;
        var RE_REASON = $("#RE_REASON").val();


        if ('교환' == commend) {
            formData.append("RE_REASON", $("textarea[name=RE_REASON]").val());
            formData.append("RE_OPTION", $("textarea[name=RE_OPTION]").val());
            if($("#RE_OPTION").val().trim() == '' || $("#RE_OPTION").val().trim() == null) {
    			alert("환불 할 옷의 옵션을 입력하여주세요 ");
    			return;
    		}else if($("#RE_REASON").val().trim() == '' || $("#RE_REASON").val().trim() == null) {
    			alert("사유를 작성해주세요 ");
    			return;
    			
    		}

        } else if ('반품' == commend) {
            formData.append("RE_REASON", $("textarea[name=RE_REASON]").val());
            formData.append("CA_ACCOUNT", $("select[name=bank]").val() + " " + $("input[name=CA_ACCOUNT]").val());
			
            if($("#RE_REASON").val().trim() == '' || $("#RE_REASON").val().trim() == null) {
    			alert("사유를 작성해주세요 ");
    			return;
    			
    		}else if($("#CA_ACCOUNT").val().trim() == '' || $("#CA_ACCOUNT").val().trim() == null) {
    			alert("환불계좌를 입력하여주세요 ");
    			return;
    		}
        } 
        formData.append("DEL_SEQ", $("input[name=DEL_SEQ]").val());
        formData.append("commend", document.getElementsByName('commend').value);


        $.ajax({
            type: "POST",
            url: "cancel.mib",
            async: true,
            data: formData,
            dataType: "html",
            processData: false,
            contentType: false,
            success: function (data) {
                var flag = $.parseJSON(data);
                if (flag.result == 'success') {
                    alert("반영되었습니다");
                    opener.parent.location.reload();
                    window.close();
                } else {
                    alert("시스템 오류 잠시후 다시 시도해주세요 ");
                }
            },
            complete: function (data) {
            },
            error: function (xhr, status, error) {
                alert("error");
            }
        });

    }
    function onlyNumber(){
        if((event.keyCode<48)||(event.keyCode>57))event.returnValue=false;
    }
    
</script>


