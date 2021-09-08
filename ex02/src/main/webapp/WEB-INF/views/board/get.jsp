<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
						<label>Bno</label> <input class="form-control" name="bno"
							value="${board.bno}" readonly="readonly">
					</div>

					<div class="form-group">
						<label>Title</label> <input class="form-control" name="title"
							value="${board.title}">
					</div>

					<div class="form-group">
						<label>Text area</label>
						<textarea class="form-control" rows="3" name="content">${board.content}</textarea>
					</div>

					<div class="form-group">
						<label>Writer</label> <input class="form-control" name="writer"
							value="${board.writer}" readonly="readonly">
					</div>

					<input type="hidden" name="pageNum" value="${cri.pageNum}">
					<input type="hidden" name="amount" value="${cri.amount}">

					<button type="submit" class="btn btn-default">Modify</button>
					<button type="submit" formaction="delete" class="btn btn-danger">Remove</button>
					<a class="btn btn-info"
						href="list?pageNum=${cri.pageNum}&amount=${cri.amount}">List</a>
				</form>
			</div>

			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<i class="fa fa-comments fa-fw"></i> Reply
						</div>
						<form id="replyForm">
							<input type="hidden" name="bno" value="${board.bno}"> <input
								name="replyer" value="user10"> <input name="reply">
							<button id="saveReply" class="btn btn-primary btn-xs pull-right">댓글
								등록</button>
						</form>
						<div class="panel-body">
							<ul class="chat">

							</ul>
						</div>
						
						<div class="panel-footer">
						
						</div>
					</div>
				</div>
			</div>
			<!-- end panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<script>
	let bno = "${board.bno}";
	$(function() {
		//등록처리
		$("#saveReply").on("click", function() {
			$.ajax({
				url : "../reply/",
				method : "post",
				data : $("#replyForm").serialize(),
				dataType : "json",
				success : function(data) {
					$('.chat').append(makeLi(data));
				}
			});
		});

		function makeLi(data) {
			return '<li class="left clearfix">' 
					+ '	<div>'
					+ '		<div class="header">'
					+ '			<strong class="primary-font">' + data.replyer + '</strong>' 
					+ '			<small class="pull-right text-muted">' + data.replyDate + '</small>' 
					+ '		</div>' 
					+ '		<p>' + data.reply + '</p>' 
					+ '	</div>' 
					+ '</li>';
		}

		// 목록조회
		$.ajax({
			url : "../reply/",
			data : {
				bno : bno
			}, //"bno=1"
			dataType : "json",
			success : function(datas) {
				console.log(datas);
				str = "";
				for (i = 0; i < datas.list.length; i++) {
					str += makeLi(datas.list[i]);
				}
				$(".chat").html(str);
			}
		});
		
		var pageNum = 1;
		var replyPageFooter = $(".panel-footer");
		
	});
</script>

<%@ include file="/WEB-INF/views/includes/footer.jsp"%>