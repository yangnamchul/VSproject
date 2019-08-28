<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="BoardWriteData.do" method="post">
<table border="2">
<c:forEach var="vo1" items="${boardlist}">
<tr>
    <td>${vo1.b_seq}</td>
    <td><a href="BoardOneView.do?b_seq=${vo1.b_seq}">${vo1.b_title}</a></td>
    <td>${vo1.b_date}</td>
    <td>${vo1.b_cnt}</td>

  </tr>
</c:forEach>
</table>
<input type="submit" value="게시물작성">
</form>
<a href="Main">메인</a>
</body>

</html>