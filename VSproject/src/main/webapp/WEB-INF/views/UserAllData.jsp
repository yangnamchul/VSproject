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
<table border="2">



<c:forEach var="vo1" items="${userlist }">
<tr>
    <td>${vo1.u_seq}</td>
    <td>${vo1.u_id}</td>
    <td>${vo1.u_pw}</td>
    <td>${vo1.u_name}</td>
    <td>${vo1.u_email}</td>
    <td>${vo1.u_date}</td>
  </tr>
</c:forEach>
</table>

<a href="Main">메인</a>
</body>
</html>