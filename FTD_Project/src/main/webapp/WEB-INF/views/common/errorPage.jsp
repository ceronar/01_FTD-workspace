<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sorry</title>
	<link href="${pageContext.request.contextPath}/resources/css/main.css?version=1.2" rel="stylesheet" type="text/css">
</head>
<body>
    <div class="wrapper">
        <div class="center-div">  
         
	        <jsp:include page="sidebar.jsp" />
	        
	        <div class="main-div">
		        <jsp:include page="header.jsp" />
	
		           
		        <div class="content">
		        	
		        	<img src="https://www.urbanbrush.net/web/wp-content/uploads/edd/2017/09/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7-2017-09-22-%EC%98%A4%ED%9B%84-8.48.41.png">
        			<br><br>
        			<h1 style="font-weight:bold;">${ requestScope.errorMsg }</h1>
		        	
		        </div>
		        <jsp:include page="footer.jsp" />
	        </div> 
	              
        </div>
    </div>
</body>
</html>