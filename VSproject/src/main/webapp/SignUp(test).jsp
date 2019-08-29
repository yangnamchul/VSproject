<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Gugi|Poor+Story&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="resources/css/GuRem.css" >
<script   src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
/*08-29 회원가입폼 양식*/
.vss-join {
   padding-top: 0.5em;
   padding-bottom: 0.5em;
   background-color: #000084;
   color: white;
   box-shadow: 2px 2px 0 #ff4d00, -2px -2px 0 #ff4d00;
}

.vss-join>li {
   font-size:40px;
   background-color: #000084;
   color: white;
}

#joinForm {
    width: 317px;
}
#JoinForm > li {
   list-style: none;
   margin: 20px;
}

#JoinForm > li > button {
   color: white;
    background-color: #ff4d00;
   font-size:25px;
   }
   
#JoinForm>li>input[type=text] {
   font-size: 30px;
    padding: 0px 3px;
    margin: 1px;
    color: black;
    background: #bbbbbb;
}

#JoinForm > div > button {
   color: white;
    background-color: #ff4d00;
   font-size:40px;
   }
   
.progress-bar_text, .progress-bar_re_text, .id-check_text{
   font-size: 22px;
   color: #f9ff00;
   text-shadow: 1px 1px 1px #ff4d00;


}

.progress-bar_wrap {
  border:1px solid blue;
  margin-left: 190px;
  width: 300px;
  height: 10px;
  background: #F6F6FA;
  display: inline-block;
  vertical-align: middle;
  overflow: hidden;
  border-radius: 5px;
}

.progress-bar_item, .progress-bar_re_item {
  display: inline-block;
  height: 100%;
  width: 32.5%;
  margin-right: .8%;
  border-radius: 5px;
  float: left; 
  transition: background-color .2s, visisility .1s;
}
/*-------------------------------------------------------*/
</style>
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

            <!--             검색 div -->
            <!--             <div class="col-xs-8" align="right" style="display:none;"> -->
            
               <div class="col-xs-8" align="right">         
               
               
               <form action="#" method="get" id="right-search-form" style="display: none;">
                  <input type="text" placeholder="부스러기 검색" value="" id="right-search-input" name="검색input이름"> 
                  <button type="submit" id="search-btn"> <img src="https://static.thenounproject.com/png/644045-200.png" width="16px" height="16px" /> </button>
               </form>

               <div class="top-menu">   
                  <div class="right-col" id="btn-search">                     
                     <div class="right-row"> <img src="http://icons.iconarchive.com/icons/pixture/donuts/32/PowderSugared-icon.png" alt="" /></div>
                     <div class="right-row"> 검색</div>                  
                  </div>
                  <div class="right-col" id="btn-login">                     
                     <div class="right-row" align="center"> <img src="http://icons.iconarchive.com/icons/pixture/donuts/32/Coffee-icon.png" alt="" /></div>
                     <div class="right-row"> 로그인</div>                  
                  </div>
               </div>
                  
                  

               
            </div>
         </div>
         </div>
         
<!--          로그인 팝업창  -->
               <div class="col-xs-4" id="loginDiv" style="display:none;">   
                  <h3>
                     <ul class="vss-a-menu" id="pop_login">
                        <li>아이디  <input type="text" /></li>
                        <li>암　호  <input type="text" /></li>
                        <div><button>완료</button></div>                                                
                     </ul>
                  </h3>
               </div>
         <div id="header-bar" class="container">
            <div class="row">
               <div id="header-menu-left" class="col-xs-2" ></div>

               <div id="header-top-notice" class="col-xs-8" align="center">
                  부스러기 | 최신VS | 인기VS | 공지사항 
               </div>      
            </div>
            <!-- row end -->
         </div>   
      

   </header>
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
            changeText(pbText, '비밀번호가 너무 짧습니다!');
          } else if (len > 4 && len <= 8) {
            $('.progress-bar_item-2').addClass('active').css('background-color','yellow');
            $('.progress-bar_item-3').removeClass('active').css('background-color','white');
            changeText(pbText, '좀 더 길게 해주세요!!');
          } else if (len > 8){
             $('.progress-bar_item').each(function() {
            	 $('.progress-bar_item-3').addClass('active').css('background-color','green');
            }); 
            changeText(pbText, '완벽하군요!!!');
          } 
     });
     $('.password-rep').keyup(function(){
          len = this.value.length;
          const pbText = $('.progress-bar_re_text');
   
          if (len === 0) {
                 $('.progress-bar_re_item').each(function() {
                   $(this).removeClass('active').css('background-color','white');
                 });
                 changeText(pbText, '같은 비밀번호를 입력해주세요');
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
</body>
</html>
