<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/main.css?version=1.2" rel="stylesheet" type="text/css">
<style>

	/* 전체 div */
	.goods {
		width: 100%;
		height: 500px;
	}

	/* 테스트 */
	.goods div {
		border: 1px solid black;
	}

	.goods-title, .goods-content, .goods-sell, .goods-detail {
		width: 100%;
		display: block;
		box-sizing: border-box;
	}

	.goods-title {
		height: 17%;
	}

	.goods-content {
		height: 50%;
	}

	.goods-sell {
		height: 23%;
	}

	.goods-detail {
		height: 10%;
	}

	/* goods-content */
	.store-img, .store-title {
		height: 100%;
		float: left;
		box-sizing: border-box;
	}

	.store-img {
		width: 80px;
	}

	/* store-title */
	.store-title {
		width: 80%;
	}

	.store-name, .store-title2 {
		display: block;
		box-sizing: border-box;
	}

	.store-name {
		height: 65%;
	}

	.store-title2 {
		height: 35%;
	}

	.store-address, .day-count {
		float: left;
		box-sizing: border-box;
		height: 100%;
		width: 170px;
	}

	/* goods-content */
	.sell-title, .sell-content {
		width: 100%;
		display: block;
		box-sizing: border-box;
	}

	.sell-title {
		height: 30%;
	}

	.sell-content {
		height: 70%;
	}

	/* goods-detail */
	.like, .like-count, .reply, .reply-count {
		height: 100%;
		float: left;
		box-sizing: border-box;
	}

	.like {
		width: 10%;
	}

	.like-count {
		width: 10%;
	}

	.reply {
		width: 10%;
	}

	.reply-count{
		width: 10%;
	}


</style>
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

						<div class="goods-title">
							<div class="store-img"></div>
							<div class="store-title">
								<div class="store-name"></div>
								<div class="store-title2">
									<div class="store-address"></div>
									<div class="day-count"></div>

								</div>
							</div>
						</div>
						<div class="goods-content">
							<div class="sell-title"></div>
							<div class="sell-content"></div>
						</div>
						<div class="goods-sell"></div>
						<div class="goods-detail">
							<div class="like"></div>
							<div class="like-count"></div>
							<div class="reply"></div>
							<div class="reply-count"></div>
						</div>
						

					</div>
				
		        </div>

	        </div>             
        </div>
	</div>
</body>
</html>