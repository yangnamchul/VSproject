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
<c:forEach var="vo1" items="${userlist }">
    <td>${vo1.u_seq}</td>
    <td>${vo1.u_id}</td>
    <td>${vo1.u_pw}</td>
    <td>${vo1.u_name}</td>
    <td>${vo1.u_email}</td>
    <td>${vo1.u_date}</td>
    <td>
</c:forEach>
</body>
</html>