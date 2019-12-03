<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
<link rel="stylesheet" href="resources/css/write.css">
<title>학사관리시스템</title>
</head>
<style>
	#plan_save{
		display: none;
	}
</style>
<body>
<jsp:include page="professor_nav.jsp" />
	<section id="lpTopTable">
		<form action="lec_write" method="post" id="lec">
		    <table class="type05">
		        <tr>
		            <th scope="row" colspan="5">[강의 계획서] * 표는 반드시 기입할 사항입니다.
					<c:choose>
						<c:when test="${lec_list.getLec_no() == lec_no}">
							<input type="hidden" name="lec_type" value="true">
							<input type="button" id="plan_modify" value="수정">
						</c:when>
						<c:otherwise>
							<input type="hidden" name="lec_type" value="false">
							<input type="button" id="plan_write" value="입력">
						</c:otherwise>
					</c:choose>
					<input type="button" id="plan_save" value="저장"></th>            
		        </tr>
		        <tr>
		        	<th scope="row" style="text-align: center;">과목명</th>
		            <td><input type="text" class="writetxt" size="40" value="${p.c_name}" disabled></td>
		            <th scope="row" style="text-align: center;">강의 교수</th>
		            <td><input type="text" class="writetxt" size="40" value="${pinfo.getP_name()}" disabled></td>
		        </tr>
		        <tr>
		        	<th scope="row" style="text-align: center;">학기</th>
		            <td><input type="text" class="writetxt" size="40" value="${p.t_year}년 ${p.t_semester}학기" disabled></td>
		            <th scope="row" style="text-align: center;">수업일시</th>
		            <td><input type="text" class="writetxt" size="40" value="${p.t_day}${p.t_time}" disabled></td>
		        </tr>
		        <tr>
		        	<th scope="row" style="text-align: center;">강의실</th>
		            <td><input type="text" class="writetxt" size="40" value="${p.t_room}" disabled></td>
		            <th scope="row" style="text-align: center;">전공구분</th>
		            <td><input type="text" class="writetxt" size="40" value="${p.c_major}" disabled></td>
		        </tr>
		        <tr>
		        	<th scope="row" style="text-align: center;">학점/이수기간</th>
		            <td><input type="text" class="writetxt" size="10" value="${p.c_unit}" disabled>학점&nbsp;&nbsp;/<input type="text" class="writetxt" size="10" placeholder="15" disabled>주</td>
		            <th scope="row" style="text-align: center;">정원</th>
		            <td><input type="text" class="writetxt" size="10" value="${p.t_max}" disabled>명</td>
		        </tr>
		    </table>
		    <table class="type05">
		        <tr>
		            <th scope="row" style="text-align: center;  padding: 450px 0px;">강의계획</th>
		            <td>
		                <table id="plan_content">
		                    <tr>
		                        <td class="plan_title">1주차</td>
		                        <td><input type="text" class="writetxt week" name="lec_week1" value="${lec_list.lec_week1}" size = "105"></td>
		                    </tr>
		                    <tr>
		                        <td class="plan_title">2주차</td>
		                        <td><input type="text" class="writetxt week" name="lec_week2" value="${lec_list.lec_week2}" size = "105"></td>
		                    </tr>
		                    <tr>
		                        <td class="plan_title">3주차</td>
		                        <td><input type="text" class="writetxt week" name="lec_week3" value="${lec_list.lec_week3}" size = "105"></td>
		                    </tr>
		                    <tr>
		                        <td class="plan_title">4주차</td>
		                        <td><input type="text" class="writetxt week" name="lec_week4" value="${lec_list.lec_week4}" size = "105"></td>
		                    </tr>
		                    <tr>
		                        <td class="plan_title">5주차</td>
		                        <td><input type="text" class="writetxt week" name="lec_week5" value="${lec_list.lec_week5}" size = "105"></td>
		                    </tr>
		                    <tr>
		                        <td class="plan_title">6주차</td>
		                        <td><input type="text" class="writetxt week" name="lec_week6" value="${lec_list.lec_week6}" size = "105"></td>
		                    </tr>
		                    <tr>
		                        <td class="plan_title">7주차</td>
		                        <td><input type="text" class="writetxt week" name="lec_week7" value="${lec_list.lec_week7}" size = "105"></td>
		                    </tr>
		                    <tr>
		                        <td class="plan_title">8주차</td>
		                        <td><input type="text" class="writetxt week" name="lec_week8" value="${lec_list.lec_week8}" size = "105"></td>
		                    </tr>
		                    <tr>
		                        <td class="plan_title">9주차</td>
		                        <td><input type="text" class="writetxt week" name="lec_week9" value="${lec_list.lec_week9}" size = "105"></td>
		                    </tr>
		                    <tr>
		                        <td class="plan_title">10주차</td>
		                        <td><input type="text" class="writetxt week" name="lec_week10" value="${lec_list.lec_week10}" size = "105"></td>
		                    </tr>
		                    <tr>
		                        <td class="plan_title">11주차</td>
		                        <td><input type="text" class="writetxt week" name="lec_week11" value="${lec_list.lec_week11}" size = "105"></td>
		                    </tr>
		                    <tr>
		                        <td class="plan_title">12주차</td>
		                        <td><input type="text" class="writetxt week" name="lec_week12" value="${lec_list.lec_week12}" size = "105"></td>
		                    </tr>
		                    <tr>
		                        <td class="plan_title">13주차</td>
		                        <td><input type="text" class="writetxt week" name="lec_week13" value="${lec_list.lec_week13}" size = "105"></td>
		                    </tr>
		                    <tr>
		                        <td class="plan_title">14주차</td>
		                        <td><input type="text" class="writetxt week" name="lec_week14" value="${lec_list.lec_week14}" size = "105"></td>
		                    </tr>
		                    <tr>
		                        <td class="plan_title">15주차</td>
		                        <td><input type="text" class="writetxt week" name="lec_week15" value="${lec_list.lec_week15}" size = "105"></td>
		                    </tr>
		                </table>
		            </td>
		        </tr>
		        <tr>
		            <th scope="row" style="text-align: center;">수료기준</th>
		            <td style="color: red">총점 60점 이상시 수료(진도 80%미만일 경우 수료 불가)</td>
		        </tr>
		        <tr>
		            <th scope="row" style="text-align: center;  padding: 50px 0px;">성적분포</th>
		            <td>
		                <table>
		                    <tr>
		                        <td class="lecture_title">중간고사</td>
		                        <td class="lecture_title">기말고사</td>
		                        <td class="lecture_title">과제물</td>
		                        <td class="lecture_title">수업활동(발표)</td>
		                        <td class="lecture_title">출석</td>
		                        <td class="lecture_title">합계</td>
		                    </tr>
		                    <tr>
		                        <td class="lecturetxt01"><input type="text" class="lecturetxt  week" name="lec_mid" value="${lec_list.lec_mid}" style="text-align: center"></td>
		                        <td class="lecturetxt01"><input type="text" class="lecturetxt week" name="lec_final" value="${lec_list.lec_final}" style="text-align: center"></td>
		                        <td class="lecturetxt01"><input type="text" class="lecturetxt week" name="lec_homework" value="${lec_list.lec_homework}" style="text-align: center"></td>
		                        <td class="lecturetxt01"><input type="text" class="lecturetxt week" name="lec_active" value="${lec_list.lec_active}" style="text-align: center"></td>
		                        <td class="lecturetxt01"><input type="text" class="lecturetxt week" name="lec_attendance" value="${lec_list.lec_attendance}" style="text-align: center"></td>
		                        <td class="lecturetxt01"><input type="text" class="lecturetxt week" placeholder="100" style="text-align: center" disabled></td>
		                    </tr>
		                </table>
		            </td>
		        </tr>
		        <tr>
		            <th scope="row" style="text-align: center;  padding: 50px 0px;">평가기간</th>
		            <td><label>중간고사 : </label>
		                <input type="text" id="mid_fromdate" class="mid_datepicker  week" name="lec_middate" value="${lec_list.lec_middate}" placeholder="날짜를 선택해주세요" readonly="true">
		                <i class="far fa-calendar-alt"></i>&nbsp;&nbsp;-
		                <input type="text" id="mid_todate" class="mid_datepicker week" name="lec_middatefrom" value="${lec_list.lec_middatefrom}" placeholder="날짜를 선택해주세요" readonly="true">
		                <i class="far fa-calendar-alt"></i>
		            <br><label>기말고사 : </label>
		                <input type="text" id="final_fromdate" class="final_datepicker week" name="lec_finaldate" value="${lec_list.lec_finaldate}" placeholder="날짜를 선택해주세요" readonly="true">
		                <i class="far fa-calendar-alt"></i>&nbsp;&nbsp;-
		                <input type="text" id="final_todate" class="final_datepicker week" name="lec_finaldatefrom" value="${lec_list.lec_finaldatefrom}" placeholder="날짜를 선택해주세요" readonly="true">
		                <i class="far fa-calendar-alt"></i>
		        </tr>
		        <tr>
		            <th scope="row" style="text-align: center;">교재</th>
		            <td><input type="text" class="writetxt" name="lec_book" value="${lec_list.lec_book}" size = "70"></td>
		        </tr>   
		    </table>
		    <div id="dvDlg1" style="display: none">
	            <label id="lblMsg1"></label>
	        </div>
		</form>
	</section>
</body>
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
	$(document)
	.ready(function(){
		$(".week").attr("disabled",true);
		var i = "${lec_no}";
		console.log("lec_no["+ i +"]");
	})
	.on("click","#plan_save",function(){
		$("#lec").submit();
	})
	.on("click","#plan_write,#plan_modify",function(){
		$(".week").attr("disabled",false);
		$(this).css("display","none");
		$("#plan_save").css("display","block");
	})
</script>
<script src="resources/js/lectureplan.js"></script>
</html>