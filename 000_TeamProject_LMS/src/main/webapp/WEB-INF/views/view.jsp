<%@page import="java.util.*,java.text.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="resources/css/write.css">
<title>학사관리시스템</title>
</head>
<body>
<%
	Date date = new Date();
	SimpleDateFormat simpleDate= new SimpleDateFormat("yyyy-MM-dd");
	String strdate = simpleDate.format(date);
	/* Object ainfo = session.getAttribute("ainfo"); */ 
	String userType = (String) session.getAttribute("userType"); 
	if(userType.equals("s")){
		%>
		<jsp:include page="student_nav.jsp"/>
		<%
	} else if(userType.equals("p")){
		%>
		<jsp:include page="professor_nav.jsp"/>
		<%	
	} else if(userType.equals("a")){
		%>
		<jsp:include page="admin_nav.jsp"/>
		<%
	}

%>
	<div id="wrap" align="center">
		<header id="board-container">
            <div class="container"></div>
        </header>
		<form action="view" method="post">
			<table class="type05">
            	<tr>
                	<th scope="row" colspan="5">[게시글 보기]</th>
                </tr>
                <tr>
                	<th scope="row" style="text-align: center;">작성자</th>
                    <td>${detail.bname}</td>
                    <th scope="row" style="text-align: center;">작성 날짜</th>
                    <td><%=strdate%></td>
                </tr>
                <tr>
                	<th scope="row" style="text-align: center;">제목</th>
                    <td colspan="5">${detail.btitle}</td>
                </tr>
                <tr>
                	<th scope="row" style="text-align: center;">첨부파일</th>
                    <td colspan="5">
                    	<c:forEach var="file" items="${path}" varStatus="status">
                    		<a href="<c:url value="filedownload?fileDir=${file}&bno=${detail.bno}&filenameToss=${pathname[status.index]}"/>">${pathname[status.index]} </a><br>
                    	</c:forEach>
                    	<!--${file} =>경로 , ${pathname[status.index]} => 파일이름 -->
                    </td>
                </tr>
                <tr>
                	<th scope="row" style="text-align: center; padding: 100px 0px;">내용</th>
                    <td colspan="5" style="width: 350px">${detail.bcontent}</td>
                </tr>
            </table>
            <div id="dvDlg1" style="display: none">
                <label id="lblMsg1"></label>
            </div>
			<%
			if(userType.equals("a")){
			%>		
				<input type="button" id="modifyBtn" value="글 수정 하기" onclick="location.href='modify_page?bno=${detail.bno}'"> &nbsp;&nbsp; 
				<input type="button" id="deleteBtn" value="글 삭제 하기" onclick="location.href='delete?bno=${detail.bno}&pageNum=1'"> &nbsp;&nbsp;
			<%  }  %>
				<input type="button" id="listBtn" value="목록" onclick="location.href='numberPaging?pageNum=1'">
		</form>
	</div>
</body>
<script src="resources/js/menu.js"></script>
</html>