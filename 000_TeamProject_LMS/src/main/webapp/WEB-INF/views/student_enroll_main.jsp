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
    <link rel="stylesheet" href="resources/css/enroll_board.css">
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
        
	</section>
	<div id="tabs">
        	<h1 style="margin: 100px 0 0 200px">&nbsp;&nbsp;&nbsp;&nbsp;수강신청 메인화면</h1>
        </div>
</body>
</html>