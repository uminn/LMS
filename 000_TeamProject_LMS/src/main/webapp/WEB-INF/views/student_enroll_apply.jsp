<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%
 	Object sinfo = session.getAttribute("sinfo");
 %>   
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
    <link rel="stylesheet" href="resources/js/jquery-ui.css">
    <link rel="stylesheet" href="resources/css/enroll_add.css">
    <title>수강신청</title>
    <script>
        $( function() {
            $( "#tabs" ).tabs();
        });
    </script>
</head>
<body>
    <nav>
        <div id="logo1">
            <a href="/finalpjt/main"><img src="resources/images/logo1.png"></a>
        </div>
        <div id="mainMenu">
            <table class="type09">
                <thead>
                <tr>
                    <th scope="cols" colspan="2">2019년도 2학기 수강신청</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th scope="row">대학</th>
                    <td>휴먼대학교</td>
                </tr>
                <tr>
                    <th scope="row">학과</th>
                    <td>${sinfo.getS_major()}</td>
                </tr>
                <tr>
                    <th scope="row">학번</th>
                    <td>${sinfo.getS_id()}</td>
                </tr>
                <tr>
                    <th scope="row">성명</th>
                    <td>${sinfo.getS_name()}</td>
                </tr>
                <tr>
                    <th scope="row">신청가능학점</th>
                    <td>21 학점</td>
                </tr>
                </tbody>
            </table>
        </div>
    </nav>
    <section>
        <header>
            <div class="container">
                <ul id="documents" class="nav">
                    <li><a href="/finalpjt/student_enroll_main">공지사항</a></li>
                    <li><a href="/finalpjt/student_enroll_view">조회</a> </li>
                    <li><a href="/finalpjt/student_enroll_apply">수강신청</a> </li>
                </ul>
            </div>
        </header>
        <div class="clear"></div>
        <div id="tabs">
            <div class="tab-wrap">
                <ul>
                    <li><a href="#tabs-1">개설강좌</a></li>
                </ul>
                <div id="tabs-1">
                    <div id="tab1"> 
                        ▶ 이수구분 <select name="" id="completion">
                        	<option value="">전과목</option>
                        	<option value="전공">전공</option>
                            <option value="교양">교양</option>
                        </select> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                       ▶ 학&nbsp;과 <select name="" id="depart">
                        	<option value="">전공무관</option>    	
                        	<c:forEach var="major" items="${possibleMajor}" >
                        		<option value="${major}">${major}</option>
                        	</c:forEach>
                        </select>
                        ▶ 대상학년 <select name="" id="grade">
                        	<option value="0">전학년</option>
                            <option value="1">1학년</option>
                            <option value="2">2학년</option>
                            <option value="3">3학년</option>
                            <option value="4">4학년</option>
                        </select>
                        &nbsp;&nbsp;&nbsp;<!-- ▶ 주/야 <select name="" id="info">
                            <option value="주간">주간</option>
                            <option value="야간">야간</option>
                        </select> -->
                        <input type="button" id="btnSearch" value="조회">
                    </div>
                    <div id="tab1">
                        <div class="nameselect">
                            <fieldset id="fi1">
                                <legend>개설과목조회 [총 조회건수: ${howmanyTeach} 강좌]</legend>
                                        <ul id='board3'>
                                            <li>
                                                <ul>
                                                    <li class="btn">수강신청</li>
                                                    <li class="cid">과목코드</li>
                                                    <!-- <li class="cidno">반번</li> -->
                                                    <li class="cmajor">이수구분</li>
                                                    <li class="cname">과목명</li>
                                                    <li class="cunit">학점</li>
                                                    <li class="pname">교수명</li>
                                                    <li class="cgrade">대상학년</li>
                                                    <li class="tmax">수강인원</li>
                                                    <li class="ttime">수업시간</li>
                                                    <li class="troom">강의실</li>
                                                    <li class="maxalert">참고사항</li>
                                                </ul>
                                            </li>
                                        </ul>
                                        <div class='clear'></div>
                                        <div id="enroll-list">
                                            <ul id="content04">
                                                <li>
                                                	<c:forEach var="teachList" items="${teachList}" >
                                                		<ul>
	                                                        <li class="btn"><input type="button" class="btnApply" value="수강신청"></li>
	                                                        <li class="cid">${teachList.c_id}</li> 
	                                                        <!-- <li class="cidno">${teachList.c_id_no}</li> -->
	                                                        <li class="cmajor">${teachList.c_major}</li>
	                                                        <li class="cname">${teachList.c_name}</li>
	                                                        <li class="cunit">${teachList.c_unit}</li>
	                                                        <li class="pname">${teachList.p_name}</li>
	                                                        <li class="cgrade">${teachList.c_grade}</li>
	                                                        <li class="tmax">${teachList.sNum} / ${teachList.t_max}</li>
	                                                        <li class="ttime">${teachList.t_day} ${teachList.t_time}</li>
	                                                        <li class="troom">${teachList.t_room}</li>
	                                                        <li class="maxalert"></li>
	                                                    </ul>
                                                	</c:forEach>
                                                </li>
                                                <div class='clear'></div>
                                            </ul>
                                        </div>
                            </fieldset>
                        </div>
                    </div>
                </div><!--1번탭-->
            </div>
        </div>
        <div class="clear"></div>
        <div class="tab-wrap1">
            <fieldset id="fi2">
                <legend>수강신청 내역 [수강신청가능학점: 21학점 | 총 신청학점: ${sumMyApplyUnit} 학점 |  신청과목수: ${howmanyApply} 과목]</legend>
                        <ul id='board4'>
                            <li>
                                <ul>
                                    <li class="btn1">수강취소</li>
                                    <li class="cid1">과목코드</li>
                                    <!-- <li class="cidno1">반번</li> -->
                                    <li class="cmajor1">이수구분</li>
                                    <li class="cname1">과목명</li>
                                    <li class="cunit1">학점</li>
                                    <li class="pname1">교수명</li>
                                    <li class="cgrade1">대상학년</li>
                                    <li class="tmax1">수강인원</li>
                                    <li class="ttime1">수업시간</li>
                                    <li class="troom1">강의실</li>
                                </ul>
                            </li>
                        </ul>
                        <div class='clear'></div>
                        <div id="enroll-list1">
                            <ul id="content05">
                                <li>
                                    <c:forEach var="applyList" items="${myApplyList}" >
                                         <ul>
                                            <li class="btn1"><input type="button" class="btnCancel" value="수강취소"></li>
                                            <li class="cid1">${applyList.c_id}</li> 
                                            <%-- <li class="cidno1">${applyList.c_id_no}</li> --%>
                                            <li class="cmajor1">${applyList.c_major}</li>
                                            <li class="cname1">${applyList.c_name}</li>
                                            <li class="cunit1">${applyList.c_unit}</li>
                                            <li class="pname1">${applyList.p_name}</li>
                                            <li class="cgrade1">${applyList.c_grade}</li>
                                            <li class="tmax1">${applyList.sNum} /${applyList.t_max}</li>
                                            <li class="ttime1">${applyList.t_day} ${applyList.t_time}</li>
                                            <li class="troom1">${applyList.t_room}</li>
                                        </ul>
                                   	</c:forEach>
                                </li>
                                <div class='clear'></div>
                            </ul>
                        </div>
            </fieldset>
        </div>
    </section>
</body>
<script>
$(document)
.ready(function(){
	//최대인원수 경고메세지 출력
	console.log("ready");
	$(".maxalert").each(function(i){
		var tlimit = $(this).siblings(".tmax").text();
		var stlimit=tlimit.split("/");
		console.log(stlimit[0]+"/"+stlimit[1]);
		if(stlimit.length==2){
			if(Number(stlimit[0].trim())>=Number(stlimit[1].trim())){
				$(this).text("인원초과!!!").css("color","red");
			}
		}
	})
})
.on("click",".btnApply",function(){
	//이미 수강한 강의 
	var cname = $(this).parents().siblings(".cname").text();
	var sw=false;
	$(".cname1").each(function(i){
		if(cname==$(this).text()){
			alert("이미 수강중인 과목입니다.");
			sw=true;
			return false;
		}
	})
	if(sw){
		console.log("sw진입");
		return false;
	}
	console.log("이미 수강중인 과목이 있으면 찍히면 안됨");
	//가능한 학점 이상 신청시 alert
	var nowApply = ${sumMyApplyUnit};
	console.log(typeof nowApply);
	var unitApply = parseInt($(this).parents().siblings(".cunit").text());
	console.log(typeof unitApply);
	console.log(nowApply+"+"+unitApply+"="+(nowApply+unitApply));
	if((nowApply+unitApply)>21){
		alert("수강가능 학점을 초과하였습니다.");
		return false;
	}
	//수업 시간 중복시 alert
	var wantTime = parseInt($(this).parents().siblings(".ttime").text());
	
	//수강인원수 초과시 alert 출력 //db거치게 수정예정
	var tlimit = $(this).parents().siblings(".tmax").text();
	var stlimit=tlimit.split("/");
	console.log(stlimit[0].trim()+"/"+stlimit[1].trim());
	if(Number(stlimit[0].trim())>=Number(stlimit[1].trim())){
		alert("수강인원이 초과되었습니다.");
		return false;
	}
	console.log("학점만 오버시 여까진 안옴");
	//insert진행
	var cid = $(this).parents().siblings(".cid").text();
	console.log(cid);
	location.href="insertMyApply/?cid="+cid;
})
.on("click",".btnCancel",function(){
	var cid = $(this).parents().siblings(".cid1").text();
	console.log(cid);
	location.href="deleteMyApply/?cid="+cid;
})
.on("click","#btnSearch",function(){
	var completion = $("#completion option:selected").val();
	var depart = $("#depart option:selected").val();
	var grade = $("#grade option:selected").val();
	
	location.href="student_enroll_apply?completion="+completion+"&depart="+depart+"&grade="+grade;
	  
})


</script>
</html>