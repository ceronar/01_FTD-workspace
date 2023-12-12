<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/main.css?version=1.2" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@800&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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
		position: sticky; /* 스크롤에 고정 */
		top: 0px;
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
		font-family: 'Noto Sans KR', sans-serif;
		width: 90%;
		padding-right: 80px;
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
		width: 100%;
		height: 70px;
		padding-left: 20px;
		text-align: left;
		font-size: 35px;
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
		width: 120px;
		height: 50px;
		padding-left: 15px;
		font-size: 17px;
		text-align: left;
		font-weight: 500;
		color: rgb(85, 85, 85);
		font-family: 'Noto Sans KR', sans-serif;	
	}

	tr > td {
		width: 300px;
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

	.sub-menu {
		position: sticky; /* 스크롤에 고정 */
		top: 50px;
		background-color: #ffffff;
	}

	/* sub-menu */
	.sub-menu a {
	width: 180px;
    display: inline-block; /* 가로로 나열되도록 변경합니다. */
    text-decoration: none;
    padding: 10px; /* 위아래 좌우 여백 조절 */
    margin: 0 5px; /* 좌우 간격 조절 */
	font-size: 22px;
    color: rgb(85, 85, 85);
    font-family: 'Noto Sans KR', sans-serif;
    /* background-color: #ccc; */
    /* border-radius: 5px; */

	}

	/* 나중에 높이값 수정 필요!!!!! */
	.goods-content {
		width: 100%;
		height: 700px;
	}

	.sub-review {
		width: 100%;
		height: 700px;
	}

	.goods-reply {
		width: 100%;
		height: 700px;
	}
	
	/* sub-header div */
	.sub-header {
		margin: auto;
		margin-top: 10px;
		padding: 20px;
		width: 100%;
		height: 80px;
		box-sizing: border-box;
	}

	.sub-header-title {
		width: 100px;
		height: 50px;
		float: left;
		font-size: 20px;
		line-height: 40px;
		text-align: left;
		font-family: 'Noto Sans KR', sans-serif;
	}

	.sub-header-icon {
		width: 50px;
		height: 50px;
		float: left;
		line-height: 40px;
		text-align: left;
	}

	.sub-header-icon > span {
		line-height: 43px;
		font-size: 22px;
		
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


	.pay-button {
		width: 60%;
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


</style>
</head>
<body>
	<div class="wrapper">
        
        <div class="center-div">  
                 
	        <div class="main-div">
	        
	            <jsp:include page="../common/header.jsp" />
	            
	            <div class="goods-header">
					<div class="header-back"><span class="material-symbols-outlined" onClick = "history.back();">arrow_back_ios_new</span></div>
					<div class="header-title">상품 글 등록</div>
	            </div>
	            
				<div class="header-img"></div>
	            
	            <div class="content">					
           				
					<div class="goods">

						<div class="goods-title">국내산 홍가라비 1kg</div>
						<div class="goods-price">3,900 원</div>
						
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
				
				
				<div class="sub-content">
				
							
					<div class="br2-line"></div>

					<div class="sub-menu">
						<a href="#goods-content" 							class="menu1">상품소개</a>
					</div>

					<div class="goods-content" id="goods-content">


					</div>					
					
					<div class="sub-footer1">
						<button class="pay-button">등록하기</button>
					</div>

					
        		</div>
        		
        		
        		
			</div>
		</div>
	</div>

</body>
</html>