<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<style>
	.require {
		color : red;
	}
	
	.emp {
		cursor : pointer;
	}
	
	.emp:hover {
		color : blue;	
	}
		
</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>

<div class="row">
	<div class="col-lg-12">
		<form id="frm" name="frm" action="${not empty emp ? 'update' : 'register'}" method="post">
		
			<h3 class="mb-2">인사관리</h3>
			
			<c:if test="${not empty emp}">
				<div class="form-group">
					<label>employeeId<span class="require">*</span></label> 
					<input type="text" id="employeeId" name="employeeId" class="mb-2" value="${emp.employeeId}">
				</div>
			</c:if>
		
			<div class="form-group">
				<label>firstName<span class="require">*</span></label> 
				<input type="text" id="firstName" name="firstName" class="mb-2" value="${emp.firstName}">
			</div>
		
			<div class="form-group">
				<label>lastName<span class="require">*</span></label> 
				<input type="text" id="lastName" name="lastName" class="mb-2" value="${emp.lastName}">
			</div>
		
			<div class="form-group">
				<label>email<span class="require">*</span></label> 
				<input type="text" id="email" name="email" class="mb-2" value="${emp.email}">
			</div>
		
			<div class="form-group">
				<label>phoneNumber</label> 
				<input type="text" id="phoneNumber" name="phoneNumber" value="${emp.phoneNumber}">
			</div>
		
			<div class="form-group">
				<label>hireDate<span class="require">*</span> </label> 
				<input type="text" id="hireDate" name="hireDate" class="mb-2" value="${emp.hireDate}">
			</div>
		
			<div class="form-group">
				<label>jobId<span class="require">*</span></label> 
				<select name="jobId" class="mb-2">
					<option value=""></option>
					<c:forEach items="${opt.jobs}" var="job">
						<option value="${job.jobId}">${job.jobTitle}</option>
					</c:forEach>
				</select>
			</div>
		
			<div class="form-group">
				<label>salary</label> 
				<input type="text" id="salary" name="salary" class="mb-2" value="${emp.salary}">
			</div>
		
			<div class="form-group">
				<label>commissionPct</label> 
				<input type="text" id="commissionPct" name="commissionPct" class="mb-2" value="${emp.commissionPct}">
			</div>
		
			<div class="form-group">
				<label>managerId</label> 
				<input type="text" id="managerId" name="managerId" class="mb-2" value="${emp.managerId}">
				<input id="name"> 
				<button type="button" class="btn btn-primary" id="btnEmpSearch">
					매니저 검색</button>
			</div>
		
			<div class="form-group">
				<label>departmentId</label> <select name="departmentId" class="mb-2">
					<option value=""></option>
					<c:forEach items="${opt.depts}" var="dept">
						<option value="${dept.departmentId}">${dept.departmentName}</option>
					</c:forEach>
				</select>
			</div>
			
			<c:if test="${empty emp}">
				<button type="button" id="btnRegister" class="btn btn-secondary">등록</button>
			</c:if>
			<c:if test="${not empty emp}">
				<button type="button" id="btnRegister" class="btn btn-secondary">수정</button>
			</c:if>
		</form>
	</div>
</div>

<div class="modal" tabindex="-1" id="empModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Manager Id Search</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary">Save changes</button>
			</div>
		</div>
	</div>
</div>

<script>
	$(function() {
		
		function validation() {
			if (frm.lastName.value == ""){
				alert("이름을 입력해주세요");
				frm.lastName.focus();
				return false;
			}
			if (frm.email.value == ""){
				alert("이메일을 입력해주세요");
				frm.email.focus();
				return false;
			}	
			if (frm.hireDate.value == ""){
				alert("입사일을 입력해주세요");
				frm.hireDate.focus();
				return false;
			}	
			if (frm.jobId.value == ""){
				alert("직업을 입력해주세요");
				frm.jobId.focus();
				return false;
			}	
			
			return true;
		}
		
		// 등록 버튼
		$("#btnRegister").on("click", function() {
			if (validation() == true) {
				frm.submit();
			}
		});
		
		// 메니저 검색
		$("#btnEmpSearch").on("click", function() {
			// 검색 페이지를 ajax -> 모달 바디 넣고 -> 모달
			$.ajax({
				url : "empSearch",
				success : function(data) {
					$("#empModal .modal-body").html(data);
					$("#empModal").modal("show");
				}
			});
		});
		
		// 메니저 단건 검색
		$("#managerId").on("keydown", function(e) {
			$("#name").val("");
			
			if($("#managerId").val() == ""){
				return;
			}
			
			if(e.keyCode == 13){
				e.preventDefault();
				$.ajax({
					url : "ajaxEmp",
					data : {employeeId : $("#managerId").val()},
					success : function(data) {
						if (data) {
							$("#name").val(data.firstName);
						} else {
							$("#btnEmpSearch").click();
						}
					}
				});
			}
		});
	});
</script>