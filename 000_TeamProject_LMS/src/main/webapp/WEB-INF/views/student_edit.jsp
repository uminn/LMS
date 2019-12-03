<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="resources/css/student_info.css">
    <title>학사관리시스템</title>
    <style>
    	.changePassword{margin:20px 0;margin-left:570px;}
    	.changePassword>input{margin-left:20px;}
    	#uploadFileInEditpage{width: 200px;height: 156px;padding: 10px;margin-left:600px;
    						  border:10px solid #f0f0f0;text-align: center;}
		#info1InEdit{margin-left: 30px;width: 1550px;padding-top:10px;border:1px solid #666;
				   border-radius:8px;box-shadow:0 0 5px #666;font-family: 'Noto Sans KR', sans-serif;}
		#editInfo{margin-left:670px;margin-bottom:30px;}
		#info_title{position:relative;}
    </style>
</head>
<body>
     <jsp:include page="student_nav.jsp"/>
    <section>
    <form action="student_editer" method="post" enctype="multipart/form-data">
        <fieldset id="info1InEdit">
            <legend id="info_title">개인정보 변경</legend>
                <div id="uploadFileInEditpage">
                    <label for="upload" title="Upload photo"  class="camera"></label>
                    <label for="upload" ><img  id="imageReader"></label>
                    <input  type="file" name="sfile" id="upload">
                </div>
                <div id='passwordChange'>
                	<li>
                		<ul class='changePassword'><span>현재 비밀번호 :</span><input type="password" id="nowPassword"></ul>
                		<ul class='changePassword'><span>변경 비밀번호 :</span><input type="password" name="password" id="changePassword"></ul>
                		<ul class='changePassword'><span>비밀번호 확인 :</span><input type="password" id="checkPassword"></ul>
                		<input type="submit" id="editInfo" value="정보변경">
                	</li>
                </div>
        </fieldset>
    </form>
    </section>
    <script src="resources/js/menu.js"></script>
    <script src="resources/js/upload.js"></script>
</body>
<script type="text/javascript">
	$(function(){
		$('#editInfo').click(function(){
			if($('#nowPassword').val()=='' || $('#changePassword').val()=='' || $('#checkPassword').val()==''){
				alert('입력란에 공백이 있습니다.');
				return false;
			}else
			if($('#nowPassword').val()==$('#changePassword').val()){
				alert('이전 비밀번호와 동일 합니다.');
				return false;
			}else
			if($('#changePassword').val()!=$('#checkPassword').val()){
				alert('비밀번호가 일치하지 않습니다.');
				return false;
			}
		});
	});
</script>
</html>