<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/resources/js/jQuery-3.4.1.js"></script>
<title>Insert title here</title>
<script>
	function SignUp() {
			var u_name = $("#u_name").val();
			var u_id = $("#u_id").val();
			var u_pw = $("#u_pw").val();
			var u_email = $("#u_email").val();
			
			if (u_name == null) {
				alert("이름을 입력하세요");
				document.form1.u_name.focus();
				return;
			}
			if (u_id == "") {
				alert("아이디를 입력하세요");
				document.form1.u_id.focus();
				return;
			}
			if (u_pw == "") {
				alert("비밀번호을 입력하세요");
				document.form1.u_pw.focus();
				return;
			}
			if (u_email == "") {
				alert("이메일을 입력하세요");
				document.form1.u_email.focus();
				return;
			}
			document.form1.submit();
	};
</script>
</head>
<body>
	<form name=form1 action="SignUp.do">
		이름<input type="text" name="u_name" id="u_name" placeholder = "이름 입력"><br>
		아이디<input type="text" name="u_id" id="u_id" placeholder = "아이디 입력"><br>
		비밀번호<input type="password" name="u_pw" id="u_pw" placeholder = "비번 입력"><br>
		이메일<input type="email" name="u_eamil" id="u_eamil" placeholder = "이메일 입력"><br>
		<button type="button" onclick="SignUp()">확인</button>
	</form>

</body>
</html>