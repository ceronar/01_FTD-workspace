<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문된 상품 목록</title>
	<style type="text/css">
		.header {
			display : none;
		}
		
		.outer {
			font-family: 'Arial', sans-serif;
			margin: 0;
			padding: 0;
			background-color: #f8f9fa;
		}
		
		.head-area {
			color: #ffffff;
			background-color: #ffffff;
			border-radius: 8px;
			box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
			padding: 1em;
			max-width: 1200px;
			margin: 0 auto;
			display: flex;
            justify-content: space-between;
            align-items: center;
		}
		
		.head-area span {
            margin-left: 10px;
            color : black;
            font-size : 30px;
        }
		
		.content-area {
			max-width: 1200px;
			margin: 20px auto;
			padding: 20px;
			background-color: #ffffff;
			border-radius: 8px;
			box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
			font-size: 18px;
		}
		
		.icon span {
			font-size: 40px;
			display: inline-block;
		}
		
		.orderDetail-table {
			width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
		}
		
		.orderDetail-table th, .orderDetail-table td {
			border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
		}
		
		.orderDetail-table th {
            background-color: #4caf50;
            color: #fff;
        }
		
		.orderDetail-table>tbody>tr:hover {
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
		    display: none !important;
		}
		
		#nav5 {
		    display: block !important;
		}
		
		.modal {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            z-index: 1000;
        }

        .overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 999;
        }
        
        .red { color:red; }
		.orange { color:orange; }
		.green { color:green; }
		
	</style>
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
</head>
<body>
	<div class="outer">
		<div class="head-area">
			<jsp:include page="../common/header.jsp"/>
			<div>
				<a href="sellerPage"><span class="material-symbols-outlined">arrow_back</span></a>
			</div>
			<div class="icon">
				<a href="${pageContext.request.contextPath}"><span id="home-icon" class="material-symbols-outlined">home</span></a>
			</div>
		</div>
		<div class="content-area">
			<h1>주문된 상품 목록</h1>
			<!-- Order details table -->
			<table class="orderDetail-table">
				<thead>
					<tr>
						<th hidden>주문 상세 번호</th>
						<th>주문번호</th>
						<th>상품명</th>
						<th>개수</th>
						<th>합산 가격</th>
						<th>구매자 이름</th>
						<th>전화번호</th>
						<th>주소</th>
						<th>요청사항</th>
						<th>주문일자</th>
						<th>배송 상태</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="o" items="${ requestScope.list }">
						<tr>
							<td hidden>${ o.orderDetailNo }</td>
							<td>${ o.orderNo }</td>
							<td>${ o.goodTitle }</td>
							<td>${ o.count }</td>
							<td>${ o.count * o.price }</td>
							<td>${ o.orderName }</td>
							<td>${ o.phone }</td>
							<td>(${ o.zipCode })${ o.address },${ o.detailAddress }</td>
							<td>${ o.request }</td>
							<td>${ o.payDate }</td>
							<td>${ o.status eq "N" ? "<span class='red'>배송전</span>" : o.status eq "Y" ? "<span class='orange'>배송중</span>" : "<span class='green'>배송완료</span>" }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	
	<script type="text/javascript">
	</script>
	
	</div>
</body>
</html>