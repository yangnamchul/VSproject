<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>Insert title here</title>
</head>
<body>

	<%@ include file="t_Header.jsp"%>
	<%-- 	<%@ include file="Header.jsp"%> --%>

	<div id="content-area">
		<div class="container" id="main">
			<div class="row" id="boardDiv">
				<!-- 	글목록 보기 -->
				<div class="col-12 col-sm-12 col-lg-12 col-xl-12" id="board-inner">
					<span id="vss">[아무]</span>의 부스러기 (전체 글 :count}
				</div>

				<div class="col-xl-10" id="board-menu">해당 부스러기 관련 링크 (정렬, 인기글,
					공지 같은거 연결하기)</div>

				<div class="col-xl-2" id="board-write" align="center">
					<form action="BoardWriteData.do" method="post">
						<button type="submit">글쓰기</button>
					</form>
				</div>

				<div class="col-12 col-sm-12 col-lg-12 col-xl-12" id="board-list">
					<table class="table table-striped table-bordered table-hover"
						id="board-table">
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
							<c:forEach var="vo1" items="${boardlist}">
								<tr>
									<td>${vo1.b_seq}</td>
									<td id="title"><a
										href="BoardOneView.do?b_seq=${vo1.b_seq}">${vo1.b_title} </a></td>



									<td>${vo1.u_id}</td>
									<td><fmt:formatDate value="${vo1.b_date}" pattern="MM-dd" />
									</td>
									<td>${vo1.b_cnt}</td>
								</tr>
							</c:forEach>

						</tbody>
					</table>

					<!-- Paging 처리 -->
					<div class="col-xs-12" id="board-page">${pageCode}(페이지번호)</div>
				</div>
			</div>
		</div>
	</div>

</body>

</html>