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

	.goods div {
		/* border: 1px solid black; */
	}

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
	
	/* navi css */
	#nav1 {
	    display: none !important;
	}
	
	#nav2 {
	    display: none;
	}
	
	#nav3 {
	    display: block !important;
	}
	
	.menu3 {
		font-size: 25px;
		border-bottom: 3px solid black;
		color: black;
	}

	.material-symbols-outlined {
	font-variation-settings:
	'FILL' 0,
	'wght' 400,
	'GRAD' 0,
	'opsz' 24
	}

	.goods-promotion {
		margin: auto;
		width: 94%;
		height: 250px;
		box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
	}

	.goods-filter {			
		margin: auto;
		width: 94%;
		height: 50px;
	}

	.goods-filter-div {
		float: right;
		width: 20%;
		height: 100%;
		border: 1px solid black;
	}

	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
	
	// 페이지 로딩시 불러올 리스트 개수 변수 설정
	var page = 0;
	var pageSize = 9; // 초기 로딩 시 20개씩 불러오기
	
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
								+'<input type="hidden" value="' + item[0].goodNo + '">'
								+'<div class="goods-img">'+item[2].changeName+'</div>'
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
	                
					<div class="goods-promotion"></div>
					
					<br><br>

		            <div class="goods-filter">
						<div class="goods-filter-div"></div>
					</div>

					<br>
					
					<div class="goods">

					
					<!-- 상품 리스트 -->	

					</div>
				
		        </div>

	        </div>             
        </div>
	</div>
	
	<script>
		$(function () {
			
			ajaxSelectGoodsList();
			
			$(".goods").on('click', '.goods-list', function (e) {

            	let gno = e.currentTarget.children.item(0).value;

                console.log(gno);

                location.href = "goodsDetailPage.go?gno=" + gno;
                
            });
			
		});
	</script>
</body>
</html>