<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet" type="text/css">
<script>
	
	// 페이지 로딩시 불러올 리스트 개수 변수 설정
	var page = 0;
	var pageSize = 20; // 초기 로딩 시 20개씩 불러오기
	
	 $(document).ready(function () {
	        
		 	ajaxSelectSellerList();

	        $(window).scroll(function () {
	            if ($(window).scrollTop() + $(window).height() >= $(document).height() - 100) {
	                
	            	page++;	         
	            	ajaxSelectSellerList();
	            }
	        });
	    });
	
	 function ajaxSelectSellerList() {
	      
	        $.ajax({
	            url : 'ajaxSelectSellerList.se',
	            type: 'get',
	            data: { page: page, pageSize: pageSize },
	            success: function(result) {
	            	
	            	console.log("ajax 통신 성공");
	            	console.log(result);
	            	
	                data.forEach(function (val) {
	                    $('#legacyContainer').append('<p>' + val + '</p>');
	                });

	            },
	            error : function() {
	            	console.log("ajax 통신 실패");
	            }
	        });
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
	            
	            <!-- 테스트 -->
	            <div id="legacyContainer"></div>
	            
	          
	            <div class="store">
					<div class="store-no">1</div>
					<div class="store-img">이미지</div>
					<div class="store-content">	
						<div class="store-title">
							<div class="store-title-img">판매 이미지</div>
							<div class="seller-title">
								<div class="store-name">가게</div>
								<div class="store-address">가게 주소</div>
							</div>
						</div>
				
						<div class="store-goods">가게 정보</div>

						<div class="store-detail">
							<div>별이미지</div>
							<div class="store-star">별점</div>
							<div class="store-review">(리뷰 수)</div>
							<div>사람이미지</div>
							<div class="store-subscribe">찜</div>
						</div>
					</div>   
    			</div>
    			<!-- 다른 가게들도 유사한 형식으로 추가 가능 -->
	            
	            
	            <!-- ======================================= -->
	                    
	            </div>
	            
	            <jsp:include page="../common/footer.jsp" />
	        </div>             
        </div>
    </div>

	

</body>
</html>