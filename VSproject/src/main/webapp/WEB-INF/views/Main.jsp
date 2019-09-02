<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>

</head>
<body>

<%-- 	<%@ include file="t_Header.jsp"%> --%>
	<%@ include file="Header.jsp"%>

	<!-- 	Content 내용부분 -->
	<div id="content-area">
		<div class="container" id="main">
			<div class="row">
				<div class="col-12 col-sm-12 col-lg-6 col-xl-4">
					<h3>
						<ul class="vss-a-menu">
							<li><a href="Board.do?num=1"> 게시판 </a></li>
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


				<div class="col-12 col-sm-12 col-lg-6 col-xl-6">
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
				<div class="col-12 col-sm-12 col-lg-6 col-xl-6">
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
	</div>
</body>
</html>