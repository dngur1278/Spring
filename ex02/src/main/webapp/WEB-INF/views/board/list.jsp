<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>

<!-- DataTables CSS -->
<link
	href="${pageContext.request.contextPath}/resources/vendor/datatables-plugins/dataTables.bootstrap.css"
	rel="stylesheet">

<!-- DataTables Responsive CSS -->
<link
	href="${pageContext.request.contextPath}/resources/vendor/datatables-responsive/dataTables.responsive.css"
	rel="stylesheet">

<!-- DataTables JavaScript -->
<script
	src="${pageContext.request.contextPath}/resources/vendor/datatables/js/jquery.dataTables.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/vendor/datatables-responsive/dataTables.responsive.js"></script>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">게시판</h1>
	</div>
</div>
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Board List Page
				<button id="regBtn" type="button" 
					class="btn btn-info btn-xs pull-right">Register New Board</button>
			</div>
			<div class="panel-body">
				<table id="board"
					class="table table-striped table-bordered table-hover"
					style="width: 100%">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성일</th>
							<th>댓글수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="board">
							<tr>
								<td>${board.bno}</td>
								<td><a class="move" href="${board.bno}">${board.title}</a></td>
								<td><fmt:formatDate value="${board.regdate}" type="both"
										pattern="yyyy-MM-dd [E]" /></td>
								<td>${board.replyCnt}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
				<div class="row">
					<div class="col-lg-12">
						<form id="actionForm" action="list" method="get">
							<select name ="type">
								<option value="" ${pageMaker.cri.type == null ? 'selected':'' }>--</option>
								<option value="T" ${pageMaker.cri.type eq 'T'?'selected':'' }>제목</option>
								<option value="C" ${pageMaker.cri.type eq 'C'?'selected':'' }>내용</option>
								<option value="W" ${pageMaker.cri.type eq 'W'?'selected':'' }>작성자</option>
								<option value="TC" ${pageMaker.cri.type eq 'TC'?'selected':'' }>제목 or 내용</option>
								<option value="TW" ${pageMaker.cri.type eq 'TW'?'selected':'' }>제목 or 작성자</option>
								<option value="TWC" ${pageMaker.cri.type eq 'TCW'?'selected':'' }>제목 or 내용 or 작성자</option>
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
								<li class="paginate_button previous">
									<a href="${pageMaker.startPage-1}">이전</a>
								</li>
							</c:if>
							
							<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="num">
								<li class="paginate_button">
									<a href="${num}">${num}</a>
								</li>
							</c:forEach>
							
							<c:if test="${pageMaker.next }">
								<li class="paginate_button next">
									<a href="${pageMaker.endPage+1 }">다음</a>
								</li>
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
		var actionForm = $("#actionForm");
		
		$('.move').on("click", function(e){
			e.preventDefault();
			var bno = $(this).attr("href");
			actionForm.append('<input type="hidden" name="bno" value="'+ bno +'">');
			actionForm.attr("action", "get");
			actionForm.submit();
		});
		
		$("#pageButton a").on("click", function(e){
			e.preventDefault();		// a, submit
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
		
		history.replaceState({},null,null);
		
		function checkModal(result){
			
			if(result == '' || history.state){
				return;
			}
			
			if(parseInt(result) > 0) {
				$(".modal-body").html("게시글 " + parseInt(result) + "번이 등록되었습니다.");
			}
			
			$("#myModal").modal("show");
		}
		
		$("#regBtn").on("click", function() {
			location.href = "register";
		});
	});
</script>
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>