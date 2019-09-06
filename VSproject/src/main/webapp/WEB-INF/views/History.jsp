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
<div class="container" id="main">
	<div class="row" id="myPageDiv">
		<div class="col-lg-1 col-xl-1"></div>
		<div id="history" class="col-12 col-sm-12 col-lg-10 col-xl-10">
					<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
					  <li class="nav-item">
					    <a class="nav-link active" id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true">my작성글</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" id="pills-profile-tab" data-toggle="pill" href="#pills-profile" role="tab" aria-controls="pills-profile" aria-selected="false">my작성댓글</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" id="pills-contact-tab" data-toggle="pill" href="#pills-contact" role="tab" aria-controls="pills-contact" aria-selected="false">추천글</a>
					  </li>
					</ul>
					<div class="tab-content" id="pills-tabContent">
					  <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
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
					</div>
					<div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
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
										<td><fmt:formatDate value="${vo2.re_date}" pattern="MM-dd" /></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="tab-pane fade" id="pills-contact" role="tabpanel" aria-labelledby="pills-contact-tab">
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
										<td><fmt:formatDate value="${vo3.v_date}" pattern="MM-dd" /></td>
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
</body>
</html>