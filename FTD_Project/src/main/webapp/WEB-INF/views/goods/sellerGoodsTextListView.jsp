<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자 상품 글 관리 페이지</title>
<link href="${pageContext.request.contextPath}/resources/css/main.css?version=1.2" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>

	div {
		/* border: 1px solid black; */
	}

	/* goods-list */
	.goods-list {
		width: 280px;
		height: 450px;
		display: inline-block;
		padding-top: 20px;
		margin-bottom: 20px;
	}

	.goods-img, .goods-title, .goods-price, .goods-detail {
		width: 250px;
		display: block;
		box-sizing: border-box;
		margin: auto;
		font-family: 'Noto Sans KR', sans-serif;

	}

	.goods-img {
		box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
		height: 250px;
	}

	.goods-title {
		margin-top: 10px;
		height: 60px;
		text-align: left;
		line-height: 35px;
		font-size: 25px;
		color: rgb(108, 108, 108);
		font-family: 'Noto Sans KR', sans-serif;
	}

	.goods-price {
		margin-top: 10px;
		height: 35px;
		line-height: 35px;
		text-align: left;
		font-size: 20px;
		font-family: 'Noto Sans KR', sans-serif;
	}

	.goods-detail {
		margin-top: 10px;
		height: 35px;
		line-height: 35px;
	}

	.star-icon, .goods-rating, .review-icon, .goods-review, .goods-count-icon, .goods-count {
		height: 100%;
		float: left;
		box-sizing: border-box;
		line-height: 30px;
		font-size: 25px;
		font-family: 'Noto Sans KR', sans-serif;
	}

	.star-icon {
		width: 40px;
	}

	.star-icon > img {
		box-sizing: border-box;
		width: 32px;
		height: 32px;
		width: 100%;
		height: 100%;
	}

	.goods-rating {
		width: 40px;
	}

	.review-icon {
		width: 40px;
	}

	.review-icon > img {
		box-sizing: border-box;
		width: 32px;
		height: 32px;
	}

	.goods-review {
		width: 40px;
	}
	
	.goods-count-icon {
		width: 40px;
	}
	
	.goods-count-icon > img {
		box-sizing: border-box;
		width: 35px;
		height: 35px;
	}

	.seller-title {
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
	

	.menu3 {
		font-size: 25px;
		border-bottom: 3px solid black;
		color: black;
	}
	
	.goods-div {
		min-height: 510px;
	}
	
	#img-div {
		box-sizing: border-box;
		width: 100%;
		height: 100%;	
	}
	
	.goods-count {
		width: 40px;
	}
	

</style>
<script>
	
	// 페이지 로딩시 불러올 리스트 개수 변수 설정
	var page = 0;
	var pageSize = 9; // 초기 로딩 시 20개씩 불러오기
	
	$(document).ready(function () {
		 
		ajaxSelectSellerGoodsTextList();

        $(window).scroll(function () {
			if ($(window).scrollTop() + $(window).height() >= $(document).height() - 1) {
                
				page++;	         
				ajaxSelectSellerGoodsTextList();
            }
		});
	});
	
	function ajaxSelectSellerGoodsTextList() {
	      
		$.ajax({
			url : 'ajaxSelectSellerGoodsTextList.go',
			type: 'get',
            data: { page: page, pageSize: pageSize, sellerNo : ${sessionScope.loginSeller.sellerNo} },
            success: function(result) {
	            	
            	console.log(result);	  
            	
				if(page == 0 && result.length == 0) {
					
					resultStr = "<br><br><br><br><br><br><h1>판매자님이 등록한 상품글이 없습니다.<h1>";
					
					$('.goods-div').html(resultStr);
					
				}
            	
                result.forEach(function (item, index) {
                	                    
                	$('.goods-div').append(
                			'<div class="goods-list">'
								+'<input type="hidden" value="' + item[1].sellNo + '">'
								+'<div class="goods-img"><img id="img-div" src="'+ item[2].changeName +'"></div>'
								+'<div class="goods-title">'+ item[1].sellTitle +'</div>'
								+'<div class="goods-price">'+item[0].priceStr.trim() +'원</div>'
								+'<div class="goods-detail">'
									+'<div class="star-icon"><img src="resources/images/sample/star.png"></div>'
									+'<div class="goods-rating">'+item[3]+'</div>'
									+'<div class="review-icon"><img src="resources/images/sample/talk.png"></div>'
									+'<div class="goods-review">'+item[4]+'</div>'
									+'<div class="goods-count-icon"><img src="resources/images/sample/eye.png"></div>'
									+'<div class="goods-count">'+ item[1].count +'</div>'
								+'</div>'
						+'</div>'
						
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
						<div class="seller-name">${sessionScope.loginSeller.companyName }님의 상품 글 관리 페이지</div>
					</div>

					<div class="goods-eroll">
						<button class="goods-eroll-btn" onclick="location.href='sellerGoodsTextEnrollForm.go';">상품 글 등록</button>
					</div>
					
					<div class="goods-div">
						
					
					</div>
				
		        </div>

	        </div>             
        </div>
	</div>

<script>

	$(function () {
				
		$(".goods-div").on('click', '.goods-list', function (e) {

			let sno = e.currentTarget.children.item(0).value;

			console.log(sno);
			
            location.href = "goodsDetailPage.go?sno=" + sno;
               
		});
		
	});
</script>
</body>
</html>