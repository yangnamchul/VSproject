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
<script>
	$(document).ready(function() {
		$('#r_reply').summernote({
			height : 100,
			minHeight : 100,
			maxHeight : 100,
			focus : true,
			airmode : true,
			lang: 'ko-KR',
			toolbar : false
		})
	})
</script>


<body>
<table border="2">
		<tr>
			<td>
				${vo.b_seq }
			</td>
			<td>
				${vo.u_id }
			</td>
			<td>
				${vo.b_date }
			</td>
		</tr>
		<tr>
			<td id="content123" colspan="3">
				${vo.b_content}
			</td>
		</tr>
		<tr>
			<td> <button type="button" onclick="">전자</button> </td>
			<td> <button type="button" onclick="">후자</button> </td>
		</tr>
</table>
<br>
	<form>
		<textarea id="r_reply"></textarea>
		<input type="submit" value="확인">
	</form>
	<a href="#">aaaa</a>
<a href="Main">메인</a>
</body>
</html>