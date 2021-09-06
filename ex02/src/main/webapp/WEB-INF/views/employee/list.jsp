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
			<div class="panel-heading">
				Employees List Page
				<button id="regBtn" type="button" class="btn btn-xs pull-right">Register
					New Employees</button>
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
								<td><a class="move" href="${employee.employeeId}">${employee.firstName }</a></td>
								<td>${employee.email }</td>
								<td>${employee.jobId }</td>
								<td><fmt:formatDate value="${employee.hireDate }"
										type="both" pattern="yyyy-MM-dd [E]" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
				<div class="row">
					<div class="col-lg-12">				
						<form id="actionForm" action="list" method="get">
							<select name="type">
								<option value="" ${pageMaker.cri.type == null ? 'selected':''}>--</option>
								<option value="E" ${pageMaker.cri.type eq 'E' ? 'selected':''}>사원번호</option>
								<option value="J" ${pageMaker.cri.type eq 'J' ? 'selected':''}>직업</option>
								<option value="H" ${pageMaker.cri.type eq 'H' ? 'selected':''}>입사일</option>
								<option value="EJ" ${pageMaker.cri.type eq 'EJ' ? 'selected':''}>사원번호 or 직업</option>
								<option value="EH" ${pageMaker.cri.type eq 'EH' ? 'selected':''}>사원번호 or 입사일</option>
								<option value="EJH" ${pageMaker.cri.type eq 'EJH' ? 'selected':''}>사원번호 or 직업 or 입사일</option>
							</select>
							<input type="text" name="keyword" value="${pageMaker.cri.keyword}">
							<input type="hidden" name="pageNum" value="1"> 
							<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
							<button class="btn btn-default">Search</button>
						</form>
					</div>
				</div>

				<div class="pull-right">
					<div id="pageButton">
						<ul class="pagination">
							<c:if test="${pageMaker.prev}">
								<li class="paginate_button previous"><a
									href="${pageMaker.startPage-1}">이전</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage}"
								end="${pageMaker.endPage}" var="num">
								<li class="paginate_button"><a href="${num}">${num}</a></li>
							</c:forEach>

							<c:if test="${pageMaker.next }">
								<li class="paginate_button next"><a
									href="${pageMaker.endPage+1 }">다음</a></li>
							</c:if>
						</ul>
					</div>
				</div>

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
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
								<button type="button" class="btn btn-primary">Save
									changes</button>
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
		var actionForm = $('#actionForm');
		
		$('.move').on("click", function(e) {
			e.preventDefault();
			var employeeId = $(this).attr("href");
			actionForm.append('<input type="hidden" name="employeeId" value="'+ employeeId +'">');
			actionForm.attr("action", "get");
			actionForm.submit();
		});
		
		$('#pageButton a').on("click", function(e) {
			e.preventDefault();
			var p = $(this).attr("href");
			$('[name="pageNum"]').val(p);
			actionForm.submit();
		});
		
		/* $('#board').DataTable({
			responsive : true
		}); */
	});
</script>

<script type="text/javascript">
	$(document).ready(function() {
		var result = '<c:out value="${result}"/>';

		checkModal(result);

		history.replaceState({}, null, null);

		function checkModal(result) {

			if (result == '' || history.state) {
				return;
			}

			if (parseInt(result) > 0) {
				$(".modal-body").html(parseInt(result) + "번 사원이 등록되었습니다.");
			}

			$("#myModal").modal("show");
		}

		$("#regBtn").on("click", function() {
			location.href = "register";
		});
	});
</script>
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>