<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/Signup.css"/>
</head>
<body>
<form class="signup-content" action="UserInsertData.do" method="get">
이름<input type="text" name="u_name"><br>
아이디<input type="text" name="u_id"><br>
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
e-mail<input type="email" name="u_email"><br>
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
	             $('.password-rep-container .active').css('background-color','#FF4b47');
	              changeText(pbText, '비밀번호가 다릅니다.');
	            } else {
	              $('.password-rep-container .progress-bar_item').each(function() {
	                $(this).addClass('active');
	              });
	              $('.password-rep-container .active').css('background-color','#2DAF7D');
	              changeText(pbText, '비밀번호가 같습니다');
	            }
	});
});
</script>
</body>
</html>

