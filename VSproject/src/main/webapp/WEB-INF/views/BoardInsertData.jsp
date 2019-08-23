<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>
    게시판 등록하기  
</h1>
    
    <form action="BoardInsertData.do" method="POST">
        <div class="createForm">
            <label >제목</label>
            <input type="text" name="b_title" placeholder = "게시판 제목">
        </div>
        <div class="createForm">
            <label >내용</label>
            <textarea rows="10" cols="50" name="b_content"  placeholder = "게시판 내용"></textarea>
        </div>
         <div class="createForm">
            <label >태그</label>
            <input type="text" name="b_tag"  placeholder = "태그달기"></textarea>
        </div>
        
        <div class="Formfooter">
                <input type="submit" value="등록하기"></button>
        </div>            
        
    </form>
 
    
</body>


</html>