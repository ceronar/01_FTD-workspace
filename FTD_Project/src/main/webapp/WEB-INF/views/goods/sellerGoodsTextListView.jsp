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
	/* goods-list */
	.goods-list {
		width: 280px;
		height: 390px;
		display: inline-block;
		padding-top: 20px;
		margin-bottom: 20px;
	}

	.goods-img, .goods-title, .goods-price, .goods-detail {
		width: 250px;
		display: block;
		box-sizing: border-box;
		margin: auto;

	}

	.goods-img {
		box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
		height: 250px;
	}

	.goods-title {
		margin-top: 10px;
		height: 35px;
		text-align: left;
		line-height: 35px;
	}

	.goods-price {
		margin-top: 10px;
		height: 35px;
		line-height: 35px;
		text-align: left;
	}

	.goods-detail {
		margin-top: 10px;
		height: 35px;
		line-height: 35px;
	}

	.star-icon, .goods-rating, .review-icon, .goods-review {
		height: 100%;
		float: left;
		box-sizing: border-box;
	}

	.star-icon {
		width: 40px;
	}

	.star-icon > img {
		width: 100%;
		height: 100%;
	}

	.goods-rating {
		width: 40px;
	}

	.review-icon {
		width: 40px;
	}

	.review-icon > span {
		line-height: 40px;
		font-size: 30px;
		color: rgb(85, 85, 85)
	}

	.goods-review {
		width: 40px;
	}

	.seller-title {
		border: 1px solid black;
		width: 100%;
		height: 150px;
		margin-bottom: 30px;
		box-sizing: border-box;
		padding: 20px;
	}

	.seller-img, .seller-name {
		height: 100%;
		border: 1px solid black;
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
		font-size: 35px;
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
								+'<div class="goods-title">'+item[1].sellTitle+'</div>'
								+'<div class="goods-price">'+item[0].price+'원</div>'
								+'<div class="goods-detail">'
									+'<div class="star-icon"><img src= "${pageContext.request.contextPath}/resources/images/sample/star-icon.png"></div>'
									+'<div class="goods-rating">'+item[3]+'</div>'
									+'<div class="review-icon"><span class="material-symbols-outlined">chat_bubble</span></div>'
									+'<div class="goods-review">'+item[4]+'</div>'
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
						<button class="goods-eroll-btn" onclick="location.href='sellerGoodsTextEnrollForm.go';">상품 등록</button>
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