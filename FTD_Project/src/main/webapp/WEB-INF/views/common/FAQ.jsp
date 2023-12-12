<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FAQ</title>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <style>
    	.content {
    		font-family: 'Noto Sans KR', sans-serif;
    		height: 750px;
    	}
    
	 	.collapsible {
            background-color: #358a54;
            color: white;
            cursor: pointer;
            padding: 18px;
            width: 70%;
            border: none;
            text-align: left;
            outline: none;
            font-size: 20px;
            margin-left: 5%;
        }
        
		.active1 {
            background-color: #388755;
        }
        
        .content_1 {
            padding: 0 18px;
            max-height: 0;
            overflow: hidden;
            transition: max-height 0.2s ease-out;
           
            width: 70%;
            margin-left:15%;
            font-size: 20px;
        }
        
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet" type="text/css">
		<script>
		    function collapse(element) {
		        var before = document.querySelector(".active1");
		        if (before && before !== element) {
		            before.classList.remove("active1");
		            before.nextElementSibling.style.maxHeight = null;
		        }
		
		        element.classList.toggle("active1");
		        var content = element.nextElementSibling;
		
		        if (content.style.maxHeight != 0) {
		            content.style.maxHeight = null;
		        } else {
		            content.style.maxHeight = content.scrollHeight + "px";
		        }
		    }
		</script>
</head>
<body>
<div class="wrapper">
        <div class="center-div">  
	        <jsp:include page="../common/sidebar.jsp" />
	        <div class="main-div">
		        <jsp:include page="../common/header.jsp" />
			        <div class="content">
						
							<h1>FAQ 게시판</h1>
							
							<br><br><br>
							<button type="button" class="collapsible" onclick="collapse(this);">발주 마감 시간은 몇 시 인가요?</button>
						
						<div class="content_1">
							<p>
								- 직배송 : 22시 마감 (다음 날 새벽 배송)<br>
								- 택배 : 낮 12시 마감 (다음 날 업장 도착)<br>
								- 고속화물 : 22시 마감 (다음 날 오전 출고)<br>
								- 현장 픽업 : 22시 마감 (다음 날 방문 시각 공유 필요)
							</p>
						</div>
						
						<button type="button" class="collapsible" onclick="collapse(this);">배송일 지정이 가능한가요?</button>
						<div class="content_1">
							<p>배송일 지정 가능합니다. 문의 사항에 배송일을 남겨주시면 가능합니다.</p>
						</div>
						
						<button type="button" class="collapsible" onclick="collapse(this);">배송 불가능한 요일은 언제인가요?</button>
						<div class="content_1">
							<p>
								- 직배송 : 일요일 불가, 월요일~토요일, 공휴일 배송 가능합니다. <br>
								- 택배 : 상품 받는 날짜 기준 화요일~토요일 택배 배송 가능합니다. <br>
								- 고속버스 화물 : 일요일 불가, 월요일~토요일 배송 가능합니다.
							</p>
						</div>
						
						<button type="button" class="collapsible" onclick="collapse(this);">배송 도착 시간은 언제인가요?</button>
						<div class="content_1">
							<p> 
								보통 새벽 1시~새벽 6시 사이에 매장 안으로 물건 배송해드리고 있습니다. <br>
								매일 착지가 바뀌기 때문에 정확한 도착 시간 공유는 어렵습니다.
							</p>
						</div>
						
						<button type="button" class="collapsible" onclick="collapse(this);">관리자와 대화를 하고싶습니다.</button>
						<div class="content_1">
							<p>우측 하단에 채널톡을 이용해주세요.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
</body>
</html>