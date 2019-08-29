<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Gugi|Poor+Story&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="resources/css/GuRem.css" >
<script   src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
.vss-join {
   /*    background: #fff; */
   /*    border-bottom: 2px solid #ebeae8; */
   /*    border-right: 2px solid #ebeae8; */
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

#JoinForm>li>input[type=text] {
   font-size: 30px;
    padding: 0px 3px;
    margin: 1px;
    color: black;
    background: #bbbbbb;
    /* width: 1%; */
    /* height: 1.5em; */
}

#JoinForm > div > button {
   color: white;
    background-color: #ff4d00;
   font-size:25px;
   }
.progress-bar_text{
   font-size: 22px;
   color: #f9ff00;
    text-shadow: 1px 1px 1px #ff4d00;
}
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
               <li>아이디&nbsp;&nbsp; <input type="text" name="u_id" /></li>
               <li>이&nbsp;&nbsp;름&nbsp;&nbsp; <input type="text" name="u_name" /></li>
               <li>닉네임&nbsp;&nbsp; <input type="text" name="u_nick" /></li>
               <li>패스워드&nbsp;&nbsp; <input type="text" name="u_pw" class="password" />
               <span class="progress-bar_text">칸이 비어있습니다</span>
               </li>               
               <li>확&nbsp;&nbsp;인&nbsp;&nbsp; <input type="text" name="u_pw_rep" class="password-rep" />
               <span class="progress-bar_text">칸이 비어있습니다</span>
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
/*             $('.password-container .progress-bar_item').each(function() {
              $(this).removeClass('active')
            }); */
            changeText(pbText, '비밀번호를 입력해주세요');
          } else if (len > 0 && len <= 4) {
/*             $('.password-container .progress-bar_item-1').addClass('active');
            $('.password-container .progress-bar_item-2').removeClass('active');
            $('.password-container .progress-bar_item-3').removeClass('active'); */
            changeText(pbText, '비밀번호가 너무 짧습니다');
          } else if (len > 4 && len <= 8) {
/*             $('.password-container .progress-bar_item-2').addClass('active');
            $('.password-container .progress-bar_item-3').removeClass('active');
            changeText(pbText, 'Could be stronger'); */
          } else if (len >= 8){
            /* $('.password-container .progress-bar_item').each(function() {
              $(this).addClass('active');
            }); */
            changeText(pbText, '안정적이군요');
          } 
     });
     $('.password-rep').keyup(function(){
          len = this.value.length;
          const pbText = $('.progress-bar_text');
   
          if (len === 0) {
/*                  $('.password-rep-container .progress-bar_item').each(function() {
                   $(this).removeClass('active')
                 }); */
                 changeText(pbText, '비밀번호를 입력해주세요');
               } else if ($('.password').val() != $('.password-rep').val()) {
/*                 $('.password-rep-container .progress-bar_item-1').addClass('active');
                $('.password-rep-container .progress-bar_item-2').removeClass('active');
                $('.password-rep-container .active').css('background-color','#FF4b47'); */
                 changeText(pbText, '비밀번호가 다릅니다.');
               } else {
/*                  $('.password-rep-container .progress-bar_item').each(function() {
                   $(this).addClass('active');
                 });
                 $('.password-rep-container .active').css('background-color','#2DAF7D'); */
                 changeText(pbText, '비밀번호가 같습니다');
               }
   });
});
</script>

</body>
</html>      
</body>
</html>
