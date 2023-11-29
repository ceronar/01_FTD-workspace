<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.header {
	    color: #4CAF50;
	    position: fixed; /* 헤더를 화면 상단에 고정 */
	    top: 0; /* 헤더가 화면 상단에 고정될 때의 위치 */
		margin: center;
		width: 900px;
		padding: 0px 18px;
		background: rgb(255, 255, 255);
		border-bottom: 1px solid rgb(201, 205, 210);
		box-sizing: border-box;
		z-index: 40;	
	    /*z-index: 1000; */ /* 다른 요소들보다 위에 나타나도록 z-index 설정 */
	}
	
	.nav-menu {
        display: flex;
        justify-content: space-around;
        margin-top: 10px;
    }

    .nav-menu a {
        color: #4CAF50;
        text-decoration: none;
        padding: 10px;
        border-radius: 5px;
        transition: background-color 0.3s;
    }

    .nav-menu a:hover {
        background-color: #45a049;
    }
</style>
</head>
<body>

	<!-- 1회성 알람문구 코드 추가해주세요. -->





	<div class="header">
	<h2>신선한땅의 맛</h1>
		<div class="nav-menu">
			<a href="#">홈</a>
			<a href="#">가게 찾기</a>
            <a href="#">상품 찾기</a>
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
		</div>
	</div>
	
	
	
</body>
</html>