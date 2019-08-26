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
<script src="resources/js/alertify.min.js"></script>
<link rel="stylesheet" href="resources/css/alertify.default.css" />
<link rel="stylesheet" href="resources/css/alertify.core.css" />
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet" />
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>
<script src="resources/js/summernote-ko-KR.js"></script>
<script>
$(document).ready(function() {
    $('#b_content').summernote({
            height: 300,                 // set editor height
            minHeight: null,             // set minimum height of editor
            maxHeight: null,             // set maximum height of editor
            focus: true,                  // set focus to editable area after initializing summernote
            lang: 'ko-KR',
            callbacks: {
				onImageUpload: function(files, editor, welEditable) {
		            for (var i = files.length - 1; i >= 0; i--) {
		            	sendFile(files[i]);
		            }
		        }
			}
    });
});

function sendFile(file) {
	var form_data = new FormData();
  	form_data.append('file', file);
  	$.ajax({
    	data: form_data,
    	type: "POST",
    	url: 'BoardInsertFile.do',
    	cache: false,
    	contentType: false,
    	enctype: 'multipart/form-data',
    	processData: false,
    	success: function(img_name) {
    		alert(img_name);
      		$('#b_content').summernote('insertImage', img_name);
    	},
    	error : function() {
    		alert("업로드 실패");
    	}
  	});
}
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