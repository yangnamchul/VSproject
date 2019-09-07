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
				<div class="col-lg-8 mx-auto my-1">
					<form action="UserInsertData.do" method="get">
						<span class="vss-title"> 회원가입 </span>
						<div id="JoinForm">
							<ul class="vss-join">

								<li>아이디&nbsp;&nbsp; <input type="text" name="u_id" id="user_id">
									<button type="button" class="checkbtn2" onclick="idCheck()">중복검사</button>
									<div id="id-check-btn">
										<button type="button" class="checkbtn" onclick="idCheck()" style="display:none;">중복검사</button>
										<p class="change_greeting"></p>
									</div>
								</li>

								<li>별&nbsp;&nbsp;명&nbsp;&nbsp; <input type="text" name="u_name" id="user_nick">
									<button type="button" class="checkbtn2" onclick="nickCheck()" style="display:none;">중복검사</button>
									<div id="nick-check-btn">
										<button type="button" class="checkbtn" onclick="nickCheck()">중복검사</button>
										<span class="id-check-text"> 칸이비어있습니다 </span>

									</div>

								</li>

								<li>암&nbsp;&nbsp;호&nbsp;&nbsp; <input type="password"name="u_pw" class="password"><br>
									<div class="progress-bar_wrap">
										<div class="progress-bar_item progress-bar_item-1 active"></div>
										<div class="progress-bar_item progress-bar_item-2 active"></div>
										<div class="progress-bar_item progress-bar_item-3 active"></div>
									</div>
									<div class="progress-bar_text">안정적이군요</div>
								</li>
								<li>암호확인 <input type="password" name="u_pw_rep" class="password-rep"><br>
									<div class="progress-bar_wrap">
										<div class="progress-bar_re_item progress-bar_re_item-1 active"></div>
										<div class="progress-bar_re_item progress-bar_re_item-2 active"></div>
										<div class="progress-bar_re_item progress-bar_re_item-3 active"></div>
									</div>
									<div class="progress-bar_re_text">비밀번호가 같습니다</div>
								</li>
								<li>이메일&nbsp;&nbsp; <input type="email" name="u_email"></li>
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

	<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
내 용 : nick 유효성 검사 Ajax
■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
<script>			
		    function nickCheck() {	
	    		var userName = $("#user_nick").val();
	    		var gdata = { "u_name" : userName };
	    		
	    		if (!/^[a-z0-9]{3,15}$/.test($("#user_nick").val())) {
					alert("숫자 3~15자리로 입력해주세요.");
					$('#user_nick').val("")  ;
					$('#user_nick').focus();
					return;
					}
	    		
	    		jQuery.ajax({
	    			type : "POST",
	    			url : "nickCheck.do",
	    			data : gdata,
	    			async : false,
	    			success : function(data) {
	    				if (data == 0) {
	    					alertify.alert("중복");
	    				} else {
	    					alertify.alert("가능");
	    				}
	    			},
	    			error : function(req, status, error) {
	    				alertify.alert(req.status + "\nmessege" + req.responseTest);
	    			}
	    		});
	    	}					
		
</script>	
	<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
내 용 : id 유효성 검사 Ajax
■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
<script>			
		    function idCheck() {	
	    		var userId = $("#user_id").val();
	    		var gdata = { "u_id" : userId };
	    		
	    		if (!/^[a-z0-9]{3,15}$/.test($("#user_id").val())) {
					alert("아이디는 영 대소문자, 숫자 3~15자리로 입력해주세요.");
					$('#user_id').val("")  ;
					$('#user_id').focus();
					return;
					}
	    		
	    		jQuery.ajax({
	    			type : "POST",
	    			url : "idCheck.do",
	    			data : gdata,
	    			async : false,
	    			success : function(data) {
	    				if (data == 0) {
// 	    					alertify.alert("중복");
							$('change_greeting').text('사용불가 아이디');
	    				} else {
	    					$('id-check-text').text('사용가능한 아이디');
	    				}
	    			},
	    			error : function(req, status, error) {
	    				alertify.alert(req.status + "\nmessege" + req.responseTest);
	    			}
	    		});
	    	}					
		
	</script>
	

<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
내 용 : 비밀번호 유효성 검사
■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
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