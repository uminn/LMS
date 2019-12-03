<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="resources/css/jquery-ui.css">
    <link rel="stylesheet" href="resources/css/admin_schedule.css">
<title>학사관리시스템</title>
</head>
<body>
<%
/* Object ainfo = session.getAttribute("ainfo"); */ 
String userType = (String) session.getAttribute("userType"); 
if(userType.equals("s")){
	%>
	<jsp:include page="student_nav.jsp"/>
	<%
} else if(userType.equals("p")){
	%>
	<jsp:include page="professor_nav.jsp"/>
	<%	
} else if(userType.equals("a")){
	%>
	<jsp:include page="admin_nav.jsp"/>
	<%
}

%>

	<section>
        <header id="board-container">
            <div class="container">
                <div class="box"> 학사일정 </div>
            </div>
        </header>
        <div id="datepicker1"></div>
        <div id="wrap">
            <ul>
                <li>
                    <div id="schedule_main">
                        <div id="schedule_btn">
                        <%
                        	if(userType.equals("a")){
                    	%>		
                        		<button class='InsertBTN'>추가</button>
                        <%  }  %>
                        
                        </div>
                        <ul id='schedule_title'>
                            <li>
                                <ul>
                                    <li>날짜</li>
                                    <li>기간</li>
                                    <li>제목</li>
                                </ul>
                            </li>
                             <li>
                               <c:choose>
                                  <c:when test="${count == '0' }">
                                     <ul>
                                        <li style="width: 760px;"> 등록 된 일정이 없습니다. </li>
                                     </ul>
                                  </c:when>
                                  <c:otherwise>
                                     <c:forEach items="${schlist}" var="board" varStatus="status">
                                         <ul>
                                             <li><input type="text" class="fromdate1" name="sch_fromdate" class="datepicker2" value="${board.sch_fromdate}"readonly="true">&nbsp;&nbsp;-
                                                 <input type="text" class="todate1" name="sch_todate" class="datepicker2" value="${board.sch_todate}" readonly="true"></li>
                                             <li>${dday.get(status.index)} </li>
                                             <%
                                             if(userType.equals("s")){
												%>
												<li class='left'>${board.sch_content}</li>
												<%
											} else if(userType.equals("p")){
												%>
												<li class='left'>${board.sch_content}</li>
												<%	
											} else if(userType.equals("a")){
												%>
												<li class='left'><a href="#" class="modifysch" id="no${board.sch_no}">${board.sch_content}</a></li>
												<%
											}
                                             %>
                                             
                                         </ul>
                                     </c:forEach>
                                 </c:otherwise>
                             </c:choose>
                            </li>
                        </ul>
                    </div>
                </li>
            </ul>
        </div>
        <div id="wrap1">
            <form action="schinsert" method="post" id="sch">
                <div class="clear"></div>
                <table class="type05">
                    <tr>
                        <th scope="row" style="text-align: center;">작성자</th>
                        <td><input type="text" class="writetxt" value="${ainfo.getA_name()}" size="10" readonly></td>
                    </tr>
                    <tr>
                        <th scope="row" style="text-align: center;">일정 등록</th>
                        <td><input type="text" id="fromdate" name="sch_fromdate" class="datepicker2" readonly="true">&nbsp;&nbsp;-
                            <input type="text" id="todate" name="sch_todate" class="datepicker2" readonly="true"></td>
                    </tr>
                    <tr>
                        <th scope="row" style="text-align: center; ">일정 내용</th>
                        <td colspan="5">
                        	<input type="text" class="writetxt" id='sch_content' name="sch_content" size = "70">
                        	<input type="hidden" id="sch_no">
                        </td>
                    </tr>
                </table>
		        <table id="button_schedule">
		        	<tr>
		        		<td><input type="button" class="modifyBTN" value="수정하기"></td>
		            	<td><button class='saveBTN'>저장하기</button></td>
		                <td><button class="resetBTN">다시작성하기</button></td>
		            </tr>
		        </table>
            </form>
        </div>
    </section>
</body>
<script src="resources/js/date.js"></script>
<script src="resources/js/button.js"></script>
<script src="resources/js/menu.js"></script>
<script>
$(document)
.on("click",".InsertBTN",function(){
	$(".saveBTN").css("display","block");
    $(".modifyBTN").css("display","none");
})
.on("click",".modifysch",function(){
    $("#wrap").css("display","none");
    $("#wrap1").css("display","block");
    var sch_no= $(this).attr("id").substr(2);
    console.log(sch_no);
    var fromdate = $(this).parent().parent().find(".fromdate1").val();
    var todate = $(this).parent().parent().find(".todate1").val();
    var sch_content = $(this).text();
    console.log("글선택시 글번호/시작일/종료일/글내용 : "+ sch_no+"/"+fromdate+"/"+todate+"/"+sch_content);
    
	$("#fromdate").val(fromdate);
	$("#todate").val(todate);
	$("#sch_content").val(sch_content);
	$("#sch_no").val(sch_no);
    
	$(".saveBTN").css("display","none");
    $(".modifyBTN").css("display","block");

})
.on("click",".modifyBTN",function(){
	alert("수정버튼 클릭");
	var sch_no = $("#sch_no").val();
	var fromdate = $("#fromdate").val();
	var todate=$("#todate").val();
	var sch_content=$("#sch_content").val();
    console.log("변경버튼 글번호/시작일/종료일/글내용 : "+ sch_no+"/"+fromdate+"/"+todate+"/"+sch_content);

	var obj = {"sch_no" : sch_no,
			   "fromdate":fromdate,
			   "todate":todate,
			   "sch_content":sch_content};
	
	$.get("modifySchedule",obj,function(txt){
		alert("학사일정 수정 완료");
	},"text")
	.fail(function(){
		alert("학사일정 수정 실패");
	}).done(function(){
		location.href="/finalpjt/admin_schedule";
	});
})

</script>



</html>