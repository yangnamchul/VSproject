<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

<link
	href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Gugi|Poor+Story&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="resources/css/GuRem2.css">
<script src="resources/js/jquery-3.4.1.js"></script>

<title>Insert title here</title>

<style>
/*08-29 게시물 목록*/

#boardDiv {
	background-color: #000084;
	margin: 0 auto;
}

#boardDiv>div>h3, b {
	text-align: center;
	color: white;
}

tr:hover {
      background-color: #fff !important;
    }


#list {
	text-align: center;
}

#write>a {
	color: white;
	float: right;
	background-color: #ff4d00;
	text-shadow: 1px 1px 1px #000;
	margin-right: 10px;
	font-size: 22px !important;
}

#paging {
	color: white;
	text-align: center;
}

th, td {
	background-color: lightgray;
	color: blue;
}
</style>
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


	<div class="container" >
		
		<div class="row" id="boardDiv" >
		
			<div>
				<h3> [아무]의 부스러기 (전체 글 : { 딸린 vss count}</h3> 
				
				<!-- Login 검증 -->
				<!-- jstl의 if문은 else가 없어서 따로 검증해야함. -->
				<c:if test="${id != null}">
					<%-- <%@include file="loginOk.jsp" %> --%>
				</c:if>
				<c:if test="${id == null}">
					<%-- <%@include file="login.jsp" %> --%>
				</c:if>
			</div>

			<div class="col-xs-10" id="list" style="border: 1px solid orange;">
				<b>뭔가 부제_아무말 넣을 자리</b>
			</div>

			<div class="col-xs-2" id="write">
				<a href="/bbs/writeForm.bbs?pageNum=${pageNum}">글쓰기</a>
			</div>

			<div class="col-xs-12" class="board_table"	style="border: 1px solid green; margin: 1% 0;">
				<table class="table table-striped table-bordered table-hover">
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
					
					

				<%int total=0; %>
						<c:forEach var="vo1" items="${boardlist}">
						<tr>
							<td>${vo1.b_seq}</td>
							<td id="title"> <a
								href="BoardOneView.do?b_seq=${vo1.b_seq}">${vo1.b_title} </a> </td>									
							
							<td>${vo1.u_id}</td>
							<td>${vo1.b_date}</td>
							<td>${vo1.b_cnt}</td>
							<% int cnt=1; 
							total=total+cnt;%> 
							
						<tr>	
							          </c:forEach>
              
					</tbody>
				</table>

			<!-- Paging 처리 -->
	
				<%int p=total/5;
				out.println(total);%>
				<%for (int i=1; i<p; i++){
				%>
				<div class="col-xs-12" id="paging"><%=i%></div>
				<%
				} %>
				
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
				frm_search.css('left', btn_search.left-350 ) ;				
				$('.frm-search' ).toggle();			
				
			});
			
			$("[id='btn-login']").click(function() {
				frm_login.css('top', btn_login.top+10   ) ;
				frm_login.css('left', btn_login.left ) ;	
				$('#loginForm').toggle();
			});
			
			$("[id='btn-logout']").click(function() {
				<%session.invalidate();%>
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