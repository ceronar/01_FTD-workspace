<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 리스트 페이지</title>
<link href="${pageContext.request.contextPath}/resources/css/main.css?version=1.2" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@800&display=swap" rel="stylesheet">

<!-- 슬라이드 외부 css -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<style>

	div {
		/* border: 1px solid black; */
		font-family: 'Noto Sans KR', sans-serif;
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
	}

	.goods-price {
		margin-top: 10px;
		height: 35px;
		line-height: 35px;
		text-align: left;
		font-size: 20px;
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
	}

	.star-icon {
		width: 40px;
	}

	.star-icon > img {
		box-sizing: border-box;
		width: 32px;
		height: 32px;
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
	
	.goods-count {
		width: 40px;
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
	
	#img-div {
		box-sizing: border-box;
		width: 100%;
		height: 100%;	
	}

	#select-goods {
		width: 100%;
		height: 50px;
		font-size: 20px;
		text-align: center;
		border: 0px;
		box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
	}

	#select-goods > option {
		height: 80px;
	}
	
	#cont_center {
		width: 100%;
		height: 100%;
	}
	
	.column col4 {
		width: 100%;
		height: 100%;
	}
	
	.slider img {
		 height : 350px;
	}

	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
	
	// 페이지 로딩시 불러올 리스트 개수 변수 설정
	var page = 0;
	var pageSize = 9; // 초기 로딩 시 20개씩 불러오기
	
	$(document).ready(function () {
		 
		ajaxSelectGoodsList();

        $(window).scroll(function () {
            if ($(window).scrollTop() + $(window).height() >= $(document).height() - 1) {
                
            	page++;	         
            	ajaxSelectGoodsList();
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
								+'<input type="hidden" value="' + item[1].sellNo + '">'
								+'<div class="goods-img"><img id="img-div" src="'+ item[2].changeName +'"></div>'
								+'<div class="goods-title">'+item[1].sellTitle+'</div>'
								+'<div class="goods-price">' + item[0].priceStr + '원</div>'
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
	                
					<div class="goods-promotion">
											<!-- 슬라이드 화면 -->
					<section id="cont_center">
		            	<article class="column col4">
			            	<div class="slider">
				            			<img src="resources/images/notice/다운로드3.jpg">
				            			<img src="resources/images/notice/다운로드4.jpg">
				            			<img src="resources/images/notice/다운로드7.jpg">
							</div>
							<br>
						</article>
					</section>
					</div>
					
					<br><br>

		            <div class="goods-filter">
						<div class="goods-filter-div">
							<select id="select-goods">
								<option>최신순</option>
							</select>
						</div>
					</div>

					<br>
					
					<div class="goods">

					
					<!-- 상품 리스트 -->	

					</div>
				
		        </div>

	        </div>             
        </div>
	</div>
	<!-- 슬라이드 스크립트 -->
	<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<script type="text/javascript">
	$(".slider").slick({
		dots: true,
		autoplay: true,
		autoplaySpeed: 3000,
		arrows: true,
		responsive: [
			{
				breakpoint: 768,
			    settings: {
			    	autoplay: false,
		      	}
		    }
		]
	});
	</script>
	
<script>
	$(function () {
			
		$(".goods").on('click', '.goods-list', function (e) {

			let sno = e.currentTarget.children.item(0).value;

            console.log(sno);

            location.href = "goodsDetailPage.go?sno=" + sno;
               
		});
		
	});
</script>
</body>
</html>