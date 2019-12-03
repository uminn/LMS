<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학사관리시스템</title>
</head>
<body>
</body>
<script>
	<%
		session.invalidate();
		response.setHeader("Cache-Control","no-store");
		response.setHeader("Pragma","no-cache");
		response.setDateHeader("Expires",0);
		if(request.getProtocol().equals("HTTP/1.1")){
			response.setHeader("Cache-Control","no-cache");
		}
	%>
	alert("로그아웃 되었습니다.");
	location.href="/finalpjt/";
</script>
</html>