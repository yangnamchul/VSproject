<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Gugi|Poor+Story&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="resources/css/GuRem.css" >
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
#boardDiv {
background-color:blue;
}
#boardDiv > div > h3, b {
text-align:center;
color:white;
}
#list {
text-align:center;
}
#write > a {
color:white;
float:right;
background-color: #ff4d00;
text-shadow: 1px 1px 1px #000;
margin-right: 10px;
font-size: 22px !important;
}
#paging {
color:white;
text-align:center;
}
th,td{background-color:lightgray; color:blue;}

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
  <div class ="container" id="cont">
  	<div class="row" id="boardDiv" style="border:1px solid red;">
  		<div class="col-xs-12" style="border:1px solid blue;">
  		<h3> ___님 로그인 성공입니다. 환영합니다. </h3>
      <!-- Login 검증 -->
      <!-- jstl의 if문은 else가 없어서 따로 검증해야함. -->
      <c:if test="${id != null}">
        <%-- <%@include file="loginOk.jsp" %> --%>
      </c:if>
      <c:if test="${id == null}">
        <%-- <%@include file="login.jsp" %> --%>
      </c:if>
    </div>
    
   <div class="col-xs-10" id="list" style="border:1px solid orange;">
      <b>게시판 (전체 글: ${totalCount})</b>
     </div>
     
     <div class="col-xs-2" id="write">
      <a href="/bbs/writeForm.bbs?pageNum=${pageNum}">글쓰기</a>
     </div>
     
    <div class="col-xs-12" class="board_table" style="border:1px solid green;">
      <table class="table table-striped table-bordered table-hover">
        <thead>
          <tr>
            <th width="10%">번호</th>
            <th width="50%">제목</th>
            <th width="10%">작성자</th>
            <th width="20%">작성일</th>
            <th width="10%">조회</th>
          </tr>
        </thead>
        <tbody>
<%--           <c:forEach var="article" items="${articles}" varStatus="status"> --%>
            <tr>
              <td>${article.articleNumber} 글번호 </td>
              <td id="title">
                <c:if test="${article.depth > 0}">
                  &nbsp;&nbsp;
                </c:if>
                <a href="/bbs/content.bbs?articleNumber=${article.articleNumber}&pageNum=${pageNum}">${article.title} 글 제목 </a>
                <c:if test="${article.hit >= 20}">
                  <span class="hit">hit! (무시)</span>
                </c:if>
              </td>
              <td>${article.id} 작성자</td>
              <td>${article.writeDate} 글작성일</td>
              <td>${article.hit} 조회수 </td>
            <tr>
<%--           </c:forEach> --%>
        </tbody>
      </table>
       
      <!-- Paging 처리 -->
      <div class="col-xs-12" id="paging">
        ${pageCode} (페이지번호)
      </div>
    </div>
    </div>
    
  </div>
</body>
</html>