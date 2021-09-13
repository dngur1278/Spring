<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<table border="1">
			<thead>
				<tr>
					<th>사원번호</th>
					<th>성</th>
					<th>이름</th>
					<th>이메일</th>
					<th>전화번호</th>
					<th>입사일</th>
					<th>직업</th>
					<th>급여</th>
					<th>커미션</th>
					<th>관리자번호</th>
					<th>부서번호</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="emp">
					<tr>
						<td><a href="update?employeeId=${emp.employeeId}">${emp.employeeId}</a></td>
						<td>${emp.firstName}</td>
						<td>${emp.lastName}</td>
						<td>${emp.email}</td>
						<td>${emp.phoneNumber}</td>
						<td>${emp.hireDate}</td>
						<td>${emp.jobId}</td>
						<td>${emp.salary}</td>
						<td>${emp.commissionPct}</td>
						<td>${emp.managerId}</td>
						<td>${emp.departmentId}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<a href="register" class="btn btn-default">등록</a>
</body>
</html>