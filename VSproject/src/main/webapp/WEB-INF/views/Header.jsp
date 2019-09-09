<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Gugi|Poor+Story&display=swap">
<link rel="stylesheet" type="text/css" href="resources/css/VSsMain.css">
<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.css">
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
					
<!-- 					<div class="right-col" id="btn-search">
						<div class="right-row">
							<img
								src="http://icons.iconarchive.com/icons/pixture/donuts/32/PowderSugared-icon.png"
								alt="" />
						</div>
						<div class="right-row">검색</div>
					</div>
 -->
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



<!-- 		<div class="frm-search" style="display: none;">
			<form action="#" method="get" id="right-search-form">
				<input type="text" placeholder="부스러기 검색" value=""
					id="right-search-input" name="검색input이름">
				<button type="submit" id="search-btn">
					<img src="https://static.thenounproject.com/png/644045-200.png"
						width="16px" height="16px" />
				</button>
			</form>
		</div> -->

		
		<div class="row">
		<!-- 로그인 팝업창 모달  -->
			<div class="modal fade" id="myModal" data-backdrop="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<span>로그인</span>
							<button class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body">
							<form class="modal-login" id="loginForm">
								<li>아이디<br>
								<input type="text" name="u_id" id="u_id"></li> <br>
								<li>암 호<br>
								<input type="password" name="u_pw" id="u_pw"></li>
								<div id="pop_login_btn">
									<div class="auto-login" id="btn-login">
<!-- 										<input type="checkbox" id="auto-login" /> 자동로그인 -->				
									</div>
									<button type="button" id="btn-login" onclick="login()">로그인</button>
								</div>
							</form>
							<!-- 여기 -->
						</div>
						<div class="modal-footer">
							<div align="center" id="pop_join_btn">
								<div class="find-id-pw">
									<a data-toggle="modal" data-target="#findIdModal">아이디찾기</a> / 
									<a data-toggle="modal" data-target="#findPwModal">암호찾기</a>
								</div>
								<span>아직 회원이 아니면??</span>
								<button type="button" onclick="location.href = 'SignUp.do' ">회원가입</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 아이디찾기 모달 -->
			<div class="modal fade" id="findIdModal" data-backdrop="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<span>아이디찾기</span>
							<button class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body">
							<form class="modal-change" id="findIdForm">
							<div>
								<li class= "mx-auto">이메일 <input type="email" name="u_email" id="u_email" class="fd-id-pw"></li>
								<div id="findId_btn">
									<button type="button" id="btn-findId" onclick="FindID()">아이디찾기</button>
								</div>
							</div>
							</form>
						</div>
						<div class="modal-footer"></div>
						</div>
					</div>
				</div>
			<!-- 암호 재설정 모달 -->
			<div class="modal fade" id="findPwModal" data-backdrop="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<span>암호 재설정</span>
							<button class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body">
							<form class="modal-change" id="findPwForm">
							<div>
								<li class= "mx-auto">아이디
								<input type="text" name="u_id" id="u_id" class="fd-id-pw"></li>
								<li class= "mx-auto">이메일
								<input type="email" name="u_email" id="u_email"  class="fd-id-pw"></li>
								<div id="findPw_btn">
									<button type="button" id="btn-findPw" onclick="FindPW()">암호 재설정</button>
								</div>
							</div>
							</form>
						</div>
						<div class="modal-footer"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
<script>	
	//아이디 찾기 ajax
	function FindID() {
		if($("#u_email").val()=="") {
			alertify.warning("이메일을 입력해주세요");
			return;
		};
		
		jQuery.ajax({
			type:"POST",
			url:"FindID.do",
			data:$("#findIdForm").serialize(),
			async : false,
			success : function (data) {
				if (data == "no-data") {
					alertify.error("아이디 정보가 없습니다.");
					$("#u_email").val("");
				} else {
					alertify.sucess("당신의 아이디는 " + data + "입니다")
				}
			},
			error: function (req, status, error) {
				alertify.error(req.status+ "\nmessege"+ req.responseTest );
			}
		});
	}
	//비밀번호 찾기 ajax
	function FindPW() {
		if($("#u_id").val()=="") {
			alertify.warning("아이디를 입력해주세요");
			return;
		};
		if($("#u_email").val()=="") {
			alertify.warning("이메일을 입력해주세요");
			return;
		};
		
		jQuery.ajax({
			type:"POST",
			url:"FindPW.do",
			data:$("#findPwForm").serialize(),
			async : false,
			success : function (data) {
				if (data == 0) {
					alertify.error("아이디 정보가 없습니다.");
					$("#u_id").val("");
					$("#u_email").val("");
				} else {
					alertify.sucess("암호 재설정페이지로 이동합니다.")
					$("#changePWModal").modal();
				}
			},
			error: function (req, status, error) {
				alertify.error(req.status+ "\nmessege"+ req.responseTest );
			}
		});
	}
	
</script>
	</header>


	<!-- 주메뉴 -->
	<div id="header-bar" class="container">
		<div class="row" align="center">
			<div class="header-row">
				<div class="header-col" onclick="myFunction()">
					MYPAGE 
					<img src="https://www.materialui.co/materialIcons/navigation/arrow_drop_down_black_192x192.png"
						alt="" width="32px" />
					<!-- Dropdown -->
					<div id="dropdown" class="dropdown-content">
						<a href="MyPage.do">내정보</a>
						<a href="History.do">HISTORY</a>
					</div>
				</div>

				<div class="header-col">
					메뉴2 
					<img src="https://www.materialui.co/materialIcons/navigation/arrow_drop_down_black_192x192.png"
						alt="" width="32px" />
					<div id="dropdown" class="dropdown-content">
						<a href="#"></a>
						<a href="#"></a>
					</div>	
				</div>

				<div class="header-col">
					메뉴3 
					<img src="https://www.materialui.co/materialIcons/navigation/arrow_drop_down_black_192x192.png"
						alt="" width="32px" />
					<div id="dropdown" class="dropdown-content">
						<a href="#"></a>
						<a href="#"></a>
					</div>	
				</div>

				<div class="header-col">
					메뉴4 
					<img src="https://www.materialui.co/materialIcons/navigation/arrow_drop_down_black_192x192.png"
						alt="" width="32px" />
					<div id="dropdown" class="dropdown-content">
						<a href="#"></a>
						<a href="#"></a>
					</div>
				</div>

			</div>

		</div>
	</div>
	<!-- row end -->


	<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
내 용 : 헤더 로그인  KeyDown
■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
	<script>   
$( document ).ready(function() {   
   $("#u_pw").keydown(function (fn_enter) {
       if (fn_enter.keyCode == 13) {
          login();
       }
   });    
});   
</script>

	<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
내 용 : ajax 로그인
■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
	<script>
      function login() {
         if ($("#u_id").val() == "") {
        	 alertify.warning("아이디를 입력해주세요");
            return;
         };
         if ($("#u_pw").val() == "") {
        	 alertify.warning("비밀번호를 입력해주세요");
            return;
         };
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
                        $("#u_id").val("");
                        $("#u_pw").val("");
                     } else {                    	
                    	alertify.success('로그인 성공');
                        location.reload() ;
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
    	                  location.reload() ;
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
내 용 : header 아이콘 작동 부분 
■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
	<script type="text/javascript">
	window.onclick = function(event) {
	     if (event.target == myModal) {
	        $('#myModal').modal('hide');           
	     }
	   }
	   
	$('#myModal').on('shown.bs.modal', function() {
	     $('#u_id').focus();
	   });
	$('#findIdModal').on('shown.bs.modal', function() {
		$('#myModal').modal('hide');
	   });
	$('#findPwModal').on('shown.bs.modal', function() {
		$('#myModal').modal('hide');
	   });
	
	$(document).ready(function() {
		   $("[id='btn-login']").click(function() {
		      $('#myModal').modal('show');
		   });
		   $("[id='btn-login']").click(function() {
		      $('#myModal').modal('hide');
		   });
		});
		</script>


	<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
내 용 : dropdown
■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
	<script>
function myFunction(){
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
</body>
</html>