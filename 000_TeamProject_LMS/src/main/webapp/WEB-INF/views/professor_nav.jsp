<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
  <%
/*   	Object pinfo = session.getAttribute("pinfo");
 	String userType = (String) session.getAttribute("userType");
 	int thisYear = 2019;
 	int thisSemester = 2; */
 	
 	Object pinfo = session.getAttribute("pinfo");
    int nYear= (Integer) session.getAttribute("nYear");
    int month = (Integer) session.getAttribute("month");
    String s_id = (String) session.getAttribute("s_id");
 %>   
 <nav>
     <div id="logo">
         <a href="/finalpjt/main"><img src="resources/images/logo.png"></a>
     </div>
     <div id="logged">
         <div class="log_title">
             <p id="welcome"><b>${pinfo.getP_name()}</b> 교수님 <br>환영합니다</p>
         </div>
         <div class="log_content">
             <input type="button" id="logout" value="로그아웃" onclick="location.href='/finalpjt/logout'">
         </div>
     </div>
     <div id="mainMenu">
<!--      	<input type="text" value=${pinfo.getP_id()}> -->
         <button class="accordion">학생정보</button>
         <ul> 
             <li><a href="professor_studentInfomation?p_id=${pinfo.getP_id()}">학생정보조회</a></li>
         </ul>
         <button class="accordion">성적관리</button>
         <ul>
             <li><a href="p_score?p_id=${pinfo.getP_id()}&nYear=${nYear}&month=${month}">성적입력</a></li>
         </ul>
         <button class="accordion">수업관리</button>
         <ul>
             <li><a href="professor_lectureplan?p_id=${pinfo.getP_id()}">강의계획서 등록</a></li>
             <li><a href="#">결보강신청</a></li>
         </ul>
         <button class="accordion">출결관리</button>
         <ul>
             <li><a href="#">출결관리</a></li>
             <li><a href="#">출석부</a></li>
         </ul>
         
     </div>   
 </nav>