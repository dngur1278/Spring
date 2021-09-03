<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ include file="/WEB-INF/views/includes/header.jsp"%>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">게시글 상세보기</h1>
	</div>
	<table class="table table-bordered col-md-8">
		<tr>
			<th class="active col-md-2">번호</th>
			<td class="col">${board.bno }</td>
		</tr>
		<tr>
			<th class="active">제목</th>
			<td >${board.title }</td>
		</tr>
		<tr>
			<th class="active">내용</th>
			<td>${board.content }</td>
		</tr>
		<tr>
			<th class="active">글쓴이</th>
			<td>${board.writer }</td>
		</tr>
		<tr>
			<th class="active">작성일</th>
			<td>
				<fmt:formatDate value="${board.regdate }" type="both" pattern="yyyy-MM-dd [E]"/>
			</td>
		</tr>
		<tr>
			<th class="active">수정일</th>
			<td>
				<fmt:formatDate value="${board.updatedate }" type="both" pattern="yyyy-MM-dd [E]"/>
			</td>
		</tr>
	</table>
</div>
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>