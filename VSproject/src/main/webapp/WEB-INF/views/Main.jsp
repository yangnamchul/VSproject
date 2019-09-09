<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

	<%-- 	<%@ include file="t_Header.jsp"%> --%>
	<%@ include file="Header.jsp"%>

	<!-- 	Content 내용부분 -->
	<div id="content-area">
		<div class="container" id="main">
			<div class="row">
			
			<div class="col-12 col-sm-12 col-lg-12 col-xl-12" id="main_img"> 
			
			<img src="resources/css/test/Main.png" alt="" width="70%" />
				</div>										

				<div class="col-12 col-sm-6 col-lg-6 col-xl-6">
					
					<ul class="vss-hot">
					<li> <h5>
						<a id="vss_title" href="#" style="color:black !important">부스러기 인기글</a>
					</h5>
					</li>

						<li><a href="#" id="vss">부스러기</a>  <a
							href="#">아무내용링크1</a></li>
						<li><a href="#" id="vss">부스러기</a>  <a
							href="#">아무내용링크1</a></li>
						<li><a href="#" id="vss">부스러기</a>  <a
							href="#">아무내용링크1</a></li>
						<li><a href="#" id="vss">부스러기</a>  <a
							href="#">아무내용링크1</a></li>
						<li><a href="#" id="vss">부스러기</a>  <a
							href="#">아무내용링크1</a></li>
							
					</ul>

				</div>
				
				<div class="col-12 col-sm-6 col-lg-6 col-xl-6">					

					<ul class="vss-hot" id="board_ul">
					<li> <h5>
						<a id="vss_title" href="Board.do?pg=1" style="color:black !important">부스러기 최신글</a>
					</h5>
					</li>					
						<li id="board_list" style="display: none;">
						<a href=" " id="vss"></a> <a href=" ">ㄹㄹ</a></li>
					</ul>					
				</div>
				
				<div class="col-12 col-sm-12 col-lg-6 col-xl-4" id="main_list">
					<h3>
						<ul class="vss-a-menu">
							<li><a href="Board.do?pg=1"> 전체게시판 </a></li>
<!-- 							<li><a href="UserAllData.do">유저정보 전부보기</a></li> -->
							<li><a href="SignUp.do">회원가입</a></li>
<!-- 							<li><a href="Login.do">로그인</a></li> -->
							<li><a href="">메인</a></li>
<!-- 							<li><a href="MyPage.do">마이페이지</a></li> -->
<!-- 							<li><a href="makeVSS.do">부스러기 만들기</a></li> -->
<!-- 							<li><a href="VSSBoard.do?vss_seq=1">부스러기 보기</a></li> -->
							<li><a href="AllVss.do">부스러기 전부 보기</a></li>
						</ul>
					</h3>
				</div>		
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">


$(document).ready(function() { 
	
	$.ajax({
		type: 'GET',
		url: 'Board1.do',
        async: false,
        dataType: 'json',//동기 비동기 설정
		 error : function(){
//              alert("통신실패!!!!");
         },
         success : function(data){
          /* alert("통신 데이터 값 : " + data[0]["b_title"]); */
          for(var i=0; i<5;i++){	
             var objRow = $("#board_list").clone();  //li 복사
             objRow.removeAttr("style");
          	 objRow.html('<li><a href="VSSBoard.do?pg=1&vss_seq=' +data[i]['vss_seq']+ ' " id="vss">'+data[i]['vssName']+
          	'</a> <a href="Content.do?b_seq=' +data[i]['b_seq']+ ' ">'+data[i]['b_title']+'</a></li>');
          	 
          	$("#board_ul").append(objRow);
          }
         }
	});
	
});
</script>
</html>