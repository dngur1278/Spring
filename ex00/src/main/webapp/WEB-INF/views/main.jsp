<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	메인페이지 입니다.
	<form action="login">
		<input type="text" name="id" value="${param.id }">
		<input type="password" name="pw">
		<button>로그인</button>
	</form>
</body>
</html>