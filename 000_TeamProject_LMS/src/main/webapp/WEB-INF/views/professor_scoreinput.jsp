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
<title>학사관리시스템</title>
</head>
<body>
	<c:set var="grade" value="${ps}"></c:set>
	<form action="p_scoreinput" method="GET">
		<section id="grade-insert">
			<h2 style="margin-bottom: 20px">성적입력</h2>
			<div class="eval_title1">
				<ul>
					<c:if test="${fn:length(grade) ==0}">
						<script>
							alert("폐강된 강의입니다.");
							history.go(-1);
						</script>
					</c:if>

					<c:if test="${fn:length(grade) ==1}">
						<c:forEach items="${ps}" var="borad" begin="0" end="1">
							<li>과목명 <input type="text" class="input-field1"
								value="${borad.c_name} " disabled></li>
							<li>과목코드 <input type="text" class="input-field1"
								value="${borad.c_id}" disabled></li>
							<li>학기 <input type="text" class="input-field1"
								value="${borad.e_semester}" disabled></li>
							<li><input type="button" id="search" value="조&nbsp;회" /></li>
						</c:forEach>
					</c:if>

					<c:if test="${fn:length(grade) > 1}">
						<c:forEach items="${ps}" var="borad" begin="1" end="1">
							<li>과목명 <input type="text" class="input-field1"
								value="${borad.c_name} " disabled></li>
							<li>과목코드 <input type="text" class="input-field1"
								value="${borad.c_id}" disabled></li>
							<li>학기 <input type="text" class="input-field1"
								value="${borad.e_semester}" disabled></li>
							<li><input type="button" id="search" value="조&nbsp;회" /></li>
						</c:forEach>
					</c:if>

				</ul>
			</div>

			<div class="clear"></div>
			<div class="pscore_content1">
				<ul class="pscore_content1_1">
					<li>
						<ul>
							<li>학번</li>
							<li>이름</li>
							<li>과목명</li>
							<li>학과명</li>
							<li>점수</li>
							<li>등급</li>
							<li>평점</li>
							<li></li>
						</ul>
					</li>
				</ul>
			</div>
			<div id="change4-content-1">

				<ul class="pscore_content1_2">
					<li><c:forEach items="${ps}" var="borad">
							<ul class="UL1">
								<li id="s_id">${borad.s_id}</li>
								<li id="s_name">${borad.s_name}</li>
								<li id="c_name">${borad.c_name}</li>
								<li id="s_major">${borad.s_major}</li>

								<li><input type="text" id="numtxt" name="s_num"
									class="sumtext" value="${borad.c_score}"></li>

								<!--실질 점수(85/100) 100점기준으로-->
								<li><input type="text" name="s_alpha" class="alphatxt"
									id="sumalpha" value="${borad.c_alpha}" readonly></li>
								<!--알파벳  -->
								<li><input type="text" name="s_hak" class="avgtxt"
									id="sumnum" value="${borad.c_rank}" readonly></li>
								<!--등급  -->

								<li><input type="button" id="insertBTN" class="insertBTN"
									value="성적입력" sid="${borad.s_id}" cid="${borad.c_id}">&nbsp;&nbsp;

									<input type="button" id="updateBTN" class="Update" value="수정"
									b_id="${borad.s_id}"></li>
								<!--stcmajor =전공  -->
						</ul>
						</c:forEach></li>
				</ul>

			</div>
		</section>
		<script>
			$(document).ready(
					function() {
						$(".sumtext").each(
								function(i) {
									var test = $(this).parent().parent();

									console.log(test.find('li:eq(4) .sumtext')
											.val());
									if ($(this).val() != null
											&& $(this).val() != "") {
										test.find('li:eq(4) #numtxt').attr(
												'disabled', true);
										test.find('li:eq(5) #sumalpha').attr(
												'disabled', true);
										test.find('li:eq(6) #sumnum').attr(
												'disabled', true);
										test.find('li:eq(7) #insertBTN').attr(
												'disabled', true);
										test.find('li:eq(7) #updateBTN').attr(
												'disabled', false);

									} else {
										test.find('li:eq(4) #numtxt').attr(
												'disabled', false);
										test.find('li:eq(5) #sumalpha').attr(
												'disabled', false);
										test.find('li:eq(6) #sumnum').attr(
												'disabled', false);
										test.find('li:eq(7) #insertBTN').attr(
												'disabled', false);
										test.find('li:eq(7) #updateBTN').attr(
												'disabled', true);
									}
								})
								
								
							      $('#dial2').dialog({
							          autoOpen:false,
							          buttons:[{
							            text: 'OK',
							            icon:"ui-icon-heart",
							            click: function(){
							              $(this).dialog("close");
							            }
							          }]
							        }); 
					})

			<c:forEach var= "items1"  items="${ps}">
			var s_sum = null;
			var a_lpha = null;
			var r_ank = 0.0;
			var s_id = null;
			var regExp = /^[0-9]+$/;

			$(document).on('blur', '.sumtext', function() {
				var ul = $(this).parent().parent(); //ul
				if ($(this).val() >= 95 && $(this).val() <= 100) {
					ul.find("li:eq(5) #sumalpha").val('A+');
					ul.find("li:eq(6) #sumnum").val('4.5');
				} else if ($(this).val() >= 90 && $(this).val() <= 94) {
					ul.find("li:eq(5) #sumalpha").val('A');
					ul.find("li:eq(6) #sumnum").val('4.0');
				} else if ($(this).val() >= 85 && $(this).val() <= 89) {
					ul.find("li:eq(5) #sumalpha").val('B+');
					ul.find("li:eq(6) #sumnum").val('3.5');
				} else if ($(this).val() >= 80 && $(this).val() <= 84) {
					ul.find("li:eq(5) #sumalpha").val('B');
					ul.find("li:eq(6) #sumnum").val('3.0');
				} else if ($(this).val() >= 75 && $(this).val() <= 79) {
					ul.find("li:eq(5) #sumalpha").val('C+');
					ul.find("li:eq(6) #sumnum").val('2.5');
				} else if ($(this).val() >= 70 && $(this).val() <= 74) {
					ul.find("li:eq(5) #sumalpha").val('C');
					ul.find("li:eq(6) #sumnum").val('2.0');
				} else if ($(this).val() >= 65 && $(this).val() <= 69) {
					ul.find("li:eq(5) #sumalpha").val('D+');
					ul.find("li:eq(6) #sumnum").val('1.5');
				} else if ($(this).val() >= 60 && $(this).val() <= 64) {
					ul.find("li:eq(5) #sumalpha").val('D');
					ul.find("li:eq(6) #sumnum").val('1.0');
				}
				else if($(this).val() >100){
                    $('#la2').text("100점을 넘을 수 없습니다.");
                    $('#dial2').dialog('open');
                    $(this).val(""); 
                    $(this).focus();
				}
				else if(!($(this).val()).match(/^[0-9]+$/)){
                    $('#la2').text("숫자만 입력해주세요");
                    $('#dial2').dialog('open');
                    $(this).val(""); 
                    $(this).focus();
	            }
				else {
					ul.find("li:eq(5) #sumalpha").val('F');
					ul.find("li:eq(6) #sumnum").val('0.0');
				}
				

				s_sum = $(this).val(); //100점
				a_lpha = ul.find("li:eq(5) #sumalpha").val(); // 알파벳
				r_ank = ul.find("li:eq(6) #sumnum").val(); //등급

			})

			</c:forEach>

			$(".insertBTN").click(function() {
				var test = $(this).parent().parent();
				var today = new Date();
				var nyear = today.getFullYear(); //년도
				var sid = $(this).attr("sid"); // 학번 //학기
				var cid = $(this).attr("cid"); //교과코드
				var ssum = s_sum; //점수
				var alpha = a_lpha; //등급
				var rank = r_ank;

				var oParam = {
					c_score : ssum,
					c_alpha : alpha,
					c_rank : rank,
					s_id : sid,
					c_id : cid
				}
				var dis = $(this);
				$.get('Update', oParam, function() {
					alert("성적입력 완료");
					test.find('li:eq(4) #numtxt').attr(
		                     'disabled', true);
		               test.find('li:eq(5) #sumalpha').attr(
		                     'disabled', true);
		               test.find('li:eq(6) #sumnum').attr(
		                     'disabled', true);
		               test.find('li:eq(7) #insertBTN').attr(
		                     'disabled', true);
		               test.find('li:eq(7) #updateBTN').attr(
		                     'disabled', false);
				}, 'text').fail(function() {
					alert("error");
				});

			})

			$('.Update').click(function() {
				var test = $(this).parent().parent();

				test.find('li:eq(4) #numtxt').attr('disabled', false);
				test.find('li:eq(5) #sumalpha').attr('disabled', false);
				test.find('li:eq(6) #sumnum').attr('disabled', false);
				test.find('li:eq(7) #insertBTN').attr('disabled', false);
				test.find('li:eq(7) #updateBTN').attr('disabled', true);
			})
			/* 			$(".Update").click(function() {
			 var s_id = $(this).attr("b_id");
			 var obj = {};
			 obj['c_score'] = c_score;
			 obj['c_alpha'] = c_alpha;
			 obj['s_id'] = s_id;
			 console.log("obj : " + obj['c_score']);
			 console.log("obj : " + obj['c_alpha']);
			 console.log("obj : " + obj['s_id']);
			 $.get('Update', obj, function(txt) {
			 alert("수정완료");
			 }, 'text').fail(function() {
			 alert("수정 실패");
			 });
			 })
			 */
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
		<script src="resources/js/button.js"></script>
	</form>
	   <div id="dial2" style="display: none">
    <label id="la2"></label>
</body>
</html>