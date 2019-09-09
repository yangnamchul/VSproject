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
<div class="content-area">
<div class="container" id="main">
   <div class="row" id="historyDiv">
      <div class="col-lg-1 col-xl-1"></div>
      <div id="history" class="col-12 col-sm-12 col-lg-10 col-xl-10">
      <span class="vss-title"> 히스토리 </span>
               <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                 <li class="nav-item">
                   <a class="nav-link active" id="pills-home-tab" data-toggle="pill" href="#my-board-list" role="tab" aria-controls="pills-home" aria-selected="true">my작성글</a>
                 </li>
                 <li class="nav-item">
                   <a class="nav-link" id="pills-profile-tab" data-toggle="pill" href="#my-reply-list" role="tab" aria-controls="pills-profile" aria-selected="false">my작성댓글</a>
                 </li>
                 <li class="nav-item">
                   <a class="nav-link" id="pills-contact-tab" data-toggle="pill" href="#my-like-list" role="tab" aria-controls="pills-contact" aria-selected="false">추천글</a>
                 </li>
               </ul>
               <div class="tab-content" id="pills-tabContent">
                 <div class="tab-pane fade show active" id="my-board-list" role="tabpanel" aria-labelledby="pills-home-tab">
                    <table class="table table-striped table-bordered table-hover" id="board-table">
                     <thead class="board-thead">
                        <tr>
                           <th class="board-no">번호</th>
                           <th class="board-title">제목</th>
                           <th class="board-writer">작성자</th>
                           <th class="board-date">작성일</th>
                           <th class="board-cnt">조회</th>
                        </tr>
                     </thead>
                     <tbody class="board-tbody">
                     <c:forEach var="vo1" items="${bvlist}">
                        <tr id="board-pc">
                           <td class="board-no">${vo1.b_seq}</td>
                           <td class="board-title" id="title"><a href="Content.do?b_seq=${vo1.b_seq}">${vo1.b_title}
                           </a></td>
                           <td class="board-writer">${vo1.u_id}</td>
                           <td class="board-date"><fmt:formatDate value="${vo1.b_date}" pattern="MM-dd" />
                           </td>
                           <td class="board-cnt">${vo1.b_cnt}</td>
                        </tr>
                     </c:forEach>
                     </tbody>
                  </table>
               </div>
<!--                댓글 -->
               <div class="tab-pane fade" id="my-reply-list" role="tabpanel" aria-labelledby="pills-profile-tab">
                  <table class="table table-striped table-bordered table-hover" id="board-table">
                     <thead class="board-thead">
                        <tr>
                           <th class="board-no">번호</th>
                           <th class="board-title">제목</th>
                           <th class="board-writer">작성자</th>
                           <th class="board-date">작성일</th>
                        </tr>
                     </thead>
                     <tbody class="board-tbody">
                        <c:forEach var="vo2" items="${rvlist}">
                           <tr id="board-pc">
                              <td class="board-no">${vo2.re_seq}</td>
                              <td  class="board-title" id="title"><a href="Content.do?b_seq=${vo2.b_seq}">${vo2.re_content}
                              </a></td>
                              <td class="board-writer">${vo2.u_id}</td>
                              <td class="board-date"><fmt:formatDate value="${vo2.re_date}" pattern="MM-dd" /></td>
                           </tr>
                        </c:forEach>
                     </tbody>
                  </table>
               </div>
               <div class="tab-pane fade" id="my-like-list" role="tabpanel" aria-labelledby="pills-contact-tab">
                   <table class="table table-striped table-bordered table-hover" id="board-table">
                     <thead class="board-thead">
                        <tr>
                           <th class="board-no">번호</th>
                           <th class="board-title">제목</th>
                           <th class="board-writer">작성자</th>
                           <th class="board-date">작성일</th>
                        </tr>
                     </thead>
                     <tbody class="board-tbody">
                        <c:forEach var="vo3" items="${vvlist}">
                           <tr id="board-pc">
                              <td class="board-no">${vo3.v_seq}</td>
                              <td class="board-title" id="title"><a href="Content.do?b_seq=${vo3.b_seq}">
                              </a></td>
                              <td class="board-writer">${vo3.u_id}</td>
                              <td class="board-date"><fmt:formatDate value="${vo3.v_date}" pattern="MM-dd" /></td>
                           </tr>
                        </c:forEach>
                     </tbody>
                  </table>
               </div>
            </div>
      </div>
      <div class="col-lg-1 col-xl-1"></div>
   </div>

</div>
</div>
</body>
</html>