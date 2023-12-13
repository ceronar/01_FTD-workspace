<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style type="text/css">
		.header{
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
			max-width: 1000px;
			margin: 0 auto;
		}
		
		.content-area {
			max-width: 1000px;
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
            text-align: left;
		}
		
		.orderDetail-table img {
			max-width: 100px;
            max-height: 100px;
            border: 1px solid #ddd;
            border-radius: 5px;
		}
		
	</style>
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
</head>
<body>
	<div class="outer">
		<div class="head-area">
			<jsp:include page="../common/header.jsp"/>
			<div>
				<a href="orderList.me"><span><i class="fas fa-arrow-left"></i></span></a>
			</div>
			<div class="icon">
				<a href="${pageContext.request.contextPath}"><span id="home-icon" class="material-symbols-outlined">home</span></a>
				<a href="basket.me"><span class="material-symbols-outlined">shopping_cart</span></a>
			</div>
		</div>
		<div class="content-area">
			<h1>주문 상세</h1>
			<!-- Order details table -->
			<table class="orderDetail-table">
				<thead>
					<tr>
						<th>Product Image</th>
						<th>Product Number</th>
						<th>Product Title</th>
						<th>Quantity</th>
						<th>Price</th>
						<th>Order Status</th>
						<th>Sales Text Number</th>
					</tr>
				</thead>
				<tbody>
					<!-- Sample data for demonstration purposes -->
					<tr>
						<td><img src="product_image_url" alt="Product Image"></td>
						<td>123</td>
						<td>Product Title</td>
						<td>2</td>
						<td>$100.00</td>
						<td>Shipped</td>
						<td>456</td>
					</tr>
					<!-- Add more order details as needed -->
				</tbody>
			</table>
		</div>
	
	
	
	</div>
</body>
</html>