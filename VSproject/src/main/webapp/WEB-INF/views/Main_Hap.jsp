<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="CSS/SlideBar.css">
<link rel="stylesheet" href="CSS/Search.css">

</head>
<!-- http://optimal.inven.co.kr/upload/2017/04/18/bbs/i15611233270.png -->
<body>
	<div class="top">
		<a href="http://naver.com"><img src="img4.png"></a>
		<div class="search">
			<div class="input">
				<input type="text" class="input" placeholder="Type to search" />
				<button class="icon" onclick="searchToggle(this, event);">
					<span></span>
				</button>
			</div>
			<span class="close" onclick="searchToggle(this, event);"></span>
		</div>
	</div>



</body>
</html>