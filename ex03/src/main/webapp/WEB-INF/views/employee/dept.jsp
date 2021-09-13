<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서관리</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
	<h3>부서관리</h3>
	<div id="list"></div>
	<button type="button" class="btn btn-primary" data-toggle="modal"
		data-target="#deptInsertModal">부서 등록</button>
	
	<button type="button" class="btn btn-success" data-toggle="modal"
		data-target="#deptUpdateModal">부서 수정</button>

	<!-- Modal -->
	<div class="modal fade" id="deptInsertModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">부서등록</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="form1">
						<div class="form-group">
							<label for="message-text" class="col-form-label">부서명</label> <input
								type="text" class="form-control" id="departmentName"
								name="departmentName">
						</div>

						<div class="form-group">
							<label for="message-text" class="col-form-label">매니저 번호</label> <input
								type="text" class="form-control" id="managerId" name="maangerId">
						</div>

						<div class="form-group">
							<label for="message-text" class="col-form-label">회사주소번호</label> <input
								type="text" class="form-control" id="locationId"
								name="locationId">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary" id="deptInsert">등록</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 수정 Modal -->
	<div class="modal fade" id="deptUpdateModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">부서수정</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="form1">
						<div class="form-group">
							<label for="message-text" class="col-form-label">부서번호</label> <input
								type="text" class="form-control" id="departmentId"
								name="departmentId">
						</div>
					
						<div class="form-group">
							<label for="message-text" class="col-form-label">부서명</label> <input
								type="text" class="form-control" id="departmentName"
								name="departmentName">
						</div>

						<div class="form-group">
							<label for="message-text" class="col-form-label">매니저 번호</label> <input
								type="text" class="form-control" id="managerId" name="managerId">
						</div>

						<div class="form-group">
							<label for="message-text" class="col-form-label">회사주소번호</label> <input
								type="text" class="form-control" id="locationId"
								name="locationId">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary" id="deptUpdate">수정</button>
				</div>
			</div>
		</div>
	</div>

	<script>
		$(function() {

			deptList();
			
			deptInsert();
			
			deptUpdate();
			
			deptDelete();
			
			deptRead();
			
		});
		
		//목록조회
		function deptList() {
			$.ajax({
				url : "deptList",
				dataType : "json",
				success : function(datas) {
					$.each(datas, function(i, data) {
						$("<div>").append($("<label>").text("부서번호:")).append(
								$("<span>").html(data.departmentId)).append(
								" / ").append($("<label>").text("부서명:"))
								.append($("<span>").html(data.departmentName))
								.append(" / ").append(
										$("<label>").text("매니저 번호:")).append(
										$("<span>").html(data.managerId))
								.append(" / ").append(
										$("<label>").text("회사주소번호:")).append(
										$("<span>").html(data.locationId))
								.append($("<hr/>")).appendTo($("#list"))
					});
				}
			});
		}

		//등록
		function deptInsert() {
			$("#deptInsert").on("click", function(e) {
				e.preventDefault();
				
				var departmentName = $("#departmentName").val();
				var managerId = $("#managerId").val();
				var locationId = $("#locationId").val();
				$.ajax({
					url : "deptInsert",
					method : "POST",
					dataType : "json",
					data : JSON.stringify({ departmentName : departmentName,
											managerId : managerId,
											locationId, locationId}),
					contentType : "application/json",
					success : function(data) {
						console.log(data);
						if (data.result = true) {
							$("#deptInsertModal").modal("hide");
							deptList();
						}
					},
					error : function() {
						alert("에러!!!");
					}
				});
			});
		}
		
		//한건 조회
		function deptRead() {
			$("#departmentId").on("keydown", function(e) {
				
				if($("#departmentId").val() == "") {
					return;
				}
				
				if (e.keyCode == 13) {
					e.preventDefault();

					var departmentId = $("#departmentId").val();
					
					$.ajax({
						url : "deptRead",
						dataType : "json",
						data : {departmentId : departmentId},
						success : function(datas) {
							console.log(datas);
							$("input[name=departmentName]").val(datas.departmentName);
							$("input[name=managerId]").val(datas.managerId);
							$("input[name=locationId]").val(datas.locationId);
						}
					});
				}
			});
		}
		
		//수정
		function deptUpdate(){
			$("#deptUpdate").on("click", function(e){
				
				e.preventDefault();
				
				var departmentId = $("input[name=departmentId]").val();
				var departmentName = $("input[name=departmentName]").val();
				var managerId = $("input[name=managerId]").val();
				var locationId = $("input[name=locationId]").val();
				
				$.ajax({
					url : "deptUpdate",
					method : "POST",
					dataType : "json",
					data : JSON.stringify({ departmentId: departmentId,
											departmentName : departmentName,
											managerId : managerId,
											locationId : locationId}),
					contentType : "application/json",
					success : function(data) {
						if (data.result = true) {
							$("#deptUpdateModal").modal("hide");
							$("#list").empty();
							deptList();
						}
					}, error : function () {
						alert("에러!");
					}
				});
			});
		}
		
		//삭제
		function deptDelete() {
			
		}
	</script>
</body>
</html>