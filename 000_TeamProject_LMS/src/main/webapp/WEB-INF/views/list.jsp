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
    <link rel="shortcut icon" href="data:image/x-icon;," type="image/x-icon">
    <link rel="stylesheet" href="resources/js/jquery-ui.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
    <link rel="stylesheet" href="resources/css/admin_board.css">
<title>학사관리시스템</title>
<style>
	.allList{margin-top:10px;}
	##nextBtn{margin-left:5px;}
	#pagingBtn{margin-left:550px;}
	#pagingBtn a{float:left;}
	#write{position: absolute;right: 17%;margin-top: 30px;}
</style>
</head>
<body>
<%
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
    <section>
    	<div id='wrap'>
            <ul>
                <li id="img11"><img src="resources/images/notice.png" alt="notice"></li>
                <div class='clear'></div>
                <div id='enroll-info'>
                    <select id='info'>
                        <option value='searchTitleAndContent'>제목+내용</option>
                        <option value='searchTitle'>제목</option>
                        <option value='searchContent'>내용</option>
                    </select>
                    <input type="text" id="enroll-input" placeholder="검색어 입력">
                    <button type="submit" id=searchBtn></button>
                </div>
                <div class='clear'></div>
                <li>
                    <div id="enroll-board">
                        <ul id='board'>
                            <li>
                                <ul>
                                    <li>번호</li>
                                    <li>제목</li>
                                    <li>글쓴이</li>
                                    <li>날짜</li>
                                    <li>조회수</li>
                                </ul>
                            </li>
                            <div class='clear'></div>
                            <c:choose>
	                            <c:when test="${count == '0'}">	
	                           		<li>   	등록된 글이 없습니다. </li>
	                           	</c:when>
	                           	<c:otherwise>
		                            <li id="boardList">
		                                <c:forEach items="${list}" var="board" end="9">
			                                <ul id="forHidden">
			                                    <li>${board.bno}</li>
			                                    <li class='left'><a href='view?bno=${board.bno}&pageNum=${pageNum}'>${board.btitle}</a></li>
			                                    <li>${board.bname}</li>
			                                    <li>${board.bdate}</li>
			                                    <li>${board.bhit}</li>
			                                </ul>
		                                </c:forEach>
		                            </li>
		                            <div id="lists"></div>
	                            </c:otherwise>
                            </c:choose>
                            <div class='clear'></div>
                        </ul>
                    </div>
                </li>
                <div class='clear'></div>
                <li id='pagingBtn'>
                    <c:choose>
                    	<c:when test="${pageNum ==1 }">
	                    </c:when>
	                    <c:otherwise>
		                    <a id='prev' href='numberPaging?pageNum=${pageNum-1}'>prev</a>
	                    </c:otherwise>
                    </c:choose>
                        <ul id = "paging_num">
                            <div id="pagingBtn"></div>
                        </ul>
                        <div id="nextBtn">${outprint}</div>
                        <ul id="write_button">
                        <%
                        	if(userType.equals("a")){
                    	%>		
                        	<li><input type="button" id="write" onclick="location.href='writer_page1'"  value="글쓰기"></li>	
                        <%  }  %>
                        </ul>
                    </div>
                </li>
            </ul>
        </div>
    </section>
    <div id=""></div>
</body>
<script src="resources/js/menu.js"></script>
<!-- 게시판 더보기 -->
<script type="text/javascript">
		//게시판 검색
		$(function(){
			$('#searchBtn').click(function(){
				if($('#enroll-input').val()==''){
					location.href='numberPaging?pageNum=1';
				}else{
					var searchVal = $('#info option:selected').val();
					var inputVal = $('#enroll-input').val();
					var inputValCut = inputVal.split(" ");
		
					console.log("searchBtn Click");
					console.log('length : '+inputValCut[1]);
					console.log("검색 옵션 값 : "+inputVal);
					
					obj={};
					//for(var i=0;i<searchValCut.length;i++){
						obj['selectVal'] = searchVal;
						obj['searchVal1'] = inputValCut[0];
						obj['searchVal2'] = inputValCut[1];
						obj['searchVal3'] = inputValCut[2];
					//}
					console.log('obj : '+obj['searchVal1']);
					$.get('searchAJAX',obj,function(search){
						$('#research').remove();
						if(search.length==0){
							$('#research').remove();
							$('#lists').append("<ul> 검색 결과가 없습니다. </ul>");
							$('#boardList').css("display","none");
							$('.allList').css("display","none");
							$('#next').css("display","none");
							$('#prev').css("display","none");
						}else {
							for(var i=0;i<search.length;i++){
								console.log('search.length : '+search.length);
								var bno = search[i]['bno'];
					         	var btitle = search[i]['btitle'];
					         	var bname = search[i]['bname'];
					         	var bdate = search[i]['bdate'];
					         	bdate.format("yyyy-MM-dd");
					         	var bhit = search[i]['bhit'];
					         	console.log("result check : bno - "+bno+", btitle - "+btitle+", bname - "+bname+", bdate - "+bdate+", bhit - "+bhit);
					         	$('#boardList').css("display","none");
					         	$('.allList').css("display","none");
					         	$('#next').css("display","none");
					         	$('#prev').css("display","none");
					         	$('#lists').append("<ul id='research'><li>"+bno+"</li><li class='left'><a href='view?bno="+bno+"'>"+btitle+"</a></li><li>"+bname+"</li><li>"+bdate+"</li><li>"+bhit+"</li></ul>");
							}
						}
					},'Json');
				}
			});
		});
	
	
	//버튼 페이징
    var gStartrow=4;
    var lineCount=4;
    $(document).on('click','#showMore',function(){
	    var obj={};
	       obj['startrow']=startrow;
	       obj['lineCount']=lineCount;
	       $.get('boardAJAX',obj,function(jsonPlace1){
	          for(var i=0;i<=jsonPlace1.length;i++){
	         	 var bno = jsonPlace1[i]['bno'];
	         	 var btitle = jsonPlace1[i]['btitle'];
	         	 var bname = jsonPlace1[i]['bname'];
	         	 var bdate = jsonPlace1[i]['bdate'];
	         	 var bhit = jsonPlace1[i]['bhit'];
	         	 $('#lists').before("<ul><li>"+bno+"</li><li class='left'><a href='view?bno="+bno+"'>"+btitle+"</a></li><li>"+bname+"</li><li>"+bdate+"</li><li>"+bhit+"</li></ul>");
	          }
	       },'Json');
       lineCount+=3;
    });
    
    
  //번호페이징
	$(function(){
		var pagingCount1=0;
		var checkLength = Math.ceil(${count}%10);
		var realLength = Math.ceil(${count}/10);
		
		console.log("realLength : "+realLength);
		console.log("checkLength1 : "+checkLength);
		console.log("checkLength2 : "+(checkLength==0));
		if(checkLength==0){
			pagingCount1=realLength;
		}else{
			pagingCount1=realLength;
		};
		for(var i=0;i<pagingCount1;i++){
			console.log("pagingCount : "+pagingCount1);
			var pageNum = (i+1);
			$('#paging_num').before("<a class='allList' class='page"+pageNum+"' href='numberPaging?pageNum="+pageNum+"'>[ "+pageNum+" ]</a>");
		};
		if(${pageNum}!=realLength){
			$('#nextBtn').before("<a id='next' class='allList' href='numberPaging?pageNum="+(${pageNum}+1)+"'>next</a>");
		}
	});
  	
  	$(document)
  	.on("keyup","#enroll-input",function(e){
  		if(e.keyCode == 13){
  			if($('#enroll-input').val()==''){
				location.href='numberPaging?pageNum=1';
			}else{
				var searchVal = $('#info option:selected').val();
				var inputVal = $('#enroll-input').val();
				var inputValCut = inputVal.split(" ");
	
				console.log("searchBar press Enter");
				console.log('length : '+inputValCut[1]);
				console.log("검색 옵션 값 : "+inputVal);
				
				obj={};
				//for(var i=0;i<searchValCut.length;i++){
					obj['selectVal'] = searchVal;
					obj['searchVal1'] = inputValCut[0];
					obj['searchVal2'] = inputValCut[1];
					obj['searchVal3'] = inputValCut[2];
				//}
				console.log('obj : '+obj['searchVal1']);
				$.get('searchAJAX',obj,function(search){
					if(search.length==0){
						$('#lists').empty();
						$('#lists').append("<ul> 검색 결과가 없습니다. </ul>");
						$('#boardList').css("display","none");
						$('.allList').css("display","none");
						$('#next').css("display","none");
						$('#prev').css("display","none");
					}else {
						$('#lists').empty();
						for(var i=0;i<search.length;i++){
							console.log('search.length : '+search.length);
							var bno = search[i]['bno'];
				         	var btitle = search[i]['btitle'];
				         	var bname = search[i]['bname'];
				         	var bdate = search[i]['bdate'];
				         	var bhit = search[i]['bhit'];
				         	console.log("result check : bno - "+bno+", btitle - "+btitle+", bname - "+bname+", bdate - "+bdate+", bhit - "+bhit);
				         	$('#boardList').css("display","none");
				         	$('.allList').css("display","none");
				         	$('#next').css("display","none");
				         	$('#prev').css("display","none");
				         	$('#lists').append("<ul id='research'><li>"+bno+"</li><li class='left'><a href='view?bno="+bno+"'>"+btitle+"</a></li><li>"+bname+"</li><li>"+bdate+"</li><li>"+bhit+"</li></ul>");
						}
					}
				},'Json');
			}
  		}
  	});


</script>

</html>