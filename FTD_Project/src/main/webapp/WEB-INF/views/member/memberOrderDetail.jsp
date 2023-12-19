<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 상세</title>
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
			max-width: 1000px;
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
		.review-btn {
			width : 80px;
			padding : 0px;
		}
		
		.review-btn button {
			width : 100%;
			height : 100%;
			
		}
		.orderDetail-table img {
			max-width: 100px;
            max-height: 100px;
            border: 1px solid #ddd;
            border-radius: 5px;
		}
		
		.orderDetail-table>tbody>tr:hover {
			background-color: lightgray;
			cursor: pointer;
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
				<a href="orderList.me"><span class="material-symbols-outlined">arrow_back</span></a>
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
						<th hidden>상품 번호</th>
						<th>상품 사진</th>
						<th>상품명</th>
						<th>개수</th>
						<th>가격</th>
						<th>주문 상태</th>
						<th hidden>판매 번호</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="og" items="${ requestScope.list }">
						<tr>
							<td hidden>${ og.goodNo }</td>
							<td><img src="${ og.changeName }" alt="상품 번호"></td>
							<td>${ og.goodTitle }</td>
							<td>${ og.count }</td>
							<td>${ og.count * og.price }</td>
							<td>${ og.status eq "N" ? "<span class='red'>배송전</span>" : og.status eq "Y" ? "<span class='orange'>배송중</span>" : "<span class='green'>배송완료</span>" }</td>
							<td hidden>${ og.sellNo }</td>
							<td class="review-btn"><button ${ og.status ne 'E' ? 'disabled' : '' }>후기 작성</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	
	<script type="text/javascript">
		$(function() {
			$(".orderDetail-table>tbody").on("click", "tr", e => {
				let sellNo = e.target.parentElement.children.item(6).innerText;
				location.href = "goodsDetailPage.go?sno=" + sellNo;
			});
		});
		
		$('.review-btn button').click(function() {
	        // var sellNo = $(this).closest('tr').find('td:hidden').last().text();
	         let goodNo = $(this).closest('tr').find('td:hidden:first').text();
			console.log(goodNo);
	        window.location.href = 'enrollForm.rev?goodNo=' + goodNo;
	        
	    });
	</script>
	
	</div>
</body>
</html>