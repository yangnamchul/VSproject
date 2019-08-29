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



	<%@ include file="Header.jsp"%>

	

	<div class="container">
		<div class="row" >
			<div class="col-xs-6">
				<form name="form1" id="form1">
					<ul class="vss-a-menu" id="pop_login">
						<li>아이디 <input type="text" name="u_id" id="u_id"></li>
						<li>암 호 <input type="password" name="u_pw" id="u_pw"></li>
						<div align="center" id="pop_login_btn">
							<button type="button" onclick="login()">확인</button>
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

</body>

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

<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
내 용 : Header toggle,offset
■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
	<script type="text/javascript">
		$(document).ready(function() { //DOM이 준비되고
			var frm_search = $('.frm-search') ;
			var frm_login = $('#loginForm') ;
			var btn_search =$( document.querySelector("#btn-search") ).offset() ;				
			var btn_login =$( document.querySelector("#btn-login") ).offset() ;				
			$("[id='btn-search']").click(function() {				
				frm_search.css('top', btn_search.top+10   ) ;
				frm_search.css('left', btn_search.left-350 ) ;				
				$('.frm-search' ).toggle();			
				
			});
			
			$("[id='btn-login']").click(function() {
				frm_login.css('top', btn_login.top+10   ) ;
				frm_login.css('left', btn_login.left ) ;	
				$('#loginForm').toggle();
			});
			
			$("[id='btn-logout']").click(function() {
				<% session.invalidate();%>
				location.reload();
			});
		});
	</script>

<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
내 용 : ajax 로그인
■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
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
		
		jQuery.ajax({
			type:"POST",
			url:"LoginAction.do",
			data:$("#loginForm").serialize(),
			async : false,
			dataType : "json",
			success : function (data) {
				if (data == 0) {
					alertify.alert("로그인 실패했습니다. 다시 로그인 해주시기 바랍니다");
					$("#u_id").val("");
					$("#u_pw").val("");
				} else  {
					location.href = "Main";
				}
			},
			error: function (req, status, error) {
				alertify.alert(req.status+ "\nmessege"+ req.responseTest );
			}
		});
	}
	
</script>

<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
내 용 : Top부분 스크롤 고정
■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
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

<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
내 용 : 팝업폼 상대경로 위치 계산
■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
</html>