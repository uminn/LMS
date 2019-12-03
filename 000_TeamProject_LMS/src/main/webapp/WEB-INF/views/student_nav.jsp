<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	 String userType = (String) session.getAttribute("userType");
	 Object sinfo = session.getAttribute("sinfo");
	 int thisYear= (Integer) session.getAttribute("thisYear");
	 int thisSemester = (Integer) session.getAttribute("thisSemester");
	 
	 int nYear= (Integer) session.getAttribute("nYear");
	 int month = (Integer) session.getAttribute("month");
	 String s_id = (String) session.getAttribute("s_id");
	 System.out.println("학생내비에서 유저타입 : "+userType);
 %>   
    
  <nav>
       <div id="logo">
           <a href="/finalpjt/main"><img src="resources/images/logo.png"></a>
       </div>
       <div id="logged">
           <div class="log_title">
                <p id="welcome"><b>${sinfo.getS_name()}</b> 님 <br>환영합니다</p>
            </div>
            <div class="log_content">
                <input type="button" id="logout" value="로그아웃" onclick="location.href='/finalpjt/logout'">
            </div>
       </div>
       <div id="mainMenu">
           <button class="accordion">학적/졸업</button>
           <ul> 
               <li><a href="/finalpjt/student_info">학적정보조회</a></li>
               <li><a href="/finalpjt/student_edit1">개인정보변경</a></li> 
               <li><a href="/finalpjt/student_last">졸업정보조회</a></li> 
           </ul>
           <button class="accordion">수업/성적</button>
           <ul>
               <li><a href="/finalpjt/student_timetable">시간표</a></li>
               <li><a href="/finalpjt/student_evaluation?s_id=${sinfo.getS_id()}">강의평가</a></li>
               <li><a href="/finalpjt/student_grade?s_id=${sinfo.getS_id()}&nYear=${nYear}&month=${month}">성적조회</a></li>
           </ul>
           <button class="accordion accordion-x" onclick="location='student_enroll_main'">수강신청</button>
       </div>   
   </nav>