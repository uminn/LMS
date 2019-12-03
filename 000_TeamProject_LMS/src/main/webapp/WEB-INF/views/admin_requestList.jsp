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
	#requestList li{float:left;line-height:25px;width:145px;margin-top:30px;text-align:center;}
	#requestList li input[type='button']{border-radius:0;}
	#requestList li input[type='text']{border-radius:0;}
	#requestList li:nth-child(2){width:153px;}
	#requestList li:nth-child(3){width:170px;}
	#requestList li:nth-child(4){width:188px;}
	#requestList li:nth-child(5),#requestList li:nth-child(6),
	.pscore_content1_1 ul li:nth-child(5), .pscore_content1_1 ul li:nth-child(6){width:250px;}
	#requestList li:nth-child(7),.pscore_content1_1 ul li:nth-child(7){width:224px;}
	#requestList li:nth-child(5),#requestList li:nth-child(6),#requestList li:nth-child(7){margin-top:20px;}
	.pscore_content1_1 li ul li{width:145px;}
	#printList{height:80px;}
</style>
<title>학사관리시스템</title>
</head>
<body>
<jsp:include page="admin_nav.jsp" />
	<form action="p_studentInfomation" method="GET">
		<section id="grade-insert">
			<h2 style="margin-bottom: 20px">휴학요청 목록</h2>
			<div class="clear"></div>
			<div class="pscore_content1">
				<ul class="pscore_content1_1">
					<li>
						<ul>
							<li>이름</li>
							<li>학번</li>
							<li>학과명</li>
							<li>신청일</li>
							<li>신청기간</li>
							<li>신청사유</li>
							<li>승인여부</li>
						</ul>
					</li>
				</ul>
			</div>
			<div class="clear"></div>
			<div id="printList">
			<c:forEach var="requestList" items="${requestList}">
				<ul>
					<li>
						<ul id="requestList">
							<li>${requestList.s_name}</li>
							<li>${requestList.s_id}</li>
							<li>${requestList.s_major}</li>
							<li>${requestList.requestdate}</li>
							<c:choose>
							<c:when test="${requestList.progress == 1}">
								<li><input type="text" id="requestperiod" value="${requestList.requestperiod}"></li>
								<li><input type="text" id="requestreason" value="${requestList.requestreason}"></li>
								<li><input type="button" id="${requestList.s_id}" value="승인"></li>
							</c:when>
							<c:otherwise>
								<li><input type="text" id="requestperiod" value="${requestList.requestperiod}" disabled></li>
								<li><input type="text" id="requestreason" value="${requestList.requestreason}" disabled></li>
								<li><input type="button" value= "승인완료" disabled></li>
							</c:otherwise>
							</c:choose>
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
<script src="resources/js/menu.js"></script>
<script>
	<c:forEach var="requestList" items="${requestList}">
	$(function(){
		$('#${requestList.s_id}').click(function(){
			$('#${requestList.s_id}').val("승인완료");
			$(this).prop('disabled', true);
			$('#requestperiod').prop('disabled', true);
			$("#requestreason").prop('disabled', true);
			
			var obj = {};
			obj['id']='${requestList.s_id}'
			obj['period']=$('#requestperiod').val();
			obj['reason']=$('#requestreason').val();
			
			$.post('requestUpdate',obj,function(txt){
				console.log(txt);
			})
		});
		
	});
	</c:forEach>
</script>
</html>