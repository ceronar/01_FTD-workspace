<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>FTD</title>
	<link href="${pageContext.request.contextPath}/resources/css/main.css?version=1.2" rel="stylesheet" type="text/css">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    
	<!-- 슬라이드 외부 css -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
	<style type="text/css">
		.slider img {
			height : 250px;
		}
		.top10List div {
			border: 1px solid lightgray;
			width: 100%;
			height: 300px;
		}
		.top10List a {
			text-decoration: none;
			color: black;
		}
	</style>
</head>
<body>
	<div class="wrapper">
		<div class="center-div">
			<jsp:include page="common/sidebar.jsp" />
			<div class="main-div">
				<jsp:include page="common/header.jsp" />
				<div class="content">메인 컨텐츠<br>
					<!-- 슬라이드 화면 -->
					<section id="cont_center">
		            	<article class="column col4">
			            	<div class="slider">
				            			<img src="resources/images/notice/다운로드.jpg">
				            			<img src="resources/images/notice/다운로드.jpg">
				            			<img src="resources/images/notice/다운로드.jpg">
				            			<img src="resources/images/notice/다운로드.jpg">
				            			<img src="resources/images/notice/다운로드.jpg">
							</div>
							<br><br><br><br>
							<div></div>
							<br><br><br><br>
						</article>
					</section>
					<h2>추천 </h2>
					<div class="top10List">
						<div class="">
							
						</div>
						<h3><a href="sellerListPage.se">산지마켓 더보기 ></a></h3>
						<div class="">
							
						</div>
						<h3><a href="goodsListPage.go">상품 더보기 ></a></h3>
						<div class="">
							
						</div>
						<h3><a href="rlist.bo">후기 더보기 ></a></h3>
					</div>
				</div>
				<jsp:include page="common/footer.jsp" />
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
</body>
</html>