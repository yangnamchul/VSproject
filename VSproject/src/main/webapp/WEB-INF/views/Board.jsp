<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- B_seq number NOT NULL,
	U_seq number NOT NULL,
	C_seq number NOT NULL,
	Re_seq number NOT NULL,
	B_title varchar2(20) NOT NULL,
	B_content varchar2(500),
	B_cnt number NOT NULL,
	B_date date NOT NULL,
	B_tag varchar2(50) NOT NULL, -->
<h1>
    게시판 등록하기  
</h1>
    
    <form action="BoardInsertData.do" method="get">
        <div class="createForm">
            <label >제목</label>
            <input type="text" name="b_title"  placeholder = "게시판 제목">
        </div>
        <div class="createForm">
            <label >내용</label>
            <textarea rows="4" cols="15" name="b_content"  placeholder = "게시판 내용"></textarea>
        </div>
        <div class="createForm">
            <label >작성자</label>
            <input type="text" name="b_writer" class="createForm" placeholder = "작성자">
        </div>
        
        <div class="Formfooter">
                <button type="submit" class="btn_button">작성하기</button>
        </div>            
        
    </form>
 
    
</body>
</html>