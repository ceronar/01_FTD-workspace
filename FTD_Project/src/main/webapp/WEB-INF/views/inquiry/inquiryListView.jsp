<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <meta charset="UTF-8">
    <title>문의게시판 전체 조회</title>
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
            padding: 20px 20px 60px 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            text-align: center;
            border-top : 1px solid #ccc;
            border-bottom : 1px solid #ccc;
        }

        th {
            background-color: #f2f2f2;
        }

        tbody tr:hover {
            background-color: #f9f9f9;
            cursor: pointer;
        }
        .btn button {
            float : right;
            padding: 8px 20px;
            border: none;
            background-color: #2ecc71;
            color: #fff;
            cursor: pointer;
            border-radius: 3px;
            margin: 10px 5px;
        }

        .btn button:hover {
            background-color: #27ae60;
        }
		.material-symbols-outlined {
		  font-variation-settings:
		  'FILL' 0,
		  'wght' 400,
		  'GRAD' 0,
		  'opsz' 24
		}

    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>
<body>

	<div class="wraaper">
	    <div class="container">
	        <h1>게시판</h1>
	        <div align="center">
	            <table>
	                <thead>
	                    <tr>
	                        <th style="width : 5%;"><input type="checkbox" id="check-all"></th>
	                        <th style="width : 7%;">번호</th>
	                        <th style="width : 15%;">답변여부</th>
	                        <th style="width : 38%;">제목</th>
	                        <th style="width : 10%;">문의자</th>
	                        <th style="width : 10%">조회수</th>
	                        <th style="width : 15%;">등록일</th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <c:forEach var="i" items="${ requestScope.list }">
	                    <tr>
	                        <td><input type="checkbox" class="delete"></td>
	                        <td name="inqNo">${i.inquiryNo}</td>
	                        <td name="answerStatus">
	                        	<c:if test="${not empty i.responseContent}">
	                        		<span class="material-symbols-outlined">
									check_circle
									</span>
	                        	</c:if>
	                        </td>
	                        <td name="inquiryTitle">${i.inquiryTitle}</td>
	                        <td name="memberNo">${i.memberNo}</td>
	                        <td name="count">${i.count}</td>
	                        <td name="createDate">${i.createDate}</td>
	                    </tr>
	                    </c:forEach>
	                </tbody>
	            </table>
	        </div>
	        <div class="btn">
	            <button onclick="deleteSelected()">삭제</button>
	            <button>작성</button>
	        </div>
	    </div>
    </div>
    <script>
        
        var page=0;
    	var pageSize = 10;

    	function ajaxSelectInquiryList() {
    		$.ajax (){
    			url : 'ajaxSelectList.li',
                type: 'post',
                data: {sellerNo: ${requestScope.sellerNo}, page: page, Size: pageSize},
                success: function(result) {
                	
                	console.log("ajax 통신 성공!");
                	console.log("result");
                	
                	$(.)
                	/*
    	           	'<table>'
    	                + '<thead>'
    	                    + '<tr>'
    	                        + '<th style="width : 5%;"><input type="checkbox" id="check-all"></th>'
    	                        + '<th style="width : 7%;">번호</th>'
    	                        + '<th style="width : 15%;">답변상태</th>'
    	                        + '<th style="width : 38%;">제목</th>'
    	                       	+ '<th style="width : 10%;">문의자</th>'
    	                        + '<th style="width : 10%">조회수</th>'
    	                        + '<th style="width : 15%;">등록일</th>'
    	                    + '</tr>'
    	                + '</thead>'
    	                + '<tbody>'
    	                + '</tbody>'
    	            + '</table>'
                	*/
                },
                error : function() {
                	console.log("ajax 통신 실패");
                }
    		}
    	}
    </script>
    <jsp:include page="../common/footer.jsp" />
   </body>
</html>