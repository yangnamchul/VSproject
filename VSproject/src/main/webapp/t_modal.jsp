<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function() {
	$('#btn').click(function(){
		$('#myModal').modal('show');
	});
	$('#btn').click(function(){
		$('#myModal').modal('hide');
	});
	$('#btn').click(function(){
		$('#myModal').modal('show');
	});
	$('#btn').click(function(){
		$('#myModal').modal('show');
	});	
});
</script>

</head>
<body>
<%@ include file="t_Header.jsp"%>
<div class="container">
<div class="row">
	<div class="modal fade" id="myModal" data-backdrop="static">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
				 <span>로그인</span>
				 	<button class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<div class="modal-login">
						<li>아이디<br><input type="text" name="u_id" id="u_id"></li>
						<br>
						<li>암  호<br><input type="password" name="u_pw" id="u_pw"></li>
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
					</div>
				</div>
				<div class="modal-footer">
					<button class="btn btn-primary" data-dismiss="modal">로그인</button>
				</div>
			</div>
		</div>
	</div> 
</div>
</div>
</body>
</html>