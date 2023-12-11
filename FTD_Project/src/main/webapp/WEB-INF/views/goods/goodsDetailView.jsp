<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/main.css?version=1.2" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<style>

	div {
		border: 1px solid black;
	}

	.main-div {
		margin-left: 140px;
	}
	
	.header {
		display: none;
	}
	
	.goods-header {
		width: 100%;
		height: 50px;
		background-color: #ffffff;
    	box-sizing: border-box;
	}

	.header-back, .header-title, .header-cart {
		float: left;
		height: 100%;
		box-sizing: border-box;
	}

	.header-back {
		width: 10%;
	}

	.header-back > span {
		font-size: 30px;
		line-height: 50px;
		color: rgb(85, 85, 85);
	}

	.header-title {
		line-height: 50px;
		font-size: 30px;
		width: 80%;
	}

	.header-cart {
		width: 10%;
	}

	.header-cart > span {
		font-size: 35px;
		font-weight: 200;
		line-height: 50px;
		color: rgb(85, 85, 85);
	}

	.header-img {
		width: 100%;
		height: 500px;
		background-color: #ffffff;
    	box-sizing: border-box;
	}

	.goods-title, .goods-price {
		width: 95%;
		height: 70px;
		padding-left: 20px;
		text-align: left;
		font-size: 35px;
		line-height: 70px;
		margin-bottom: 10px;
	}

	.goods-like {
		width: 100px;
		height: 70px;
		float: right;
	}

	.br-line {
		width: 95%;
		margin: auto;
		border: 1px solid rgba(0, 0, 0, 0.1);
	}

	tr > th {
		width: 120px;
		height: 50px;
		padding-left: 15px;
		font-size: 17px;
		text-align: left;
		font-weight: 500;
		color: rgb(85, 85, 85);		
	}

	tr > td {
		width: 300px;
		height: 40px;
		font-size: 17px;
		text-align: left;
		color: rgb(23, 23, 23);
	}

	.td-size {
		height: 20px;
		font-size: 12px;
		color: rgb(118, 118, 118);
	}
	
	/* sub-content */
	.sub-content {
		width: 100%;
		height: 500px;
		background-color: #ffffff;
    	box-sizing: border-box;
		
	}

	.material-symbols-outlined {
	font-variation-settings:
	'FILL' 0,
	'wght' 400,
	'GRAD' 0,
	'opsz' 24
	}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
	<div class="wrapper">
        
        <div class="center-div">  
                 
	        <div class="main-div">
	        
	            <jsp:include page="../common/header.jsp" />
	            
	            <div class="goods-header">
					<div class="header-back"><span class="material-symbols-outlined" onClick = "history.back();">arrow_back_ios_new</span></div>
					<div class="header-title">제목</div>
					<div class="header-cart"><span class="material-symbols-outlined">shopping_cart</span></div>
	            </div>
	            
				<div class="header-img"></div>
	            
	            <div class="content">					
           				
					<div class="goods">

						<div class="goods-title">국내산 홍가라비 1kg</div>
						<div class="goods-price">3,900 원
							<div class="goods-like"></div>
						</div>
						
						<div class="br-line"></div>
						<br>

						<table>
							<tr>
								<th>배송비</th>
								<td>4,000원</td>
							</tr>
							<tr>
								<th class="td-size"></th>
								<td class="td-size">제주, 도서산간지역 배송 불가</td>
							</tr>
							<tr>
								<th>배송방식</th>
								<td>택배</td>
							</tr>
							<tr>
								<th>원산지</th>
								<td>통영</td>
							</tr>
							<tr>
								<th>보관방법</th>
								<td>받으신 후 냉장 보관 해 주세요.</td>
							</tr>
						</table>

					</div>
		        </div>

				<div class="sub-content"></div>

	       	              
        	</div>
		</div>
	</div>
</body>
</html>