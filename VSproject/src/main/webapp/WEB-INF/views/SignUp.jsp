<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/Signup.css"/>
</head>
<body>
<form class="signup-content" action="UserInsertData.do" method="get">
<div class="signup-container">
이름<input type="text" name="u_name"><br>
아이디<input type="text" name="u_id"><br>
<div class="password-container">
비밀번호<input type="password" name="u_pw" class="password"><br>
<div class="password-rep-container"></div>
<div class="progress-bar_wrap">
<div class="progress-bar_item progress-bar_item-1"></div>
<div class="progress-bar_item progress-bar_item-2"></div>
<div class="progress-bar_item progress-bar_item-3"></div>
</div>
<span class="progress-bar_text</div>">비밀번호를 입력해주세요</span>
</div>
비밀번호 확인<input type="password" name="u_pw_rep" class="password-rep"><br>
<div class="progress-bar_wrap">
<div class="progress-bar_item progress-bar_item-1"></div>
<div class="progress-bar_item progress-bar_item-2"></div>
<span class="progress-bar_text">비밀번호를 입력해주세요</span>
</div>
<div class="e-mail-container">
e-mail<input type="email" name="u_email"><br>
<div class="clearfix">
<input type="submit" value="가입하기">
<input type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">
</div>
</div>
</div>
</form>

</body>
</html>

