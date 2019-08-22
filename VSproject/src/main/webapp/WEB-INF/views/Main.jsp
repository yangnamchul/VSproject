<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/jquery-3.4.1.js"></script>
<script src="resources/js/alertify.min.js"></script>

<!-- Vss's -->

<link rel="stylesheet" href="resources/css/VSs_Main.css">
</head>

<h1>메인페이지</h1>

<body>
	<div class="top">
		<div class="search">
			<div class="input">
				<input type="text" class="input" placeholder="Type to search" />
				<button class="icon" onclick="searchToggle(this, event);">
					<span></span>
				</button>
			</div>
			<span class="close" onclick="searchToggle(this, event);"></span>
		</div>
		<a href="#"><img src="#"> MY </a>
	</div>
	<hr />
	<div class="slideshow-container">
		<div class="mySlides fade">
			<div class="numbertext">1 / 3</div>
			<img src="resources/images/banner_img_01.jpg" style="width: 100%">
			<div class="text">Caption Text</div>
		</div>

		<div class="mySlides fade">
			<div class="numbertext">2 / 3</div>
			<img src="resources/images/banner_img_02.jpg" style="width: 100%">
			<div class="text">Caption Two</div>
		</div>
		<div class="mySlides fade">
			<div class="numbertext">3 /3</div>
			<img src="resources/images/banner_img_03.jpg" style="width: 100%">
			<div class="text">Caption Three</div>
		</div>
		<a class="prev" onclick="plusSlides(-1)">&#10094;</a> <a class="next"
			onclick="plusSlides(1)">&#10095;</a>
	</div>


	<br>
	<div style="text-align: center">
		<span class="dot" onclick="currentSlide(1)"></span> <span class="dot"
			onclick="currentSlide(2)"></span> <span class="dot"
			onclick="currentSlide(3)"></span>
	</div>
	<script>
		var slideIndex = 1;
		showSlides(slideIndex);

		function plusSlides(n) {
			showSlides(slideIndex += n);
		}

		function currentSlide(n) {
			showSlides(slideIndex = n);
		}

		function showSlides(n) {
			var i;
			var slides = document.getElementsByClassName("mySlides");
			var dots = document.getElementsByClassName("dot");
			if (n > slides.length) {
				slideIndex = 1
			}
			if (n < 1) {
				slideIndex = slides.length
			}
			for (i = 0; i < slides.length; i++) {
				slides[i].style.display = "none";
			}
			for (i = 0; i < dots.length; i++) {
				dots[i].className = dots[i].className.replace(" active", "");
			}
			slides[slideIndex - 1].style.display = "block";
			dots[slideIndex - 1].className += " active";
		}
		function searchToggle(obj, evt) {
			var container = $(obj).closest('.search');
			if (!container.hasClass('active')) {
				container.addClass('active');
				evt.preventDefault();
			} else if (container.hasClass('active')
					&& $(obj).closest('.input').length == 0) {
				container.removeClass('active');
				// clear input
				container.find('.input').val('');
			}
		}
	</script>




	<h1>메인페이지</h1>
	<div align="right">
		<h2>검색 MY(로그인)</h2>
	</div>

	<hr />
	<div align="center" style="color: red">
		<h2>
			<FONT COLOR="red">게시판 </FONT> <FONT COLOR="red"> 카테고리 </FONT> <FONT
				COLOR="red"> 최신글 </FONT> <FONT COLOR="red"> 공지사항 </FONT> <br> <FONT
				COLOR="green"><a href="Ajax.do">AJAX 실험실</a> </FONT>
		</h2>
	</div>

	<hr />
	<a href="Board"> 게시판 </a>
	<a href="UserAllData.do">유저정보 전부보기</a>
	<a href="SignUp.do">회원가입</a>
	<a href="Login.do">로그인</a>

</body>
</html>