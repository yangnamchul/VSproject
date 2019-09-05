<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet" />
<script src="resources/js/jquery-3.4.1.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<script src="resources/js/alertify.min.js"></script>
<link rel="stylesheet" href="resources/css/alertify.default.css" />
<link rel="stylesheet" href="resources/css/alertify.core.css" />
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css"
	rel="stylesheet" />
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>
<script src="resources/js/summernote-ko-KR.js"></script>

</head>
<body>
	<h1>게시글 작성</h1>
	<form action="BoardInsertData.do" method="POST">
		<div class="createForm">
			<label>제목</label> <input type="text" name="b_title"
				placeholder="게시판 제목">
		</div>
		<div class="createForm">
			<label>내용</label>
			<textarea rows="10" cols="50" name="b_content" id="b_content"
				placeholder="게시판 내용"></textarea>
		</div>

		<div class="Formfooter">
			<input type="submit" value="등록하기">
		</div>

	</form>
</body>
<script>

function sendfile(file, el) {
	data = new FormData();
	data.append("file",file);
	$.ajax({
		data : data,
		type : "POST",
		url : 'BoardInsertFile.do',
		cache : false,
		contentType : false,
		processData : false,
		success : function(data) {
			$(el).summernote('editor.insertImage', data.url);
		},
		error : function() {
			alert("실패");
		}
	});
}

	$(document).ready(function() {
		/* 텍스트 에디터 설정 */
		$('#b_content').summernote({
			height : 300,
			minHeight : null,
			maxHeight : null,
			focus : true,
			airmode : true,
			lang: 'ko-KR',
			callbacks : {
				onImageUpload : function(file, editor, welEditable) {
						sendfile(file[0], this);
				}
			},
			
			hint: {
			    mentions: ['사자', '악어', '펭귄', '고양이', '강아지', 'COW', 'RABBIT', 'SNAKE', '기만 ㄴ'],
			    match: /\B@([a-z|A-Z|\u3131-\u314e|\u314f-\u3163|\uac00-\ud7a3]*)/,
			    search: function (keyword, callback) {
			        callback(
			            $.grep(this.mentions, function (item) {
			                return item.indexOf(keyword) === 0;
			            })
			        );
			    },
			    template: function (item) {
			        return item;
			    },
			    content: function (item) {
			        return '@' + item;
			    }
			}
		});
	});

</script>
</html>