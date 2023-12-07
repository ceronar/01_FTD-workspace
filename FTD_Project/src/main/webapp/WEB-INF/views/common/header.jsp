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

<link href="${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet" type="text/css">
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
	<c:if test="${ not empty sessionScope.alertMsg }">
		<script>
			alertify.success('${ sessionScope.successMsg }');
		</script>
		
		<!-- session 의 successMsg 지우기 -->
		<c:remove var="successMsg" scope="session" />
	</c:if>
	
	<div class="header">

		<div class="title-div">
			<div><img></div>
			<div class="title-name"><a href="${pageContext.request.contextPath}">FTD</a></div>
			<div><img></div>
			<div>
	            <c:choose>
	            	<%-- 관리자 로그인인 경우 --%>
	            	<c:when test="${ sessionScope.loginUser.memberId eq 'admin' }">
	            		<a href="menu.ad">관리자 페이지</a> | 
	            		<a href="logout.me">로그아웃</a>
	            	</c:when>
	            	
	            	<%-- 구매자 로그인 후 --%>
	            	<c:when test="${ not empty sessionScope.loginUser }">
	            		<a href="myPage.me">마이페이지</a> | 
			            <a href="logout.me">로그아웃</a>
	            	</c:when>
	            	
	            	<%-- 판매자 로그인 후 --%>
	            	<c:when test="${ not empty sessionScope.loginSeller }">
	            		<a href="sellerPage">내 가게 정보</a> | 
	            		<a href="logout.se">로그아웃</a>
	            	</c:when>
	            	
					<%-- 로그인 전 --%>
	            	<c:otherwise>
			            <a href="loginForm.me">로그인</a> |
			            <a href="loginForm.se">판매자 로그인</a>	
	            	</c:otherwise>         	
	            </c:choose>	
			</div>	
<!-- 
	<h2>신선한땅의 맛</h1>
		<div class="nav-menu">
			<a href="list.in">홈</a>
			<a href="#">가게 찾기</a>
            <a href="#">상품 찾기</a>
            <a href="plist.bo">홍보</a>
            <c:choose>
            	<%-- 구매자 로그인 후 --%>
            	<c:when test="${ not empty sessionScope.loginUser }">
	            	<a href="myPage.me">마이페이지</a>
		            <a href="logout.me">로그아웃</a>
            	</c:when>
            	
            	<%-- 판매자 로그인 후 --%>
            	<c:when test="">
            	
            	</c:when>            	

				<%-- 로그인 전 --%>
            	<c:otherwise>
		            <a href="loginForm.me">로그인</a>
		            <a href="#">회원 가입</a>  	
            	</c:otherwise>
            	
            </c:choose>

		</div> -->
		
			<div class="nav-menu">
				<a href="#">추천</a>
				<a href="list.no" class="notice">공지사항</a>
				<a href="#">고객센터</a>
				<a href="#">회사소개</a>
			</div>
			
		
		</div>
	</div>

	<script>
		$(document).ready(function() {
			
		 	$(".notice").click(function(e) {
		 		
				location.href = "list.no";
			})
			
			// 상단 네비바 클릭시 이벤트 처리
			$(".nav-menu a").click(function(e){
				
			 	e.preventDefault(); // 기본 클릭 이벤트 방지
				
			 	
				// 클릭된 요소에 스타일 적용
				$(this).css({
					"font-size": "25px",
				    "border-bottom": "3px solid black",
				    "color": "black" // 글자 색상 변경
				});
				
				// 나머지 요소 스타일 초기화
		      	$(".nav-menu a").not(this).css({
		        	"font-size": "22px",
		        	"border-bottom": "none",
		        	"color": "rgb(85, 85, 85)" // 다른 메뉴의 글자 색상 변경
		      	});
				
			
			});
			
			
			
			
			
			
			
			
		});


	</script>
	
	
</body>
</html>