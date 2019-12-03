<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <link rel="stylesheet" href="resources/css/student_eval.css">
    <title>학사관리시스템</title>
</head>
<body>
    <jsp:include page="student_nav.jsp"/>
    <form action="student_evaluation" method="POST">
	    <section id="test-wrap">
	        <h2 style="margin-bottom: 20px">강의 평가</h2>
	        <div class="eval_title1">
	            <ul>
	                <li>년도 <input type="text" class="input-field1" value="${thisYear}" disabled></li>
	                <li>학기 <input type="text" class="input-field1" value="${thisSemester}" disabled></li>
	                <li>성명 <input type="text" class="input-field1" value="${sinfo.getS_name()}" disabled></li>
	                <li><input type="button" id="search" value="조&nbsp;회"></li>
	            </ul>
	        </div>
	        <div class="clear"></div>
	        <div class="eval_content1">
	            <ul class="eval_content1_1">
	                <li>
	                    <ul>
	                        <li>교과코드</li>
	                        <li>교과명</li>
	                        <li>이수구분</li>
	                        <li>학점</li>
	                        <li>담당교수</li>
	                        <li>수업평가</li>
	                    </ul>
	                </li>
	            </ul>
	        </div>
	        <div class="clear"></div>
	        <div id="change2-content">
	            <ul class="eval_content1_2">
	                <li>
	                	<c:forEach items="${eval}" var="e">
		                    <ul>
		                        <li>${e.c_id}</li>
		                        <li>${e.c_name}</li>
		                        <li>${e.c_major}</li>
		                        <li>${e.c_unit}</li>
		                        <li>${e.p_name}</li>
								<c:choose>
								    <c:when test="${empty e.e_avg_eval }">
    		                        	<li><input type="button" id="test" onclick="window.open('student_evaluationinput?s_id=${sinfo.getS_id()}&c_id=${e.c_id}','popup','width=1795,height=760,location=no,status=no,scrollbars=yes')" value="강의평가"></li>								        
								    </c:when>
								    <c:otherwise>
								    	<li><input type="button" id="test" onclick="window.open('student_evaluationinput?s_id=${sinfo.getS_id()}&c_id=${e.c_id}','popup','width=1795,height=760,location=no,status=no,scrollbars=yes')" value="평가완료" disabled></li>				
								    </c:otherwise>
								</c:choose>
		                    </ul>
		                </c:forEach>
	                </li>
	            </ul>
	        </div>
	    </section>
	</form>
</body>
<script src="resources/js/menu.js"></script>
<script src="resources/js/button.js"></script>
<!-- <script>
	function popup() {
		var url = "student_evaluationinput?s_id=${s.s_id}&c_id=${e.c_id}";
		console.log(url);
		var name = "popup";
		window.open(url, name,
					"width=1795,height=760,location=no,status=no,scrollbars=yes");
	}
  </script> -->
</html>