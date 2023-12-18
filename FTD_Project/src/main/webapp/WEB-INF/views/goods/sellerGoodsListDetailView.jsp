<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="${pageContext.request.contextPath}/resources/css/main.css?version=1.2" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@800&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>

	div {
		/* border: 1px solid black; */
	}

	.main-div {
		margin-left: 140px;
	}

	.content {
		height: 830px;
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

	.header-back, .header-title {
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
		font-family: 'Noto Sans KR', sans-serif;
		width: 90%;
		padding-right: 80px;
	}

	.goods-title, .goods-price {
		width: 100%;
		height: 70px;
		padding-left: 20px;
		text-align: left;
		font-size: 50px;
		line-height: 70px;
		margin-bottom: 10px;
		box-sizing: border-box;
		font-family: 'Noto Sans KR', sans-serif;
	}
	
	.br-line {
		width: 95%;
		margin: auto;
		border: 1px solid rgba(0, 0, 0, 0.1);
	}

	tr > th {
		width: 250px;
		height: 90px;
		padding-left: 15px;
		font-size: 30px;
		text-align: left;
		font-weight: 500;
		color: rgb(85, 85, 85);
		font-family: 'Noto Sans KR', sans-serif;
	}

	tr > td {
		width: 600px;
		height: 40px;
		font-size: 17px;
		text-align: left;
		color: rgb(23, 23, 23);
		font-family: 'Noto Sans KR', sans-serif;
	}

	.td-size {
		height: 20px;
		font-size: 12px;
		color: rgb(118, 118, 118);
		font-family: 'Noto Sans KR', sans-serif;
	}

	input {
		width: 300px;
		height: 40px;
		font-size: 20px;
		font-family: 'Noto Sans KR', sans-serif;
		border: 0px;
		box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
		padding-left: 15px;
	}
	
	/* sub-content */
	.sub-content {
		width: 100%;
		background-color: #ffffff;
    	box-sizing: border-box;	
	}

	/* br2-line */
	.br2-line {
		width: 100%;
		height: 8px;
		background-color: #ddd;
	}

	.material-symbols-outlined {
	font-variation-settings:
	'FILL' 0,
	'wght' 400,
	'GRAD' 0,
	'opsz' 24
	}

	.pay-button {
		width: 40%;
		height: 40px;
		margin-top: 5px;
		margin-left: 20px;
		box-sizing: border-box;
		display: inline;
		font-size: 20px;
		font-family: 'Noto Sans KR', sans-serif;
	}

	.btn-icon {
		margin: auto;
		width: 25px;
		height: 25px;
		font-size: 20px;
		font-family: 'Noto Sans KR', sans-serif;
	}
	
	.goods-title-div1, .goods-title-div2 {
		height: 100%;
		box-sizing: border-box;
		float: left;
	}

	.goods-title-div1 {
		font-size: 18px;
		width: 10%;
		color: rgb(85, 85, 85);
	}

	.goods-title-div2 {
		width: 70%;
	}

	#goods-title-div2 {
		font-size: 35px;
	}

	.sub-footer1 {
		width: 100%;
		height: 50px;
		position: sticky; /* 스크롤에 고정 */
		bottom : 0px;
		background-color: #ffffff;
		border-top-left-radius: 4px;
    	border-top-right-radius: 4px;
		box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
		/* padding-top: 5px; */
	}

</style>
<body>
	<div class="wrapper">
        
        <div class="center-div">  
                 
	        <div class="main-div">
	        
	            <jsp:include page="../common/header.jsp" />
	            
	            <div class="goods-header">
					<div class="header-back"><span class="material-symbols-outlined" onClick = "history.back();">arrow_back_ios_new</span></div>
					<div class="header-title">상품 등록 세부 페이지</div>
	            </div>
	        	            
				<form action="updateSellerGoods.go" method="post">
		            <div class="content">					
	           				
						<div class="goods">
	
							<div class="goods-title">
								<div class="goods-title-div1">상호명</div>
								<div class="goods-title-div2">${sessionScope.loginSeller.companyName }</div>
							</div>
							<div class="goods-price">
								<div class="goods-title-div1">대표명</div>
								<div class="goods-title-div2" id="goods-title-div2">${sessionScope.loginSeller.sellerName }</div>
							</div>
							
							<div class="br-line"></div>
							<br>
							
							<input type="hidden" name="goodNo" value="${ requestScope.goods.goodNo }">
							<input type="hidden" name="sellerNo" value="${sessionScope.loginSeller.sellerNo }">
							<table>
								<tr>
									<th>품목</th>
									<td><input type="text" name="goodTitle" value="${ requestScope.goods.goodTitle }"></td>
								</tr>
								<tr>
									<th class="td-size"></th>
									<td class="td-size">한글품목명으로 입력해주세요.</td>
								</tr>
								<tr>
									<th>품목상세정보</th>
									<td><input type="text" name="goodDetail" value="${ requestScope.goods.goodDetail }"></td>
								</tr>
								<tr>
									<th>원산지</th>
									<td><input type="text" name="origin" value="${ requestScope.goods.origin }"></td>
								</tr>
								<tr>
									<th class="td-size"></th>
									<td class="td-size">도/시/군/구 까지 입력해주세요.</td>
								</tr>
								<tr>
									<th>판매가</th>
									<td><input type="number" name="price" value="${ requestScope.goods.price }"></td>
								</tr>
								<tr>
									<th>유통기한</th>
									<td><input type="date" id="expiration" name="expiration"></td>
								</tr>
								<tr>
									<th>재고</th>
									<td><input type="number" name="stock" value="${ requestScope.goods.stock }"></td>
								</tr>
							</table>	

						</div>
										
		        	</div>
				
				
					<div class="sub-content">				
						<div class="sub-footer1">
							<button class="pay-button" type="submit">수정하기</button>
							<button class="pay-button" type="button" onclick="location.href='deleteSellerGoods.go?gno=' + ${requestScope.goods.goodNo};">삭제하기</button>
						</div>
	        		</div>
				</form>
				
			</div>
		</div>
	</div>

	<script>
	
	$(function() {
    	
		let date = '${ requestScope.goods.expiration }';
		
		let expiration = date.substr(0, 10);
		
		$("#expiration").val(expiration);
		
		console.log(expiration);

	});
	
	</script>

</body>
</html>