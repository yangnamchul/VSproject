<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부스러기 : 회원가입</title>
</head>
<body>      

<%@ include file="Header.jsp"%>

    <!-- 회원가입 폼 -->
	<div id="content-area">
		<div class="container" id="main">
			<div class="row" id="joinDiv">
				<div class="col-lg-8 mx-auto my-1">
					<form action="UserInsertData.do"  id="SignUp" >
						<span class="vss-title"> 회원가입 </span>
						<div id="JoinForm">
							<ul class="vss-join">

								<li>아이디&nbsp;&nbsp; <input type="text" name="u_id" id="user_id" maxlength="16" required="required" autofocus tabindex="1">
									<button type="button" class="checkbtn" onclick="idCheck()" >중복검사</button>
									<div id="id-check-btn">										
										<span class="id-check-text"> 아이디를 입력해주세요</span>
									</div>
								</li>

								<li>별&nbsp;&nbsp;명&nbsp;&nbsp; <input type="text" name="u_name" id="user_nick" maxlength="7" required="required" tabindex="2">
									<button type="button" class="checkbtn" onclick="nickCheck()">중복검사</button>
									<div id="nick-check-btn">										
										<span class="nick-check-text"> 별명을 입력해주세요 </span>

									</div>

								</li>

								<li>암&nbsp;&nbsp;호&nbsp;&nbsp; <input type="password"name="u_pw" class="password" maxlength="18" required="required" tabindex="3"><br>
									<div class="progress-bar_wrap">
										<div class="progress-bar_item progress-bar_item-1 active"></div>
										<div class="progress-bar_item progress-bar_item-2 active"></div>
										<div class="progress-bar_item progress-bar_item-3 active"></div>
									</div>
									<div class="progress-bar_text">비밀번호를 입력해주세요</div>
								</li>
								<li>암호확인 <input type="password" name="u_pw_rep" class="password-rep" maxlength="18" required="required" tabindex="4"><br>
									<div class="progress-bar_wrap">
										<div class="progress-bar_re_item progress-bar_re_item-1 active"></div>
										<div class="progress-bar_re_item progress-bar_re_item-2 active"></div>
										<div class="progress-bar_re_item progress-bar_re_item-3 active"></div>
									</div>
									<div class="progress-bar_re_text">비밀번호를 다시 입력해주세요</div>
								</li>
								<li>이메일&nbsp;&nbsp; <input type="email" name="u_email" id="user_email" maxlength="30" tabindex="5"></li>
								<div align="center" class="submit-btn">
									<button type="button" class="submitbtn" onclick="SignUp()">회원가입</button>
								</div>
							</ul>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>


	<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
내 용 : id 유효성 검사 Ajax
■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
<script>			
window.login1 = 0;
var changeText = function (el, text, color) {
    el.text(text).css('color', color);
  };
  
		    function idCheck() {	
	    		var userId = $("#user_id").val();
	    		var gdata = { "u_id" : userId };
	    		const idChkText = $('.id-check-text');
	    		
	    		if (!/^[a-z0-9]{3,15}$/.test($("#user_id").val())) {
	    			$('.id-check-text').removeClass('chk-val-ok');
	    			$('.id-check-text').removeClass('chk-val-error');    			 
	    			$('.id-check-text').addClass('chk-val');
	    			changeText(idChkText, '영문자,숫자만 가능합니다.');
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
	    					$('.id-check-text').removeClass('chk-val');
	    					$('.id-check-text').removeClass('chk-val-ok');
	    					$('.id-check-text').addClass('chk-val-error');
	    					changeText(idChkText, '중복된 아이디 입니다.');
	    					login1 = 0;
	    				}
	    				if (data != 0) {
	    					$('.id-check-text').removeClass('chk-val');
	    					$('.id-check-text').removeClass('chk-val-error');
	    					$('.id-check-text').addClass('chk-val-ok');    					
	    					changeText(idChkText, '사용가능한 아이디 입니다.');
	    					login1 = 1;
	    				}
	    			},
	    			error : function(req, status, error) {
	    				alertify.alert(req.status + "\nmessege" + req.responseTest);
	    			}
	    		});
	    	}					
		
	</script>
	
		<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
내 용 : nick 유효성 검사 Ajax
■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
<script>			
window.nick1 = 0;
var changeText = function (el, text, color) {
    el.text(text).css('color', color);
  };
		    function nickCheck() {	
	    		var userName = $("#user_nick").val();
	    		var gdata = { "u_name" : userName };
	    		const nickChkText = $('.nick-check-text');	    		
	    		if (!/^[\w\Wㄱ-ㅎㅏ-ㅣ가-힣]{2,6}$/.test($("#user_nick").val())) {
	    			$('.nick-check-text').removeClass('chk-val-ok');
	    			$('.nick-check-text').removeClass('chk-val-error');    			 
	    			$('.nick-check-text').addClass('chk-val');
					changeText(nickChkText, '별명은 2~6자리로 입력해주세요.');
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
	    					$('.nick-check-text').removeClass('chk-val');
	    					$('.nick-check-text').removeClass('chk-val-ok');
	    					$('.nick-check-text').addClass('chk-val-error'); 
	    					changeText(nickChkText, '중복된 별명 입니다.');
	    					nick1 = 0;
	    				}
	    				if (data !== 0){
	    					$('.nick-check-text').removeClass('chk-val');
	    					$('.nick-check-text').removeClass('chk-val-error');
	    					$('.nick-check-text').addClass('chk-val-ok');  	
	    					changeText(nickChkText, '사용가능한 별명 입니다.');
	    					nick1 = 1;
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
	window.pw1 = 0;
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
            pw1 = 0;
          } else if (len > 0 && len <= 4) {
            $('.progress-bar_item-1').addClass('active').css('background-color','red');
            $('.progress-bar_item-2').removeClass('active').css('background-color','white');
            $('.progress-bar_item-3').removeClass('active').css('background-color','white'); 
            changeText(pbText, '비밀번호가 너무 짧습니다');
            pw1 = 0;
          } else if (len > 4 && len <= 8) {
            $('.progress-bar_item-2').addClass('active').css('background-color','yellow');
            $('.progress-bar_item-3').removeClass('active').css('background-color','white');
            changeText(pbText, '좀 더 길게 해주세요');
            pw1 = 1;
          } else if (len > 8){
             $('.progress-bar_item').each(function() {
                $('.progress-bar_item-3').addClass('active').css('background-color','green');
            }); 
            changeText(pbText, '안정적이군요');
            pw1 = 1;
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
                 pw1 = 0;
               } else if ($('.password').val() != $('.password-rep').val()) {
                $(' .progress-bar_re_item-1').addClass('active').css('background-color','red');
                $(' .progress-bar_re_item-2').removeClass('active').css('background-color','red');
                $(' .progress-bar_re_item-3').removeClass('active').css('background-color','red');
                 changeText(pbText, '비밀번호가 다릅니다.');
                 pw1 = 1;
               } else {
                 $('.progress-bar_re_item').each(function() {
                   $(this).addClass('active').css('background-color','green');
                 });
                 changeText(pbText, '비밀번호가 같습니다');
                 pw1 = 2;
               }
   });
});
</script>

	<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
내 용 : 회원가입 유효성 검사 (해야함) 개귀찮아 
■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
<script>
	function SignUp() {
		if (login1 == 0) {
			alertify.error("아이디  중복검사를 해주세요.");			
			return;
		}
		if (nick1 == 0 ) {
			alertify.error("별명  중복검사를 해주세요.");
			return;
		}
		if (pw1 == 0 ) {
			alertify.error("비밀번호를 더 안전하게 해주세요.");
			return;
		}
		if (pw1 == 1) {
			alertify.error("비밀번호를 확인해주세요.");
			return;
		}
		
		jQuery.ajax({
			type : "POST",
			url : "UserInsertData.do",
			data : $("#SignUp").serialize(),
			async : false,
			dataType : "json",
			success : function(data) {
				if (data == 0) {
					alertify.error("회원가입 실패!");
				} else {
					location.href = "Main";
				}
			},
			error : function(req, status, error) {
				alertify.alert(req.status + "\nmessege" + req.responseTest);
			}
		});
	}
</script>	

</body>
</html>