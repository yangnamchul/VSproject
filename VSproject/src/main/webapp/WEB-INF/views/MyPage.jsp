<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="Header.jsp"%>

<div id="content-area">
	<div class="container" id="main">
		<div class="row" id="mypageDiv">
			<div class="col-lg-8 mx-auto my-5">
				<span id=vss_title> 내정보 </span>
<!-- 				<div id="JoinForm"> -->
					<ul class="vss-myinfo py-2">
						<li>아이디&nbsp;&nbsp; 
							<input type="text" name="u_id" id="user_id" value="${uv.u_id }" readonly="readonly">
						</li>
						<li>별&nbsp;&nbsp;명&nbsp;&nbsp; 
							<input type="text" name="u_name" id="out_user_nick" value="${uv.u_name }" readonly="readonly">
							<button type="button" id="btn-changeNick">별명변경</button>
						</li>
						<li>암&nbsp;&nbsp;호&nbsp;&nbsp; 
							<button type="button" id="btn-changePW">암호변경</button>
						</li>
						<li>이메일&nbsp;&nbsp; 
							<input type="email" name="u_email" id="user_email" value="${uv.u_email }" readonly="readonly">
						</li>
						<li>가입일&nbsp;&nbsp; 
							<input type ="text" name="u_date" readonly="readonly" value="<fmt:formatDate value="${uv.u_date }" pattern="yyyy년 MM월 dd일" />" />
						</li>								
					</ul>
<!-- 				</div> -->
			</div>
		</div>
<!-- 		별명 변경모달 -->
		<div class="row">
			<div class="modal fade" id="changeNickModal" data-backdrop="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<span>별명 변경하기</span>
							<button class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body">
							<form class="modal-change" id="ChangeNickForm">
								<div>
									<li class="mx-auto">원래 별명<br>
										<input type="text" id="u_name" class="ch-nick" value="${uv.u_name }" readonly="readonly">
									</li>
									<li class="mx-auto">변경할 별명
										<input type="text" name="u_name" id="user_nick" class="ch-nick">
										<button type="button" class="checkbtn" onclick="nickCheck()">검사</button>
										<div id="nick-check-btn">										
											<span class="nick-check-text"> 별명을 입력해주세요 </span>
										</div>
									<div class="mx-auto" align="center">
										<button type="button" id="change-nickbtn" onclick="ChangeNick()">변경하기</button>
									</div>
								</div>
							</form>							
						</div>
						<div class="modal-footer"></div>
					</div>
				</div>
			</div>
		</div>
<!-- 		암호변경 모달 -->
		<div class="row">
			<div class="modal fade" id="changePWModal" data-backdrop="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<span>암호 변경하기</span>
							<button class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body">
							<form class="modal-change" id="ChangePWForm">
								<div>
									<li class="mx-auto">암&nbsp;&nbsp;&nbsp;&nbsp;호 
										<input type="password" name="u_pw" class="ch-pw" /><br>
						               <div class="progress-bar_wrap">
						               <div class="progress-bar_item progress-bar_item-1"></div>
						               <div class="progress-bar_item progress-bar_item-2"></div>
						               <div class="progress-bar_item progress-bar_item-3"></div>               
						            </div>
						               <span class="progress-bar_text">칸이 비어있습니다</span>
						               </li>               
						               <li class="mx-auto">암호확인 
						               	<input type="password" name="u_pw_rep" class="ch-re-pw" /><br>
						               <div class="progress-bar_wrap">
						               <div class="progress-bar_re_item progress-bar_re_item-1"></div>
						               <div class="progress-bar_re_item progress-bar_re_item-2"></div>
						               <div class="progress-bar_re_item progress-bar_re_item-3"></div>               
						            </div>               
						               <span class="progress-bar_re_text">칸이 비어있습니다</span>
						            </li>
						            <div class="mx-auto" align="center">
										<button type="button" id="change-pwbtn" onclick="ChangePW()">변경하기</button>
									</div>
								</div>
							</form>
							<!-- 여기 -->
						</div>
						<div class="modal-footer"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript">
$(document).ready(function() {
   $("[id='btn-changeNick']").click(function() {
      $('#changeNickModal').modal('show');
   });
   $("[id='btn-changePW']").click(function() {
	      $('#changePWModal').modal('show');
	   });   
});
</script>	

<!-- 비밀번호 변경 유효성 검사 -->
<script type="text/javascript">
window.pwReturn = 0;
window.pwReturn1 = 0;
$( document ).ready( function() {
     const changeText = function (el, text, color) {
       el.text(text).css('color', color);
     };
     $('.ch-pw').keyup(function(){
          len = this.value.length;
          const pbText = $('.progress-bar_text');
          
          if (len == 0) {
             $('.progress-bar_item').each(function() {
              $(this).removeClass('active').css('background-color','white');
            });
            changeText(pbText, '비밀번호 입력해주세요');
            pwReturn = 0 ;
          } else if (len > 0 && len <= 4) {
            $('.progress-bar_item-1').addClass('active').css('background-color','red');
            $('.progress-bar_item-2').removeClass('active').css('background-color','white');
            $('.progress-bar_item-3').removeClass('active').css('background-color','white'); 
            changeText(pbText, '비밀번호가 너무 짧습니다');
            pwReturn = 0 ;
          } else if (len > 4 && len <= 8) {
            $('.progress-bar_item-2').addClass('active').css('background-color','yellow');
            $('.progress-bar_item-3').removeClass('active').css('background-color','white');
            changeText(pbText, '좀 더 길게 해주세요');
            pwReturn = 1 ;
          } else if (len > 8){
             $('.progress-bar_item').each(function() {
                $('.progress-bar_item-3').addClass('active').css('background-color','green');
            }); 
            changeText(pbText, '안정적이군요');
            pwReturn = 2 ;
          } 
     });
     $('.ch-re-pw').keyup(function(){
          len = this.value.length;
          const pbText = $('.progress-bar_re_text');
   
          if (len === 0) {
                 $('.progress-bar_re_item').each(function() {
                   $(this).removeClass('active').css('background-color','white');
                 });
                 changeText(pbText, '비밀번호 입력해주세요');
                 pwReturn1 = 0 ;
               } else if ($('.ch-pw').val() != $('.ch-re-pw').val()) {
                $(' .progress-bar_re_item-1').addClass('active').css('background-color','red');
                $(' .progress-bar_re_item-2').removeClass('active').css('background-color','red');
                $(' .progress-bar_re_item-3').removeClass('active').css('background-color','red');
                 changeText(pbText, '비밀번호가 다릅니다.');
                 pwReturn1 = 1 ;
               } else {
                 $('.progress-bar_re_item').each(function() {
                   $(this).addClass('active').css('background-color','green');
                 });
                 changeText(pbText, '비밀번호가 같습니다');
                 pwReturn1 = 2 ;
               }
   });

});
</script>

<script>			
window.nickReturn = 0;
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
					nickReturn = 0;
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
	    					nickReturn = 0;
	    				}
	    				if (data !== 0){
	    					$('.nick-check-text').removeClass('chk-val');
	    					$('.nick-check-text').removeClass('chk-val-error');
	    					$('.nick-check-text').addClass('chk-val-ok');  	
	    					changeText(nickChkText, '사용가능한 별명 입니다.');
	    					nickReturn = 2 ;
	    				}
	    			},
	    			error : function(req, status, error) {
	    				alertify.alert(req.status + "\nmessege" + req.responseTest);
	    			}
	    		});
	    	}					
		
</script>

<script>

	function ChangePW() {
		if ($(".ch-pw").val() == "") {
       	 alertify.warning("암호를 입력해주세요");
           return;
        };
		 if ($(".ch-re-pw").val() == "") {
        	 alertify.warning("암호확인을 입력해주세요");
            return;
         };        
         
         if (pwReturn == 0) {
  			alertify.error("비밀번호 검사를 제대로해주세요.");			
  			return;
  		};
  		
  		 if (pwReturn1 == 0) {
   			alertify.error("비밀번호 확인을 제대로해주세요.");			
   			return;
   		};
   		
   		if (pwReturn1 == 1) {
   			alertify.error("비밀번호 다릅니다.");			
   			return;
   		};
         
         if (confirm('정말 변경 하시겠습니까?')) {
		jQuery.ajax({
			type : "POST",
			url : "ChangePW.do",
			data : $("#ChangePWForm").serialize(),
			async : false,
			dataType : "json",
			success : function(data) {
				if (data == 0) {
					alertify.error('비밀번호 변경 실패');
					
				} else {
					alertify.success('비밀번호 변경 성공');
					location.href = "MyPage.do";
				}
			},		
				error : function(req, status, error) {
					alertify.alert(req.status + "\nmessege" + req.responseTest);
				
			}
		});
         }else {alertify.error("비밀번호 변경 취소");
	}
	}
</script>



<script type="text/javascript">
	function ChangeNick() {  	  
         if ($("#user_nick").val() == "") {
        	 alertify.warning("별명을 입력해주세요");
            return;
         };
         
         if (nickReturn == 0) {
 			alertify.error("별명 중복검사를 해주세요.");			
 			return;
 		};
         
         if (confirm('정말 변경 하시겠습니까?')) {
         jQuery.ajax({
                  type : "POST",
                  url : "ChangeNick.do",
                  data : $("#ChangeNickForm").serialize(),
                  async : false,
                  dataType : "json",
                  success : function(data) {
                     if (data == 0) {                      
                        alertify.error('별명 변경 실패');
                        $("#user_nick").val("");
                     } else {
                    	alertify.success('별명 변경 성공');
                    	location.href="MyPage.do";
                     }
                  },
                  error : function(req, status, error) {
                     alertify.alert(req.status + "\nmessege" + req.responseTest);
                  }
               });   
         } else {
				alertify.error("별명 변경 취소");
			}
	};
</script>

</div>
</body>
</html>