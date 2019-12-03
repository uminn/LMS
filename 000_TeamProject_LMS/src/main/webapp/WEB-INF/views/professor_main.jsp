<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*"%>
<%
   Calendar calendar = new GregorianCalendar();
   int nYear;
   nYear = calendar.get(Calendar.YEAR);
   int month;
   month = calendar.get(Calendar.MONTH) + 1;
   session.setAttribute("nYear",nYear);
   session.setAttribute("month",month);
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <link rel="stylesheet" href="resources/css/student_main.css">
<link rel="stylesheet" href="resources/css/main_menu.css">
   <link rel="stylesheet" href="resources/css/slideshow.css">
   <script src="resources/js/slideshow.js"></script>
<title>학사관리시스템</title>
</head>
<body>
	<jsp:include page="professor_nav.jsp" />
	<section>
        <h1 id="h1">휴먼대학교 교수 메인 페이지</h1>
        <div class="wide-board">
            <div class="banner">
                <ul class="slideshow-container">
                     <div class="mySlides fade">
				        <!-- <div class="numbertext">1 / 6</div> -->
				        <img src="resources/images/slide1.jpg" style="width:1200px;height:350px">
				        <!-- <div class="text">ACNE STUDIO</div> -->
				      </div>
				
				      <div class="mySlides fade">
				        <!-- <div class="numbertext">2 / 6</div> -->
				        <img src="resources/images/slide2.jpg" style="width:1200px;height:350px">
				        <!-- <div class="text">ACNE STUDIO</div> -->
				      </div>
				
				      <div class="mySlides fade">
				        <!-- <div class="numbertext">3 / 6</div> -->
				        <img src="resources/images/slide3.jpg" style="width:1200px;height:350px">
				        <!-- <div class="text">ACNE STUDIO</div> -->
				      </div>
				
				      <div class="mySlides fade">
				        <!-- <div class="numbertext">4 / 6</div> -->
				        <img src="resources/images/slide4.jpg" style="width:1200px;height:350px">
				        <!-- <div class="text">ACNE STUDIO</div> -->
				      </div>
				

				
				      <!-- Next and previous buttons -->
				      <a class="prev" onclick="moveSlides(-1)">&#10094;</a>
				      <a class="next" onclick="moveSlides(1)">&#10095;</a>
				    </div>
				    <br/>
				
				    <!-- The dots/circles -->
				    <div style="text-align:center">
				      <span class="dot" onclick="currentSlide(0)"></span>
				      <span class="dot" onclick="currentSlide(1)"></span>
				      <span class="dot" onclick="currentSlide(2)"></span>
				      <span class="dot" onclick="currentSlide(3)"></span>
<!-- 				      <span class="dot" onclick="currentSlide(4)"></span>
				      <span class="dot" onclick="currentSlide(5)"></span> -->
				    </div>
                </ul>
		    </div>
        </div>
        <div class="clear"></div>
        <div id="notice" class="board">
            <div id='wrap'>
                <ul>
                    <span class="title">공지사항</span><span class="more"><a href="/finalpjt/numberPaging?pageNum=1">more+</a></span>
                    <li>
                        <div id="student_board_main">
                            <ul id='student_board_title'>
                                <li>
                                    <ul>
                                        <li>번호</li>
                                        <li>제목</li>
                                        <li>날짜</li>
                                    </ul>
                                </li>
                                <li>
                                <c:choose>
		                            <c:when test="${count == '0'}">	
		                           		<li>   	등록된 글이 없습니다. </li>
		                           	</c:when>
		                           	<c:otherwise>
			                            <li id="boardList">
			                                <c:forEach items="${noticelist}" var="board" end="4">
				                                <ul id="forHidden">
				                                    <li>${board.bno}</li>
				                                    <li class='left'><a href='view?bno=${board.bno}&pageNum=${pageNum}'>${board.btitle}</a></li>
				                                    <li>${board.bdate}</li>
				                                </ul>
			                                </c:forEach>
			                            </li>
			                            <div id="lists"></div>
		                            </c:otherwise>
	                            </c:choose>
                                    <!-- <ul>
                                        <li>5</li>
                                        <li class='left'><a href='#'>공지사항</a></li>
                                        <li>2019.09.04</li>
                                    </ul>
                                    <ul>
                                        <li>4</li>
                                        <li class='left'><a href='#'>공지사항</a></li>
                                        <li>2019.09.04</li>
                                    </ul>
                                    <ul>
                                        <li>3</li>
                                        <li class='left'><a href='#'>공지사항</a></li>
                                        <li>2019.09.04</li>
                                    </ul>
                                    <ul>
                                        <li>2</li>
                                        <li class='left'><a href='#'>공지사항</a></li>
                                        <li>2019.09.04</li>
                                    </ul>
                                    <ul>
                                        <li>1</li>
                                        <li class='left'><a href='#'>공지사항</a></li>
                                        <li>2019.09.04</li>
                                    </ul> -->
                                </li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        
        <div id="schedule" class="board">
            <div id='wrap'>
                <ul>
                    <span class="title">학사일정</span> <span class="more"><a href="/finalpjt/admin_schedule">more+</a></span>
                    <li>
                        <div id="student_board_main">
                            <ul id='student_board_title'>
                                <li>
                                    <ul>
                                        <li>날짜</li>
                                        <li>기간</li>
                                        <li>제목</li>
                                    </ul>
                                </li>
                                <li>
                              <c:choose>
                                  <c:when test="${count == '0' }">
                                     <ul>
                                        <li style="width: 760px;"> 등록 된 일정이 없습니다. </li>
                                     </ul>
                                  </c:when>
                                  <c:otherwise>
                                     <c:forEach items="${schlist}" var="board" varStatus="status">
                                         <ul>
                                             <li>${board.sch_fromdate} - ${board.sch_todate}</li>
	                                         <li>${dday.get(status.index)}</li>
	                                         <li class='left'>${board.sch_content}</li>  
                                         </ul>
                                     </c:forEach>
                                 </c:otherwise>
                             </c:choose>
                                    
                                </li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </section>
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
	</script>
</body>
</html>