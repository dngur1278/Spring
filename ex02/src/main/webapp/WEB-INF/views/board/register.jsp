<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>



<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Board Register</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">

			<div class="panel-heading">Board Register</div>
			<!-- /.panel-heading -->
			<div class="panel-body">

				<form id="frm" role="form" action="register" method="post">
					<div class="form-group">
						<label>Title</label> 
						<input class="form-control" name="title">
					</div>
					
					<div class="form-group">
						<label>Text area</label> 
						<textarea class="form-control" rows="3" name="content"></textarea>
					</div>
					
					<div class="form-group">
						<label>Writer</label>
						<input class="form-control" name="writer">
					</div>
					
					<button type="button" id="btnRegister" class="btn btn-default">Submit Button</button>
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

<!-- 파일 업로드 부분 추가 -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">File Attach</div>
			<div class="panel-body">
				<div class="form-group uploadDiv">
					<input type="file" name="uploadFile" multiple="multiple">
					<button type="button" id="uploadBtn" class="btn btn-default">File Upload</button>
				</div>
				<div id="uploadResult">
					<ul>
					
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	$(function(){
		
		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
		var maxSize = 5242880; //5MB

		function checkExtension(fileName, fileSize) {

			if (fileSize >= maxSize) {
				alert("파일 사이즈 초과");
				return false;
			}

			if (regex.test(fileName)) {
				alert("해당 종류의 파일은 업로드할 수 없습니다.");
				return false;
			}
			return true;
		}
		
		$('#uploadBtn').on("click", function(e){
			var formData = new FormData(document.frm);
		 	var inputFile = $("input[name='uploadFile']");
			var files = inputFile[0].files;
			for (var i = 0; i < files.length; i++) {
				if ( !checkExtension(files[i].name, files[i].size )) {
					return;
				}
				
				formData.append("uploadFile", files[i]);
			} 
			
			// formData
			$.ajax({
				url : "../uploadAjaxAction",
				type : "POST",
				processData : false,
				contentType : false,
				data : formData,
				success : function(datas) {
					console.log(datas);
					var str = "";
					for (var i = 0; i < datas.length; i++){
						var obj = datas[i];
						var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);			      
					    var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
					      
						str += "<li "
						str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
						str += "<span> "+ obj.fileName+"</span>";
						str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' " 
						str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
						str += "<img src='../resources/img/attach.png'></a>";
						str += "</div>";
						str +"</li>";
					}
					$('#uploadResult ul').html(str);
					alert("Upload Success");
				},
			});	// end ajax
		});	// end click function
		
		// 등록 버튼 이벤트
		$("#btnRegister").on("click", function(){
			
			var str="";
			
			$("#uploadResult ul li").each(function(i, obj) {
				var jobj = $(obj);
				console.log(jobj);
				
				str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
				str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
				str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
				str += "<input type='hidden' name='attachList["+i+"].fileType' value='1'>";	// "+jobj.data("type")+"
			});
			$("#frm").append(str).submit();
		});
		
		// 업로드 사진 지우기
		$("#uploadResult").on("click", "button", function(e) {
			console.log("delete file.");
			
			if (confirm("Remove this file? ")) {
				var targetLi = $(this).closest("li");
				targetLi.remove();
			}
		});
	});
</script>
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>