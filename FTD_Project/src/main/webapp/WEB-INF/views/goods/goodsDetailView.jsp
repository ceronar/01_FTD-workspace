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
		width: 100%;
		height: 70px;
		padding-left: 20px;
		text-align: left;
		font-size: 35px;
		line-height: 70px;
		margin-bottom: 10px;
		box-sizing: border-box;	
	}

	.goods-like {
		width: 70px;
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
		min-height: 700px;
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
		height: 80px;
		position: sticky; /* 스크롤에 고정 */
		bottom : 0px;
		background-color: #ffffff;
		border-top-left-radius: 4px;
    	border-top-right-radius: 4px;
		box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
		/* padding-top: 5px; */
	}

	.sub-footer2 {
		width: 100%;
		height: 150px;
		position: sticky; /* 스크롤에 고정 */
		bottom : 0px;
		background-color: #ffffff;
		border-top-left-radius: 4px;
    	border-top-right-radius: 4px;
		box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
		display: none;
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

	.like-button {
		width: 30%;
		height: 40px;
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

	.cart-button {
		width: 45%;
		height: 40px;
		display: inline;
		font-size: 20px;
		font-family: 'Noto Sans KR', sans-serif;
	}

	.pay2-button {
		width: 45%;
		height: 40px;
		margin-top: 5px;
		margin-left: 20px;
		box-sizing: border-box;
		display: inline;
		font-size: 20px;
		font-family: 'Noto Sans KR', sans-serif;
	}

	.good-info {
		margin: auto;
		height: 70px;
		width: 100%;
		padding-left: 30px;
		padding-right: 30px;
		box-sizing: border-box;
	}

	.goods-count-text {
		font-family: 'Noto Sans KR', sans-serif;
		font-size: 15px;
		text-align: left;
	}

	.goods-count {
		width: 100%;
		height: 45px;
		box-sizing: border-box;
	}

	.goods-count-div1, .goods-count-div2 {
		float: left;
		height: 100%;
		box-sizing: border-box;
	}

	.goods-count-div1 {
		width: 55%;
		margin-right: 40px;
		font-family: 'Noto Sans KR', sans-serif;
		line-height: 45px;
		font-size: 30px;
	}

	.goods-count-div2 {
		margin: auto;
		width: 40%;
	}

	.count-number {
		width: 60px;
		height: 30px;
		font-size: 18px;
		text-align: center;
	}

	.count-btn {
		margin: 3px;
		width: 60px;
		height: 35px;
		font-size: 18px;
	}
	
	.goodsSell-content {
		width: 100%;
		height: 100%;
	}
	
	.like-icon {
		width: 100%;
		height: 100%;
		box-sizing: border-box;
	}



</style>
<script type="text/javascript">
	
		
	$(document).ready(function () {
			

		if(${ sessionScope.loginUser.memberId eq 'admin' }) { // 관리자 로그인인 경우
			
			
		} else if(${ not empty sessionScope.loginUser }) { // 구매자 로그인 후
			
			ajaxSelectLike();
			
		} else if(${ not empty sessionScope.loginSeller }) { // 판매자 로그인 후
			 
		} else { // 로그인 전
			
			
		}
				
	});
		
	function ajaxSelectLike() {
		      
		$.ajax({
			url : 'ajaxSelectLike.go',
	        type: 'get',
	        data: { memberNo: ${ sessionScope.loginUser.memberNo }, goodNo: ${ requestScope.goods.goodNo } },
	        success: function(result) {	        
	            	
	        	if(result > 0) {
	        		
	        		$(".goods-like").html(
	        			'<img class="like-icon" src= "${pageContext.request.contextPath}/resources/images/sample/like_on.png">'	  
	        		);  
	        		
	        	} else {
	        		
	        		$(".goods-like").html(
		        		'<img class="like-icon" src= "${pageContext.request.contextPath}/resources/images/sample/like_off.png">'	  
		        	); 	   
	        	}
	        	   
	        },
	        error : function() {
	        	
	        	console.log("ajax 통신 실패");
	        }
		});
	}


</script>
</head>
<body>
	<div class="wrapper">
        
        <div class="center-div">  
                 
	        <div class="main-div">
	        
	            <jsp:include page="../common/header.jsp" />
	            
	            <div class="goods-header">
					<div class="header-back"><span class="material-symbols-outlined" onClick = "history.back();">arrow_back_ios_new</span></div>
					<div class="header-title">${ requestScope.goodsSell.sellTitle }</div>
					<div class="header-cart"><span class="material-symbols-outlined">shopping_cart</span></div>
	            </div>
	            
				<div class="header-img"></div>
	            
	            <div class="content">					
           				
					<div class="goods">

						<div class="goods-title">${ requestScope.goodsSell.sellTitle }</div>
						<div class="goods-price">${ requestScope.goods.price } 원
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
								<td>${ requestScope.goods.origin }</td>
							</tr>
							<tr>
								<th>보관방법</th>
								<td>받으신 후 냉장 보관 해주세요.</td>
							</tr>
						</table>

					</div>
		        </div>
				
				
				<div class="sub-content">
				
							
					<div class="br2-line"></div>

					<div class="sub-menu">
						<a href="#goods-content" 							class="menu1">상품소개</a>
						<a href="#sub-review" 								class="menu2">후기 1</a>
						<a href="#goods-reply" 								class="menu3">상품문의</a>
					</div>

					<div class="goods-content" id="goods-content">
					
						<div class="goodsSell-content"></div>

					</div>

					<div class="br2-line"></div>

					<div class="sub-review" id="sub-review">
						<div class="sub-header">
							<div class="sub-header-title" style="width: 110px;">후기 1건</div>
							<div class="sub-header-icon"><span class="material-symbols-outlined">arrow_forward_ios</span></div>	
						</div>
						
						<div class="br-line"></div>

						<div class="sub-review-content"></div>
					</div>

					<div class="br2-line"></div>

					<div class="goods-reply" id="goods-reply">
						<div class="sub-header">
							<div class="sub-header-title">상품문의</div>
							<div class="sub-header-icon"><span class="material-symbols-outlined">arrow_forward_ios</span></div>	
						</div>
						
						<div class="br-line"></div>

						<div class="goods-reply-content"></div>

					</div>
									
					
					<div class="sub-footer1">
						<div class="btn-icon" id="footer-icon1"><span class="material-symbols-outlined">keyboard_arrow_up</span></div>
						<button class="like-button">찜 하기</button>
						<button class="pay-button">주문하기</button>
					</div>

					<div class="sub-footer2">
						<form action="insertCart.go" method="post">
							<div class="btn-icon" id="footer-icon2"><span class="material-symbols-outlined">keyboard_arrow_down</span></div>
							
							<div class="good-info">
								<div class="goods-count-text">상품 수량 선택(필수) </div>
								<div class="goods-count">
									<div class="goods-count-div1">
										${ requestScope.goodsSell.sellTitle }
										<input type="hidden" name="goodNo" value="${ requestScope.goodsSell.goodNo }">
										<input type="hidden" name="memberNo" value="${ sessionScope.loginUser.memberNo }">
										<input type="hidden" name="sellNo" value="${ requestScope.goodsSell.sellNo }">
									</div>
									<div class="goods-count-div2">
										<button type="button" class="count-btn" id="countMinus">-</button>
										<input class="count-number" type="text" name="count" value="1">
										<button type="button" class="count-btn" id="countPlus">+</button>
									</div>
								</div>
							</div>
		
							<div class="br-line"></div>
							<button class="cart-button" type="submit" name="order" value="cart">장바구니 담기</button>
							<button class="pay2-button" type="submit" name="order" value="order">주문하기</button>
						</form>
					</div>
        		</div>
        		
        		
        		
			</div>
		</div>
	</div>

<script>
	
	$(function() {
		
		// 상품 글 content 부분 삽입
		let sellContent = '${ requestScope.goodsSell.sellContent }';
		
		$(".goodsSell-content").html(sellContent);
		  	
		// 아래 화살표 누룰시 이벤트 처리
		$(".sub-footer1").on("click", "#footer-icon1",function() {
    		
			$(".sub-footer1").css('display', 'none');
			$(".sub-footer2").css('display', 'block');
    	
    	});
		
		$(".sub-footer2").on("click", "#footer-icon2",function() {
    		
			$(".sub-footer2").css('display', 'none');
			$(".sub-footer1").css('display', 'block');
    	
    	});
		
		// 상품 수량 +- 클릭 이벤트
		let count = parseInt($(".count-number").val());
		
		$(".goods-count-div2").on('click', '#countMinus', function () {
			
			if(count > 0) {
				
				count = count - 1;		
			}
			
			$(".count-number").val(count);
			
		});
		
		$(".goods-count-div2").on('click', '#countPlus', function () {
			
			if(count <= ${requestScope.goods.stock}) {
				
				count = count + 1;
			}
			
			$(".count-number").val(count);
		});
		
		
		// 상품 찜 하기 클릭 이벤트
		$(".goods-like").on("click", ".like-icon",function() {
    		
			ajaxClickLike();  	
    	});
		
	});
	
	// 상품 찜 하기 클릭 이벤트 함수	
	function ajaxClickLike() {
	    
		let loginUser
		
		$.ajax({
			url : 'ajaxClickLike.go',
	        type: 'get',
	        data: { memberNo: ${ sessionScope.loginUser.memberNo }, goodNo: ${ requestScope.goods.goodNo } },
	        success: function(result) {
	        	
	        	console.log(result);	
	            	
	        	if(result == "추가") {
	        		
	        		$(".goods-like").html(
	        			'<img class="like-icon" src= "${pageContext.request.contextPath}/resources/images/sample/like_on.png">'	  
	        		);  
	        		
	        	} else if(result == "삭제") {
	        		
	        		$(".goods-like").html(
		        		'<img class="like-icon" src= "${pageContext.request.contextPath}/resources/images/sample/like_off.png">'	  
		        	); 
	        		
	        	} else {
	        		
	        		location.href = "goodsDetailPage.go?sno=" + ${ requestScope.goodsSell.sellNo };
	        	}       	   
	        },
	        error : function() {
	        	
	        	console.log("ajax 통신 실패");
	        }
	    });
	
	}

</script>
</body>
</html>