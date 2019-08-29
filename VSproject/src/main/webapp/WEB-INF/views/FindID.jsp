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
	<h1>아이디 찾기</h1>
	<form id="FindID">
		<h3>
			<input hidden="hidden" />
			이메일 입력 : <input type="text" name="u_email" id="u_email"  onkeydown="JavaScript:Enter_Check();">
			<button type="button" onclick="FindID()">확인</button>
		</h3>
	</form>
	
	<h1>비밀번호 재설정</h1>
	<form id="FindPW">
		<h3>
			<input hidden="hidden" />
			아이디 입력 : <input type="text" name="u_id" id="u_id" >
			이메일 입력 : <input type="text" name="u_email" id="u_email2">
			<button type="button" onclick="FindPW()">확인</button>
		</h3>
	</form>
	
<script>	
	function Enter_Check(){
   		 // 엔터키의 코드는 13입니다.
		if(event.keyCode == 13){
  	  	 	FindID();  // 실행할 이벤트
		}
	}
	//아이디 찾기 ajax
	function FindID() {
		if($("#u_email").val()=="") {
			alertify.alert("이메일을 입력해주세요");
			return;
		};
		
		jQuery.ajax({
			type:"POST",
			url:"FindID.do",
			data:$("#FindID").serialize(),
			async : false,
			success : function (data) {
				if (data == "no-data") {
					alertify.alert("아이디 정보가 없습니다.");
					$("#u_email").val("");
				} else {
					alertify.alert("당신의 아이디는 " + data + "입니다")
				}
			},
			error: function (req, status, error) {
				alertify.alert(req.status+ "\nmessege"+ req.responseTest );
			}
		});
	}
	//비밀번호 찾기 ajax
	function FindPW() {
		if($("#u_id").val()=="") {
			alertify.alert("아이디를 입력해주세요");
			return;
		};
		if($("#u_email2").val()=="") {
			alertify.alert("이메일을 입력해주세요");
			return;
		};
		
		jQuery.ajax({
			type:"POST",
			url:"FindPW.do",
			data:$("#FindPW").serialize(),
			async : false,
			success : function (data) {
				if (data == 0) {
					alertify.alert("아이디 정보가 없습니다.");
					$("#u_id").val("");
					$("#u_email2").val("");
				} else {
					location.href="FindPW.do";
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