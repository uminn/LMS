<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="shortcut icon" href="data:image/x-icon;," type="image/x-icon">
<!-- <link rel="stylesheet" href="resources/js/jquery-ui.css"> -->
<link rel="stylesheet" href="resources/css/student_evalinput.css">
<title>학사관리시스템</title>
</head>
<body>
	<form action="student_eval_update" method="GET" id="evl">
		<section id="eval-insert">
	        <h2 style="margin-bottom: 20px">강의평가</h2>
	        <div id="evalinput_main">
	            <input type="button" id="eval_save" value="저&nbsp;장">
	        </div>
	        <div class="clear"></div>
	        <div class="evalinput_content_main">
	            <fieldset id="fi1">
	                <legend>강의평가 선택문항 리스트[총: <span></span>건 중 ?건 답변]</legend>
	                <div class="evalinput_content_main">
	                    <ul class="evalinput_content">
	                        <li>
	                            <ul>
	                                <li class="num">순번</li>
	                                <li class="content">문항</li>
	                                <li class="jum">5</li>
	                                <li class="jum">4</li>
	                                <li class="jum">3</li>
	                                <li class="jum">2</li>
	                                <li class="jum">1</li>
	                            </ul>
	                        </li>
	                    </ul>
	                </div>
	                <ul class="evalinput_content1">
	                    <li>
	                        <ul>
	                            <li class="num">1</li>
	                            <li class="content">수업계획서는 강좌선택과 수강준비에 구체적인 도움을 주었다.</li>
	                            <li class="jum"><input type="radio" name="e1" value="5"></li>
	                            <li class="jum"><input type="radio" name="e1" value="4"></li>
	                            <li class="jum"><input type="radio" name="e1" value="3"></li>
	                            <li class="jum"><input type="radio" name="e1" value="2"></li>
	                            <li class="jum"><input type="radio" name="e1" value="1"></li>
	                        </ul>
	                        <ul>
	                            <li class="num">2</li>
	                            <li class="content">수업목표는 구체적이고 명확하게 제시되었다. </li>
	                            <li class="jum"><input type="radio" name="e2" value="5"></li>
	                            <li class="jum"><input type="radio" name="e2" value="4"></li>
	                            <li class="jum"><input type="radio" name="e2" value="3"></li>
	                            <li class="jum"><input type="radio" name="e2" value="2"></li>
	                            <li class="jum"><input type="radio" name="e2" value="1"></li>
	                        </ul>
 	                        <ul>
	                            <li class="num">3</li>
	                            <li class="content">수업목표, 내용, 방법에 따른 합리적인 성적평가 방법과 기준이 안내되었다.</li>
	                            <li class="jum"><input type="radio" name="e3" value="5"></li>
	                            <li class="jum"><input type="radio" name="e3" value="4"></li>
	                            <li class="jum"><input type="radio" name="e3" value="3"></li>
	                            <li class="jum"><input type="radio" name="e3" value="2"></li>
	                            <li class="jum"><input type="radio" name="e3" value="1"></li>
	                        </ul>
	                        <ul>
	                            <li class="num">4</li>
	                            <li class="content">교수는 학생들이 흥미를 갖고 수업에 몰입할 수 있도록 성실히 지도하였다.</li>
	                            <li class="jum"><input type="radio" name="e4" value="5"></li>
	                            <li class="jum"><input type="radio" name="e4" value="4"></li>
	                            <li class="jum"><input type="radio" name="e4" value="3"></li>
	                            <li class="jum"><input type="radio" name="e4" value="2"></li>
	                            <li class="jum"><input type="radio" name="e4" value="1"></li>
	                        </ul>
	                        <ul>
	                            <li class="num">5</li>
	                            <li class="content">교수는 학생의 활동이나 과제에 대해 적절한 피드백을 제공하였다.</li>
	                            <li class="jum"><input type="radio" name="e5" value="5"></li>
	                            <li class="jum"><input type="radio" name="e5" value="4"></li>
	                            <li class="jum"><input type="radio" name="e5" value="3"></li>
	                            <li class="jum"><input type="radio" name="e5" value="2"></li>
	                            <li class="jum"><input type="radio" name="e5" value="1"></li>
	                        </ul>
	                        <ul>
	                            <li class="num">6</li>
	                            <li class="content">수업에 대한 교수의 열정은 나의 학업과 태도 변화에 긍정적인 영향을 주었다.</li>
	                            <li class="jum"><input type="radio" name="e6" value="5"></li>
	                            <li class="jum"><input type="radio" name="e6" value="4"></li>
	                            <li class="jum"><input type="radio" name="e6" value="3"></li>
	                            <li class="jum"><input type="radio" name="e6" value="2"></li>
	                            <li class="jum"><input type="radio" name="e6" value="1"></li>
	                        </ul>
	                        <ul>
	                            <li class="num">7</li>
	                            <li class="content">교수는 교과와 관련된 학문적 관심과 흥미를 이끌어냈다.</li>
	                            <li class="jum"><input type="radio" name="e7" value="5"></li>
	                            <li class="jum"><input type="radio" name="e7" value="4"></li>
	                            <li class="jum"><input type="radio" name="e7" value="3"></li>
	                            <li class="jum"><input type="radio" name="e7" value="2"></li>
	                            <li class="jum"><input type="radio" name="e7" value="1"></li>
	                        </ul>
	                        <ul>
	                            <li class="num">8</li>
	                            <li class="content">강의는 교과와 관련된 실력 향상에 도움을 주었다.</li>
	                            <li class="jum"><input type="radio" name="e8" value="5"></li>
	                            <li class="jum"><input type="radio" name="e8" value="4"></li>
	                            <li class="jum"><input type="radio" name="e8" value="3"></li>
	                            <li class="jum"><input type="radio" name="e8" value="2"></li>
	                            <li class="jum"><input type="radio" name="e8" value="1"></li>
	                        </ul>
	                        <ul>
	                            <li class="num">9</li>
	                            <li class="content">교수는 학생들의 의견을 존중하면서 토론(실습)을 이끌어 나갔다.</li>
	                            <li class="jum"><input type="radio" name="e9" value="5"></li>
	                            <li class="jum"><input type="radio" name="e9" value="4"></li>
	                            <li class="jum"><input type="radio" name="e9" value="3"></li>
	                            <li class="jum"><input type="radio" name="e9" value="2"></li>
	                            <li class="jum"><input type="radio" name="e9" value="1"></li>
	                        </ul>
	                        <ul>
	                            <li class="num">10</li>
	                            <li class="content">수업(실습, 발표)에 참여할 수 있는 기회가 충분하였다.</li>
	                            <li class="jum"><input type="radio" name="e10" value="5"></li>
	                            <li class="jum"><input type="radio" name="e10" value="4"></li>
	                            <li class="jum"><input type="radio" name="e10" value="3"></li>
	                            <li class="jum"><input type="radio" name="e10" value="2"></li>
	                            <li class="jum"><input type="radio" name="e10" value="1"></li>
	                        </ul>
	                        <ul>
	                            <li class="num">11</li>
	                            <li class="content">교수는 수업기간과 수업시간을 준수하여 강의를 운영하였다.</li>
	                            <li class="jum"><input type="radio" name="e11" value="5"></li>
	                            <li class="jum"><input type="radio" name="e11" value="4"></li>
	                            <li class="jum"><input type="radio" name="e11" value="3"></li>
	                            <li class="jum"><input type="radio" name="e11" value="2"></li>
	                            <li class="jum"><input type="radio" name="e11" value="1"></li>
	                        </ul>
	                        <ul>
	                            <li class="num">12</li>
	                            <li class="content">나는 이 교과의 내용을 학습하는 데 충실히 임하였다.</li>
	                            <li class="jum"><input type="radio" name="e12" value="5"></li>
	                            <li class="jum"><input type="radio" name="e12" value="4"></li>
	                            <li class="jum"><input type="radio" name="e12" value="3"></li>
	                            <li class="jum"><input type="radio" name="e12" value="2"></li>
	                            <li class="jum"><input type="radio" name="e12" value="1"></li>
	                        </ul> 
	                    </li>
	                </ul>
	            </fieldset>
	        </div>
	    </section>
	    <input type="hidden" id="avg" name="avg_eval">
	    <input type="hidden" id="sid" name="s_id" value="${s_id}" >
	    <input type="hidden" id="cid" name="c_id" value="${c_id}" >
	</form>
	<div id="dvDlg1" style="display:none">
        <label id="lblMsg1"></label>
    </div>
</body>
<script>
	$(document).ready(function(){
		$('#dvDlg1').dialog({
	        autoOpen:false, //true로 하면 대화상자가 자동으로 열리는 속성 이 메소드가 호출 false될 때까지 대화 상자는 숨겨진 상태로 유지됨
	        closeText: '다이얼로그를 닫습니다.',
	        // hide:{ effect: "fadeOut", duration: 1000}, //속성 : slideUp, explode, fadeOut
	        buttons: [
	            {
	                text:'OK',
	                icon: 'ui-icon-closethick',
	                click: function(){
	                    $(this).dialog('close');
	                }
	            }
	        ],
	        title:'Warning', //제목 설정하는 것
	        closeOnEscape : false, //esc키 막는 것
	        draggable: false, //드래그 못하게 하는 것
	        height:200, width: 450, //높이와 너비를 지정해주는 것
	        resizable: true //사이즈 조절 가능 여부
	    });
	})
	.on("click","#eval_save",function(){
		var sum = 0;
		
		for(var i = 1; i<13; i++){
			if($('input[name="e'+i+'"]:checked').val() == null){
				msg('문항을 선택을 다 해주세요!!!');
				return false;
			}
			sum += parseInt($('input[name="e'+i+'"]:checked').val());
			console.log("sum["+sum+"]");
		}
		var avg = sum/12;
		$('#avg').val(avg);
		console.log("submit 직전");
 		$("#evl").submit();
		
		
		opener.parent.location.reload();
		window.close();
		
	})
	
	function msg(text)
	{
	    $('#lblMsg1').html("&nbsp;&nbsp;&nbsp;&nbsp;<i class='fas fa-times-circle' style='color: red; font-size: 15px;'></i>"+text);
	    $('#dvDlg1').dialog('open');
	}
</script>
</html>