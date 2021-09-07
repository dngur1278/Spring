/* webapp/resources/js/reply.js */
	let replyService = (function() {
		// 등록
		function add(callback, error) {
			$.ajax({
				method: "post",
				url: "../reply/",
				data: $("#replyForm").serialize(),
				dataType: "json",
				success: function(data) {
					if (callback) {
						callback(data);
					}
				},
				error: function() {
					if (error) {
						error();
					}
				}
			});
		}
		
		//목록
		function getList(param, callback, error) {
			$.ajax({
				url : "../reply/",
				data : param,
				dataType : "json",
				success: function(data) {
					if (callback) {
						callback(data);
					}
				},
				error: function() {
					if (error) {
						error();
					}
				}
			});
		}
		return { add: add, getList : getList }
	})();