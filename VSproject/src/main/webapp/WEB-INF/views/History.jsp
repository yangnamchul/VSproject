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
                           <th class="board-no" width="5%">번호</th>
<!-- 								<th class="board-info" width="5%">종류</th> -->
								<th class="board-title" >제목</th>
								<th class="board-re" width="5%">댓글</th> 
								<th class="board-writer" width="10%">작성자</th>
								<th class="board-date" width="5%">작성일</th>
								<th class="board-cnt" width="5%">조회</th>
								<th class="board-like" width="5%">추천</th>		
                        </tr>
                     </thead>
                     <tbody class="board-tbody">
                    <c:forEach var="vo1" items="${bvlist}">
								<tr id="board-pc">
									<td class="board-no">${vo1.b_seq}</td>
<!-- 									<td class="board-info"></td> -->
									<td class="board-title">
									<a id="vss" href="VSSBoard.do?vss_seq=${vo1.vss_seq}&pg=1">${vo1.vssName}</a>
									<a
										href="Content.do?b_seq=${vo1.b_seq}"> ${vo1.b_title} </a></td>
									<td class="board-re">${vo1.replyCnt }</td>	
									<td class="board-writer"><a href="History.do?pg=1&u_id=${vo1.u_id }"><span
											id="vss_u_id">${vo1.u_name}</span> </a></td>								

									<td class="board-date"><fmt:formatDate
											value="${vo1.b_date}" pattern="MM-dd" /></td>
									<td class="board-cnt">${vo1.b_cnt}</td>
									<td class="board-like" id="vss_like">${vo1.lv.l_like }</td>
								</tr>
							</c:forEach>

							<c:forEach var="vo1" items="${bvlist}">
								<tr id="board-mb">
									<td class="board-title col-12">
										<a href="Content.do?b_seq=${vo1.b_seq}">
											<div class=col-12 id="board-mb-title"><span id=vss>${vo1.vssName }</span> ${vo1.b_title}</div>
										</a>
										<div class=col-12 id="board-mb-info">
											<a href="#"><span id="vss_u_id">${vo1.u_id}</span></a> | <span>조회_${vo1.b_cnt}</span>
											| <span> <fmt:formatDate value="${vo1.b_date}"
													pattern="MM-dd" /> | 추천_<span id="vss_like">${vo1.lv.l_like }</span> | <span>댓글_${vo1.replyCnt }</span>
										</div></td>

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
                        
                  </table>
               </div>
            </div>
      </div>
      <!-- Paging 처리 -->
	<div class="col-lg-1 col-xl-1" id="numbering"></div>
	
					<%
			
					 final int ROWSIZE = 5; //한페이지에 보일 게시물 수
					 final int BLOCK = 5;   //아래에 보일 페이지 최대 개수
					 
					 int pg = 1; //기본 페이지 값
					 if(request.getParameter("pg")!= null){
						 pg = Integer.parseInt(request.getParameter("pg"));
					 }
					 /* int total=Integer.valueOf((String)request.getAttribute("ListCount")); */	%>
					
					 <%  
					 	int total = Integer.parseInt((request.getAttribute("BoardListCount")).toString()); 
					 %>
					 <% 
					 int allPage = 0; //전체 페이지 수
					 
					 int start = (pg*ROWSIZE)-(ROWSIZE-1); //해당 페이지에서 시작번호
					 int end = (pg*ROWSIZE); //해당 페이지에서 끝 번호
					 
					 int startPage = ((pg-1)/BLOCK*BLOCK)+1; //시작 블럭 숫자
					 int endPage = ((pg-1)/BLOCK*BLOCK)+BLOCK; //끝 블럭 숫자
					

					 allPage = (int)Math.ceil(total/(double)ROWSIZE);
					  
					  if(endPage > allPage){
					   endPage = allPage;
					  }
					  out.print("총 게시물 :" +total +"개");
	
				
					%>
					
					<div class="col-xs-12" id="paging board-page">
					<%
  if(pg>BLOCK){
 %>
  [<a href="History.do?pg=1&u_id=${u_id1 }">◀◀</a>]
  [<a href="History.do?pg=<%=startPage-1%>&u_id=${u_id1 }">◀</a>]
 <%
  }
 %>
 <%
  for(int i=startPage; i<=endPage; i++){
   if(i==pg){
 %>
  
  <U><B> [<%=i %>]</B></U>
 <%
   }else{
 %>
  [<a href="History.do?pg=<%=i %>&u_id=${u_id1 }"><%=i%></a>]
 <%
   }
  }
 %>
 <%
  if(endPage<allPage){
 %>
  [<a href="History.do?pg=<%=endPage+1 %>&u_id=${u_id1 }">▶</a>]
  [<a href="History.do?pg=<%=allPage %>&u_id=${u_id1 }">▶▶</a>]
 <%
  }
 %>
	   </div>
   </div>
</div>
</div>
</body>
</html>