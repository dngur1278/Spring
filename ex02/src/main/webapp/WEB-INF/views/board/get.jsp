<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ include file="/WEB-INF/views/includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Board Read</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">

			<div class="panel-heading">Board Modify Page</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<form role="form" action="modify" method="post">
	                <div class="form-group">
	                    <label>Bno</label> 
	                    <input class="form-control" name="bno" value="${board.bno}" readonly="readonly">
	                </div>
	                
	                <div class="form-group">
						<label>Title</label> 
						<input class="form-control" name="title" value="${board.title}">
					</div>
	                
	                <div class="form-group">
						<label>Text area</label> 
						<textarea class="form-control" rows="3" name="content">${board.content}</textarea>
					</div>
	
	                <div class="form-group">
	                    <label>Writer</label>
	                    <input class="form-control" name="writer" value="${board.writer}" readonly="readonly">
	                </div>
	       			
	       			<input type="hidden" name="pageNum" value="${cri.pageNum}">
					<input type="hidden" name="amount" value="${cri.amount}">
	                
	                <button type="submit" class="btn btn-default">Modify</button>
	                <button type="submit" formaction="delete" class="btn btn-danger">Remove</button>
	                <a class="btn btn-info" href="list?pageNum=${cri.pageNum}&amount=${cri.amount}">List</a>
	        	</form>
			</div>
			<!-- end panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<%@ include file="/WEB-INF/views/includes/footer.jsp"%>