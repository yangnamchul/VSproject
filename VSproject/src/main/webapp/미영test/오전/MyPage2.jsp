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
<link rel="stylesheet" type="text/css" href="resources/css/VSsMain2.css">
<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.css">


<link rel="stylesheet" href="resources/css/alertify.default.css" />
<link rel="stylesheet" href="resources/css/alertify.core.css" />
<script src="resources/js/jquery-3.4.1.js"></script>
<script src="resources/js/alertify.min.js"></script>
<script src="resources/js/bootstrap.js"></script> 

</head>
<body>
<%-- <%@ include file="Header.jsp"%> --%>
	
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
		
		function logout() {
			jQuery.ajax({
				type : "POST",
				url : "LogOut.do",
				async : false,
				success : function(data) {
					if (data == 0) {
						alertify.alert("로그아웃 실패");
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


	<div id="content-area">
		<div class="container" id="main">
			<div class="row" id="mypageDiv">
				<div id="my-info" class="col-12 col-sm-6 col-lg-6 col-xl-6">
				<div class="vss-title">마이페이지</div>
					<div class="vss-join" id="JoinForm">
		               <li>아이디 <input type="text" name="u_id" readonly="readonly" value="${uv.u_id}">
		               </li>
		               <li>별&nbsp;&nbsp;명 <input type="text" name="u_name" readonly="readonly" value="${uv.u_name}">
		               	<div class="change-btn" id="change-nickbtn">
							<button type="button" class="changebtn">수정</button>
						</div>
		               </li>
		<!--                <li>별&nbsp;&nbsp;명 <input type="text" name="u_nick"></li> -->
		               <li>암&nbsp;&nbsp;호 <input type="text" name="u_pw" class="password" readonly="readonly" value="${uv.u_pw}">
		               	<div class="change-btn" id="change-pwbtn" id="change-pwbtn">
		               		<button type="button" class="changebtn">수정</button>
		               	</div>	       
		               </li>               
		               <li>이메일 <input type="text" name="u_email" readonly="readonly" value="${uv.u_email}"> </li>
		               <li>가입일 
		               <input type="text" name="u_date" readonly="readonly" value="${uv.u_date}" />
		               <%-- <fmt:formatDate value="${uv.u_date}" pattern="MM-DD" /> --%>
		               </li>
		               <div align="center" class="submit-btn"> 
		                  <button type="submit" class="submitbtn">완료</button>             
		               </div>                                                
           	 		</div>
				</div>
				
				<div id="lastest" class="col-12 col-sm-6 col-lg-6 col-xl-6">
					<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
					  <li class="nav-item">
					    <a class="nav-link active" id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true">my작성글</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" id="pills-profile-tab" data-toggle="pill" href="#pills-profile" role="tab" aria-controls="pills-profile" aria-selected="false">my작성댓글</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" id="pills-contact-tab" data-toggle="pill" href="#pills-contact" role="tab" aria-controls="pills-contact" aria-selected="false">추천글</a>
					  </li>
					</ul>
					<div class="tab-content" id="pills-tabContent">
					  <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
					  	<table class="table table-striped table-bordered table-hover" id="mypage">
							<thead>
								<tr>
									<th width="10%">번호</th>
									<th width="50%">제목</th>
									<th width="10%">작성자</th>
									<th width="20%">작성일</th>
									<th width="10%">조회</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="vo1" items="${bvlist}">
								<tr>
									<td>${vo1.b_seq}</td>
									<td id="title"><a href="Content.do?b_seq=${vo1.b_seq}">${vo1.b_title}
									</a></td>
									<td>${vo1.u_id}</td>
									<td><fmt:formatDate value="${vo1.b_date}" pattern="MM-dd" />
									</td>
									<td>${vo1.b_cnt}</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
						<table class="table table-striped table-bordered table-hover" id="mypage">
							<thead>
								<tr>
									<th width="10%">번호</th>
									<th width="50%">제목</th>
									<th width="10%">작성자</th>
									<th width="20%">작성일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="vo2" items="${rvlist}">
									<tr>
										<td>${vo2.re_seq}</td>
										<td id="title"><a href="Content.do?b_seq=${vo2.b_seq}">${vo2.re_content}
										</a></td>
										<td>${vo2.u_id}</td>
										<td>"${vo2.re_date}"</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="tab-pane fade" id="pills-contact" role="tabpanel" aria-labelledby="pills-contact-tab">
				 		<table class="table table-striped table-bordered table-hover" id="mypage">
							<thead>
								<tr>
									<th width="10%">번호</th>
									<th width="50%">제목</th>
									<th width="10%">작성자</th>
									<th width="20%">작성일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="vo3" items="${vvlist}">
									<tr>
										<td>${vo3.v_seq}</td>
										<td id="title"><a href="Content.do?b_seq=${vo3.b_seq}">${vo3.b_seq}
										</a></td>
										<td>${vo3.u_id}</td>
										<td>"${vo3.v_date}"</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				
				</div>
			</div>
			<!-- 			로그인 팝업창  -->
		<div class="row">
				<div class="modal fade" id="change-nickModal" data-backdrop="static">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
							 <span>별명 변경하기</span>
							 	<button class="close" data-dismiss="modal">&times;</button>
							</div>
							<div class="modal-body">
								<form class="modal-login" id="loginForm">
									<li>별  명<br><input type="text" name="u_name" id="u_name"></li>
								</form> <!-- 여기 -->
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary" onclick="change_nick">변경</button>
			        			<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>
				</div> 
				<div class="modal fade" id="change-pwModal" data-backdrop="static">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
							 <span>암호 변경하기</span>
							 	<button class="close" data-dismiss="modal">&times;</button>
							</div>
							<div class="modal-body">
								<form class="modal-login" id="loginForm">
									<li>암     호<br><input type="text" name="u_pw" id="u_pw"></li>
									<li>암호확인<br><input type="text" name="u_pw_rep" id="u_pw_rep"></li>
								</form> <!-- 여기 -->
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary" onclick="change_pw">변경</button>
			        			<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>
				</div> 
			</div>
		</div>
	</div>
<script type="text/javascript">
$(document).ready(function() {
	$("[id='change-nickbtn']").click(function() {
		$('#change-nickModal').modal('show');
	});
	$("[id='change-nickbtn']").click(function() {
		$('#change-nickModal').modal('hide');
	});
	
	$("[id='change-pwbtn']").click(function() {
		$('#change-pwModal').modal('show');
	});
	$("[id='change-pwbtn']").click(function() {
		$('#change-pwModal').modal('hide');
	});
});
</script>	

</body></html>