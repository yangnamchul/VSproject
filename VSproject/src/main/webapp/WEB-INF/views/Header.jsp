<%@page import="com.vs.my.User.DAOVO.UserVO"%>
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
	String u_id = null;
	if (session.getAttribute("uv") == null ) {
		u_id = "";
	} else {
		UserVO uv = (UserVO) session.getAttribute("uv");
		u_id = uv.getU_id();
	}
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
						<div class="right-row">부스러기</div>
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

					<div class="right-col" id="btn-logout" onclick="logout()">
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

		<!--          로그인 팝업창  -->
		<div class="row">
			<div class="modal fade" id="myModal" data-backdrop="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<span id="vss_title">로그인</span>
							<button class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body">
							<form class="modal-login" id="loginForm">
								<li>아이디<br> <input type="text" name="u_id" id="u_id"></li>
								<br>
								<li>암 호<br> <input type="password" name="u_pw"
									id="u_pw"></li>
								<div align="center" id="pop_login_btn">
									<!-- 									<div class="auto-login"> -->
									<!-- 										<input type="checkbox" id="auto-login" /> 자동로그인 -->
									<!-- 									</div> -->
									<button type="button" onclick="login()">로그인</button>
								</div>
							</form>						
						</div>
						<div class="modal-footer">
							<div align="center" id="pop_join_btn">
								<div class="find-id-pw">
									<a id="btn_findIdModal">아이디찾기</a> / <a id="btn_findPwModal">암호찾기</a>
								</div>
								<span id="vss_title">부스러기에 가입하세요.</span>
								<button type="button" onclick="location.href = 'SignUp.do' ">회원가입</button>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- 아이디찾기 모달 -->
			<div class="modal fade" id="findIdModal">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<span id=vss_title>아이디 찾기 </span>
							<button class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body">
							<form class="modal-change" id="findIdForm">
								<div>
									<li class="mx-auto">이메일 <input type="email" name="u_email"
										id="u_email" class="fd-id-pw"></li>
									<div id="findId_btn">
										<button type="button" id="btn-findId" onclick="FindID()">아이디찾기</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- 암호 재설정 모달 -->
			<div class="modal fade" id="findPwModal">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<span id=vss_title>암호 재설정</span>
							<button class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body">
							<form class="modal-change" id="findPwForm">
								<div>
									<li class="mx-auto">아이디 <input type="text" name="u_id"
										id="re_u_id" class="fd-id-pw"></li>
									<li class="mx-auto">이메일 <input type="email"
										name="u_email" id="re_u_email" class="fd-id-pw"></li>
									<div id="findPw_btn">
										<button type="button" id="btn-findPw" onclick="FindPW()">
											암호재설정</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>


			<!--          부스러기 만들기 모달창  -->
			<div class="modal fade" id="vssModal" data-backdrop="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<span id="vss_title">부스러기 만들기</span>
							<button class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body">
							<form class="modal-vss" id="makeVSS">
								<li id="vss_title">부스러기 이름 <br> <input type="text"
									name="VSS_name" id="VSS_name" maxlength="15"
									placeholder="부스러기 이름(15자 이내)" required="required"></li> <br>
								<li>부스러기 설명 <br> <textarea rows="20" cols="10"
										name="VSS_content" id="VSS_content"
										placeholder="부스러기 정의(최대 40자)" required="required"></textarea>
								</li>

								<div align="center">
									<button type="button" id="pop_vss_btn" onclick="makeVSS()">확인</button>
								</div>
							</form>
							<!-- 여기 -->
						</div>
						<div class="modal-footer">
							<div align="center">
								<button type="button" id="pop_vssinfo_btn"
									onclick="location.href = '#' ">부스러기란?</button>
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
				<div class="header-col" onclick="dropdown()">
					홈페이지 <img
						src="https://www.materialui.co/materialIcons/navigation/arrow_drop_down_black_192x192.png"
						alt="" width="32px" />
					<!-- Dropdown -->
					<div id="dropdown" class="dropdown-content">
						<a href="" > 메인</a> 
<!-- 						<a href="#" >들어간페이지(1)</a> -->
<!-- 						<a href="#" >들어간페이지(2)</a> -->
<!-- 						<a href="#" >들어간페이지(3)</a> -->
					</div>
				</div>

				<div class="header-col" onclick="dropdown2()">
					부스러기 <img
						src="https://www.materialui.co/materialIcons/navigation/arrow_drop_down_black_192x192.png"
						alt="" width="32px" />
						<div id="dropdown2" class="dropdown-content2">
						<a href="Board.do?pg=1" >모든글보기</a> 
						<a href="AllVss.do" >모든부스러기</a> 
						</div>
				</div>

				<div class="header-col" onclick="dropdown3()">
					내 정보 <img
						src="https://www.materialui.co/materialIcons/navigation/arrow_drop_down_black_192x192.png"
						alt="" width="32px" />
						<div id="dropdown3" class="dropdown-content3">
						<a href="MyPage.do" id="btn_mypage">마이페이지</a>
						<a href="History.do?u_id=<%= u_id %>" id="btn_history">히스토리</a>
						</div>
				</div>

				<div class="header-col" onclick="dropdown4()">
					기타기능 <img
						src="https://www.materialui.co/materialIcons/navigation/arrow_drop_down_black_192x192.png"
						alt="" width="32px" />
						<div id="dropdown4" class="dropdown-content4">
						<a href="#">일단비워놓음</a>
						</div>
				</div>

			</div>

		</div>
	</div>
	<!-- row end -->

	<script>
//아이디 찾기 ajax
		function FindID() {
			if ($("#u_email").val() == "") {
				alertify.warning("이메일을 입력해주세요");
				return;
			}
			;
			jQuery
					.ajax({
						type : "POST",
						url : "FindID.do",
						data : $("#findIdForm").serialize(),
						async : false,
						success : function(data) {
							if (data == "no-data") {
								alertify.error("아이디 정보가 없습니다.");								
							} else {
								alertify.success("당신의 아이디는 " + data + "입니다")
								$('#findIdModal').modal('hide');
							}
						},
						error : function(req, status, error) {
							alertify.error(req.status + "\nmessege"
									+ req.responseTest);
						}
					});
		}
		
		//비밀번호 찾기 ajax
		function FindPW() {
			if ($("#re_u_id").val() == "") {
				alertify.warning("아이디를 입력해주세요");
				return;
			}
			;
			if ($("#re_u_email").val() == "") {
				alertify.warning("이메일을 입력해주세요");
				return;
			}
			;
			jQuery
					.ajax({
						type : "POST",
						url : "FindPW.do",
						data : $("#findPwForm").serialize(),
						async : false,
						success : function(data) {
							if (data == 0) {
								alertify.error("아이디 정보가 없습니다.");
// 								$("#re_u_id").val("");
// 								$("#re_u_email").val("");
							} else {
								alertify.success("암호 재설정페이지로 이동합니다.")
// 								$("#changePWModal").modal();
							}
						},
						error : function(req, status, error) {
							alertify.error(req.status + "\nmessege"
									+ req.responseTest);
						}
					});
		}
	</script>


	<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
내 용 : 헤더 로그인  KeyDown
■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
	<script>
		$(document).ready(function() {
			$("#u_pw").keydown(function(fn_enter) {
				if (fn_enter.keyCode == 13) {
					login();
				}
			});

		});
	</script>

	<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
내 용 : ajax 로그인, 로그아웃
■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
	<script>
		function login() {
			if ($("#u_id").val() == "") {
				alertify.warning("아이디를 입력해주세요");
				return;
			}
			;
			if ($("#u_pw").val() == "") {
				alertify.warning("비밀번호를 입력해주세요");
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
								alertify.error('아이디 비밀번호를 확인해주세요.');
								//                         $("#u_id").val("");
								//                         $("#u_pw").val("");
							} else {
								alertify.success('로그인 성공');
								location.reload();
							}
						},
						error : function(req, status, error) {
							alertify.alert(req.status + "\nmessege"
									+ req.responseTest);
						}
					});
		}

		function logout() {
			if (confirm('로그아웃 하시겠습니까?')) {
				alertify.success("로그아웃 완료");
				jQuery.ajax({
					type : "POST",
					url : "LogOut.do",
					async : false,
					success : function(data) {
						if (data == 0) {
							alertify.error("로그아웃 실패");
						} else {
							alertify.success('로그아웃 성공');
							location.reload();
						}
					},
					error : function(req, status, error) {
						alertify.alert(req.status + "\nmessege"
								+ req.responseTest);
					}
				});
			} else {
				alertify.error("로그아웃 취소");
			}
		}
	</script>
	<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
내 용 : 부스러기 만들기
■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
	<script>
		function makeVSS() {
			if ($("#VSS_name").val() == "") {
				alertify.warning("부스러기 이름을 입력해주세요");
				return;
			}
			;
			if ($("#VSS_content").val() == "") {
				alertify.warning("부스러기 내용을 입력해주세요");
				return;
			}
			;
			
			
			
			if (confirm('부스러기를 만드시겠습니까?')) {
				jQuery.ajax({
					type : "POST",
					url : "makeVSS.do",
					data : $("#makeVSS").serialize(),
					async : false,
					success : function(data) {
						if (data == 0) {
							alertify.error("이미 존재하는 부스러기 입니다");
						} else {
							alertify.success("부스러기 만들기 성공");
							location.href = "VSSBoard.do?pg=1&vss_seq=" + data ;
						}
					},
					error : function(req, status, error) {
						alertify.alert(req.status + "\nmessege"
								+ req.responseTest);
					}
				});
			} else {
				alertify.error("부스러기 만들기 취소");
			}
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
내 용 : header아이콘, 모달 작동 부분 
■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
	<script type="text/javascript">
// 		window.onclick = function(event) {
// 			if (event.target == myModal) {
// 				$('#myModal').modal('hide');
// 			}
// 		}
		
// 		헤더버튼
		$(document).ready(function() {
			$("[id='btn-login']").click(function() {
				$('#myModal').modal('show');
			});

			$("[id='btn-search']").click(function() {
				var isLogin = "<%=session.getAttribute("uv")%>";
				if (isLogin == "null") {
					alertify.error("먼저 로그인 해주세요.");
					return false;
				}
				else
				$('#vssModal').modal('show');
			});
			
			
// 			비번 아디찾기
						
			$("[id='btn_findIdModal']").click(function() {
				$('#findIdModal').modal('show');				
			});
			
			$("[id='btn_findPwModal']").click(function() {
				$('#findPwModal').modal('show');
			});
			
			$('#myModal').on('shown.bs.modal', function() {
				$('#u_id').focus();					
			});		
			$('#findIdModal').on('shown.bs.modal', function() {
				$('#u_email').focus();			
			});
			$('#findPwModal').on('shown.bs.modal', function() {
				$('#re_u_id').focus();	
				
			});		
			

		});
	</script>


	<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
내 용 : dropdown
■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
	<script>
function dropdown(){
   $("#dropdown").toggle();
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

<script>
function dropdown2(){
   $("#dropdown2").toggle();
}
window.onclick = function(event){
   if(!event.target.matches('.header-col')){
      var dropdowns = document.getElementsByClassName("dropdown-content2");
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
<script>
function dropdown3(){
   $("#dropdown3").toggle();
}
window.onclick = function(event){
   if(!event.target.matches('.header-col')){
      var dropdowns = document.getElementsByClassName("dropdown-content3");
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
<script>
function dropdown4(){
   $("#dropdown4").toggle();
}
window.onclick = function(event){
   if(!event.target.matches('.header-col')){
      var dropdowns = document.getElementsByClassName("dropdown-content4");
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

<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
내 용 : 링크 로그인 검사
작성자 : 건영
■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->


<script type="text/javascript">

// ,[id='pop_vss_btn']
$("[id='btn_mypage'],[id='btn_history']").click(function () {
	var isLogin = "<%=session.getAttribute("uv")%>";
	if (isLogin == "null") {
		alertify.error("먼저 로그인 해주세요.");
		return false;
	}
});

</script>

</body>
</html>