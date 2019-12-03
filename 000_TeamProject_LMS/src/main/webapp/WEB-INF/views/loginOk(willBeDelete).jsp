<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String userID = request.getParameter("userID"); 
		String userType =request.getParameter("userType");
		if(userID !=null){ 
			session.setAttribute("userID",userID);
			
		}
		
		if(userType.equals("s")){
			response.sendRedirect("student_main");
		} else
		
	%>
		alert("환영합니다.");
	<%
		response.sendRedirect("main?userID="+userID);
	%>
</body>
</html>