<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 리스트 상세 페이지</title>
<link href="${pageContext.request.contextPath}/resources/css/main.css?version=1.2" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@800&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/53a8c415f1.js" crossorigin="anonymous"></script>

<style>

	.sub-review-content {
	    margin: 20px;
	     border : 0px;
	}
	
	.profile_under_1 {
	    border: 1px solid #ccc;
	    padding: 10px;
	    
	    display: flex;
	    flex-direction: column;
	    align-items: flex-start;
	     border : 0px;
	}
	
	.profile_2 {
	    width: 100%;
	    display: flex;
	    justify-content: space-between;
	    align-items: center;
	    margin-bottom: 10px;
	     border : 0px;
	}
	
	#profile_2_2 {
	    font-size: 12px;
	    color: #888;
	     border : 0px;
	}
	
	.starRating{
		border : 0px;
	}
	
	.star-rating {
	    margin-top: 5px;
	     border : 0px;
	}
	
	.star-rating span {
	    margin-right: 3px;
	     border : 0px;
	}

	#content {	 
	    border : 0px;
	}

	div {
		font-family: 'Noto Sans KR', sans-serif;
		/* border: 1px solid black; */
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
		box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
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
		height: 700px;
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
		box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
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
	
	.pay-button2 {
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
	
	.like-button2 {
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
		box-sizing: border-box;
	}
	
	.like-icon {
		width: 100%;
		height: 100%;
		box-sizing: border-box;
	}
	
	.like-icon2 {
		width: 100%;
		height: 100%;
		box-sizing: border-box;
	}
	
	.sub-footer3 {
		width: 100%;
		height: 50px;
		position: sticky; /* 스크롤에 고정 */
		bottom : 0px;
		background-color: #ffffff;
		border-top-left-radius: 4px;
    	border-top-right-radius: 4px;
		box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
		/* padding-top: 5px; */
	}
	
	.update-button {
		width: 45%;
		height: 40px;
		display: inline;
		font-size: 20px;
		font-family: 'Noto Sans KR', sans-serif;
		background-color: #0e9720;
		border-color: #13970e;
		border-radius: 8px;
		color: white;
	}

	.delete-button {
		width: 45%;
		height: 40px;
		margin-top: 5px;
		margin-left: 20px;
		box-sizing: border-box;
		display: inline;
		font-size: 20px;
		font-family: 'Noto Sans KR', sans-serif;
		background-color: #0e9720;
		border-color: #13970e;
		border-radius: 8px;
		color: white;
	}
	
	#thumbnail {
		width: 100%;
		height: 100%;
		box-sizing: border-box;
	}
	
	#replyArea {
		margin-top: 20px;
		width: 80%;
		height: 80%;
		box-sizing: border-box;
	}

	#table-div {
		margin: auto;
		width: 850px;
		height: 300px;
		background-color: #edffec;
	}
	
	.form-control {
		height: 100px;
	}
	


</style>
<script type="text/javascript">
	
		
	$(document).ready(function () {
			
		ajaxSelectLike();
		
	});
		
	function ajaxSelectLike() {
		
		let memberNo = ${!empty sessionScope.loginUser.memberNo ? sessionScope.loginUser.memberNo : 0 };
		let goodNo = "${ requestScope.goods.goodNo }";
		
		$.ajax({
			url : 'ajaxSelectLike.go',
	        type: 'get',
	        data: { memberNo: memberNo, goodNo: goodNo },
	        success: function(result) {	        
	            	
	        	if(result > 0) {
	        		
	        		$(".goods-like").html(
	        			'<img class="like-icon" src= "${pageContext.request.contextPath}/resources/images/sample/like_on.png">'	  
	        		);  
	        		
	        	} else if(result == -1 ) {
	        		
	        		
	        		
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
					<div class="header-cart" onclick="location.href='basket.me';"><span class="material-symbols-outlined">shopping_cart</span></div>
	            </div>
	            
				<div class="header-img">
					<img id="thumbnail" src="${ requestScope.goodsFile.changeName }">
				</div>
	            
	            <div class="content">					
           				
					<div class="goods">

						<div class="goods-title">${ requestScope.goodsSell.sellTitle }</div>
						<div class="goods-price">${ requestScope.goods.priceStr } 원
							<div class="goods-like">
							<c:if test="${ ( empty sessionScope.loginUser ) and ( empty sessionScope.loginSeller) }">
								<img class="like-icon2" src= "${pageContext.request.contextPath}/resources/images/sample/like_on.png" onclick="location.href='loginForm.me';">
							</c:if>
							</div>
						</div>
						
						<div class="br-line"></div>
						<br>

						<table id="table-div">
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
						<a href="#goods-content" 						class="menu1">상품소개</a>
						<a href="#sub-review" 							class="menu2">후기</a>
						<a href="#goods-reply" 								class="menu3">상품문의</a>
					</div>

					<div class="goods-content" id="goods-content">
					
						<div class="goodsSell-content" id="goodsSell-content">
						
						</div>

					</div>

					<div class="br2-line"></div>

					<div class="sub-review" id="sub-review">
						<div class="sub-header">
							<div class="sub-header-title" style="width: 110px;">후기 건</div>
							<div class="sub-header-icon"><span class="material-symbols-outlined">arrow_forward_ios</span></div>	
						</div>
						
						<div class="br-line"></div>

						<div class="sub-review-content" >
							<hr>
							<c:forEach var="r" items="${requestScope.r }">
							 <div class="profile_under_1">
							 	<!-- 프로필 -->
							 <div class="profile_2">
				                <span>${r.memberNo}</span>
				                <div id="profile_2_2">
				                    <span>${r.createDate }</span>
				                    <!-- 몇분전인지-->
				                </div>
				            </div>
					            <%-- 별점 --%>
					         
					            <div class="starRating">
					             <c:forEach var="star" begin="1" step="1" end="${r.starRating}">
					                <span ><i class="fas fa-star" style="color : rgb(255, 225, 0)"></i></span>
					             </c:forEach>   
					             ${r.starRating} 
					            </div>
					            <br>
					            <%-- 내용 --%>
					            <div id="content" >
						
						           ${r.revContent }
						
						      </div>
				       		 </div>
				       		 	
				       		
						      <hr>
					       </c:forEach> 
						</div>
					</div>

					<div class="br2-line"></div>

					<div class="goods-reply" id="goods-reply">
						<div class="sub-header">
							<div class="sub-header-title">상품문의</div>
							<div class="sub-header-icon"><span class="material-symbols-outlined">arrow_forward_ios</span></div>	
						</div>
						
						<div class="br-line"></div>

						<div class="goods-reply-content">
						
						<table id="replyArea" class="table" align="center" >
			                <thead>
			                    <tr>
			                    <c:choose>
									<c:when test="${ empty sessionScope.loginUser }">
										<!-- 로그인 전 : 댓글창 막기 -->
										<th colspan="2">
				                            <textarea class="form-control" cols="55" rows="2" style="resize:none; width:100%;" readonly>로그인한 사용자만 이용 가능한 서비스입니다. 로그인 후 이용 바랍니다.</textarea>
				                        </th>
				                        <th style="vertical-align:middle"><button class="btn btn-secondary" disabled>등록하기</button></th>                  
									</c:when>
									<c:otherwise>
				                        <th colspan="2">
				                            <textarea class="form-control" id="replyContent" cols="55" rows="2" style="resize:none; width:100%;"></textarea>
				                        </th>
				                        <th style="vertical-align:middle"><button class="btn btn-secondary" onclick="addReply();">등록하기</button></th>                  
									</c:otherwise>                    
			                    
			                    </c:choose>
			                  
			                    </tr>
			                    <tr>
			                        <td colspan="3">댓글(<span id="rcount"></span>)</td>
			                    </tr>
			                </thead>
	                		<tbody>            
			               </tbody>
			           </table>
							
						
						
						
						
						
						</div>

					</div>
					
					<c:choose>
	            	<%-- 관리자 로그인인 경우 --%>
	            	<c:when test="${ sessionScope.loginUser.memberId eq 'admin' }">
	            		
	            	</c:when>
	            	
	            	<%-- 판매자 로그인 후 --%>
	            	<c:when test="${ (not empty sessionScope.loginSeller) and (sessionScope.loginSeller.sellerNo eq requestScope.goodsSell.sellerNo) }">
	            	<div class="sub-footer3">
						<button class="update-button" type="button" onclick="location.href='sellerGoodsUpdateEnrollForm.go?sno=' + ${requestScope.goodsSell.sellNo};">수정하기</button>
						<button class="delete-button" type="button" onclick="location.href='sellerGoodsDelete.go?sno=' + ${requestScope.goodsSell.sellNo};">삭제하기</button>
					</div>	            		
	            	</c:when>
	            	
					<%-- 로그인 회원과 비회원 --%>
	            	<c:when test="${ not empty sessionScope.loginUser }">	     
					<div class="sub-footer1">
						<div class="btn-icon" id="footer-icon1"><span class="material-symbols-outlined">keyboard_arrow_up</span></div>
						<button class="like-button" type="button">찜 하기</button>
						<button class="pay-button" type="button">주문하기</button>
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
					</c:when>
					<c:otherwise>
						<div class="sub-footer1">
							<div class="btn-icon" id="footer-icon1" onclick="location.href='loginForm.me';"><span class="material-symbols-outlined">keyboard_arrow_up</span></div>
							<button class="like-button2" type="button" onclick="location.href='loginForm.me';">찜 하기</button>
							<button class="pay-button2" type="button" onclick="location.href='loginForm.me';">주문하기</button>
						</div>		
	            	</c:otherwise>         	
       				</c:choose>
							
				
					
					
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
	
	$(function() {
		
		// 상품 글 content 부분 삽입
   		let sellContent = '${ requestScope.goodsSell.sellContent }';
   		
   		$("#goodsSell-content").html(sellContent);  
		  	
		// 아래 화살표 누룰시 이벤트 처리
		$(".sub-footer1").on("click", "#footer-icon1",function() {
    		
			$(".sub-footer1").css('display', 'none');
			$(".sub-footer2").css('display', 'block');
    	
    	});
		
		$(".sub-footer2").on("click", "#footer-icon2",function() {
    		
			$(".sub-footer2").css('display', 'none');
			$(".sub-footer1").css('display', 'block');
    	
    	});
		
		// 아래 처음 주문하기 누룰시 이벤트 처리
		$(".sub-footer1").on("click", ".pay-button",function() {
    		
			$(".sub-footer1").css('display', 'none');
			$(".sub-footer2").css('display', 'block');
    	
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
		
		
		// 상단 상품 찜 하기 클릭 이벤트
		$(".goods-like").on("click", ".like-icon", function() {
    		
			ajaxClickLike();  	
    	});
		
		// 하단 상품 찜 하기 클릭 이벤트
		$(".sub-footer1").on("click", ".like-button", function() {
    		
			ajaxClickLike();  	
    	});
		
		$(".menu1").click(function() {
	        
			$(".menu1").css("border-bottom","3px solid black");
			$(".menu1").css("color","rgb(44, 116, 44)"); 
	        
			$(".menu2").css("border-bottom","");
			$(".menu2").css("color",""); 
			
			$(".menu3").css("border-bottom","");
			$(".menu3").css("color",""); 

		});
		
		$(".menu2").click(function() {
			
			$(".menu1").css("border-bottom","");
			$(".menu1").css("color",""); 
	        
			$(".menu2").css("border-bottom","3px solid black");
			$(".menu2").css("color","rgb(44, 116, 44)"); 
			
			$(".menu3").css("border-bottom","");
			$(".menu3").css("color",""); 

		});
		
		$(".menu3").click(function() {
	        
			$(".menu1").css("border-bottom","");
			$(".menu1").css("color",""); 
	        
			$(".menu2").css("border-bottom","");
			$(".menu2").css("color",""); 
			
			$(".menu3").css("border-bottom","3px solid black");
			$(".menu3").css("color","rgb(44, 116, 44)"); 

		});
		
		
	});
	
	// 상품 찜 하기 클릭 이벤트 함수	
	function ajaxClickLike() {
	    
		let memberNo = ${!empty sessionScope.loginUser.memberNo ? sessionScope.loginUser.memberNo : 0 };
		
		let goodNo = "${ requestScope.goods.goodNo }";
		
		$.ajax({
			url : 'ajaxClickLike.go',
	        type: 'get',
	        data: { memberNo: memberNo, goodNo: goodNo },
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
<script>
	$(function() {
		
		// 댓글리스트 조회용 선언적 함수 호출
		selectReplyList();
		
		// 만약, 댓글이 실시간으로 달리는걸 보고싶다면?
		setInterval(selectReplyList, 1000);
	
	});
	
	function addReply() {
		
		let memberNo = "${ sessionScope.loginUser.memberNo }";
		
		if($("#replyContent").val().trim().length != 0) {
		
			$.ajax({
				url : "rinsert.go",
				type : "get",
				data : {  
					sellNo : ${ requestScope.goodsSell.sellNo },
					memberNo : memberNo,
					replyContent : $("#replyContent").val()
   				},
   				success : function(result) { 
   					
   					// 댓글 작성 성공 시
   					selectReplyList();
   					$("#replyContent").val("");
   					
   				},
   				error : function() {
   					console.log("댓글 작성용 ajax 통신 실패!");
   				}
			});
			
		} else {
			
			alertify.alert("Alert", "댓글 작성 후 등록을 요청해주세요.", function(){ alertify.success('Ok'); });
		}
	}
	
	function selectReplyList() {
		
		// 해당 게시글에 딸린 댓글 조회 요청용 ajax 요청
		$.ajax({
			url : "rlist.go",
			type : "get",
			data : {sno : ${ requestScope.goodsSell.sellNo }},
			success : function(result){
				
				// console.log(result);
				
				let resultStr = "";
				
				for(let i = 0; i < result.length; i++) {
					
					resultStr += "<tr>"
							   + "<th>" + result[i].replyWriter + "</th>"
							   + "<th>" + result[i].replyContent + "</th>"
							   + "<th>" + result[i].createDate + "</th>"
							   + "</tr>";								   
				}
				
				$("#replyArea>tbody").html(resultStr);
				$("#rcount").text(result.length);
				
			},
			error : function(){
				console.log("댓글리스트 조회용 ajax 통신 실패!");
			}	
		});
	}
   
</script>
</body>
</html>