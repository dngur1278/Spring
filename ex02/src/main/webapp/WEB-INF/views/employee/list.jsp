<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>

<!-- DataTables CSS -->
<link
	href="${pageContext.request.contextPath }/resources/vendor/datatables-plugins/dataTables.bootstrap.css"
	rel="stylesheet">

<!-- DataTables Responsive CSS -->
<link
	href="${pageContext.request.contextPath }/resources/vendor/datatables-responsive/dataTables.responsive.css"
	rel="stylesheet">

<!-- DataTables JavaScript -->
<script
	src="${pageContext.request.contextPath }/resources/vendor/datatables/js/jquery.dataTables.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/vendor/datatables-responsive/dataTables.responsive.js"></script>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">인사관리</h1>
	</div>
</div>
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Employees List Page
				<button id="regBtn" type="button" 
					class="btn btn-xs pull-right">Register New Employees</button>
			</div>
			<div class="panel-body">
				<table id="board"
					class="table table-striped table-bordered table-hover"
					style="width: 100%">
					<thead>
						<tr>
							<th>사원번호</th>
							<th>이름</th>
							<th>이메일</th>
							<th>직업</th>
							<th>입사일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list }" var="employee">
							<tr>
								<td>${employee.employeeId }</td>
								<td><a href="get?employeeId=${employee.employeeId }">${employee.firstName }</a></td>
								<td>${employee.email }</td>
								<td>${employee.jobId }</td>
								<td><fmt:formatDate value="${employee.hireDate }" type="both"
										pattern="yyyy-MM-dd [E]" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<!-- Modal 추가 -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<h4 class="modal-title" id="myModalLabel">Modal title</h4>
							</div>
							<div class="modal-body">처리가 완료되었습니다.</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
								<button type="button" class="btn btn-primary">Save changes</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	$(function() {
		$('#board').DataTable({
			responsive : true
		});
	});
</script>

<script type="text/javascript">
	$(document).ready(function() {
		var result = '<c:out value="${result}"/>';
		
		checkModal(result);
		
		history.replaceState({},null,null);
		
		function checkModal(result){
			
			if(result == '' || history.state){
				return;
			}
			
			if(parseInt(result) > 0) {
				$(".modal-body").html( parseInt(result) + "번 사원이 등록되었습니다.");
			}
			
			$("#myModal").modal("show");
		}
		
		$("#regBtn").on("click", function() {
			location.href = "register";
		});
	});
</script>
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>