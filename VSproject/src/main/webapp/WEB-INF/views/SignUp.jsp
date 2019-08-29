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


  
<form class="signup-content" action="UserInsertData.do" method="get">
<div class="container" id="cont">
   <div class="row">
      <!-- <div class="col-xs-1"></div> -->
      <div class="col-xs-12" id="joinDiv">
         <h3>
            <ul class="vss-join" id="JoinForm">
               <li>아이디&nbsp;&nbsp; <input type="text" name="u_id" />
               <button type="button" class="checkbtn">중복검사</button>
               <br>
               <div>
                  <span class="id-check_text" style="margin-left: 200px;">중복검사항목</span>
               </div>
               </li>
               <li>이&nbsp;&nbsp;름&nbsp;&nbsp; <input type="text" name="u_name" /></li>
               <li>닉네임&nbsp;&nbsp; <input type="text" name="u_nick" /></li>
               <li>암&nbsp;&nbsp;호&nbsp;&nbsp; <input type="text" name="u_pw" class="password" /><br>
               <div class="progress-bar_wrap">
               <div class="progress-bar_item progress-bar_item-1"></div>
               <div class="progress-bar_item progress-bar_item-2"></div>
               <div class="progress-bar_item progress-bar_item-3"></div>               
            </div>
               <span class="progress-bar_text">칸이 비어있습니다</span>
               </li>               
               <li>암호확인 <input type="text" name="u_pw_rep" class="password-rep" /><br>
               <div class="progress-bar_wrap">
               <div class="progress-bar_re_item progress-bar_re_item-1"></div>
               <div class="progress-bar_re_item progress-bar_re_item-2"></div>
               <div class="progress-bar_re_item progress-bar_re_item-3"></div>               
            </div>               
               <span class="progress-bar_re_text">칸이 비어있습니다</span>
               </li>
               <li>이메일&nbsp;&nbsp; <input type="text" name="u_email" /></li>
               <div align="center" class="clearfix"> 
                  <button type="submit" class="submitbtn">가입하기</button>
                  <button type="button" class="cancelbtn">취소</button>                  
               </div>                                                
            </ul>
         </h3>
      </div>
   </div>
</div>
</form>
<script type="text/javascript">
$( document ).ready(function() {
   $("[id='btn-search']").click(function() { //$('#btn-search').click(function() {
      $('#right-search-form').toggle();                  
   });
   
   $("[id='btn-login']").click(function() {
      $('#loginDiv').toggle();
      });
/* ---------------------------------------------- */
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