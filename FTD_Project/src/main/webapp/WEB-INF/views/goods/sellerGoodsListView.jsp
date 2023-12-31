<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자 상품 관리 페이지</title>
<link href="${pageContext.request.contextPath}/resources/css/main.css?version=1.2" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@800&display=swap" rel="stylesheet">
<style>

	/* 전체 div */
	.goods {
		width: 100%;
		height: 200px;
		/* border: 1px solid lightgrey;		 */
	}

	div {
		font-family: 'Noto Sans KR', sans-serif;
	}

	/* 테스트 */
	.goods-content  div {
		box-sizing: border-box;
		/* box-shadow: 0 0 1px rgb(0, 0, 0); */
	}

	/* store div 공통 css */
	.goods-content {
		height: 100%;
		width: 100%;
		float: left;
		box-sizing: border-box;
		box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
	}

	/* store-content 공통 css */
	.goods-title, .goods-text, .goods-detail {
		width: 100%;
		display: block;
		box-sizing: border-box;
	}
	
	/* store-title 공통 css */
	.goods-title > div {
		float: left;
		height: 100%;
		text-align: center;
		line-height: 80px;
		box-sizing: border-box;
		font-family: 'Noto Sans KR', sans-serif;
	}

	.goods-title {
		width: 100%;
		height: 40%;
	}

	.goods-title-img {
		width: 15%;
		height: 50%;
	}

	.goods-name {
		width: 45%;
		font-size: 25px;
		font-weight: bolder;
	}

	.goods-origin {
		width: 40%;
		color: rgb(38, 40, 40);
	}

	/* store-goods div css */
	.goods-text {
		height: 30%;
		text-align: left;
		line-height: 60px;
		padding-left: 10px;
		color: rgb(114, 120, 127);
	}	

	/* store-detail 공통 css */
	.goods-detail div {
		float: left;
		height: 100%;
		line-height: 60px;
		font-family: 'Noto Sans KR', sans-serif;
		font-size: 22px;
	
	}

	.goods-detail {
		height: 30%;
	}

	.goods-price-text {
		height: 100%;
		width: 15%;
	}

	.goods-price {
		height: 100%;
		width: 30%;
	}

	.goods-createDate {
		height: 100%;
		width: 25%;
	}

	.goods-stock-icon {
		height: 100%;
		width: 10%;
	}

	.goods-stock {
		height: 100%;
		width: 20%;
	}

	.seller-title {
		/* border: 1px solid black; */
		width: 100%;
		height: 150px;
		margin-bottom: 30px;
		box-sizing: border-box;
		padding: 20px;
		box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
	}

	.seller-img, .seller-name {
		height: 100%;
		float: left;
		box-sizing: border-box;
	}

	.seller-img {
		width: 100px;
		height: 100px;
		margin-left: 70px;
		margin-right: 30px;
	}
	
	#seller-img2 {
		width: 100px;
		height: 100px;	
	}

	.seller-name {
		width: 70%;
		height: 100px;
		font-size: 20px;
		font-family: 'Noto Sans KR', sans-serif;
		line-height: 100px;
		padding-left: 60px;
		text-align: left;
	}

	.goods-eroll {
		box-sizing: border-box;
		width: 100%;
		height: 70px;
		margin-bottom: 30px;
	}

	.goods-eroll-btn {
		float: right;
		margin-top: 10px;
		width: 150px;
		height: 50px;
		font-size: 17px;
		font-family: 'Noto Sans KR', sans-serif;
		background-color: rgba(223, 240, 217, 0.966);
		color: rgb(21, 71, 21);
		border-radius: 8px;
	}
	
	h1 {
		font-family: 'Noto Sans KR', sans-serif;
	}


	/* navi css */
	#nav1 {
	    display: none !important;
	}
	
	#nav2 {
	    display: block !important;
	}
		
	.menu2 {
		font-size: 25px;
		border-bottom: 3px solid black;
		color: black;
	}
	
	.goods-div {
		height: 510px;
	}
	
	.icon3 {
		height: 50px;
		width: 80px;
		padding: 5px;
		margin-top: 15px;
		line-height: 40px;
		margin-left: 15px;
		box-sizing: border-box;
		background-color: rgba(186, 231, 171, 0.966);
		color: rgb(44, 116, 44);
		border-radius: 4px;
		
	}
	
	.icon2 {
		margin-top: 5px;
		box-sizing: border-box;
		height: 50px;
		width: 50px;
	}
	

</style>
<script>
	
	// 페이지 로딩시 불러올 리스트 개수 변수 설정
	var page = 0;
	var pageSize = 5; // 초기 로딩 시 20개씩 불러오기
	
	$(document).ready(function () {
		 
		ajaxSelectSellerGoodsList();

		$(window).scroll(function () {
            if ($(window).scrollTop() + $(window).height() >= $(document).height() - 1) {
                
            	page++;	         
            	ajaxSelectSellerGoodsList();
            }
		});
	});
	
	function ajaxSelectSellerGoodsList() {
	      
	    $.ajax({
	        url : 'ajaxSelectSellerGoodsList.go',
	        type: 'get',
	        data: { page: page, pageSize: pageSize, sellerNo : ${sessionScope.loginSeller.sellerNo} },
	        success: function(result) {
	        	          	
				console.log(result);
				
				if(page ==0 && result.length == 0) {
					
					resultStr = "<br><br><br><br><br><br><h1>판매자님이 등록한 상품이 없습니다.<h1>";
					
					$('.goods-div').html(resultStr);
					
				}
						
				result.forEach(function (item, index) {
					
					$('.goods-div').append(
							
						'<div class="goods">'
							
							+'<input type="hidden" value="' + item.goodNo + '">'
							+'<div class="goods-content">'	
										
								+'<div class="goods-title">'
									+'<div class="goods-title-img"><div class="icon3">판매중</div></div>'
									+'<div class="goods-name">'+item.goodTitle+'</div>'
									+'<div class="goods-origin">'+item.origin+'</div>'
								+'</div>'
								
								+'<div class="goods-text">'+item.goodDetail+'</div>'
		
								+'<div class="goods-detail">'
									+'<div class="goods-price-text"><img class="icon2" src= "resources/images/sample/money.png"></div>'
									+'<div class="goods-price">'+ item.priceStr +'원</div>'
									+'<div class="goods-createDate">'+item.createDate.substring(0, 10) +'</div>'
									+'<div class="goods-stock-icon"><img class="icon2" src= "resources/images/sample/box.png"></div>'
									+'<div class="goods-stock">'+item.stock+'</div>'
								+'</div>'
							+'</div>'
						+'</div>'
						+'<br><br><br>'
													
					);
								
				});
				
			
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
         
	        <jsp:include page="../common/sidebar.jsp" />
	        
	        <div class="main-div">
	            <jsp:include page="../common/header.jsp" />
	            
	            <div class="content">
					
					<div class="seller-title">
						<div class="seller-img"><img id="seller-img2" src="${ sessionScope.loginSeller.changeName }"></div>
						<div class="seller-name">${sessionScope.loginSeller.companyName}님의 상품 관리 페이지</div>
					</div>

					<div class="goods-eroll">
						<button class="goods-eroll-btn" onclick="location.href='sellerGoodsEnrollForm.go';">상품 등록</button>
					</div>
					
					<div class="goods-div">
						
					
					</div>
				
		        </div>

	        </div>             
        </div>
	</div>

<script>
	
	$(function () {
			
		$(".goods-div").on('click', '.goods', function (e) {

			let gno = e.currentTarget.children.item(0).value;

            location.href = "sellerGoodsListDetailPage.go?gno=" + gno;
               
		});
		
	});
</script>
</body>
</html>