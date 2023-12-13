<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>

<!-- JavaScript -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- alertify 라이브러리 -->
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
<!-- CSS -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
<!-- Default theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
<!-- Semantic UI theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
<!-- google icon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<!-- bootstrap -->
<!-- <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"/> -->

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@800&display=swap" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/header.css?version=1.2" rel="stylesheet" type="text/css">
</head>
<body>

	<!-- 1회성 알람문구 코드 추가해주세요. -->
	<c:if test="${ not empty sessionScope.alertMsg }">
		<script>
			alertify.alert('Alert', '${ sessionScope.alertMsg }', function(){ alertify.success('Ok'); });
		</script>
		
		<!-- session 의 alertMsg 지우기 -->
		<c:remove var="alertMsg" scope="session" />
	</c:if>
	
	<!-- 1회성 successMsg 출력 코드 -->
	<c:if test="${ not empty sessionScope.successMsg }">
		<script>
			alertify.success('${ sessionScope.successMsg }');
		</script>
		
		<!-- session 의 successMsg 지우기 -->
		<c:remove var="successMsg" scope="session" />
	</c:if>
	
	<div class="header">

		<div class="title-div">
			<div class="title-logo"><img class="logo" src= "${pageContext.request.contextPath}/resources/images/sample/logo.png" onclick="location.href='${pageContext.request.contextPath}';"></div>
			<div class="title-name"><a href="${pageContext.request.contextPath}/">신선한 땅의 맛</a></div>
			<div class="title-search"><span class="material-symbols-outlined" onclick="location.href='${pageContext.request.contextPath}';">search</span></div>
			<div class="title-cart"><span class="material-symbols-outlined" onclick="location.href='basket.me';">shopping_cart</span></div>
			<div class="title-login">
			<c:choose>
	            	<%-- 관리자 로그인인 경우 --%>
	            	<c:when test="${ sessionScope.loginUser.memberId eq 'admin' }">
	            		<span class="material-symbols-outlined" onclick="location.href='logout.me';">move_item</span>
	            	</c:when>
	            	
	            	<%-- 구매자 로그인 후 --%>
	            	<c:when test="${ not empty sessionScope.loginUser }">
	            		<span class="material-symbols-outlined" onclick="location.href='logout.me';">move_item</span>
	            	</c:when>
	            	
	            	<%-- 판매자 로그인 후 --%>
	            	<c:when test="${ not empty sessionScope.loginSeller }">
	            		<span class="material-symbols-outlined" onclick="location.href='logout.se';">move_item</span>
	            	</c:when>
	            	
					<%-- 로그인 전 --%>
	            	<c:otherwise>
						<span class="material-symbols-outlined" onclick="location.href='loginForm.me';">account_circle</span>	
	            	</c:otherwise>         	
	        </c:choose>
	        </div>
	
		</div>
		
		<div class="nav-menu" id="nav1">
			<a href="" 	class="menu1">추천</a>
			<a href="list.no" 					class="menu2">공지사항</a>
			<a href="FAQ" 							class="menu3">고객센터</a>
			<a href="IntroduceCompany" 							class="menu4">회사소개</a>
		</div>
		
		<div class="nav-menu" id="nav2">
			<a href="sellerListPage.se" 			class="menu1">판매자</a>
			<a href="${pageContext.request.contextPath}" 								class="menu2">베스트</a>
			<a href="${pageContext.request.contextPath}" 								class="menu3">홍보</a>
			<a href="${pageContext.request.contextPath}" 								class="menu4">후기</a>
		</div>
		
		<div class="nav-menu" id="nav3">
		<c:choose>
			<%-- 판매자 로그인 후 --%>
           	<c:when test="${ not empty sessionScope.loginSeller }">
           		<a href="sellerGoodsListPage.go" 				class="menu1">판매자 상품</a>
				<a href="sellerGoodsTextListPage.go" 			class="menu2">판매자 상품 글</a>
           	</c:when>
           	
			<%-- 로그인 전 이거나 구매자일 경우 --%>
           	<c:otherwise>
				<a href="goodsRecommendPage.go" 	class="menu1">쇼핑추천</a>
				<a href="goodsBestPage.go" 			class="menu2">베스트</a>	
           	</c:otherwise> 
		</c:choose>
			<a href="goodsListPage.go" 			class="menu3">상품</a>
			<a href="" 							class="menu4">비고</a>
		</div>
		
		<!-- 구매자 마이페이지 -->
		<div class="nav-menu" id="nav4">
			<a href="orderList.me" 					class="menu1">주문내역</a>
			<a href="like.me" 						class="menu2">좋아요</a>
			<a href="" 								class="menu3">찜</a>
			<a href="" 								class="menu4">쓴 글</a>
		</div>
		
		<!-- 판매자 마이페이지 -->
		<div class="nav-menu" id="nav5">
			<a href="" 								class="menu1">내 가게</a>
			<a href="" 								class="menu2">물품</a>
			<a href="" 								class="menu3">통계</a>
			<a href="#" 							class="menu4"></a>
		</div>
		
	</div>
	
	<script src="${pageContext.request.contextPath}/resources/js/api/apikey.js"></script>
	<script>
	  (function(){var w=window;if(w.ChannelIO){return w.console.error("ChannelIO script included twice.");}var ch=function(){ch.c(arguments);};ch.q=[];ch.c=function(args){ch.q.push(args);};w.ChannelIO=ch;function l(){if(w.ChannelIOInitialized){return;}w.ChannelIOInitialized=true;var s=document.createElement("script");s.type="text/javascript";s.async=true;s.src="https://cdn.channel.io/plugin/ch-plugin-web.js";var x=document.getElementsByTagName("script")[0];if(x.parentNode){x.parentNode.insertBefore(s,x);}}if(document.readyState==="complete"){l();}else{w.addEventListener("DOMContentLoaded",l);w.addEventListener("load",l);}})();
	  let apikey1 = apikey;
	  ChannelIO('boot', {
	    "pluginKey": apikey1
	  });
	</script>
	
</body>
</html>