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
<script src="resources/js/jquery-3.4.1.js"></script>
<script src="resources/js/alertify.min.js"></script>
<link rel="stylesheet" href="resources/css/alertify.default.css" />
<link rel="stylesheet" href="resources/css/alertify.core.css" />
	</head>
<body>
	
<header>
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<div class="top-menu">
						<div class="right-col">
							<a href="Main.do"> <img src="resources/css/test/logo.png" alt="" />
							</a>
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
			</div>

		</div>

		<!-- 			로그인 팝업창  -->
		<form id="loginForm" style="display: none;">
			<h3>
				<div class="col-xs-12" id="loginDiv">
					<ul class="vss-a-menu" id="pop_login">
						<li>아이디 <input type="text" name="u_id" id="u_id" /></li>
						<li>암 호 <input type="password" name="u_pw" id="u_pw" /></li>
						<div align="center" id="pop_login_btn">
							<button type="button" onclick="loginAction()">확인</button>
							<button type="button" onclick="">회원가입</button>
						</div>
					</ul>
				</div>
			</h3>
		</form>
	</header>	
	
	<div id="header-bar" class="container">
		<div class="row" align="center">               
             
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

	 <!-- 로그인 폼 -->
<form class="login-content" action="LoginAction.do" method="get">
<div class="container" id="cont">
   <div class="row" id="Login">
      <!-- <div class="col-xs-2"></div> -->
      <div class="col-xs-12" id="Login_Div">
         <h1> 로그인 </h1>
            <ul class="vss-login" id="LoginForm">
               <li>아이디&nbsp;&nbsp; <input type="text" name="u_id" /></li>
               <li>암&nbsp;&nbsp;호&nbsp;&nbsp; <input type="text" name="u_pw" class="password" /><br></li>
               <div align="center" class="login_btn">
               <div class="auto-login"> <input type="checkbox" id="auto-login" /> 자동로그인 </div> 
                  <div class="loginbtn">
                  <button type="submit" onclick="login()">로그인</button>
                  </div>
                  <div class="find-id-pw">
                        <a href="#">아이디찾기</a> /
                        <a href="#">암호찾기</a>
                  </div>
                  아직 회원이 아니면?? <button type="button" onclick="">회원가입</button>             
               </div>                                                
            </ul>
         
      </div>
   </div>
</div>
</form>
</body>
</html>