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
    	#join2{margin-left:0;}
    	#request{border-radius:0; margin-top:10px; margin-right:40px; background-color:#D1D3E8;float:right;}
    	#requestBtn{border:none;width:1700px;margin-top:10px;margin-bottom:-20px;}
    </style>
</head>
<body>
     <jsp:include page="student_nav.jsp"/>
    <section>
        <fieldset id="info1">
            <legend id="info_title">기본인적사항</legend>
                <div id="uploadFile">
					<img  id="imageReader" src="resources/images/${picture}"><!-- 경로수정필요 -->
                </div>
                <div id="submain">
                    <div id="join1">
                        <ul>
                            <li class="input-icons1">이름</li>
                            <li class="input-icons1">생년월일</li>
                            <li class="input-icons1">연락처</li>
                            <li class="input-icons1">E-mail</li>
                            <li class="input-icons1">성별</li>
                            <li class="input-icons1">주소</li>
                        </ul>
                    </div>
                    <div id="join1_1">
                        <ul>
                            <li class="input-icons">
                                <i class="fas fa-user"></i>
                                <input type="text" class="input-field" name="s_name" value="${sinfo.s_name}" readonly>
                            </li>
                            <li class="input-icons">
                                <i class="fas fa-birthday-cake"></i>
                                <input type="text" class="input-field" name="s_birth" value='${sinfo.s_birth}' readonly>
                            </li>
                            <li class="input-icons">
                            	<i class="fas fa-mobile-alt"></i>
                                <input type="text" class="input-field" name="s_phone" value='${sinfo.s_phone}' readonly>
                            </li>
                            <li class="input-icons">
                            	<i class="fas fa-envelope"></i>
                                <input type="text" class="input-field" name="s_email" value='${sinfo.s_email}' readonly>
                            </li>
                            <li class="input-icons"><c:choose>
                            <c:when test='${sinfo.s_gender == "남"}'>
                                <input type="radio" class="input-field" id="gen" name="s_gender" value="남" checked disabled>남&nbsp;
                                <input type="radio" class="input-field" id="gen1" name="s_gender" value="여" disabled>여
                            </c:when>
                            <c:otherwise>
                            	<input type="radio" class="input-field" id="gen" name="s_gender" value="남" disabled>남&nbsp;
                                <input type="radio" class="input-field" id="gen1" name="s_gender" value="여" checked disabled>여
                            </c:otherwise>
                            </c:choose>
                            </li>
                            <li class="input-icons">
                                <i class="fas fa-globe-asia" id="addricon"></i>
                                <input type="text" class="input-field" id="addr" name="s_address"  value="${sinfo.s_addr}" readonly>
                            </li>
                        </ul>
                    </div>
                    <div id="join2">
                        <ul>
                            <li class="input-icons2">대학</li>
                            <li class="input-icons2">학과</li>
                            <li class="input-icons2">학년</li>
                            <li class="input-icons2">학번</li>
                            <li class="input-icons2">학적상태</li>
                            <li class="input-icons2">국적</li>
                        </ul>
                    </div>
                    <div id="join2_1">
                        <ul>
                            <li class="input-icons">
                                <i class="fas fa-graduation-cap"></i>
                                <input type="text" class="input-field" name="s_universty" value="${sinfo.s_college}" readonly>
                            </li>
                            <li class="input-icons">
                            	 <input type="text" class="input-field" name="s_major" value="${sinfo.s_major.substring(1)}" readonly>
                            </li>
                            <li class="input-icons">
                            	<input type="text" class="input-field" name="s_grade" value="${sinfo.s_grade}"readonly>
                            </li>
                            <li class="input-icons">
                                <i class="fas fa-address-card"></i>
                                <input type="text" class="input-field" name="s_id" value="${sinfo.s_id}"readonly>
                            </li>
                            <li class="input-icons">
                                <i class="fas fa-user"></i>
                                <input type="text" class="input-field" name="s_condition" value="${sinfo.s_status}" readonly>
                            </li>
                            <li class="input-icons">
                                <i class="fas fa-globe-asia"></i>
                                <input type="text" class="input-field" name="s_nation" value="${sinfo.s_country}" readonly>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </fieldset>
        <fieldset id='requestBtn'>
            <input type="button" id="request" value="휴학신청">
        </fieldset>
        <fieldset id="info2">
            <legend id="info_title">학적변동사항</legend>
            <div id="change1">
                <ul id="board5">
                    <li>
                        <ul>
                            <li>년도</li>
                            <li>학기</li>
                            <li>일자</li>
                            <li>구분</li>
                            <li>상세내용</li>
                            <li>승인과정</li>
                        </ul>
                    </li>
                </ul>
            </div>
            <div class="clear"></div>
            <div id="change1-content">
                <ul id="board5-content">
                    <li>
                        <ul>
                            <li>2019</li>
                            <li>1</li>
                            <li>2019-03-13</li>
                            <li>입학</li>
                            <li>입학</li>
                            <li>승인</li>
                        </ul>
                    </li>
                </ul>
            </div>
        </fieldset>
    </section>
    <script src="resources/js/menu.js"></script>
    <script src="resources/js/upload.js"></script>
    <script>
    	$(function(){
    		$('#request').click(function(){
    			var name = '${sinfo.s_name}';
    			var major = '${sinfo.s_major.substring(1)}';
    			var id = '${sinfo.getS_id()}';
    			var obj = {};
    			console.log("click check - "+name+", major - "+major+", id - "+id);
    			
    			obj['name'] = name;
    			obj['major'] = major;
    			obj['id'] = id;
    			$.post('request',obj,function(txt){
    				console.log(txt);
    				alert("휴학신청 완료. 자세한 사항은 학생처를 방문해주세요");
    			},'text');
    		});
    	});
    </script>
</body>
</html>