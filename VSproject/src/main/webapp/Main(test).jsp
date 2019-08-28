<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<link
	href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Gugi|Poor+Story&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="resources/css/GuRem2.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>

</head>
<body>
	<header>
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<div class="top-menu">

						<div class="right-col" >
							<a href="#"> <img src="resources/css/test/logo.png" alt="" /> </a>
						</div>											
					<%
                		if (session.getAttribute("u_id") == null) {
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
				<form action="#" method="get" id="right-search-form" style="display: none;">
						<input type="text" placeholder="부스러기 검색" value="" id="right-search-input" name="검색input이름"> 
						<button type="submit" id="search-btn"> <img src="https://static.thenounproject.com/png/644045-200.png" width="16px" height="16px" /> </button>
					</form>
			</div>
			
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


		<div id="header-bar" class="container">
			<div class="row">
				<div id="header-menu-left" class="col-xs-2">

					<!-- 스크립트로 소메뉴 여는 부분 Class -->
					<!-- <div class="dropdown">
						<a href="#" class="dropdown-toggle" id="latestDropdown"
							data-toggle="dropdown"> <i class="fa fa-clock-o"></i> 최근<span
							class="caret"></span>
						</a>
						<ul class="dropdown-menu" aria-labelledby="latestDropdown"
							id="latestDropdownMenu"></ul>
					</div>
					<div class="dropdown">
						<a href="#" class="dropdown-toggle" id="favoriteDropdown"
							data-toggle="dropdown"> <i class="fa fa-star"></i> <span
							class="caret"></span>
						</a>
						<ul class="dropdown-menu" aria-labelledby="favoriteDropdown"
							id="favoriteDropdownMenu"></ul>
					</div>
					<div class="dropdown">
						<a href="#" class="dropdown-toggle" id="playgroundDropdown"
							data-toggle="dropdown"> <i class="fa fa-smile-o"></i> <span
							class="caret"></span>
						</a>
						<ul class="dropdown-menu" aria-labelledby="playgroundDropdown"
							id="playgroundDropdownMenu">
							<li><a href="/play/attendance">출석체크</a></li>
							<li><a href="/play/ad">전광판</a></li>
							<li><a href="/play/iconshop">아이콘샵</a></li>
							<li><a href="/play/giveaway">포인트경품</a></li>
							<li class="divider"></li>
							<li><a href="/play/chatutil">채팅툴</a></li>
						</ul>
					</div> -->
					<!-- 스크립트로 소메뉴 여는 부분 Close -->

				</div>

				<div id="header-top-notice" class="col-xs-8" align="center">
					부스러기 | 최신VS | 인기VS | 공지사항</div>


				<!-- 메인바 우측메뉴	 -->
				<!-- <div id="header-menu-right" class="col-xs-2" align="right">
					<div class="dropdown">
						<a href="/note/lists" class="dropdown-toggle"> <i
							class="fa fa-envelope-o"></i> <span class="caret"></span>
						</a>
					</div>
					<div class="dropdown">
						<a href="#" class="dropdown-toggle" id="userDropdown"
							data-toggle="dropdown"> <i class="fa fa-user"></i> <span
							class="caret"></span></a> </a>
						<ul class="dropdown-menu dropdown-menu-right"
							aria-labelledby="userDropdown">
							<li><a href="/member/login"><i class="fa fa-twitch"></i>
									로그인</a></li>
						</ul>
					</div>
				</div> -->

			</div>
			<!-- row end -->
		</div>
	</header>

	<!-- 	Content 내용부분 -->

	<div id="content-area">
		<div class="container" id="main">

			<div class="row">
				<div class="col-xs-4">
					<h3>
						<ul class="vss-a-menu">
							<li><a href="Board.do"> 게시판 </a></li>
							<li><a href="UserAllData.do">유저정보 전부보기</a></li>
							<li><a href="SignUp.do">회원가입</a></li>
							<li><a href="Login.do">로그인</a></li>
							<li><a href="">메인</a></li>
						</ul>

					</h3>
				</div>

				<img
					src="https://characterdevteam.files.wordpress.com/2016/04/pce18490e185a9e186bce18489e185b5e186ab__hitel_plaza.jpg"
					alt="" width="100%" />

			</div>


			<div class="col-xs-6">
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
					<li><a href="#" class="board-name">부스러기</a> <span>▶</span> <a
						href="#">아무내용링크1</a></li>
					<li><a href="#" class="board-name">부스러기</a> <span>▶</span> <a
						href="#">아무내용링크1</a></li>
					<li><a href="#" class="board-name">부스러기</a> <span>▶</span> <a
						href="#">아무내용링크1</a></li>

				</ul>

			</div>

			<!-- 				중복 -->
			<div class="col-xs-6">
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


	<script type="text/javascript">
		$(document).ready(function() { //DOM이 준비되고
// 			$('#btn-search').click(function() {
			$("[id='btn-search']").click(function() {
				$('#right-search-form').toggle();				
			});
			
			$("[id='btn-login']").click(function() {
				$('#loginForm').toggle();
			});
			
			$("[id='btn-logout']").click(function() {
				<% session.invalidate();%>
				location.reload();
			});
		});
	</script>

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

</body>
</html>