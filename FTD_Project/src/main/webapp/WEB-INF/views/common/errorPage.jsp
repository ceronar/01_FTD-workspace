<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <div class="wrapper">
        <div class="center-div">  
         
	        <jsp:include page="sidebar.jsp" />
	        
	        <div class="main-div">
		        <jsp:include page="header.jsp" />
	
		           
		        <div class="content">
		        	
		        	<img src="https://cdn2.iconfinder.com/data/icons/oops-404-error/64/208_balloon-bubble-chat-conversation-sorry-speech-256.png">
        			<br><br>
        			<h1 style="font-weight:bold;">${ requestScope.errorMsg }</h1>
		        	
		        </div>
		        <jsp:include page="footer.jsp" />
	        </div> 
	              
        </div>
    </div>
</body>
</html>