<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="t_Header.jsp"%>
</head>
<body>
	<div id="content-area">
		<div class="container" id="main">
			<div class="row" id="mypageDiv">
				<div id="my-info" class="col-12 col-sm-6 col-lg-6 col-xl-6">
				<h1> 마이페이지 </h1>
				<ul class="vss-join" id="JoinForm">
               <li>아이디&nbsp;&nbsp; <input type="text" name="u_id" />
               </li>
               <li>이&nbsp;&nbsp;름&nbsp;&nbsp; <input type="text" name="u_name" /></li>
               <li>별&nbsp;&nbsp;명&nbsp;&nbsp; <input type="text" name="u_nick" />
               <div align="center" class="change-btn" id="change-nickbtn"> 
                  <button type="button" class="changebtn">수정</button>             
               </div></li>
               <li>암&nbsp;&nbsp;호&nbsp;&nbsp; <input type="text" name="u_pw" class="password" />
               <div align="center" class="change-btn" id="change-pwbtn"> 
                  <button type="button" class="changebtn">수정</button>             
               </div>
               </li>               
               <li>이메일&nbsp;&nbsp; <input type="text" name="u_email" /></li>
               <div align="center" class="submit-btn"> 
                  <button type="submit" class="submitbtn">완료</button>             
               </div>                                                
            </ul>
				</div>
				
				<div id="lastest" class="col-12 col-sm-6 col-lg-6 col-xl-6">
				</div>
			</div>
			<!-- 			로그인 팝업창  -->
		<div class="row">
	<div class="modal fade" id="change-nickModal" data-backdrop="static">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
				 <span>별명 변경하기</span>
				 	<button class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<form class="modal-login" id="loginForm">
						<li>암  호<br><input type="password" name="u_pw" id="u_pw"></li>
					</form> <!-- 여기 -->
				</div>
				<div class="modal-footer">
					<button class="btn btn-priamry" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div> 
	<div class="modal fade" id="change-pwModal" data-backdrop="static">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
				 <span>암호 변경하기</span>
				 	<button class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<form class="modal-login" id="loginForm">
						<li>암  호<br><input type="password" name="u_pw" id="u_pw"></li>
					</form> <!-- 여기 -->
				</div>
				<div class="modal-footer">
					<button class="btn btn-priamry" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div> 
</div>
		</div>
	</div>
<script type="text/javascript">
$(document).ready(function() {
	$("[id='btn-login']").click(function() {
		$('#myModal').modal('show');
	});
	$("[id='btn-login']").click(function() {
		$('#myModal').modal('hide');
	});
	
	$("[id='change-nickbtn']").click(function() {
		$('#change-nickModal').modal('show');
	});
	$("[id='change-nickbtn']").click(function() {
		$('#change-nickModal').modal('hide');
	});
	
	$("[id='change-pwbtn']").click(function() {
		$('#change-pwModal').modal('show');
	});
	$("[id='change-pwbtn']").click(function() {
		$('#change-pwModal').modal('hide');
	});
});
</script>	
</body>
</html>