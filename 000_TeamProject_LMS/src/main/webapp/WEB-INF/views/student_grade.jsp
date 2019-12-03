<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String s_id = (String) session.getAttribute("s_id");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<link rel="stylesheet" href="resources/css/student_grade.css">
<title>학사관리시스템</title>
<style>
#sinfo {
	padding: 10px;
	width: 800px;
	border: 1px solid black;
	background-color: #ddd;
}
</style>
</head>
<body>
	<jsp:include page="student_nav.jsp" />
	<form action="student_grade" method="GET">
		<div class="clear"></div>
		<section id="grade-wrap">
			<div id="grade-wrap-content">
				<h2>|학기별 성적조회</h2>
				<div class="clear"></div>
				<div class="grade_content1">
					<ul class="grade_content1_1">
						<li>
							<ul>
								<li>년도</li>
								<li>개설학기</li>
								<li>개설학과</li>
								<li>교과코드</li>
								<li>교과목명</li>
								<li>실점</li>
								<li>등급</li>
								<li>학점</li>
							</ul>
						</li>
					</ul>
				</div>
				<div class="clear"></div>
				<div id="change3-content">
					<ul class="grade_content1_2">
						<li><c:forEach items="${st}" var="board">
								<ul>
									<li id="e_year">${board.e_year}</li>
									<li id="e_semester">${board.e_semester}</li>
									<li id="c_name">${board.c_name}</li>
									<li id="c_id">${board.c_id}</li>
									<li id="c_major">${board.s_major}</li>
									<li id="c_score">${board.c_score}</li>
									<li id="c_alpha">${board.c_alpha}</li>
									<li id="c_rank">${board.c_rank}</li>

								</ul>
							</c:forEach></li>
					</ul>
				</div>
				<div class="clear"></div>
				<br>
				<h2>|전체 성적조회</h2>
				<div id="grade-wrap1">
					<canvas id="myChart"></canvas>
				</div>
			</div>
		</section>
		<script>
			$(document).ready(function() {
						var n = [];
						var name =[];
						<c:forEach items="${sum}" var='data'>
						n.push("${data.sumhap}");
						name.push("${data.c_name}");
						console.log(n);
						</c:forEach>
						var ctx = document.getElementById('myChart')
								.getContext('2d');
						var a = 2019
						var b = 1;
						ctx.canvas.width = 1000;
						ctx.canvas.height = 300;

						var mixedChart = new Chart(ctx, {
							type : 'bar',
							data : {
								datasets : [ {
									label : '나의 현재 점수 위치',
									// backgroundColor: 'rgb(255, 99, 132)',
									borderColor : 'rgb(255, 99, 132)',
									data : n,
									fill : false,
									// Changes this dataset to become a line
									type : 'line'
								}, {
									label : '학과평균',
									backgroundColor : '#C3E5E9',
									// borderColor: 'rgb(255, 99, 132)',
									data : n,
									width : 100
								} ],

								labels : name
							},
							options : {
								scales : {
									xAxes : [ {
										barPercentage : 0.4
									} ],
									yAxes : [ {
										ticks : {
											beginAtZero : true,
											min : 0,
											max : 100
										}
									} ]
								}
							}
						});
						// ctx.canvas.parentNode.style.width = '1000px';

					})
			var acc = document.getElementsByClassName("accordion");
			var i;

			for (i = 0; i < 2; i++) {
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
		<script src="resources/js/button.js"></script>
	</form>
</body>
</html>