<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>      

<%@ include file="Header.jsp"%>

    <!-- 회원가입 폼 -->
<div id="content-area">
<div class="container" id="main">
   <div class="row" id="joinDiv">
      <div class="col-12 col-sm-12 col-lg-12 col-xl-12">
      <form action="UserInsertData.do" method="get">
         <h1> 회원가입 </h1>
						<div id="JoinForm">
							<ul class="vss-join">
								<li>아이디&nbsp;&nbsp; <input type="text" name="u_id" id="user_id" />
									<div id="id-check-btn">
										<div>
											<!-- 										모바일 일때 안쪽으로 배치용 -->
											<span class="id-check-text2"> 중복검사항목 </span>
											<button type="button" class="checkbtn">중복검사</button>
										</div>										
									</div>
									<div class="id-check-text">중복검사항목</div>
								</li>
								<li>이&nbsp;&nbsp;름&nbsp;&nbsp; <input type="text"
									name="u_name" /></li>
								<li>별&nbsp;&nbsp;명&nbsp;&nbsp; <input type="text"
									name="u_nick" /></li>
								<li>암&nbsp;&nbsp;호&nbsp;&nbsp; <input type="password"
									name="u_pw" class="password" /><br>
									<div class="progress-bar_wrap">
										<div class="progress-bar_item progress-bar_item-1"></div>
										<div class="progress-bar_item progress-bar_item-2"></div>
										<div class="progress-bar_item progress-bar_item-3"></div>
									</div>
									<div class="progress-bar_text">칸이 비어있습니다</div>
								</li>
								<li>암호확인 <input type="password" name="u_pw_rep"
									class="password-rep" /><br>
									<div class="progress-bar_wrap">
										<div class="progress-bar_re_item progress-bar_re_item-1"></div>
										<div class="progress-bar_re_item progress-bar_re_item-2"></div>
										<div class="progress-bar_re_item progress-bar_re_item-3"></div>
									</div>
									<div class="progress-bar_re_text">칸이 비어있습니다</div>
								</li>
								<li>이메일&nbsp;&nbsp; <input type="email" name="u_email" /></li>
								<div align="center" class="submit-btn">
									<button type="submit" class="submitbtn">회원가입</button>
								</div>
							</ul>
						</div>
					</form> 
      </div>
   </div>
</div>
</div>

	<script>	
		$(document).ready(function() {
			$('.checkbtn').click(function() {		
				
				if (!/^[a-z0-9]{3,15}$/.test($("#user_id").val())) {
					alert("아이디는 영 대소문자, 숫자 3~15자리로 입력해주세요.");
					$('#user_id').val("")  ;
					$('#user_id').focus();
					return;
					}
			});
		});
	</script>


	<script type="text/javascript">


$( document ).ready( function() {
   const changeText = function (el, text, color) {
       el.text(text).css('color', color);
     };
     $('.password').keyup(function(){
          len = this.value.length;
          const pbText = $('.progress-bar_text');
          
          if (len == 0) {
             $('.progress-bar_item').each(function() {
              $(this).removeClass('active').css('background-color','white');
            });
            changeText(pbText, '비밀번호를 입력해주세요');
          } else if (len > 0 && len <= 4) {
            $('.progress-bar_item-1').addClass('active').css('background-color','red');
            $('.progress-bar_item-2').removeClass('active').css('background-color','white');
            $('.progress-bar_item-3').removeClass('active').css('background-color','white'); 
            changeText(pbText, '비밀번호가 너무 짧습니다');
          } else if (len > 4 && len <= 8) {
            $('.progress-bar_item-2').addClass('active').css('background-color','yellow');
            $('.progress-bar_item-3').removeClass('active').css('background-color','white');
            changeText(pbText, '좀 더 길게 해주세요');
          } else if (len > 8){
             $('.progress-bar_item').each(function() {
                $('.progress-bar_item-3').addClass('active').css('background-color','green');
            }); 
            changeText(pbText, '안정적이군요');
          } 
     });
     $('.password-rep').keyup(function(){
          len = this.value.length;
          const pbText = $('.progress-bar_re_text');
   
          if (len === 0) {
                 $('.progress-bar_re_item').each(function() {
                   $(this).removeClass('active').css('background-color','white');
                 });
                 changeText(pbText, '비밀번호를 입력해주세요');
               } else if ($('.password').val() != $('.password-rep').val()) {
                $(' .progress-bar_re_item-1').addClass('active').css('background-color','red');
                $(' .progress-bar_re_item-2').removeClass('active').css('background-color','red');
                $(' .progress-bar_re_item-3').removeClass('active').css('background-color','red');
                 changeText(pbText, '비밀번호가 다릅니다.');
               } else {
                 $('.progress-bar_re_item').each(function() {
                   $(this).addClass('active').css('background-color','green');
                 });
                 changeText(pbText, '비밀번호가 같습니다');
               }
   });
});
</script>

</body>
</html>