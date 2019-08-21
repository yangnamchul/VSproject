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
	<form name="form1" action="Login.do">
	<h1>
		아이디 : <input type="text" name="u_id" id="u_id"> <br>
		비밀번호 : <input type="text" name="u_pw" id="u_pw"> <br>
		<input type="button" value="확인" onclick="login()">
	</h1>
	</form>
	
</body>

<script>
	function login() {
		if($("#u_id").val()=="") {
			alertify.alert("아이디를 입력해주세요");
			return;
		};
		if($("#u_pw").val()=="") {
			alertify.alert("비밀번호를 입력해주세요");
			return;
		};
		document.form1.submit();
	}
</script>
</html>