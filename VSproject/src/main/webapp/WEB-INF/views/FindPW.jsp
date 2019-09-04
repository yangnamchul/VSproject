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
	<h1>비밀번호 변경</h1>
	<form id="ChangePW">
		변경할 비밀번호 : <input type="password" name="u_pw" id="u_pw">
		<button type="button" onclick="ChangePW()">확인</button>
	</form>
</body>
<script>
	function ChangePW() {
		if($("#u_pw").val()=="") {
			alertify.alert("비밀번호를 입력해주세요");
			return;
		};
		jQuery.ajax({
			type:"POST",
			url:"ChangePW.do",
			data:$("#ChangePW").serialize(),
			async : false,
			success : function (data) {
				if (data == 0) {
					alertify.alert("비밀번호 변경 실패")
				} else  {
					alertify.alert("변경된 비밀번호로 로그인해주세요");
					location.href="Main";
				}
			},
			error: function (req, status, error) {
				alertify.alert(req.status+ "\nmessege"+ req.responseTest );
			}
		});
	}
	
</script>
</html>