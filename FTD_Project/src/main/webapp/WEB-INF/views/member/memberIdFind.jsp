<!-- /WEB-INF/views/find-id-form.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Find ID</title>
</head>
<body>
    <h2>Find Your ID</h2>
    <form action="found-id" method="post">
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>
        <button type="submit">Find ID</button>
    </form>
</body>
</html>