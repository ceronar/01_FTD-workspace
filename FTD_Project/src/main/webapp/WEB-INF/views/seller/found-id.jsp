<!-- /WEB-INF/views/found-id.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Found ID</title>
</head>
<body>
<!-- 아이디를 찾았을 때 보여줄 페이지 -->
	<c:if test="${empty error}">
		<h2>Your ID is: ${foundId}</h2>
	</c:if>
	<c:if test="${empty foundId}">
		찾는 아이디가 없습니다.
		<br>
		새로 회원가입 하세요
	</c:if>    
</body>
</html>