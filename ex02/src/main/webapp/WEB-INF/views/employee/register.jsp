<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Employees Register</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">

			<div class="panel-heading">Employees Register</div>
			<!-- /.panel-heading -->
			<div class="panel-body">

				<form role="form" action="register" method="post">
					<div class="form-group">
						<label>Employee ID</label> 
						<input class="form-control" name="employeeId">
					</div>
					
					<div class="form-group">
						<label>First Name</label> 
						<input class="form-control" name="firstName">
					</div>
					
					<div class="form-group">
						<label>Last Name</label>
						<input class="form-control" name="lastName">
					</div>
					
					<div class="form-group">
						<label>Email</label> 
						<input class="form-control" name="email">
					</div>
					
					<div class="form-group">
						<label>Phone Number</label> 
						<input class="form-control" name="phoneNumber">
					</div>
					
					<div class="form-group">
						<label>Hire Date</label> 
						<input class="form-control" name="hireDate">
					</div>
					
					<div class="form-group">
						<label>Job ID</label> 
						<input class="form-control" name="jobId">
					</div>
					
					<div class="form-group">
						<label>Salary</label> 
						<input class="form-control" name="salary">
					</div>
					
					<div class="form-group">
						<label>Department ID</label> 
						<input class="form-control" name="departmentId">
					</div>
					
					<button type="submit" class="btn btn-default">Submit Button</button>
					<button type="reset" class="btn btn-default">Reset Button</button>
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