<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet" />
<script src="resources/js/jquery-3.4.1.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<script src="resources/js/summernote-ko-KR.js"></script>
<script src="resources/js/alertify.min.js"></script>
<link rel="stylesheet" href="resources/css/alertify.default.css" />
<link rel="stylesheet" href="resources/css/alertify.core.css" />
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet" />
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>
<script>
$(document).ready(function() {
    $('#b_content').summernote({
            height: 300,                 // set editor height
            minHeight: null,             // set minimum height of editor
            maxHeight: null,             // set maximum height of editor
            focus: true                  // set focus to editable area after initializing summernote
            
    });
});

$(document).ready(function() {
	  $('#b_content').summernote();
	});

</script>
</head>
<body>
	<h1> 게시글 작성 </h1>	
	 <form action="BoardInsertData.do" method="POST">
        <div class="createForm">
            <label >제목</label>
            <input type="text" name="b_title" placeholder = "게시판 제목">
        </div>
        <div class="createForm">
            <label >내용</label>
            <textarea rows="10" cols="50" name="b_content"  id="b_content" placeholder = "게시판 내용"></textarea>
        </div>
         <div class="createForm">
            <label >태그</label>
            <input type="text" name="b_tag"  placeholder = "태그달기">
        </div>
        
        <div class="Formfooter">
                <input type="submit" value="등록하기">
        </div>            
        
    </form>
	
	
	
</body>
</html>