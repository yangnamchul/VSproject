<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport"
	content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<link
	href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Gugi|Poor+Story&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="resources/css/VSsMain.css">
<link rel="stylesheet" type="text/css"
href="resources/css/bootstrap.css">

<link rel="stylesheet" href="resources/css/alertify.default.css" />
<link rel="stylesheet" href="resources/css/alertify.core.css" />
<script src="resources/js/jquery-3.4.1.js"></script>
<script src="resources/js/alertify.min.js"></script>
<script src="resources/js/bootstrap.js"></script> 



<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>

</head>
<body>
	<header>
		<div class="container">
			<div class="row" id="top-menu">
				<div class="col-4 col-sm-4 col-lg-4 col-xl-4">
					<a href="Main.do"> <img src="resources/css/test/logo.png" />
					</a>

				</div>
				<div class="col-8 col-sm-8 col-lg-8 col-xl-8" align="right"
					id="top-menu-right">
					<div class="right-col" id="btn-search">
						<div class="right-row">
							<img
								src="http://icons.iconarchive.com/icons/pixture/donuts/32/PowderSugared-icon.png"
								alt="" />
						</div>
						<div class="right-row">검색</div>
					</div>

					<%
							if (session.getAttribute("uv") == null) {
						%>


					<div class="right-col" id="btn-login">
						<div class="right-row" align="center">
							<img
								src="http://icons.iconarchive.com/icons/pixture/donuts/32/Coffee-icon.png"
								alt="" />
						</div>
						<div class="right-row">로그인</div>
					</div>

					<%
							} else {
						%>
						
						<div class="right-col" id="btn-logout">
						<div class="right-row" align="center">
							<img
								src="http://icons.iconarchive.com/icons/pixture/donuts/32/Coffee-icon.png"
								alt="" />
						</div>
						<div class="right-row">로그아웃</div>
					</div>
					<%
							}
						%>

				</div>
			</div>
		</div>



		<div class="frm-search" style="display: none;">
			<form action="#" method="get" id="right-search-form">
				<input type="text" placeholder="부스러기 검색" value=""
					id="right-search-input" name="검색input이름">
				<button type="submit" id="search-btn">
					<img src="https://static.thenounproject.com/png/644045-200.png"
						width="16px" height="16px" />
				</button>
			</form>
		</div>

		<!-- 			로그인 팝업창  -->
		<div class="row">
	<div class="modal fade" id="myModal" data-backdrop="static">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
				 <span>로그인</span>
				 	<button class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<form class="modal-login" id="loginForm">
						<li>아이디<br><input type="text" name="u_id" id="u_id"></li>
						<br>
						<li>암  호<br><input type="password" name="u_pw" id="u_pw"></li>
						<div align="center" id="pop_login_btn">
							<div class="auto-login">
								<input type="checkbox" id="auto-login" /> 자동로그인
							</div>
							<button type="button" onclick="login()">로그인</button>
						</div>
					</form> <!-- 여기 -->
				</div>
				<div class="modal-footer">
					<div align="center" id="pop_join_btn">
							<div class="find-id-pw">
								<a href="FindID.do">아이디찾기</a> / <a href="FindPW.do">암호찾기</a>
							</div>
							<span>아직 회원이 아니면??</span>
							<button type="button" onclick = "location.href = 'SignUp.do' ">회원가입</button>
					</div>
				</div>
			</div>
		</div>
	</div> 
</div>
		
		

	</header>


	<!-- 주메뉴 -->
	<div id="header-bar" class="container">
		<div class="row" align="center">
			<div class="header-row">
				<div class="header-col" onclick="myFunction()">
               메뉴1 <img
                  src="https://www.materialui.co/materialIcons/navigation/arrow_drop_down_black_192x192.png"
                  alt="" width="32px" />
               <!-- Dropdown -->
               <div id="dropdown" class="dropdown-content">
                  <a href="Main.do">고것은</a> 
                  <a href="https://youtu.be/PKkFG21lz7M">옥냥이가</a>
                  <a href="#">먼저 했고연</a>	
               </div>
            </div>

				<div class="header-col">
					메뉴2 <img
						src="https://www.materialui.co/materialIcons/navigation/arrow_drop_down_black_192x192.png"
						alt="" width="32px" />
				</div>

				<div class="header-col">
					메뉴3 <img
						src="https://www.materialui.co/materialIcons/navigation/arrow_drop_down_black_192x192.png"
						alt="" width="32px" />
				</div>

				<div class="header-col">
					메뉴4 <img
						src="https://www.materialui.co/materialIcons/navigation/arrow_drop_down_black_192x192.png"
						alt="" width="32px" />
				</div>

			</div>

		</div>
	</div>
	<!-- row end -->
	
<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
내 용 : ajax 로그인
■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
	<script>
		function login() {
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

			jQuery
					.ajax({
						type : "POST",
						url : "LoginAction.do",
						data : $("#loginForm").serialize(),
						async : false,
						dataType : "json",
						success : function(data) {
							if (data == 0) {
								alertify.alert("로그인 실패했습니다. 다시 로그인 해주시기 바랍니다");
								$("#u_id").val("");
								$("#u_pw").val("");
							} else {
								location.reload() ;
							}
						},
						error : function(req, status, error) {
							alertify.alert(req.status + "\nmessege"
									+ req.responseTest);
						}
					});			
		}
	</script>

	<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
내 용 : Top부분 스크롤 고정 
수 정 : 일단 PC화면은 적용안함 (8/31) 

<script type="text/javascript"> 

$( document ).ready( function() {
	   var topOffset = $( '.top-menu' ).offset();
	    $( window ).scroll( function() {       
	       if ( $( document ).scrollTop() > topOffset.top ) {
	          $( '.top-menu' ).addClass( 'top-fixed' );
	         
	       }
	       else  {
	       $('.top-menu').removeClass('top-fixed');    
	      
	       }
	       });
	    } );

</script>
■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->


<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
내 용 : header 아이콘 작동 부분 
■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
<script type="text/javascript">


$(document).ready(function() {
	$("[id='btn-login']").click(function() {
		$('#myModal').modal('show');
	});
	$("[id='btn-login']").click(function() {
		$('#myModal').modal('hide');
	});
	
	$("[id='btn-logout']").click(function() {
		location.href="LogOut.do";
	});
	
	
});
</script>


<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
내 용 : dropdown
■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
<script>
function myFunction(){
   document.getElementById("dropdown").classList.toggle("show");
}
window.onclick = function(event){
   if(!event.target.matches('.header-col')){
      var dropdowns = document.getElementsByClassName("dropdown-content");
      var i;
       for (i = 0; i < dropdowns.length; i++) {
         var openDropdown = dropdowns[i];
         if (openDropdown.classList.contains('show')) {
           openDropdown.classList.remove('show');
         }
       }
     }
}
</script>


</body>
</html>
