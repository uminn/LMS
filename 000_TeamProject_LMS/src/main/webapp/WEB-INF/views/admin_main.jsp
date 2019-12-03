<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <link rel="stylesheet" href="resources/css/main_menu.css">
    <title>학사관리시스템</title>
</head>
<style>
#board-container{
    width: 1707px;
    height: 155px;
    background: #C9D1E8;
    /* position: fixed; */
}
.container {
    height: 100%;
    text-align: center;
}
.container:before {
    content: ""; 
    display: inline-block;
    width: 1px; 
    height: 100%;
    margin-right: 0; 
    vertical-align: bottom;
}
.box {
    display: inline-block; 
    vertical-align: middle;
    font-size: 50px;
}
#tblSS,#tblPS{
	text-align: center;
}
table#tblSS th,
table#tblPS th{
	border-bottom: 1px solid silver;
	border-right: 1px solid silver;
	width: 140px;
    height: 45px;
    background: #DFDEF8;
}
table#tblSS td,
table#tblPS td{
	border-bottom: 1px solid silver;
	border-right: 1px solid silver;
}
#studentStats,#professorStats{
	margin-left: 255px;
}
</style>
<%-- <%
	session.setAttribute("userI",request.getAttribute("userName"));
	session.setAttribute("userType","a");
%> --%>
<body>
  <jsp:include page="admin_nav.jsp"/>
  <section id="admin_main">
	  <header id="board-container">
	      <div class="container">
	          <div class="box">관리자 메인</div>
	      </div>
	  </header>
  <div id="studentStats">
	<table id="tblSS">
		<tr>
			<th>학과/학년</th>
			<th class="s1">1학년</th>
			<th class="s2">2학년</th>
			<th class="s3">3학년</th>
			<th class="s4">4학년</th>
			<th class="s5">5학년</th>
			<th class="s6">6학년</th>
			<th class="sum">합계</th>
		</tr>
	<c:forEach items="${possibleMajorStudent}" var="major">
		<tr id="${major}">
			<th>${major}</th>
			<td class='s1 ps1'></td>
			<td class='s2 ps2'></td>
			<td class='s3 ps3'></td>
			<td class='s4 ps4'></td>
			<td class='s5 ps5'></td>
			<td class='s6 ps6'></td>
			<td class='hsum phsum'></td>
		</tr>
	</c:forEach>
		<tr id='psum'>
			<th>합계</th>
			<td class='s1'></td>
			<td class='s2'></td>
			<td class='s3'></td>
			<td class='s4'></td>
			<td class='s5'></td>
			<td class='s6'></td>
			<td class='hsum'></td>
		</tr>
	</table>
  </div>
  <div id="professorStats">
  	<table id="tblPS">
		<tr><th>학과/학년</th><th class='p1'>정교수</th><th class='p2'>부교수</th><th class='p3'>조교수</th><th class='sum'>합계</th></tr>
	<c:forEach items="${possibleMajorProfessor}" var="major">
		<tr id="${major}"><th>${major}</th><td class='p1 pp1'></td><td class='p2 pp2'></td><td class='p3 pp3'></td><td class='hsum'></td></tr>
	</c:forEach>
		<tr id='psum'><th>합계</th><td class='p1'></td><td class='p2'></td><td class='p3'></td><td class='hsum'></td></tr>
	</table>
  </div>
  </section>
  <script src="resources/js/menu.js"></script>
</body>
<script>

$(document)
.ready(function(){
	//학생표 생성
	/* history.go(0); */
	console.log("admin main ready");
	//학생자료 채우기
	<c:forEach items="${StudentEachMajor}" var="s">
		console.log("전공별학생경로 : #tblSS #${s.s_major} .s${s.s_grade}");
		console.log("전공별학생수 : ${s.count}");
		$("#tblSS #${s.s_major} .s${s.s_grade}").text("${s.count}");
	</c:forEach> 
	
	

	//교수표 생성
	//교수자료 채우기
	<c:forEach items="${ProfessorEachMajor}" var="p">
		console.log("전공별교수경로 : #tblPS #${p.p_major} .p1");
		console.log("전공별교수수 : ${p.count}");
		$("#tblPS #${p.p_major} .p1").text("${p.count}");
	</c:forEach> 
	
	
	//세로합
	for(var i=1;i<=7;i++){
		var psum=0;
		$(".ps"+i).each(function(){
			var tmp=$(this).text();
			if(tmp!="" && tmp!=null){
				psum+=parseInt(tmp);
			}	
		})
		$("#tblSS #psum td").eq(i-1).text(psum);
	}
	console.log("학생합 끝 교수합시작전")
	for(var i=1;i<=3;i++){
		console.log("교수합 포문")
		var psum=0;
		$(".pp"+i).each(function(){
			var tmp=$(this).text();
			if(tmp!="" && tmp!=null){
				psum+=parseInt(tmp);
			}	
		})
		console.log("교수합 넣기전 "+psum);
		$("#tblPS #psum td").eq(i-1).text(psum);
	}
	
	//가로합
	console.log("each문 진입전");
	$(".hsum").each(function(){
		console.log("each문 시작");{
			
		}
		var hsum=0;
		for(var i=1;i<=6;i++){
			var tmp = $(this).siblings(".s"+i).text();
			console.log("tmp값"+tmp);
			if(tmp!="" && tmp!=null){
				hsum+=parseInt(tmp);
			}
		}
		for(var i=1;i<=3;i++){
			var tmp = $(this).siblings(".p"+i).text();
			console.log("tmp값"+tmp);
			if(tmp!="" && tmp!=null){
				hsum+=parseInt(tmp);
			}
		}
		console.log("hsum"+hsum);
		$(this).text(hsum);
	})
	
})
</script>
</html>