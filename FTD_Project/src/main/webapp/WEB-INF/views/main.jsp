<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		.top10List>div {
			border: 1px solid lightgray;
			width: 100%;
			
		}
		.top10List a {
			text-decoration: none;
			color: black;
		}
		
		.top10List table{
			width : 100%;
			border-collapse: collapse;
		}
		
		.top10List table tr:hover{
			cursor : pointer;
			background-color: lightgray;
		}
		
		.goodsTop10List table td{
			width : 20%;
		}
		
		.content_1 {
			width: 100%; /* content 영역 크기 조정 */
			padding: 20px;
			box-sizing: border-box;
			/* border: 1px solid rgb(85, 85, 85); 위쪽(top)만 0으로 수정 */
			box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
			margin: 0; /* content의 마진 제거 */
			
		}
		
			/* 전체 div */
		.store {
			width: 100%;
			height: 200px;
			
			display: flex;
		}
	
		/* 테스트 */
		.store div {
			border: 1px solid black;
		}
	
		/* store div 공통 css */
		.store-img, .store-content {
			height: 100%;
			float: left;
			box-sizing: border-box;
		}
	
		.store-img {
			width: 200px;
			height: 100%;		
		}
		
		.store-img{
			height: 100%;
			box-shadow: 0 0 10px rgba(235, 234, 234, 0.589);
			border-radius: 8px;
			box-sizing: border-box;
		}
	
		.store-content {
			width: 75%;
		}
	
		/* store-content 공통 css */
		.store-title, .store-goods, .store-detail {
			width: 100%;
			display: block;
			box-sizing: border-box;
		}
		
		/* store-title 공통 css */
		.store-title div {
			float: left;
			height: 100%;
			text-align: center;
			line-height: 80px;
			box-sizing: border-box;
		}
	
		.store-title {
			width: 100%;
			height: 40%;
		}
	
		.store-title-img {
			width: 10%;
		}
	
		.store-name {
			width: 45%;
			font-size: 25px;
			font-weight: bolder;
		}
	
		.store-address {
			width: 45%;
			color: rgb(38, 40, 40);
		}
	
		/* store-goods div css */
		.store-goods {
			height: 30%;
			text-align: left;
			line-height: 60px;
			padding-left: 10px;
			color: rgb(114, 120, 127);
		}	
	
		/* store-detail 공통 css */
		.store-detail div {
			float: left;
			height: 70%;
			line-height: 40px;
		}
	
		.store-detail {
			height: 30%;
		}
	
		.store-star {
			height: 100%;
			width: 15%;
		}
	
		.store-rating {
			height: 100%;
			width: 20%;
		}
	
		.store-review {
			height: 100%;
			width: 20%;
		}
	
		.store-person {
			height: 100%;
			width: 15%;
		}
	
		.store-subscribe {
			height: 100%;
			width: 20%;
		}
		.good_table img{
			width : 250px;
			height : 200px;
		}
		
		
		.store-img img {
			width : 100%;
			height : 100%;
		}
		
		.review-img img {
			width : 100%;
			height : 100%;
		}
		
	</style>
</head>
<body>
	<div class="wrapper">
		<div class="center-div">
			<jsp:include page="common/sidebar.jsp" />
			<div class="main-div">
				<jsp:include page="common/header.jsp" />
				<div class="content">
					<!-- 슬라이드 화면 -->
					<section id="cont_center">
		            	<article class="column col4">
			            	<div class="slider">
				            			<img src="resources/images/notice/다운로드.jpg">
				            			<img src="resources/images/notice/다운로드1.jpg">
				            			<img src="resources/images/notice/다운로드2.jpg">
				            			<img src="resources/images/notice/다운로드.jpg">
				            			<img src="resources/images/notice/다운로드.jpg">
							</div>
							<br>
						</article>
					</section>
					<!-- top10List 를 main-div 로 바꾸면 뭔가 뭔가됨 -->
					<div class="top10List sellerTop10List">
						
						<h3>추천 가게</h3>
						<div class="content_1">
							<c:forEach var="s" items="${ requestScope.sList }">
								<div class="store">
		                    		<input type="hidden" value="${s.sellerNo}">
		        					<div class="store-img"><img src= "${s.changeName}"></div>
		        					<div class="store-content">
		        					 	<div class="store-title">
		        							<div class="store-title-img">아이콘</div>
		        							<div class="store-name">${ s.companyName }</div>
		        							<div class="store-address">${ s.address }</div>
		        						</div>
		        						
		        						<div class="store-goods"></div>
		
		        						<div class="store-detail">
		        							<div class="store-star">별이미지</div>
		        							<div class="store-rating">${ s.starRating }</div>
		        							<div class="store-review"></div>
		        							<div class="store-person">찜사람</div>
		        							<div class="store-subscribe">${ s.subscribeCount }</div>
		        						</div>
		        					</div> 
		                    	</div>
							</c:forEach>
						</div>
						<h4><a href="sellerListPage.se">산지마켓 더보기 ></a></h4>
						<br>
						<div class="top10List goodsTop10List">
						<h3>추천 상품</h3>
							<div class="content_2">
								<table class="good_table">
									<c:forEach var="g" items="${ requestScope.gList }">
										<tr>
											<td hidden><input type="hidden" name="goodNo" value="${ g.sellNo }"></td>
											<td class="review-img"><img src= "${ g.changeName }" ></td>
											<td>
												${ g.goodTitle } <br>
												${ g.goodDetail }
											</td>
											<td>
												찜 : ${ g.likeCount }
											</td>
											<td>
												가격 : ${ g.price }
											</td>
										</tr>
									</c:forEach>
								</table>
							</div>
						</div>
						<h4><a href="goodsListPage.go">상품 더보기 ></a></h4>
						<br>
						<div class="top10List reviewTop10List">
						<h3>후기</h3>
							<div class="content_3">
								<table class="review_table">
									<c:forEach var="r" items="${ requestScope.rList }">
										<tr>
											<td><input type="hidden" name="revNo" value="${ r.revNo }"></td>
											<td>${ r.revContent }</td>
											<td>조회수 : ${ r.count }</td>
											<td>작성자 : ${ r.memberNo }</td>
										</tr>
									</c:forEach>
								</table>
							</div>
						</div>
						<h4><a href="rlist.bo">후기 더보기 ></a></h4>
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
	<script>
    	$(function () {


            $(".content_1").on('click', '.store', function (e) {
            	let target = e.target;
            	let store = findParentWithClass(target, "store");
            	let sno = store.children.item(0).value;
            	console.log(sno);
            	// let sno = e.currentTarget.children.value;

                // console.log(sno);

                location.href = "sellerDetailPage.se?sno=" + sno;
                
            });
    	});
    	
    	$(function () {


            $(".content_2").on('click', '.good_table', e => {
            	
            	var value = e.target.parentElement.children.item(0).children.item(0).value;
				console.log(value);
                location.href = "goodsDetailPage.go?sno=" + value;
                
            });
    	});
    	
    	$(function () {


				$(".content_3").on('click', '.review_table', e => {
            	
            	var parentTrTag = e.target;
                //부모 태그 명이 TR이 나올때까지 자동순회
                for(;parentTrTag.nodeName != 'TR' ; parentTrTag=parentTrTag.parentElement);
                let rno = parentTrTag.children.item(0).children.item(0).value;
                location.href = "rdlist.bo?rno=" + rno;
                
            });
    	});
    	
    	// 요소에서 클래스를 찾는 함수
    	function findParentWithClass(element, className) {
    	  // 현재 요소에 클래스가 포함되어 있는지 확인
    	  if (element.classList.contains(className)) {
    	    // 클래스가 포함되어 있다면 현재 요소 반환
    	    return element;
    	  } else {
    	    // 부모 요소가 있고, 부모 요소에서 클래스를 찾을 때까지 반복
    	    if (element.parentElement) {
    	      return findParentWithClass(element.parentElement, className);
    	    } else {
    	      // 부모 요소가 없는 경우 null 반환
    	      return null;
    	    }
    	  }
    	}
    	
	</script>
</body>
</html>