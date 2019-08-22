<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/jquery-3.4.1.js"></script>
<script src="resources/js/alertify.min.js"></script>
<link rel="stylesheet" href="resources/css/alertify.default.css" />
<link rel="stylesheet" href="resources/css/alertify.core.css" />
</head>
<body>

	<h1>Ajax 실험실</h1>
	<button onclick="kaja()">가자</button>

	<script type="text/javascript">
		/*=======================================================================
		 내      용  : 댓글 저장
		 작  성  자  : judy
		 2017.11.23 - 최초생성
		 ========================================================================*/
		function insertComment() {

			if (("" == "" || "" == null) && "R" == "E") {
				alertify.alert("이미 마감된 투표입니다.");
				$("#txtComment").val("");
				return;
			}

			if ("" == "" || "" == null) {
				alertify.alert("투표해야만 댓글작성이 가능합니다");
				$("#txtComment").val("");
				return;
			}

			if ($("#txtComment").val() == "") {
				alertify.alert("댓글을 1자이상 입력해주세요");
				return;
			}
			$.ajax({
				type : 'POST',
				url : '/ajax/insertContentsComment',
				data : {
					'content' : $("#txtComment").val(),
					'contentSeq' : '1054'
				},
				async : false,
				dataType : 'json',
				success : function(data) {
					if (data == 0) {
						alertify.alert('댓글 저장에 실패했습니다.');
					} else if (data > 0) {
						$("#txtComment").val("");
						var type = $("input[name=commentType]").val();
						if (type != 'C') {
							changeSort();
						} else {
							$('.comment-container').remove();
							$("input[name=commentNext]").val("1");
							goAllList();
						}
					}
				}
			});
		}
	</script>

</body>
</html>

