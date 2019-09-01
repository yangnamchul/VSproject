<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="t_Header.jsp"%>


	<div class="container">
		<div class="row">
			<div class="col-xs-6">
				<form name="form1" id="form1">
					<ul class="vss-a-menu" id="pop_login">
						<li>아이디 <input type="text" name="u_id" id="u_id"></li>
						<br>
						<li>암 호 <input type="password" name="u_pw" id="u_pw"></li>
						<div align="center" id="pop_login_btn">
							<div class="auto-login">
								<input type="checkbox" id="auto-login" /> 자동로그인
							</div>
							<button type="button" onclick="login()">로그인</button>
							<div class="find-id-pw">
								<a href="#">아이디찾기</a> / <a href="#">암호찾기</a>
							</div>
							아직 회원이 아니면??
							<button type="button" onclick="">회원가입</button>
						</div>
					</ul>
				</form>

			</div>
		</div>
	</div>

	<!-- 	<form name="form1"  id="form1"> -->
	<!-- 	<h1> -->
	<!-- 		아이디 : <input type="text" name="u_id" id="u_id"> <br> -->
	<!-- 		비밀번호 : <input type="text" name="u_pw" id="u_pw"> <br> -->
	<!-- 		<input type="button" value="확인" onclick="login()"> -->
	<!-- 	</h1> -->
	<!-- 	</form> -->



	<script>
	function loginAction() {
		if ($("#u_id").val() == "") {
			alertify.alert("아이디를 입력해주세요");
			return;
		}
		;
		if ($("#u_pw").val() == "") {
			alertify.alert("비밀번호를 입력해주세요");
			return;
		}
		;

		jQuery.ajax({
			type : "POST",
			url : "LoginAction.do",
			data : $("#form1").serialize(),
			async : false,
			dataType : "json",
			success : function(data) {
				if (data == 0) {
					alertify.alert("로그인 실패했습니다. 다시 로그인 해주시기 바랍니다");
					$("#u_id").val("");
					$("#u_pw").val("");
				} else {
					location.href = "Main";
				}
			},
			error : function(req, status, error) {
				alertify.alert(req.status + "\nmessege" + req.responseTest);
			}
		});
	}
</script>
</body>
</html>