<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/main.css?version=1.2" rel="stylesheet" type="text/css">
<style>

	.goods div {
		border: 1px solid black;
	}

	/* goods-list */
	.goods-list {
		width: 280px;
		height: 390px;
		display: inline-block;
		margin-bottom: 20px;
		padding: 10px;
	}

	.goods-img, .goods-title, .goods-price, .goods-detail {
		width: 250px;
		display: block;
		box-sizing: border-box;

	}

	.goods-img {
		height: 250px;
	}

	.goods-title {
		margin-top: 10px;
		height: 30px;
	}

	.goods-price {
		margin-top: 10px;
		height: 30px;
	}

	.goods-detail {
		margin-top: 10px;
		height: 30px;
	}

	.star-icon, .goods-rating, .review-icon, .goods-review {
		height: 100%;
		float: left;
		box-sizing: border-box;	
	}

	.star-icon {
		width: 40px;
	}

	.goods-rating {
		width: 40px;
	}

	.review-icon {
		width: 40px;
	}

	.goods-review {
		width: 40px;
	}
	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
	
	// 페이지 로딩시 불러올 리스트 개수 변수 설정
	var page = 0;
	var pageSize = 15; // 초기 로딩 시 20개씩 불러오기
	
	 $(document).ready(function () {

	        $(window).scroll(function () {
	            if ($(window).scrollTop() + $(window).height() >= $(document).height() - 1) {
	                
	            	ajaxSelectGoodsList();
	            	page++;	         
	            }
	        });
	    });
	
	 function ajaxSelectGoodsList() {
	      
	        $.ajax({
	            url : 'ajaxSelectGoodsList.go',
	            type: 'get',
	            data: { page: page, pageSize: pageSize },
	            success: function(result) {
	            	
	            	console.log("ajax 통신 성공");	    
	            	
	                result.forEach(function (item, index) {
	                    
	                	$('.goods').append(
	                			'<div class="goods-list">'

								+'<div class="goods-img">'+item[2].changeName+'</div>'
								+'<div class="goods-title">'+item[1].sellTitle+'</div>'
								+'<div class="goods-price">'+item[0].price+'</div>'
								+'<div class="goods-detail">'
									+'<div class="star-icon">icon</div>'
									+'<div class="goods-rating">'+item[3]+'</div>'
									+'<div class="review-icon">icon</div>'
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
	                      
		            <div class="goods-filter"></div>
					
					<div class="goods">

						<div class="goods-list">

							<div class="goods-img"></div>
							<div class="goods-title"></div>
							<div class="goods-price"></div>
							<div class="goods-detail">
								<div class="star-icon"></div>
								<div class="goods-rating"></div>
								<div class="review-icon"></div>
								<div class="goods-review"></div>
							</div>

						</div>

						<div class="goods-list">

							<div class="goods-img"></div>
							<div class="goods-title"></div>
							<div class="goods-price"></div>
							<div class="goods-detail">
								<div class="star-icon"></div>
								<div class="goods-rating"></div>
								<div class="review-icon"></div>
								<div class="goods-review"></div>
							</div>

						</div>

						<div class="goods-list">

							<div class="goods-img"></div>
							<div class="goods-title"></div>
							<div class="goods-price"></div>
							<div class="goods-detail">
								<div class="star-icon"></div>
								<div class="goods-rating"></div>
								<div class="review-icon"></div>
								<div class="goods-review"></div>
							</div>

						</div>
						

					</div>
				
		        </div>

	        </div>             
        </div>
	</div>
	
	<script>
		$(function () {
			
			ajaxSelectGoodsList();
			
		});
	</script>
</body>
</html>