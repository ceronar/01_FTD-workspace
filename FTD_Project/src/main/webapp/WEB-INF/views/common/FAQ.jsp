<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FAQ</title>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <style>
    	.content {
    		font-family: 'Noto Sans KR', sans-serif;
    	}
    
	 	.collapsible {
            background-color: #388755;
            color: white;
            cursor: pointer;
            padding: 18px;
            width: 70%;
            border: none;
            text-align: left;
            outline: none;
            font-size: 20px;
            margin-left:15%;
        }
        
		.active1 {
            background-color: gray;
        }
        
        .content_1 {
            padding: 0 18px;
            max-height: 0;
            overflow: hidden;
            transition: max-height 0.2s ease-out;
           
            width: 70%;
            margin-left:15%;
            font-size: 20px;
        }
        
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet" type="text/css">
		<script>
			function collapse(element) {
				var before = document.getElementsByClassName("active1")[0]
				if (before && document.getElementsByClassName("active1")[0] != element) {  
					before.classList.remove("active1");                 
				}
				element.classList.toggle("active1");        

				var content = element.nextElementSibling;
				if (content.style.maxHeight != 0) {         
					content.style.maxHeight = null;        
				} else {
					content.style.maxHeight = content.scrollHeight + "px";  
				}
			}
		</script>
</head>
<body>
<div class="wrapper">
        <div class="center-div">  
	        <jsp:include page="../common/sidebar.jsp" />
	        <div class="main-div">
		        <jsp:include page="../common/header.jsp" />
			        <div class="content">
						
							<br><br>
							
							<br><br><br>
							<button type="button" class="collapsible" onclick="collapse(this);">질문1</button>
						
						<div class="content_1">
							<p>대충내용</p>
						</div>
						
						<button type="button" class="collapsible" onclick="collapse(this);">질문2</button>
						<div class="content_1">
							<p>대충내용</p>
						</div>
						
						<button type="button" class="collapsible" onclick="collapse(this);">질문3?</button>
						<div class="content_1">
							<p>대충내용</p>
						</div>
						
						<button type="button" class="collapsible" onclick="collapse(this);">질문4</button>
						<div class="content_1">
							<p>대충내용</p>
						</div>
						
						<button type="button" class="collapsible" onclick="collapse(this);">질문5</button>
						<div class="content_1">
							<p>대충내용</p>
						</div>
					</div>
				</div>
			</div>
		</div>
</body>
</html>