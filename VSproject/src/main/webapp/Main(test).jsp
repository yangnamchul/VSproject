<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Gugi|Poor+Story&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="resources/css/GuRem.css" >
<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

</head>
<body>

	<header>
		<div class="container">
			<div class="row">
				<div class="col-xs-4">
					<a href="/"> <span class="VSlogo">부스러기 </span> <img
						src="http://icons.iconarchive.com/icons/pixture/donuts/32/Yummy-icon.png"
						alt="" />
					</a>
				</div>

				<!-- 				검색 div -->
				<!-- 				<div class="col-xs-8" align="right" style="display:none;"> -->
				
				   <div class="col-xs-8">			
					
<!-- 					display: none; -->
<!-- 					<form action="#" method="get" id="right-search-form" style=""> -->
<!-- 						<input type="text" placeholder="부스러기 검색" value="" id="right-search-input" name="검색input이름">  -->
<!-- 						<button type="submit" id="search-btn"> <img src="https://static.thenounproject.com/png/644045-200.png" width="16px" height="16px"/> </button> -->
<!-- 					</form> -->

					<div class="top-menu" style="float:right !important;">								
						<div class="right-row">
						<div class="right-col"><img src="http://icons.iconarchive.com/icons/pixture/donuts/32/PowderSugared-icon.png" alt="" /></div>
						<div class="right-col" align="center"><img src="http://icons.iconarchive.com/icons/pixture/donuts/32/Coffee-icon.png" alt="" /></div>				 							
						</div>
						<div class="right-row">
							<div class="right-col">검색</div>
							<div class="right-col">로그인</div>
						</div>
					</div>

					<!-- 					<div class="top-menu"> -->
<!-- 						검색 -->
<!-- 						<img src="http://icons.iconarchive.com/icons/pixture/donuts/32/PowderSugared-icon.png" alt="" /> -->
<!-- 						로그인 -->
<!-- 						<img src="http://icons.iconarchive.com/icons/pixture/donuts/32/Coffee-icon.png"	alt="" /> -->
<!-- 						</div> -->
<!-- 					</div> -->
					
				</div>
			</div>
			</div>
			
		

			<div id="header-bar" class="container">
				<div class="row">
					<div id="header-menu-left" class="col-xs-2" >

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
						부스러기 | 최신VS | 인기VS | <span id="loginBtn">공지사항 </span>
					</div>


					<div class="col-xs-4" id="loginDiv" style="display: none;">
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
			$('#loginBtn').click(function() {
				$('#loginDiv').toggle();
			});
		});
	</script>

</body>
</html>