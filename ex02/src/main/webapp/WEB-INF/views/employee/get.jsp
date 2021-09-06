<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ include file="/WEB-INF/views/includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Employees Modify</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">

			<div class="panel-heading">Employees Modify Page</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<form role="form" action="modify" method="post">
	                <div class="form-group">
						<label>Employee ID</label> 
						<input class="form-control" name="employeeId" value="${employee.employeeId }" readonly="readonly">
					</div>
					
					<div class="form-group">
						<label>First Name</label> 
						<input class="form-control" name="firstName" value="${employee.firstName }" readonly="readonly">
					</div>
					
					<div class="form-group">
						<label>Last Name</label>
						<input class="form-control" name="lastName" value="${employee.lastName }" readonly="readonly">
					</div>
					
					<div class="form-group">
						<label>Email</label> 
						<input class="form-control" name="email" value="${employee.email }">
					</div>
					
					<div class="form-group">
						<label>Phone Number</label> 
						<input class="form-control" name="phoneNumber" value="${employee.phoneNumber }">
					</div>
					
					<div class="form-group">
						<label>Job ID</label> 
						<input class="form-control" name="jobId" value="${employee.jobId }">
					</div>
					
					<div class="form-group">
						<label>Salary</label> 
						<input class="form-control" name="salary" value="${employee.salary }">
					</div>
					
					<div class="form-group">
						<label>Department ID</label> 
						<input class="form-control" name="departmentId" value="${employee.departmentId }">
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