<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/MainFront.css"/>
</head>
<body>

<!-- 전체 Div -->
	<div id="container" style="overflow-x: hidden; overflow-y: hidden;">
<!-- 	내용물 Div -->
		<div id="content-container">
			<div id="header" class="clearfix" style="min-width: 300px;">
				<div class="header-top"></div>
				<div id="main-sidebar">
					<div class="header-content">
						<div class="top-menu">
<!-- 							<div class="top-menu-left"> -->
<!-- 								<a href="https://www.avsb.co.kr/login" -->
<!-- 									style="color: #ffffff !important;">로그인</a> -->
<!-- 							</div> -->
<!-- 							<div class="top-menu-right"> -->
<!-- 								<a href="https://www.avsb.co.kr/joinAuth" -->
<!-- 									style="color: #ffffff !important;">회원가입</a> -->
<!-- 							</div> -->
						</div>						
						<div class="navBarDiv"></div>
						<div class="logoDiv"></div>
						<div class="searchDiv">
							<form id="searchForm" action="/search" method="get">
								<input type="text" id="searchKeyword" name="searchKeyword"
									placeholder=" 검색어를 입력하세요" value="" maxlength="255"> <a
									href="javascript:goSearch();" class="srch_btn" id="SearchBtn">검색</a>
								<input type="text" style="display: none;" />
							</form>
						</div>
						<!-- <div class="header-menu">
							<ul>
								<li class="menu-news"><a href="/news" >뉴스</a></li>
								<li><a href="/entertainment" >연예</a></li>
								<li><a href="/sports" >스포츠</a></li>
								<li><a href="/food" >푸드</a></li>
								<li><a href="/style" >스타일</a></li>
								<li style="width:130px !important;"><a href="/car" >차/테크</a></li>
								<li style="width:40px !important;"><a href="/etc" >기타</a></li>
							</ul>
						</div> -->
						<div class="mobile-header-menu">
							<ul>							
								<li class="bmenu-active" style="width: 25% !important; text-align: center;">
									<a href="/main"> <b>부스러기</b> </a>
								</li>

								<li style="width: 25% !important; text-align: center;">
								<a href="/ot256ListF"> 최신 </a>
								</li>

								<li style="width: 25% !important; text-align: center;">
								<a href="/fanWorldList">인기VS</a>
								</li>
								
								<li style="width: 25% !important; text-align: center;">
								<a href="/bettingList">공지사항</a>
								</li>								
							</ul>							
						</div>

<!-- 						<div class="mobile-header-menu2"> -->
<!-- 							<ul> -->
<!-- 								<li style="width: 12.5% !important; text-align: center;"><a -->
<!-- 									href="/news">뉴스</a></li> -->
<!-- 								<li style="width: 12.5% !important; text-align: center;"><a -->
<!-- 									href="/entertainment">연예</a></li> -->
<!-- 								<li style="width: 16.5% !important; text-align: center;"><a -->
<!-- 									href="/sports">스포츠</a></li> -->
<!-- 								<li style="width: 12.5% !important; text-align: center;"><a -->
<!-- 									href="/food">푸드</a></li> -->
<!-- 								<li style="width: 16.5% !important; text-align: center;"><a -->
<!-- 									href="/style">스타일</a></li> -->
<!-- 								<li style="width: 17.5% !important; text-align: center;"><a -->
<!-- 									href="/car">차/테크</a></li> -->
<!-- 								<li style="width: 12% !important; text-align: center;"><a -->
<!-- 									href="/etc">기타</a></li> -->
<!-- 							</ul> -->
<!-- 						</div> -->
					</div>
					<nav>




				
					</nav>
					<div id="contentLayer" class="clearfix"></div>					
				</div>
			</div>

			<div align="center" class="vss">
				<ul>
					<li><a href="Board.do"> 게시판 </a></li>
					<li><a href="UserAllData.do">유저정보 전부보기</a></li>
					<li><a href="SignUp.do">회원가입</a></li>
					<li><a href="Login.do">로그인</a></li>
					<li><a href="">메인</a></li>
				</ul>




			</div></body>
</html>