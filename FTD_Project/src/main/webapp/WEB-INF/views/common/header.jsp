<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- alertify 라이브러리 -->
   <!-- JavaScript -->
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
<!-- CSS -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
<!-- Default theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
<!-- Semantic UI theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>

<link href="${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet" type="text/css">
<style>

	.header > div {
        display: block;
    }

    .title-div > div {
        width: 100%;
        display: inline;
        box-sizing: border-box;
    }

    img {
        width: 100px;
        height: 100px;
        border: 1px solid black;
    }

     /* 네비게이션 메뉴 스타일 */
    .nav-menu {
    	width: 100%;
    	height: 100%;
        float: right; /* 오른쪽으로 정렬합니다. */
        
    }

    .nav-menu a {
		width: 150px;
        display: inline-block; /* 가로로 나열되도록 변경합니다. */
        text-decoration: none;
        padding: 10px; /* 위아래 좌우 여백 조절 */
        margin: 0 5px; /* 좌우 간격 조절 */
        color: black;
        background-color: #ccc;
        border-radius: 5px;
    }

    .nav-menu a:hover {
        background-color: #ddd;
    }
	
</style>
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
	

	<div class="header">

		<div class="title-div">
			<div><img></div>
			<div><a>신선한땅의 맛</a></div>
			<div><img></div>
			<div>
	            <c:choose>
	            	<%-- 구매자 로그인 후 --%>
	            	<c:when test="${ not empty sessionScope.loginUser }">
			            <a href="logout.me">로그아웃</a>
	            	</c:when>
	            	
	            	<%-- 판매자 로그인 후 --%>
	            	<c:when test="">
	            	
	            	</c:when>            	
	
					<%-- 로그인 전 --%>
	            	<c:otherwise>
			            <a href="loginForm.me">로그인</a>	
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
				<a href="#">공지사항</a>
				<a href="#">고객센터</a>
				<a href="#">회사소개</a>
			</div>
			
		
		</div>
	</div>
	
	
</body>
</html>