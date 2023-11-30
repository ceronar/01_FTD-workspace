<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet" type="text/css">
</head>
<body>
    <div class="wrapper">
        <div class="center-div">  
         
	        <jsp:include page="common/sidebar.jsp" />
	        
	        <div class="main-div">
	            <jsp:include page="common/header.jsp" />

	           
	            		
	            <div class="content">메인 컨텐츠<br>
	            
	            
	            <a href="list.se">가게</a>

	            </div>
	            <jsp:include page="common/footer.jsp" />
	        </div> 
	              
        </div>
    </div>
	
</body>
</html>
