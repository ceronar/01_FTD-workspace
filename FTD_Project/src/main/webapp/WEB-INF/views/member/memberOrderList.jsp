<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>주문 내역</title>
    <link href="${pageContext.request.contextPath}/resources/css/main.css?version=1.2" rel="stylesheet" type="text/css">
    <style type="text/css">
    	.order-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        .order-table th, .order-table td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        .order-table th {
            background-color: #007acc;
            color: #fff;
        }
        
        .order-table>tbody>tr:hover {
			background-color: lightgray;
			cursor: pointer;
		}
		
		/* navi css */
		#nav1 {
		    display: none !important;
		}
		
		#nav2 {
		    display: none !important;
		}
		
		#nav3 {
		    display: none !important;
		}
		
		#nav4 {
		    display: block !important;
		}
		
		#nav5 {
		    display: none !important;
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
		        	<h2>주문 내역</h2>
		            <table class="order-table">
					    <thead>
					        <tr>
					            <th>주문 번호</th>
					            <th>결제 금액</th>
					            <th>결제 날짜</th>
					            <th>요구사항</th>
					        </tr>
					    </thead>
					    <tbody>
					    	<c:forEach var="o" items="${ requestScope.list }">
						        <tr>
						            <td>${ o.orderNo }</td>
						            <td>${ o.price }</td>
						            <td>${ o.payDate }</td>
						            <td>${ o.request }</td>
						        </tr>
					        </c:forEach>
					    </tbody>
					</table>
		        </div>
		        <jsp:include page="../common/footer.jsp" />
	        </div>
        </div>
    </div>
    
    <script type="text/javascript">
    	$(function() {
			$(".order-table>tbody").on("click", "tr", e => {
				let orderNo = e.target.parentElement.childNodes.item(1).innerText;
				
				var form = document.createElement('form'); // 폼객체 생성
				var objs;
				objs = document.createElement('input'); // 값이 들어있는 녀석의 형식
				objs.setAttribute('type', 'text'); // 값이 들어있는 녀석의 type
				objs.setAttribute('name', 'orderNo'); // 객체이름
				objs.setAttribute('value', orderNo); //객체값
				form.appendChild(objs);
				form.setAttribute('method', 'post'); //get,post 가능
				form.setAttribute('action', "orderDetail.me"); //보내는 url
				document.body.appendChild(form);
				form.submit();
				
			});
		});
    	
    	
    </script>
    
</body>
</html>
