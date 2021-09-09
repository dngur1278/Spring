<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정규표현식 테스트</title>

<script src="${pageContext.request.contextPath }/resources/vendor/jquery/jquery.min.js"></script>

</head>
<body>
	<input type="text" id="pass" name="pass">
	<button type="button" id="btnCheck">확인</button>
	
	<script>
		var passRule = /^[A-Za-z0-9]{6,12}$/;//숫자와 문자 포함 형태의 6~12자리 이내의 암호 정규식
	 
		$("#btnCheck").on("click", function() {
			if(!passRule.test($("#pass").val())) {
		   		//경고
		   		alert("ERROR 올바른 방식으로 입력해주세요.");
		    	return flase;
			}
		});
	</script>
</body>
</html>