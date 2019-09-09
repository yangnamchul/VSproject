<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <%@ include file="Header.jsp"%>

   <div id="content-area">
      <div class="container" id="main">
         <div class="row" id="writeDiv">
            <div class="col-12 col-sm-12 col-lg-12 col-xl-12">
               <div class="frame">
              	 <c:forEach var="vo1" items="${vsslist}">
             	  <a id="vss" href="VSSBoard.do?vss_seq=${vo1.VSS_seq }&pg=1"> ${vo1.VSS_name }</a>
               	</c:forEach>
               </div>
            </div>
         </div>
      </div>
   </div>

</body>
</html>