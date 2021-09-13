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
				
				<!-- 첨부파일 -->
				<div>
					<c:forEach items="${board.attachList}" var="attach">
						<a href="download?uuid=${attach.uuid}">${attach.fileName}</a>
					</c:forEach>
				</div>
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
	$(function() {
		
		let bno = "${board.bno}";
		let replyCnt = ${board.replyCnt};
		let re = $(".chat");
		
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
		
		//등록처리
		$("#saveReply").on("click", function(e) {
			e.preventDefault();
			
			let reply = $("input[name='reply']").val();
			let replyer = $("input[name='replyer']").val();
			
			if (reply == "" || replyer == "") {
				return;
			}
			
			$.ajax({
				url : "../reply/",
				method : "post",
				data : $("#replyForm").serialize(),
				dataType : "json",
				success : function(data) {
					
					$.ajax({
						url: "../reply/",
						method: "get",
						dataType: "json",
						success : function(data) {
							console.log(data);
							replyCnt = data;
							showList(1, replyCnt);
						},
						error : function() {
							console.error();
						}
					});
				},
				error : function(){
					alert("등록 실패");
				}
			});
		});
		
		var pageNum = 1;
		var replyPageFooter = $(".panel-footer");
		
		//페이징 처리 부분
		function showReplyPage(replyCnt, pageNum) {
			
			var endNum = Math.ceil(pageNum / 10.0) * 10;
			var startNum = endNum - 9;
			
			var prev = startNum != 1;
			var next = false;
			
			if (endNum * 10 >= replyCnt) {
				endNum = Math.ceil(replyCnt/10.0);
			}
			
			if (endNum * 10 < replyCnt) {
				next = true;
			}
			
			var str = "<ul class='pagination pull-right'>";
			
			if (prev) {
				str += "<li class='page-item'> <a class='page-link' href='"+(startNum -1)+"'>Previous</a></li>"
			}
			
			for(var i = startNum; i <= endNum; i++){
				var active = pageNum == i ? "active" : "";
				
				str += "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
			}
			
			if (next) {
				str += "<li class='page-item'> <a class='page-link' href='"+(endNum + 1)+"'>Next</a></li>";
			}
			
			str += "</ul></div>"
			
			console.log(str);
			
			replyPageFooter.html(str);
		}
		
		// 댓글 보여주기
		function showList(pageNum, replyCnt){
			//초기화
			$('.chat').empty();
			$('.chatPageNum').empty();
			
			// 다시그리기
			$.ajax({
				url : '../reply/' + pageNum,
				data : {bno: bno},
				method : 'get',
				dataType : 'json',
				success : function(data) {
					console.log(data);
					let str = "";
					for (i = 0; i < data.length; i++) {
						str += makeLi(data[i]);
					}
					$(".chat").html(str);
					showReplyPage(replyCnt);
				},
				error : function(e) {
					console.log(e);
				}
			});
		}
		
		replyPageFooter.on("click", "li a", function(e) {
			e.preventDefault();
			console.log("page click");
			
			var targetPageNum = $(this).attr('href');
			
			console.log("targetPageNum: " + targetPageNum);
			
			pageNum = targetPageNum;
			
			showList(pageNum, replyCnt);
			
		});
		
		showList(1, replyCnt);
		
	});
</script>

<%@ include file="/WEB-INF/views/includes/footer.jsp"%>