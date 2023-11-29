<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.wrapper {
	    display: flex;
	    flex-direction: column;
		margin: auto;
	    min-height: 100vh;
	    margin-top: 150px;
	}
	
	.content {
		
		background: rgb(255, 255, 255);
	}

</style>
</head>
<body>

	<div class="wrapper">

		<jsp:include page="common/header.jsp" />
		

	<div class="wrapper">
		<jsp:include page="common/header.jsp" />
		
		<div class="content">


		

			<a href="basket.me">장바구니로</a>

		
		</div>

		<jsp:include page="common/footer.jsp" />
		
	
	</div>
	
	
	
</body>
</html>
