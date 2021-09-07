<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="${pageContext.request.contextPath }/resources/vendor/jquery/jquery.min.js"></script>

<script>
	$(function() {	//page ready 이벤트
		// addEventListener 계속 이벤트를 추가할 수 있다.
		$("#btn1").on("click", function(){
			$.ajax({
				url : "ajax1",
				method : "GET",		//post
				data : { writer : $("#writer").val() },
				//async : false,		// 동기식
				dataType: "json",	// plain=text, json, xml
				success: function(data){
					$("#result").append(data.content+"<br>");
					$("#result").append(data.writer+"<br>")
				}
			});
		});	// btn1 click end
	
		$("#btn2").on("click", function(){
			$.ajax({
				url : "ajax2",
				method : "POST",		//post
				data : JSON.stringify({ writer : $("#writer").val() }),
				contentType: "application/json",
				//async : false,		// 동기식
				dataType: "json",	// plain=text, json, xml
				success: function(data){
				//	$("#result").append($("<p>").append(data.content)
				//								.append("<br>")
				//								.append(data.writer));
					$("#result").append($(`<p>\${data.content}<br>\${data.writer}</p>`));
				//	$("#result").append($'<p>'+data.content+'</p>');					
				}
			});
		}); // btn2 click end
		
		// 그룹 이벤트 : 위임 -> 동적으로 추가될 태그에도 미리 이벤트를 지정
		$("#result").on("click", "p", function(){
			$(this).remove();
		});
		
	})	// end of $(function(){
</script>
</head>
<body>
	<input name="writer" id="writer">
	<button type="button" id="btn1">문자열 요청</button>
	<button type="button" id="btn2">파라미터(json)</button>
	<div id="result"></div>
	
	<script>
		
	</script>
</body>
</html>