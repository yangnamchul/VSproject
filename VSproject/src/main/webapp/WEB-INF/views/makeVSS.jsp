<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/jquery-3.4.1.js"></script>
<script src="resources/js/alertify.min.js"></script>
<link rel="stylesheet" href="resources/css/alertify.default.css" />
<link rel="stylesheet" href="resources/css/alertify.core.css" />
</head>
<body>
	<h1>부스러기 만들기</h1>
	
	<form id="makeVSS">
		<h3>
			부스러기 이름 : <input type="text" name="VSS_name" id="VSS_name"> <br>
			부스러기 설명 : <input type="text" name="VSS_content" id="VSS_content"> <br>
			<button type="button" onclick="makeVSS()"> 확인</button>
		</h3>
	</form>
	
	<script>
		function makeVSS() {
			if($("#VSS_name").val()=="") {
				alertify.alert("부스러기 이름을 입력해주세요");
				return;
			};
			
			jQuery.ajax({
				type:"POST",
				url:"makeVSS.do",
				data:$("#makeVSS").serialize(),
				async : false,
				success : function (data) {
					if (data == 0) {
						alertify.alert("이미 존재하는 부스러기 입니다");
						$("#VSS_name").val("");
					} else {
						location.href="Main";
					}
				},
				error: function (req, status, error) {
					alertify.alert(req.status+ "\nmessege"+ req.responseTest );
				}
			});
		}
	</script>
</body>
</html>