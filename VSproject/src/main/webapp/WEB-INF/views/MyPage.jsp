<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>
		유저 ID : ${uv.u_id } <br>
		유저 이름 : ${uv.u_name } <br>
		유저 이메일 : ${uv.u_email } <br>
		유저 가입일 : ${uv.u_date } <br>
		---------내가 쓴글------------
		<table class="table table-striped table-bordered table-hover" id="mypage">
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
				<c:forEach var="vo1" items="${bvlist}">
					<tr>
						<td>${vo1.b_seq}</td>
						<td id="title"><a href="Content.do?b_seq=${vo1.b_seq}">${vo1.b_title}
						</a></td>
						<td>${vo1.u_id}</td>
						<td><fmt:formatDate value="${vo1.b_date}" pattern="MM-dd" />
						</td>
						<td>${vo1.b_cnt}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		--------------내가 쓴 댓글--------------------
		<table class="table table-striped table-bordered table-hover" id="mypage">
			<thead>
				<tr>
					<th width="10%">번호</th>
					<th width="50%">제목</th>
					<th width="10%">작성자</th>
					<th width="20%">작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="vo2" items="${rvlist}">
					<tr>
						<td>${vo2.re_seq}</td>
						<td id="title"><a href="Content.do?b_seq=${vo2.b_seq}">${vo2.re_content}
						</a></td>
						<td>${vo2.u_id}</td>
						<td><fmt:formatDate value="${vo2.re_date}" pattern="MM-dd" />
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		------------------내가 추천한 글------------------
		<table class="table table-striped table-bordered table-hover" id="mypage">
			<thead>
				<tr>
					<th width="10%">번호</th>
					<th width="50%">제목</th>
					<th width="10%">작성자</th>
					<th width="20%">작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="vo3" items="${vvlist}">
					<tr>
						<td>${vo3.v_seq}</td>
						<td id="title"><a href="Content.do?b_seq=${vo3.b_seq}">${vo3.b_seq}
						</a></td>
						<td>${vo3.u_id}</td>
						<td><fmt:formatDate value="${vo3.v_date}" pattern="MM-dd" />
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</h3>
</body>
</html>