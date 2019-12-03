<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	int nYear= (Integer) session.getAttribute("nYear");
	int month = (Integer) session.getAttribute("month");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<link rel="stylesheet" href="resources/css/student_main.css">
	<link rel="stylesheet" href="resources/css/student_timetable.css">
	<title>학사관리시스템</title>
</head>
<body>
<jsp:include page="student_nav.jsp"/> 
<section>
<div id="wrap">
       <h1>학기별 시간표</h1>
       <div id="searchArea">
           년도 : <select name="" id="sctYear"> <!-- 로그인 한 사람 입학년도부터 지금까지 -->
       		   <option value='2017'>2017년</option>
               <option value='2018'>2018년</option>
               <option value='2019'>2019년</option>
          </select>&nbsp;&nbsp;&nbsp;
           학기 : <select name="" id="sctSemester">
               <option value="1">1학기</option>
               <option value="2">2학기</option>
          </select>&nbsp;&nbsp;&nbsp;
          <input type="button" id="btnSearch" value="검색">&nbsp;&nbsp;&nbsp;
 수강 과목수 : <span id="totalNum"></span> &nbsp;&nbsp; 총 수강 학점 : <span id="sumUnit"></span>
       </div>
       <div id="showTable">

       </div>
</div>
<div>

</div>
    
</section>
</body>
<script src="resources/js/menu.js"></script>
<script>
var arClassName = ["time","mon","tue","wed","thu","fri"];
var arTime=["09:00-10:30","10:30-12:00","12:00-13:30","13:30-15:00","15:00-16:30","16:30-18:00","18:00-19:30"];

function drawEmptyTable(){
	var header="<ul id='thead'><li class='time'>시간/요일</li><li class='mon1'>월</li><li class='tue1'>화</li><li class='wed1'>수</li><li class='thu1'>목</li><li class='fri1'>금</li></ul>"
	$("#showTable").append(header);

	console.log(arTime[0]);
	for(var i = 1;i<=7;i++){ //세로 교시
		var row="";
		row+="<ul class='tbody'>";
		for(var j=0;j<6;j++){ //가로 요일
			if(j==0){
				row+=("<li class='"+arClassName[j]+"' id='td"+j.toString()+i+"'><br><br>"+i+"교시 <br>"+arTime[i-1]+"</li>");
			} else{
				row+=("<li class='"+arClassName[j]+"' id='td"+j.toString()+i+"'></li>");
			}
		}
		row+="</ul>";
		console.log(row);
		$("#showTable").append(row);
	}
}

$(document)
.ready(function(){
	//빈테이블 그리기
	drawEmptyTable();
	$("#sctYear option").each(function(){
		var sctYear = $(this).val();
		var thisYear = "${nYear}";
		console.log("올해년도 : "+thisYear);
		if(thisYear == sctYear){
			$(this).attr("selected",true);
		}
	})
	$("#sctSemester option").each(function(){
		var sctSemester = $(this).val();
		var thisMonth = "${month}";
		if(thisMonth>=1 &&thisMonth<=6){
			var thisSemester=1;
		}else{
			var thisSemester=2;
		}
		if(thisSemester == sctSemester){
			$(this).attr("selected",true);
		}
	})
})
.on("click","#btnSearch",function(){
	$("#showTable").text("");
	drawEmptyTable();	
	var year = $("#sctYear option:selected").val();
	var semester = $("#sctSemester option:selected").val();
	console.log("year : "+year+" / sem : "+semester);
	var obj={"year":year,"semester":semester};
	
	$.get("/finalpjt/searchTimetable",obj,function(jsonPlace){
		console.log("searchTimetable() 진입")
		console.log("json길이 : "+jsonPlace.length);
		$("#totalNum").text(jsonPlace.length);
		
		console.log(arTime[0]);
		var sumunit =0;
		for(var i=0;i<jsonPlace.length;i++){
			console.log("첫번째 포문");
			var cname = jsonPlace[i]["c_name"];
			var pname = jsonPlace[i]["p_name"];
			var troom = jsonPlace[i]["t_room"];
			var ttime = jsonPlace[i]["t_time"];
			var tday = jsonPlace[i]["t_day"];
			sumunit+=jsonPlace[i]["c_unit"];
			console.log("td에 넣을값 : "+cname+"/"+troom+"/"+ttime+"/"+tday);
			
			var starttime = ttime.split("-")[0]; 
			var starthour = starttime.split(":")[0];
			var startmin = starttime.split(":")[1];
			
			var endtime = ttime.split("-")[1];
			var endhour = endtime.split(":")[0];
			var endmin = endtime.split(":")[1];
			
			var arStarthour=arTime.map(a=>a.substr(0,2));
			var arEndhour=arTime.map(a=>a.substr(6,2));
			
			var lecturepos=arStarthour.indexOf(starthour)+1; //몇교시 시작인지
			console.log("강의 시작 몇 교시 : "+lecturepos);
			var lecturelen = Math.ceil((endhour-starthour)/1.5); 
			console.log("강의 몇 시간 진행"+lecturelen);
			
			var days=["월","화","수","목","금"];
			var tdays = tday.split(",");
			
			/* var randomColor = Math.round(Math.random()*0xffffff).toString(16); */
			/*  'hsl(' + 360 * Math.random() + ',' + (25 + 80 * Math.random()) + '%,' + (85 + 30 * Math.random()) + '%)'; */
			var arR=[124,123,233,164,238,156,249,165];
			var arG=[208,164,192,200,133,133,170,199];
			var arB=[192,230,102,110,116,221,103,112];
			var arA=0.2;
			for(var j=0;j<tdays.length;j++){
				
				
				console.log("두번째 포문 진입");
				var whatday=tdays[j];
				console.log("강의 무슨요일 : "+whatday);
				var col = days.indexOf(whatday)+1; 
				console.log("요일 숫자로 변환 : "+col);
				for(k=0;k<lecturelen;k++){
					console.log("세번째 포문 ");
					var randomColor= "rgb("+arR[i]+","+arG[i]+","+arB[i]+","+arA+")";
					$("#td"+col.toString()+(lecturepos+k)).html(cname+"<br>"+pname+"<br>"+troom+"<br>"+ttime).css("background-color",randomColor);
					
				}

			}
		}
		
		$("#sumUnit").text(sumunit);
	},'json')
	.fail(function(){
		alert("searchTimetable 실패");
	})
	
})
</script>
</html>