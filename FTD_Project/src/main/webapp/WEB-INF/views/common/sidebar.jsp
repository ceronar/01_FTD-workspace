<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@800&display=swap" rel="stylesheet">
<style>
	.sidebar  div {
		/* border: 1px solid black; */
		width: 100%;	
		text-align: center;
	}
  	.sidebar-menu {
		width: 100%;
		height: 80px;
		margin-bottom: 5px;
	}

	.icon {
		width: 100%;
		height: 70%;
	}

	.icon > span {
		line-height: 56px;
		font-size: 40px;
		font-weight: 100;
		height: 100%;
		width: 100%;
		color: rgba(118, 118, 118, 0.792);
		cursor: pointer;
	}

	#home-icon, #my-icon {
		font-size: 45px;
	}

	.text {
		line-height: 15px;
		width: 100%;
		height: 30%;
		text-align: center;
		font-size: 15px;
		color: rgba(118, 118, 118, 0.792);
		font-family: 'Noto Sans KR', sans-serif;
	}


</style>
</head>
<body>
	<div class="sidebar">
		<div class="sidebar-menu" onclick="location.href='${pageContext.request.contextPath}';">
			<div class="icon"><span id="home-icon" class="material-symbols-outlined">home</span></div>
			<div class="text">홈</div>
		</div>
		<div class="sidebar-menu" onclick="location.href='sellerListPage.se';">
			<div class="icon"><span class="material-symbols-outlined">storefront</span></div>
			<div class="text">산지마켓</div>
		</div>
		<c:choose>
			<%-- 판매자 로그인 후 --%>
           	<c:when test="${ not empty sessionScope.loginSeller }">
           		<div class="sidebar-menu" onclick="location.href='sellerGoodsListPage.go';">
					<div class="icon"><span class="material-symbols-outlined">local_mall</span></div>
					<div class="text">쇼핑몰</div>
				</div>
           	</c:when>
           	
			<%-- 로그인 전 --%>
           	<c:otherwise>
				<div class="sidebar-menu" onclick="location.href='goodsRecommendPage.go';">
					<div class="icon"><span class="material-symbols-outlined">local_mall</span></div>
					<div class="text">쇼핑몰</div>
				</div>	
           	</c:otherwise>
		
		</c:choose>
		<div class="sidebar-menu" onclick="location.href='basket.me';">
			<div class="icon"><span class="material-symbols-outlined">shopping_cart</span></div>
			<div class="text">장바구니</div>
		</div>
		<c:choose>
			<c:when test="${ not empty sessionScope.loginSeller }">
				<div class="sidebar-menu" onclick="location.href='sellerPage';">
				<div class="icon"><span id="my-icon" class="material-symbols-outlined">person</span></div>
			<div class="text">MY</div>
		</div>
			</c:when>
			<c:otherwise>
				<div class="sidebar-menu" onclick="location.href='myPage.me';">
					<div class="icon"><span id="my-icon" class="material-symbols-outlined">person</span></div>
					<div class="text">MY</div>
				</div>
			</c:otherwise>
		</c:choose>

	</div>
</body>
</html>