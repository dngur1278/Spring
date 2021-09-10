<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서관리</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<h3>부서관리</h3>
	<div id="list">
	
	</div>
	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">부서 등록</button>
	
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">부서등록</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<label for="recipient-name" class="col-form-label">부서번호</label>
							<input type="text" class="form-control" id="departmentId" name="departmentId">
						</div>
						
						<div class="form-group">
							<label for="message-text" class="col-form-label">부서명</label>
							<input type="text" class="form-control" id="departmentName" name="departmentName">
						</div>
						
						<div class="form-group">
							<label for="message-text" class="col-form-label">매니저 번호</label>
							<input type="text" class="form-control" id="maangerId" name="maangerId">
						</div>
						
						<div class="form-group">
							<label for="message-text" class="col-form-label">회사주소번호</label>
							<input type="text" class="form-control" id="locationId" name="locationId">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary">등록</button>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		$(function() {
			deptList();
			
			//목록조회
			function deptList() {
				$.ajax({
					url : "deptList",
					dataType: "json",
					success : function(datas) {
						$.each(datas , function(i, data) {
							$("<div>").append( $("<label>").text("부서번호:") )
									  .append( $("<span>").html(data.departmentId) )
									  .append( " / " )
									  .append( $("<label>").text("부서명:") )
									  .append( $("<span>").html(data.departmentName))
									  .append( " / " )
									  .append( $("<label>").text("매니저 번호:") )
									  .append( $("<span>").html(data.managerId) )
									  .append( " / " )
									  .append( $("<label>").text("회사주소번호:") )
									  .append( $("<span>").html(data.locationId) )
									  .append( $("<hr/>") )
									  .appendTo($("#list"))
						});
					}
				});
			}	
			
			//등록
			
			//수정
		});
	</script>
</body>
</html>