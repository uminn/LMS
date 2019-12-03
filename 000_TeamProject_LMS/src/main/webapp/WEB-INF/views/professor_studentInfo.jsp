<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String p_id = (String) session.getAttribute("userID");
%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
<link rel="stylesheet" href="resources/css/pf_score.css">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="resources/js/jquery-ui.css">
<link rel="stylesheet" href="resources/css/pf_score.css">
<style>
	#pscore_content1{margin-bottom:10px;}
	#imageReader{width:145px;position:absolute;margin-top:-30px;}
	#studentlist li ul li{float:left;line-height:100px;width:145px;margin-left:20px;margin-top:40px;}
	.pscore_content1_1 li ul li:last-Child{width:250px;}
	#studentlist li ul{height:185px;}
</style>
<title>학사관리시스템</title>
</head>
<body>
<jsp:include page="professor_nav.jsp" />
	<form action="p_studentInfomation" method="GET">
		<section id="grade-insert">
			<h2 style="margin-bottom: 20px">학생정보</h2>
			<div class="eval_title1">
				<ul>
					
				</ul>
			</div>

			<div class="clear"></div>
			<div class="pscore_content1">
				<ul class="pscore_content1_1">
					<li>
						<ul>
							<li>사진</li>
							<li>학번</li>
							<li>이름</li>
							<li>학과명</li>
							<li>연락처</li>
							<li>E-mail</li>
						</ul>
					</li>
				</ul>
			</div>
			<div class="clear"></div>
			<div id="studentlist">
			<c:forEach var="studentList" items="${studentList}">
				<ul class="studentlist">
					<li>
						<ul>
							<li><img id="imageReader" src="resources/images/${studentList.s_filename}"></li>
							<li>${studentList.s_id}</li>
							<li>${studentList.s_name}</li>
							<li>${studentList.s_major}</li>
							<li>${studentList.s_phone}</li>
							<li>${studentList.s_email}</li>
						</ul>
					</li>
				</ul>
				<div class="clear"></div>
			</c:forEach>
			</div>
		</section>
		<script src="resources/js/button.js"></script>
	</form>
</body>
<script>
	/* console.log(p_id); */
</script>
<script>
	var acc = document.getElementsByClassName("accordion");
	var i;
	for (i = 0; i < acc.length; i++) {
		acc[i].addEventListener("click", function() {
			this.classList.toggle("active");
			var panel = this.nextElementSibling;
			if (panel.style.maxHeight) {
				panel.style.maxHeight = null;
			} else {
				panel.style.maxHeight = panel.scrollHeight + "px";
			}
		});
	}
</script>
</html>