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
<link rel="stylesheet" type="text/css" href="resources/css/GuRem.css" />

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/Signup.css"/>
</head>
<body>
<header>
		<div class="container">
			<div class="row">
				<div class="col-xs-4">
					<a href="/"> <span class="VSlogo">부스러기 </span> <img
						src="http://icons.iconarchive.com/icons/pixture/donuts/32/Yummy-icon.png"
						alt="" />
					</a>
				</div>

				<!-- 				검색 div -->
				<div class="col-xs-8" align="right">
					<form action="#" method="get" id="right-search-form">
						<input type="text" placeholder="부스러기 검색" value=""
							id="right-search-input" name="q"> 검색 아이콘
						<button type="submit" id="search-btn">
							<i class="fa fa-search"></i>
						</button>
					</form>
				</div>
			</div>
		</div>
		<div id="header-bar" class="container">
			<div class="row">
				<div id="header-menu-left" class="col-xs-2" align="left">

					<!-- 스크립트로 소메뉴 여는 부분 Class -->
					<!-- <div class="dropdown">
						<a href="#" class="dropdown-toggle" id="latestDropdown"
							data-toggle="dropdown"> <i class="fa fa-clock-o"></i> 최근<span
							class="caret"></span>
						</a>
						<ul class="dropdown-menu" aria-labelledby="latestDropdown"
							id="latestDropdownMenu"></ul>
					</div>
					<div class="dropdown">
						<a href="#" class="dropdown-toggle" id="favoriteDropdown"
							data-toggle="dropdown"> <i class="fa fa-star"></i> <span
							class="caret"></span>
						</a>
						<ul class="dropdown-menu" aria-labelledby="favoriteDropdown"
							id="favoriteDropdownMenu"></ul>
					</div>
					<div class="dropdown">
						<a href="#" class="dropdown-toggle" id="playgroundDropdown"
							data-toggle="dropdown"> <i class="fa fa-smile-o"></i> <span
							class="caret"></span>
						</a>
						<ul class="dropdown-menu" aria-labelledby="playgroundDropdown"
							id="playgroundDropdownMenu">
							<li><a href="/play/attendance">출석체크</a></li>
							<li><a href="/play/ad">전광판</a></li>
							<li><a href="/play/iconshop">아이콘샵</a></li>
							<li><a href="/play/giveaway">포인트경품</a></li>
							<li class="divider"></li>
							<li><a href="/play/chatutil">채팅툴</a></li>
						</ul>
					</div> -->
					<!-- 스크립트로 소메뉴 여는 부분 Close -->
				</div>
				<div id="header-top-notice" class="col-xs-8" align="center">
					부스러기 | 최신VS | 인기VS | 공지사항</div>
				<!-- 메인바 우측메뉴	 -->
				<!-- <div id="header-menu-right" class="col-xs-2" align="right">
					<div class="dropdown">
						<a href="/note/lists" class="dropdown-toggle"> <i
							class="fa fa-envelope-o"></i> <span class="caret"></span>
						</a>
					</div>
					<div class="dropdown">
						<a href="#" class="dropdown-toggle" id="userDropdown"
							data-toggle="dropdown"> <i class="fa fa-user"></i> <span
							class="caret"></span></a> </a>
						<ul class="dropdown-menu dropdown-menu-right"
							aria-labelledby="userDropdown">
							<li><a href="/member/login"><i class="fa fa-twitch"></i>
									로그인</a></li>
						</ul>
					</div>
				</div> -->
			</div>
			<!-- row end -->
		</div>
	</header>
	<hr>
	
<form class="signup-content" action="UserInsertData.do" method="get">
<div class="signup-container">
이름<input type="text" name="u_name"><br>
아이디<input type="text" name="u_id"><br>
</div>

<div class="password-container">
비밀번호<input type="password" name="u_pw" class="password">
<div class="progress-bar_wrap">
      <div class="progress-bar_item progress-bar_item-1"></div>
      <div class="progress-bar_item progress-bar_item-2"></div>
      <div class="progress-bar_item progress-bar_item-3"></div>
    </div>
    <span class="progress-bar_text">Password is blank</span>
    </div>
    
<div class="password-rep-container">
비밀번호 확인<input type="password" name="u_pw_rep" class="password-rep"><br>
  <div class="progress-bar_wrap">
      <div class="progress-bar_item progress-bar_item-1"></div>
      <div class="progress-bar_item progress-bar_item-2"></div>
      </div>
    <span class="progress-bar_text">Password is blank</span>
    </div>

    <div class="signup-container">
e-mail<input type="email" name="u_email"><br>
</div>

<div class="clearfix">
<input type="submit" value="가입하기" class="submitbtn">
<button class="cancelbtn">뒤로가기</button>
</div>
</form>
<script>
$( document ).ready(function() {	  
	  const changeText = function (el, text, color) {
	    el.text(text).css('color', color);
	  };
	  $('.password').keyup(function(){
		    len = this.value.length;
		    const pbText = $('.password-container .progress-bar_text');
		    if (len == 0) {
		      $('.password-container .progress-bar_item').each(function() {
		        $(this).removeClass('active')
		      });
		      changeText(pbText, 'Password is blank');
		    } else if (len > 0 && len <= 4) {
		      $('.password-container .progress-bar_item-1').addClass('active');
		      $('.password-container .progress-bar_item-2').removeClass('active');
		      $('.password-container .progress-bar_item-3').removeClass('active');
		      changeText(pbText, 'Too weak');
		    } else if (len > 4 && len <= 8) {
		      $('.password-container .progress-bar_item-2').addClass('active');
		      $('.password-container .progress-bar_item-3').removeClass('active');
		      changeText(pbText, 'Could be stronger');
		    } else {
		      $('.password-container .progress-bar_item').each(function() {
		        $(this).addClass('active');
		      });
		      changeText(pbText, 'Strong password');
		    } 
	  });
	  $('.password-rep').keyup(function(){
		    len = this.value.length;
		    const pbText = $('.password-rep-container .progress-bar_text');
	
		    if (len === 0) {
	              $('.password-rep-container .progress-bar_item').each(function() {
	                $(this).removeClass('active')
	              });
	              changeText(pbText, '비밀번호를 입력해주세요');
	            } else if ($('.password').val() != $('.password-rep').val()) {
	             $('.password-rep-container .progress-bar_item-1').addClass('active');
	             $('.password-rep-container .progress-bar_item-2').removeClass('active');
	             $('.password-rep-container .active').css('background-color','#ff0000');
	              changeText(pbText, '비밀번호가 다릅니다.');
	            } else {
	              $('.password-rep-container .progress-bar_item').each(function() {
	                $(this).addClass('active');
	              });
	              $('.password-rep-container .active').css('background-color','#80ffff');
	              changeText(pbText, '비밀번호가 같습니다');
	            }
	});
});
</script>
</body>
</html>

