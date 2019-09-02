<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link
	href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Gugi|Poor+Story&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="resources/css/GuRem2.css">
<script src="resources/js/jquery-3.4.1.js"></script>
<script src="resources/js/alertify.min.js"></script>
<link rel="stylesheet" href="resources/css/alertify.default.css" />
<link rel="stylesheet" href="resources/css/alertify.core.css" />



</head>
<body>
	<header>
		<div class="container-fluid">
			<div class="row">
				<div class="col-xs-12">
					<div class="top-menu">
						<div class="right-col">
							<a href="Main.do"> <img src="resources/css/test/logo.png" alt="" />
							</a>
						</div>
						
						<div class="right-col" id="btn-login">
							<div class="right-row" align="center">
								<img
									src="http://icons.iconarchive.com/icons/pixture/donuts/32/Coffee-icon.png"
									alt="" />
							</div>
							<div class="right-row">로그인</div>
						</div>
						
						<div class="right-col" id="btn-search">
							<div class="right-row">
								<img
									src="http://icons.iconarchive.com/icons/pixture/donuts/32/PowderSugared-icon.png"
									alt="" />
							</div>
							<div class="right-row">검색</div>
						</div>


					</div>
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
		<form id="loginForm" style="display: none;">
			<h3>
				<div class="col-xs-4" id="loginDiv">
					<ul class="vss-a-menu" id="pop_login">
						<li>아이디 <input type="text" name="u_id" id="u_id" /></li>
						<li>암 호 <input type="password" name="u_pw" id="u_pw" /></li>
						<div align="center" id="pop_login_btn">
							<button type="button" onclick="login()">확인</button>
							<button type="button" onclick="">회원가입</button>
						</div>
					</ul>
				</div>
			</h3>
		</form>
	</header>	
	
	<div id="header-bar" class="container-fluid">
		<div class="row" align="center" id="menu">               
            
			<div class="header-row">
				<div class="header-col">메뉴1 
				<img src="https://www.materialui.co/materialIcons/navigation/arrow_drop_down_black_192x192.png" alt="" width="32px" /></div>
				
				<div class="header-col">메뉴2 
				<img src="https://www.materialui.co/materialIcons/navigation/arrow_drop_down_black_192x192.png" alt="" width="32px" /></div>
				
				<div class="header-col">메뉴3 
				<img src="https://www.materialui.co/materialIcons/navigation/arrow_drop_down_black_192x192.png" alt="" width="32px" /></div>
				
				<div class="header-col">메뉴4 
				<img src="https://www.materialui.co/materialIcons/navigation/arrow_drop_down_black_192x192.png" alt="" width="32px" /></div>										

			</div>
			
		</div>
	</div>

	<!-- 	Content 내용부분 -->
	<div id="content-area">
		<div class="container-fluid" id="main">

			<div class="row">
				<!-- <div class="col-xs-4">
					<h3>
						<ul class="vss-a-menu">
							<li><a href="Board.do"> 게시판 </a></li>
							<li><a href="UserAllData.do">유저정보 전부보기</a></li>
							<li><a href="SignUp.do">회원가입</a></li>
							<li><a href="Login.do">로그인</a></li>
							<li><a href="">메인</a></li>
						</ul>

					</h3>
				</div> -->
				<div class="col-xs-offset-1 col-xs-11 col-sm-offset-1 col-sm-11 col-md-offset-1 col-md-11">
				<img
					src="https://characterdevteam.files.wordpress.com/2016/04/pce18490e185a9e186bce18489e185b5e186ab__hitel_plaza.jpg"
					alt="" width="90%" />
				</div>
			</div>


			<div class="col-xs-12 col-sm-6  col-md-4">
				<h3>
					<a href="#">부스러기 인기글</a>
				</h3>
				<ul class="vss-hot">

					<li><a href="#" class="board-name">부스러기</a> <span>▶</span> <a
						href="#">아무내용링크1</a></li>
					<li><a href="#" class="board-name">부스러기</a> <span>▶</span> <a
						href="#">아무내용링크1</a></li>
					<li><a href="#" class="board-name">부스러기</a> <span>▶</span> <a
						href="#">아무내용링크1</a></li>

				</ul>

			</div>

			<!-- 				중복 -->
			<div class="col-xs-12 col-sm-6 col-md-4">
				<h3>
					<a href="#">부스러기 최신글</a>
				</h3>
				<ul class="vss-hot">

					<li><a href="#" class="board-name">부스러기</a> <span>▶</span> <a
						href="#">아무내용링크1</a></li>
					<li><a href="#" class="board-name">부스러기</a> <span>▶</span> <a
						href="#">아무내용링크1</a></li>
					<li><a href="#" class="board-name">부스러기</a> <span>▶</span> <a
						href="#">아무내용링크1</a></li>

				</ul>

			</div>
			
			<!-- 				중복 -->
			<div class="col-xs-12 col-sm-6 col-md-4">
				<h3>
					<a href="#">부스러기 최신글</a>
				</h3>
				<ul class="vss-hot">

					<li><a href="#" class="board-name">부스러기</a> <span>▶</span> <a
						href="#">아무내용링크1</a></li>
					<li><a href="#" class="board-name">부스러기</a> <span>▶</span> <a
						href="#">아무내용링크1</a></li>
					<li><a href="#" class="board-name">부스러기</a> <span>▶</span> <a
						href="#">아무내용링크1</a></li>

				</ul>

			</div>
		</div>
	</div>

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
				frm_search.css('left', btn_search.left ) ;				
				$('.frm-search' ).toggle();			
				
			});
			
			$("[id='btn-login']").click(function() {
				frm_login.css('top', btn_login.top+10   ) ;
				frm_login.css('left', btn_login.left ) ;	
				$('#loginForm').toggle();
			});
			
			$("[id='btn-logout']").click(function() {
				
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

</body>
</html>