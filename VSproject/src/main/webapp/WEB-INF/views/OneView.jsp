<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/jquery-3.4.1.js"></script>
</head>
<%
	
%>
<body>
<table border="2">
		<tr>
			<td>
				${vo.b_seq }
			</td>
			<td>
				${vo.u_id }
			</td>
			<td>
				${vo.b_date }
			</td>
		</tr>
		<tr>
			<td id="content123" colspan="3">
				${vo.b_content}
			</td>
		</tr>
		
</table>
<a href="Main">메인</a>
</body>
</html>