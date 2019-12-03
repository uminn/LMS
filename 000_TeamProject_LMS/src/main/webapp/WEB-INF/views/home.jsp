<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<!--===============================================================================================-->	
<link rel="icon" type="image/png" href="/resources/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<!-- <script src="js/jQuery-3.4.1.js"></script> -->
<!--===============================================================================================-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/css/login.css">
<!--===============================================================================================-->
<html>
<head>
	<title>Home</title>
</head>

<body>
<%
	session.invalidate();
	System.out.println("로그인 화면 세션 만료");
%>
<div id="wrap">
		<div id="wrap-login">
			<div id="wrap-loginform">
				<div class="login-pic">
					<img src="resources/images/img-01.png" alt="IMG">
				</div>
				<form class="login-form" method="post" action="main">  
					<span class="login-form-title"> 학사정보시스템 </span>
					<div class="wrap-input">
						<input class="input" type="text" name="userID" placeholder="학번">
						<span class="symbol-input">
							<i class="fa fa-envelope"></i>
						</span>
					</div>

					<div class="wrap-input">
						<input class="input" type="password" name="userPassword" placeholder="비밀번호">
						<span class="symbol-input">
							<i class="fa fa-lock"></i>
						</span>
					</div>
					
					<div class="container-login-form-btn">
						<button class="login-form-btn" id="btnGo"> 로그인 </button>
						
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
<script>
console.log("${mismatch}");
var name = "${mismatch}";
if(name =="alert"){
	alert("로그인 실패. 입력 정보를 다시 확인하세요.");
	history.go(-1);
}
</script>

</html>
