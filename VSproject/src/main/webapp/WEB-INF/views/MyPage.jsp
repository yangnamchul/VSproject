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
</h3>
</body>
</html>