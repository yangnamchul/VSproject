<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
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

	<%@ include file="Header.jsp"%>

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
					
					

					
						<c:forEach var="vo1" items="${boardlist}">
						<tr>
							<td>${vo1.b_seq}</td>
							<td id="title"><c:if test="${article.depth > 0}">
                  &nbsp;&nbsp;
                </c:if> <a
								href="BoardOneView.do?b_seq=${vo1.b_seq}">${vo1.b_title} </a> <c:if test="${article.hit >= 20}"></c:if></td>
									<span class="hit">hit! (무시)</span>
							
							<td>${vo1.b_writer}</td>
							<td>${vo1.b_date}</td>
							<td>${vo1.b_cnt}</td>
						<tr>					
					
							          </c:forEach>
					</tbody>
				</table>

				<!-- Paging 처리 -->
				<div class="col-xs-12" id="paging">${pageCode}(페이지번호)</div>
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
				<% session.invalidate();%>
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