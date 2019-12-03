<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
    <link rel="stylesheet" href="resources/js/jquery-ui.css">
    <link rel="stylesheet" href="resources/css/student_last.css">
    <title>학사관리시스템</title>
    <script>
        $( function() {
            $( "#tabs" ).tabs();
        });
    </script>
</head>
<body>
<%--  <%
 	Object sinfo = session.getAttribute("sinfo");
 %>   --%>
    <jsp:include page="student_nav.jsp"/>
    <section id="last_main">
        <div id="tabs">
            <ul>
                <li><a href="#tabs-1">졸업사전예고</a></li>
            </ul>
            <div id="tabs-1">
                <div id="tab1">
                    <div class="last_title1">
                        <ul>
                            <li>대학 <input type="text" class="input-field1" placeholder="휴먼대학교" disabled></li>
                            <li>소속학과 <input type="text" class="input-field1" placeholder="${sinfo.s_major }" disabled></li>
                            <li>학번 <input type="text" class="input-field1" placeholder="${sinfo.getS_id()}" disabled></li>
                            <li>학년 <input type="text" class="input-field1" placeholder="${sinfo.getS_grade()}" disabled></li>
                            <li>적용년도 <input type="text" class="input-field1" placeholder="2019년" disabled></li>
                            <li>성명 <input type="text" class="input-field1" placeholder="${sinfo.getS_name()}" disabled></li>
                        </ul>
                    </div>
                    <div class="clear"></div>
                    <br><br>
                    <hr>
                    <div class="last_content1">
                        <ul>
                            <li>교양</li>
                            <li>전공</li>
                        </ul>
                    </div>
                    <hr>
                    <div class="clear"></div>
                    <div class="last_content2">
                        <ul>
                            <li></li>
                            <li>필수</li>
                            <li>선택</li>
                            <li>교양 소계</li>
                            <li>필수</li>
                            <li>선택</li>
                            <li>전공 소계</li>
                            <li>합계</li>
                        </ul>
                    </div>
                    <hr>
                    <div class="clear"></div>
                    <div class="last_content3">
                        <ul>
                            <li>기준학점</li>
                            <li>16</li>
                            <li>14</li>
                            <li>30</li>
                            <li>55</li>
                            <li>45</li>
                            <li>100</li>
                            <li>130</li><hr>
                        </ul>
                        <ul>
                            <li>취득학점</li>
                            <li>${sog}</li>
                            <li>0</li>
                            <li>${sog+0 }</li>
                            <li>${som }</li>
                            <li>0</li>
                            <li>${som+0}</li>
                            <li>${sog+som}</li><hr>
                        </ul>
                        <ul>
                            <li>부족학점</li>
                            <li>${16-sog }</li>
                            <li>14</li>
                            <li>${30-sog }</li>
                            <li>${55-som }</li>
                            <li>45</li>
                            <li>${100-som }</li>
                            <li>${130-(sog+som) }</li><hr>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
     <script>
        var acc = document.getElementsByClassName("accordion");
        var i;
        
        for (i = 0; i < 2; i++) {
          acc[i].addEventListener("click", function() {
            this.classList.toggle("active");
            var panel = this.nextElementSibling;
            if (panel.style.maxHeight){
              panel.style.maxHeight = null;
            } else {
              panel.style.maxHeight = panel.scrollHeight + "px";
            } 
          });
        }
    </script> 
</body>
</html>