<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/main.css?version=1.2" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>
	/* navi css */
	#nav1 {
	    display: none !important;
	}
	
	#nav2 {
	    display: none;
	}
	
	#nav3 {
	    display: block !important;
	}
	
	.menu2 {
		font-size: 25px;
		border-bottom: 3px solid black;
		color: black;
	}

</style>
</head>
<body>
	<div class="wrapper">
        
        <div class="center-div">  
         
	        <jsp:include page="../common/sidebar.jsp" />
	        
	        <div class="main-div">
	            <jsp:include page="../common/header.jsp" />
	            
	            <div class="content">
	            
	            	<h1>판매글</h1>
	                      
		            <div class="goods-filter"></div>
					
					<div class="goods"></div>
				
		        </div>

	        </div>             
        </div>
	</div>
</body>
</html>