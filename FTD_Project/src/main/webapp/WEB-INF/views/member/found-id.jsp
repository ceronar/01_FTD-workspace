<!-- /WEB-INF/views/found-id.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Found ID</title>
</head>
<style>
	body {
		display: flex;
		align-items: center;
		justify-content: center;
		height: 100vh;
		margin: 0;
		font-family: Arial, sans-serif;
		background-color: #f5f5f5;
	}

	.id {
		text-align: center;
		padding: 20px;
		border-radius: 8px;
		background-color: #fff;
		box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        font-size: 30px
	}

	.error-message {
		color: #ff0000;
		font-weight: bold;
	}

	h1 {
		color: #007bff;
	}
   
    #email {
        font-size: 25px;
    }
</style>
<div class="id" style="background-color: white;">
	<!-- 아이디를 찾았을 때 보여줄 페이지 -->

	<c:if test="${empty error}">
		<h1>당신의 아이디는 { ${foundId} } 입니다. </h1>
	</c:if>

	<c:if test="${empty foundId}">
		<h1>
			찾는 아이디가 없습니다.
			<br>
			새로 회원가입 하세요
		</h1>
	</c:if>  
</div>
</body>
</html>