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
				<div class="col-12 col-sm-12 col-lg-6 col-xl-4">
					<h3>
						<ul class="vss-a-menu">
							<li><a href="Board.do?page=1"> 게시판 </a></li>
							<li><a href="UserAllData.do">유저정보 전부보기</a></li>
							<li><a href="SignUp.do">회원가입</a></li>
							<li><a href="Login.do">로그인</a></li>
							<li><a href="">메인</a></li>
							<li><a href="MyPage.do">마이페이지</a></li>
							<li><a href="ip.do">ip</a></li>
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

					<ul class="vss-hot" id="board_ul">

						<li id="board_list" style="display: none;"><a href=" "
							class="board-name"></a> <span>▶ </span> <a href=" ">ㄹㄹ</a></li>

					</ul>

					<a href="Board.do?page=1"><span id="MoreALL" class="">+1111더보기</span></a>
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
          	 objRow.html('<li><a href="Content.do?b_seq=' +data[i]['b_seq']+ ' " class="board-name">'+data[i]['c_seq']+
          	'</a><span>▶  </span> <a href="Content.do?b_seq=' +data[i]['b_seq']+ ' ">'+data[i]['b_title']+'</a></li>');
          	 
          	$("#board_ul").append(objRow);
          }
         }
	});
	
});
</script>
</html>