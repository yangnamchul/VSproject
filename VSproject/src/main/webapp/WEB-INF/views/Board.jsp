<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>Insert title here</title>
</head>
<body>

<%-- 		<%@ include file="t_Header.jsp"%> --%>
	<%@ include file="Header.jsp"%>

	<div id="content-area">
		<div class="container" id="main">
			<div class="row" id="boardDiv">
				<!-- 	글목록 보기 -->


				<div class="col-12 col-sm-12 col-lg-12 col-xl-12" id="board-inner">
					[아무]의 부스러기 (전체 글 : { 딸린 vss count}</div>

				<div class="col-xl-10" id="board-menu">해당 부스러기 관련 링크 (정렬, 인기글,
					공지 같은거 연결하기)</div>

				<div class="col-xl-2" id="board-write" align="center">
					<form action="BoardWriteData.do" method="post">
						<input hidden="hidden" />
						<button type="submit">글쓰기</button>
					</form>
				</div>

				<div class="col-12 col-sm-12 col-lg-12 col-xl-12" id="board-list">
					<table class="table table-striped table-bordered table-hover"
						id="board-table">
						<thead>
							<tr>
								<th width="10%">번호</th>
								<th width="50%">제목</th>
								<th width="10%">작성자</th>
								<th width="20%">작성일</th>
								<th width="10%">조회</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="vo1" items="${boardlist}">
								<tr>
									<td>${vo1.b_seq}</td>
									<td id="title"><a href="Content.do?b_seq=${vo1.b_seq}">${vo1.b_title} </a></td>
									<td>${vo1.u_id}</td>
									<td><fmt:formatDate value="${vo1.b_date}" pattern="MM-dd" />
									</td>
									<td>${vo1.b_cnt}</td>
								</tr>
							</c:forEach>

						</tbody>
					</table>

					<!-- Paging 처리 -->
		<%-- 			<%  /* int total=Integer.valueOf((String)request.getAttribute("ListCount")); */
		      
		        int total =Integer.parseInt((request.getAttribute("ListCount")).toString()); 
				int p=0;
				if(total%5==0){
					p=total/5;
				}
				else{
					p=(total/5)+1;
				}
				%> --%>
        <%--  		<div class="col-xs-12" id="paging">
				
				<button type="button" id="before_bt">   <   </button>  
				<%
				
				
				for (int i=1; i<=p; i++){
				%>
				  <a href="Board.do?page=<%=i%>"> <%=i%></a>
				
				<%
	                     } %>
				<button type="button" id="after_bt">     >    </button>  
				</div> --%>
				<!--현재는 페이징 영역 ID "paging" 으로 고정 -->
            <ul id="paging">11111</ul>


				
			</div>
		</div>
	</div>

</body>
<script>


var pager = function(options) {

    var defaults = {
        currentPage : 1 // 현재페이지    
        ,pageSize : 5 // 페이지 사이즈 (화면 출력 페이지 수)
        ,maxListCount : 10 // (보여질)최대 리스트 수 (한페이지 출력될 항목 갯수)
        ,startnum : 1 // 시작 글번호
        ,lastnum : 10 // 마지막 글번호
        ,totalCnt : 0 // 전체 글의 갯수.
        ,totalPageCnt : 0 // 전체 페이지 수
        
    };
    
    this.buttonClickCallback = null;
    this.opts = $.extend({}, defaults, options);
    
};

pager.prototype = {

    "renderpager" : function(totalCnt, buttonClickCallback) {

        //console.log(this);
        //console.log(this.opts);
        var _ = this;
        alert("prototype");
        _.opts.totalCnt = totalCnt; //토탈 카운트 객체 멤버변수에 저장.
        
        var pageSize = this.opts.pageSize;
        var maxListCount = this.opts.maxListCount;
        var currentPage = this.opts.currentPage;
        
        if (totalCnt == 0) {
            return "";
        }
        
        //총페이지수 구하기 : 페이지 출력 범위 (1|2|3|4|5)
        var totalPageCnt = Math.ceil(totalCnt / maxListCount);
    
        //현재 블럭 구하기 
        var n_block = Math.ceil(currentPage / pageSize);

        //페이징의 시작페이지와 끝페이지 구하기
        var s_page = (n_block - 1) * pageSize + 1; // 현재블럭의 시작 페이지
        var e_page = n_block * pageSize; // 현재블럭의 끝 페이지

        // setup $pager to hold render
        var $pager = $('#paging'); // TODO: 페이지를 출력할 영역. ( 출력할 영역의 ID를 인자로..  )
        $pager.empty(); //영역에 기존에 있던 내용 제거


        //처음, 이전 버튼 추가
        $pager.append(this.renderButton('first', totalPageCnt, _.buttonClickCallback))
              .append(this.renderButton('prev', totalPageCnt,    _.buttonClickCallback));

        //페이지 나열
        for (var j = s_page; j <= e_page; j++) {
            if (j > totalPageCnt)    break;
            
            var currentButton = $('<li >' + (j) + '</li>');
            
            //현재 페이지일경우 select 클래스 추가. 
            if (j == currentPage)    currentButton.addClass('selected');
            else currentButton.click(function() {
                                _.initNum(parseInt(this.firstChild.data));
                                _.buttonClickCallback(this.firstChild.data);
                            });
        
            currentButton.appendTo($pager); //페이징 영역에 버튼 추가            
        }

        //다음, 마지막 버튼 추가
        $pager.append(this.renderButton('next', totalPageCnt,    _.buttonClickCallback))
              .append(this.renderButton('last', totalPageCnt,    _.buttonClickCallback));

        return $pager;
    },
    
    
    "initNum" : function(cp) {

        this.opts.currentPage = cp;

        //시작 글번호
        this.opts.startnum = (cp - 1) * this.opts.maxListCount + 1;

        // 마지막 글번호
        var tmp = cp * this.opts.maxListCount;
        this.opts.lastnum = (tmp > this.opts.totalCnt ? this.opts.totalCnt
                : tmp);

        console.log("P:"+cp+"/startnum:"+this.opts.startnum+"/lastnum:"+this.opts.lastnum);

    },

    "renderButton" : function(buttonLabel, totalPageCnt,
            buttonClickCallback) {
        var _ = this;
        var currentPage = this.opts.currentPage;
        //var totalPageCnt = this.opts.totalPageCnt;

        var $Button = $('<li >' + buttonLabel + '</li>');
        var destPage = 1;

        // work out destination page for required button type
        switch (buttonLabel) {
        case "first":
            destPage = 1;
            $Button.addClass('active');
            $Button.html('처음');
            break;

        case "prev":
            destPage = currentPage - 1;
            $Button.addClass('active');
            $Button.html('이전');
            break;

        case "next":
            destPage = currentPage + 1;
            $Button.addClass('active');
            $Button.html('다음');
            break;

        case "last":
            destPage = totalPageCnt;
            $Button.addClass('active');
            $Button.html('마지막');
            break;
        }

        // disable and 'grey' out buttons if not needed.
        if (buttonLabel == "first" || buttonLabel == "prev") { //1페이지에서는 처음, 이전 버튼 안보이게 

            if(    currentPage <= 1 ) $Button.addClass('pgEmpty').css("display", "none") 
            else $Button.click(function() {    _.initNum(destPage); buttonClickCallback(); });
        } else {
            if( currentPage >= totalPageCnt) $Button.addClass('pgEmpty').css("display", "none")
            else $Button.click(function() { _.initNum(destPage); buttonClickCallback();    });
        }
        return $Button; //생성된 버튼 반환
    }
};

})
</script>
<script>

//pager객체 생성
$(document).ready(function(){

var page = new pager();

//클릭했을때 사용할 콜백함수 지정. 
//여기서는 테스트용함수 지정.
//게시판 같은경우 리스트를 호출하는 함수 지정하면된다.
page.buttonClickCallback = listContent;

//최초 로딩시 실행.
listContent();
})



//테스트용.

function listContent() {
    //console.log(pageCurrent);
    //alert(pageCurrent);        
    
    //Ajax 작업 (S)
$.ajax({
			type: 'GET',
			url: 'BoardListCount.do',
	        async: false,
	 /*        data : $("#replyform").serialize(), */
	      /*   dataType: 'json',//동기 비동기 설정 */
			 error : function(){
	             alert("통신실패!!!!");
	         },
	         success : function(data){  
	        	   alert(data);
	        	 page.renderpager(data);   //페이징 처리를 위해 총레코드수를 매개변수로 전달해야함.
	         }

});

}
</script>

</html>