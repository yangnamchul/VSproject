<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>Insert title here</title>
</head>
<body>

	<%-- 		<%@ include file="t_Header.jsp"%> --%>
	<%@ include file="Header.jsp"%>

	<div id="content-area">
		<div class="container" id="main">
			<div class="row" id="boardDiv">
				<!-- 	글목록 보기 -->

 

				<div class="col-12 col-sm-12 col-lg-12 col-xl-12" id="board-inner">
					<a id="vss" href="VSSBoard.do?vss_seq=${vss_seq}">${vssOne}</a>(전체
					글 : <strong>${ListCount}</strong> )
				</div>

				<div class="col-10 col-xl-10" id="board-menu">vss_content쓰고
					(추가정보는 관련meme정립글(링크)</div>

				<div class="col-2 col-xl-2" id="board-write" align="center">
					<form action="BoardWriteData.do?vss_seq=${vss_seq}" method="post"
						id="BoardWriteData">
						<button type="submit" id="btn_write">글쓰기</button>
					</form>
				</div>

				<div class="col-12 col-sm-12 col-lg-12 col-xl-12" id="board-list">
					<table class="table table-striped table-bordered table-hover"
						id="board-table">
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
									<a id="vss" href="VSSBoard.do?vss_seq=${vo1.vss_seq}">${vo1.vssName}</a>
									<a
										href="Content.do?b_seq=${vo1.b_seq}">${vo1.b_title}</a></td>
									<td class="board-re">${vo1.replyCnt }</td>	
									<td class="board-writer"><a href="#"><span
											id="vss_u_id">${vo1.u_id}</span> </a></td>								

									<td class="board-date"><fmt:formatDate
											value="${vo1.b_date}" pattern="MM-dd" /></td>
									<td class="board-cnt">${vo1.b_cnt}</td>
									<td class="board-like" id="vss_like">${vo1.lv.l_like }</td>
								</tr>
							</c:forEach>

							<c:forEach var="vo1" items="${bvlist}">
								<tr id="board-mb">
									<td class="board-title col-12"><a
										href="Content.do?b_seq=${vo1.b_seq}">
											<div class=col-12 id="board-mb-title">${vo1.b_title}</div>
									</a>
										<div class=col-12 id="board-mb-info">
											<a href="#"><span id="vss_u_id">${vo1.u_id}</span></a> | <span>조회_${vo1.b_cnt}</span>
											| <span> <fmt:formatDate value="${vo1.b_date}"
													pattern="MM-dd" /> | 추천_<span id="vss_like">7</span> | <span>댓글_0</span>
										</div></td>

								</tr>
							</c:forEach>
						</tbody>
					</table>

					<!-- Paging 처리 -->
					<%
			
					 final int ROWSIZE = 5; //한페이지에 보일 게시물 수
					 final int BLOCK = 5;   //아래에 보일 페이지 최대 개수
					 
					 int pg = 1; //기본 페이지 값
					 if(request.getParameter("pg")!= null){
						 pg = Integer.parseInt(request.getParameter("pg"));
					 }
					
					 /* int total=Integer.valueOf((String)request.getAttribute("ListCount")); */	
					 int total = Integer.parseInt((request.getAttribute("ListCount")).toString());
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
							if (pg > BLOCK) {
						%>
						[<a href="VSSBoard.do?vss_seq=${vss_seq}&pg=1">◀◀</a>] [<a
							href="VSSBoard.do?vss_seq=${vss_seq}&pg=<%=startPage - 1%>">◀</a>]
						<%
							}
						%>
						<%
							for (int i = startPage; i <= endPage; i++) {
								if (i == pg) {
						%>
						<U><B> [<%=i%>]</B></U>
						<%
							} else {
						%>
						[<a href="VSSBoard.do?vss_seq=${vss_seq}&pg=<%=i%>"><%=i%></a>]
						<%
							}
							}
						%>
						<%
							if (endPage < allPage) {
						%>
						[<a href="VSSBoard.do?vss_seq=${vss_seq}&pg=<%=endPage + 1%>">▶</a>] [<a
							href="VSSBoard.do?vss_seq=${vss_seq}&pg=<%=allPage %>">▶▶</a>]
						<%
 							 }
 						%>
					</div>
				</div>
			</div>
		</div>
</body>


		<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
내 용 : submit 유효성 검사
작성자 : 건영
■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
<script type="text/javascript">
$('#BoardWriteData').submit(function () {
	var isLogin = "<%=session.getAttribute("uv")%>";
	if (isLogin == "null") {
		alertify.error("먼저 로그인 해주세요.");
		return false;
	}
});
	
</script>

</html>