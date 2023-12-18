<!-- /WEB-INF/views/find-id-form.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Find ID</title>
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

	h3 {
		color: #007bff;
	}
   
    #email {
        font-size: 25px;
    }
</style>
<body>
    <div class="id" style="background-color: white;">
        <h3>아이디 찾기</h3>
        <form action="found-id" method="post">
            <label for="email">이메일:</label>
            <input type="email" id="email" name="email" required>
            <button type="submit" id="email">검색</button>
        </form>
    </div>
</body>
</html>