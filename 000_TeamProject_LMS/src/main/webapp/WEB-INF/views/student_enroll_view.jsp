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
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="resources/js/jquery-ui.css">
    <link rel="stylesheet" href="resources/css/enroll_search.css">
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
                    <li><a href="#tabs-1">개설과목조회</a></li>
                    <li><a href="#tabs-2">수강신청</a></li>
                    <li><a href="#tabs-3">나의 이수내역</a></li>
                </ul>
                <div id="tabs-1">
                    <div id="tab1">
                        ▶ 이수구분 <select name="" id="completion">
                        	<option value="">전과목</option>
                        	<option value="전공">전공</option>
                            <option value="교양">교양</option>
                        </select> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ▶ 대상학년 <select name="" id="grade">
                        	<option value="0">전학년</option>
                            <option value="1">1학년</option>
                            <option value="2">2학년</option>
                            <option value="3">3학년</option>
                            <option value="4">4학년</option>
                        </select>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;▶ 과목명 <input type="text" placeholder="검색어 입력">
                        <button type="submit"></button>
                    </div>
                    <div id="tab1">
                        <div class="nameselect">
                            <fieldset id="fi1">
                                <legend>개설과목조회 [총 조회건수: ${howmanyTeach}건]</legend>
                                        <ul id='enroll-title'>
                                            <li>
                                                <ul>
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
	                                                <li class="lecturePlan">강의계획서</li>
                                                </ul>
                                            </li>
                                        </ul>
                                        <div class='clear'></div>
                                        <div id="enroll-search">
                                            <ul id="content01">
                                                <li>
                                                    <c:forEach var="teachList" items="${teachList}" >
                                                		<ul>
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
	                                                        <li class="lecturePlan"><input type="button" id="${teachList.p_id}" value="강의계획서"></li>
	                                                    </ul>
                                                	</c:forEach>

                                                </li>
                                                <div class='clear'></div>
                                            </ul>
                                        </div>
                            </fieldset>
                        </div>
                    </div>
                </div>
            </div><!--1번탭끝-->
            <div id="tabs-2">
                <fieldset id="fi1">
                    <legend>수강신청 내역[수강신청가능학점: 21학점 | 총 신청학점: ${sumMyApplyUnit}학점 | 신청과목수: ${howmanyApply}과목]</legend>
                            <ul id='board1'>
                                <li>
                                    <ul>
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
                                        <!-- <li class="timetable">시간표</li> -->
                                    </ul>
                                </li>
                            </ul>
                            <div class='clear'></div>
                            <div id="enroll-insert">
                                <ul id="content02">
                                    <li>
                                       <c:forEach var="applyList" items="${myApplyList}" >
                                         <ul>
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
            </div> <!--2번탭끝-->
            <div id="tabs-3">
                <fieldset id="fi1">
                    <legend>나의 이수내역</legend>
		                <ul id='board2'>
		                    <li>
		                        <ul>
		                            <li class="tyearandsem"> 취득시기 </li>
		                            <li class="cid"> 과목코드 </li>
		                            <li class="cname"> 과목명 </li>
		                            <li class="cmajor"> 이수구분 </li>
		                            <li class="cgrade"> 학년 </li>
		                            <li class="cunit"> 학점 </li>
		                            <li class="cscore"> 점수 </li>
		                            <li class="calpha"> 평점 </li>
		                        </ul>
		                    </li>
		                </ul>
		                <div class='clear'></div>
		                <div id="enroll-mypage">
		                    <ul id="content03">
		                        <li>
		                        	<c:forEach var="allapplyList" items="${allMyApplyList}" >
                                        <ul>
                                        	<li class="tyearandsem"> ${allapplyList.t_year}/${allapplyList.t_semester} </li>
				                            <li class="cid"> ${allapplyList.c_id} </li>
				                            <li class="cname"> ${allapplyList.c_name} </li>
				                            <li class="cmajor"> ${allapplyList.c_major} </li>
				                            <li class="cgrade"> ${allapplyList.c_grade} </li>
				                            <li class="cunit"> ${allapplyList.c_unit} </li>
				                            <li class="cscore"> <%-- ${allapplyList.c_score} --%> </li>
				                            <li class="calpha"> <%-- ${allapplyList.c_alpha} --%> </li>
                                     	</ul>
                                   </c:forEach>
		                        </li>
		                        <div class='clear'></div>
		                    </ul>
		                </div>
                </fieldset>
            </div> <!--3번 탭-->
        </div>
    </section>
</body>
<script>
<c:forEach var="forAJAX" items="${forAJAX}" varStatus='status'>
	$(function(){
		$('#${forAJAX.p_id}').click(function(){
			var date = new Date();
			var month = date.getMonth();
			var realMonth = month+1;
			console.log(month);
				window.open('student_lectureplan?p_id=${forAJAX.p_id}&month='+realMonth,'popup',"width=1795,height=760,location=no,status=no,scrollbars=yes");
		});
	});
</c:forEach>
</script>
</html>