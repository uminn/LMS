<%@page import="java.util.*,java.text.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="resources/css/write.css">
<title>학사관리시스템</title>
<style>
	.forDel input[type='button']{border-radius:0;height:25px;width:40px;}
</style>
</head>
<body>
	<%
		Date date = new Date();
		SimpleDateFormat simpleDate= new SimpleDateFormat("yyyy-MM-dd");
		String strdate = simpleDate.format(date);
	%>
	<jsp:include page="admin_nav.jsp"/>
	<div id="wrap" align="center">
		<header id="board-container">
            <div class="container"></div>
        </header>
		<form action="modify?bno=${modify.bno}&pageNum=1" method="post" enctype="multipart/form-data">
			<table class="type05">
            	<tr>
                	<th scope="row" colspan="5">[게시글 등록] * 표는 반드시 기입할 사항입니다. </th>
                </tr>
                <tr>
                	<th scope="row" style="text-align: center;">작성자</th>
                    <td><input type="text" class="writetxt" name="bname" size="10" value="${modify.bname}"></td>
                    <th scope="row" style="text-align: center;">작성 날짜</th>
                    <td><%=strdate%></td>
                </tr>
                <tr>
                	<th scope="row" style="text-align: center;">제목</th>
                    <td colspan="5"><input type="text" class="writetxt" id='btitle' name="btitle" size = "70" value="${modify.btitle}"> * 필수</td>
                </tr>
                <tr>
                	<th scope="row" style="text-align: center;">첨부파일</th>
                    <td colspan="100" class='forDel'>
                    *한번 삭제한 파일은 복구하실 수 없습니다.<br>
	                    <c:choose>
		                    <c:when test="${fileCount == 0}">
		                    </c:when>
		                    <c:otherwise>
		                    	<c:forEach var="file" items="${modifyPath}" varStatus="status" step="1">
		                    		<a class="del${rownum[status.index]}" href="<c:url value="filedownload?fileDir=${file}&bno=${modify.bno}"/>">
		                    		${modifyFilenameLoad[status.index]}</a><input type="button" value="삭제" id="forDel${rownum[status.index]}"><br>
		                    	</c:forEach>
	                    	</c:otherwise>
	                    </c:choose>
                    	<input type="file" multiple="multiple" name="bfile">
                    </td>
                    
                </tr>
                <tr>
                	<th scope="row" style="text-align: center;  padding: 100px 0px;">내용</th>
                    <td colspan="5"><textarea id="bcontent" cols="130" rows="15" name="bcontent" placeholder="내용 500자 이내로 작성해주세요!!" style="resize:none">${modify.bcontent}</textarea>
                    <span style="color: #aaa;" id="counter">(0 / 최대 500자)</span></td>
                </tr>
            </table>
            <div id="dvDlg1" style="display: none">
                <label id="lblMsg1"></label>
            </div>
			<input type="submit" value="글 저장하기" id='saveBtn'>
			&nbsp;&nbsp;
			<input type="reset" value="다시 작성하기">
			&nbsp;&nbsp;
			<input type="button" id="listBtn" value="목록" onclick="location.href='numberPaging?pageNum=1'">
		</form>
	</div>
</body>


<script type="text/javascript">
	<!-- 파일 삭제 스크립트 -->
	<c:forEach var="rownum" items="${rownum}" varStatus="status">
		$('#forDel${rownum}').click(function(){
			var obj={};
			var rownums=${rownum};
			obj['rownum']=rownums;
			obj['bno']=${modify.bno}
			//클릭 후 AJAX 먼저 실행
			$.get('deleteFile',obj,function(txt){
				
			})
			//AJAX로 값을 넘겨받아 와서 삭제한 파일 화면에서 지우기.
			$('.del${rownum}').css('display','none');
			$('#forDel${rownum}').css('display','none');
		});
	</c:forEach>
	
$(document)
.ready(function() {
    $('#dvDlg1').dialog({
        autoOpen : false, //true로 하면 대화상자가 자동으로 열리는 속성 이 메소드가 호출 false될 때까지 대화 상자는 숨겨진 상태로 유지됨
        closeText : '다이얼로그를 닫습니다.',
        buttons : [ {
            text : 'OK',
            icon : 'ui-icon-heart',
            click : function() {
                $(this).dialog('close');
            }
        } ],
        title : 'Warning', //제목 설정하는 것
        closeOnEscape : false, //esc키 막는 것
        draggable : false, //드래그 못하게 하는 것
        height : 200,
        width : 450, //높이와 너비를 지정해주는 것
        resizable : true  //사이즈 조절 가능 여부
    });
var content = $('#bcontent').val();
$('#counter').html("(" + content.length + "/ 최대 200자)"); //글자수 실시간 카운팅
})
.on('keyup','#bcontent',function() {
    var content = $(this).val();
    $('#counter').html("(" + content.length + "/ 최대 200자)"); //글자수 실시간 카운팅
    if (content.length > 200) 
    {
        msg("최대 200자까지 입력 가능합니다.");
        $(this).val(content.substring(0, 200));
        $('#counter').html("(200 / 최대 200자)");
    }
    $('#l_content').html("&nbsp;&nbsp;&nbsp;&nbsp;<i class='fas fa-check-circle' style='color: green; font-size: 20px;'></i>");
})
.on('click','#saveBtn',function(){
	if($('#btitle').val()==''){
		alert('빈칸을 채우세요');
		return false;
	}else 
	if( $('#bcontent').val()==''){
		alert('빈칸을 채우세요');
		return false;
	}
	
});
function msg(text) {
    $('#lblMsg1').html("&nbsp;&nbsp;&nbsp;&nbsp;<i class='fas fa-times-circle' style='color: red; font-size: 15px;'></i>"+ text);
    $('#dvDlg1').dialog('open');
};
var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i < 2; i++) {
    acc[i].addEventListener("click", function() {
        this.classList.toggle("active");
        var panel = this.nextElementSibling;
        if (panel.style.maxHeight){
            panel.style.maxHeight = null;
        } else {
            panel.style.maxHeight = panel.scrollHeight + "px";
        } ;
    });
};
</script>
</html>