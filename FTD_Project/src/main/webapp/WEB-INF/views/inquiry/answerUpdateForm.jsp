<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 20px;
            
        }

        .container {
            max-width: 800px;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align:left;
        }

        h1 {
            text-align: center;
            color: #333;
        }

        form {
            margin-top: 20px;
        }



        input[type="text"],
        textarea {
            width: calc(100% - 22px); /* 오른쪽 여백 20px + border 1px = 22px */
            padding: 8px;
            margin-bottom: 10px;
            border-radius: 3px;
            border: 1px solid #ccc;
            
        }

        input[type="submit"] {
            padding: 10px 20px;
            border: none;
            background-color: #3498db;
            color: #fff;
            cursor: pointer;
            border-radius: 3px;
        }

        input[type="submit"]:hover {
            background-color: #2980b9;
        }

        textarea {
            resize: none;
            height: 500px;
        }

    </style>
<link href="${pageContext.request.contextPath}/resources/css/main.css?version=1.2" rel="stylesheet" type="text/css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="wrapper">
        
        <div class="center-div">  
 	        <jsp:include page="../common/sidebar.jsp" />
	        <div class="main-div">
	            
	            <jsp:include page="../common/header.jsp" />
	            
	            <div class="content">
				    <div class="container">
				        <h1>게시글 작성</h1>
				
				        <form id="updatForm" method="post" action="update.re">
				            <h2>문의글 제목:</h2>
				            <input type="text" name="inqTitle" value="${requestScope.i.inqTitle}" readonly>
				
				            <h2>내용:</h2>
				            <textarea id="resopnseContent" name="responseContent" rows="6" required>${ requestScope.i.responseContent }</textarea>
				            
				            <div align="center">
				                <input type="submit" value="답변 등록">
				            </div>
				            
				            <input type="hidden" name="inqNo" value="${ requestScope.i.inqNo }">
				            <input type="hidden" name="sellerNo" value="${ requestScope.i.sellerNo }">
				        </form>
				    </div>
			    </div>
		    </div>
	    </div>
    </div>
</body>
</html>