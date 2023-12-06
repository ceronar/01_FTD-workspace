<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/main.css?version=1.2" rel="stylesheet" type="text/css">
<style>
	
	/* 전체 div */
	.store {
		width: 100%;
		height: 200px;
	}

	/* 테스트 */
	.store div {
		border: 1px solid black;
	}

	/* store div 공통 css */
	.store-no, .store-img, .store-content {
		height: 100%;
		float: left;
		box-sizing: border-box;
	}
	
	.store-no {
		width: 10%;
		height: 100%;
		text-align: center;
		line-height: 200px;
		font-size: 20px;
		font-weight: bolder;
	}

	.store-img {
		width: 200px;
		height: 100%;		
	}
	
	.store-img img {
		width: 100%;
		height: 100%;
		box-shadow: 0 0 10px rgba(235, 234, 234, 0.589);
		border-radius: 8px;
		box-sizing: border-box;
	}

	.store-content {
		width: 65%;
	}

	/* store-content 공통 css */
	.store-title, .store-goods, .store-detail {
		width: 100%;
		display: block;
		box-sizing: border-box;
	}
	
	/* store-title 공통 css */
	.store-title div {
		float: left;
		height: 100%;
		text-align: center;
		line-height: 80px;
		box-sizing: border-box;
	}

	.store-title {
		width: 100%;
		height: 40%;
	}

	.store-title-img {
		width: 10%;
	}

	.store-name {
		width: 45%;
		font-size: 25px;
		font-weight: bolder;
	}

	.store-address {
		width: 45%;
		color: rgb(38, 40, 40);
	}

	/* store-goods div css */
	.store-goods {
		height: 30%;
		text-align: left;
		line-height: 60px;
		padding-left: 10px;
		color: rgb(114, 120, 127);
	}	

	/* store-detail 공통 css */
	.store-detail div {
		float: left;
		height: 70%;
		line-height: 40px;
	}

	.store-detail {
		height: 30%;
	}

	.store-star {
		height: 100%;
		width: 15%;
	}

	.store-rating {
		height: 100%;
		width: 20%;
	}

	.store-review {
		height: 100%;
		width: 20%;
	}

	.store-person {
		height: 100%;
		width: 15%;
	}

	.store-subscribe {
		height: 100%;
		width: 20%;
	}
	
	
	

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
	
	// 페이지 로딩시 불러올 리스트 개수 변수 설정
	var page = 0;
	var pageSize = 10; // 초기 로딩 시 20개씩 불러오기
	
	 $(document).ready(function () {
	        
		 	ajaxSelectSellerList();

	        $(window).scroll(function () {
	            if ($(window).scrollTop() + $(window).height() >= $(document).height() - 10) {
	                
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
	                   		
	                result.forEach(function (item, index) {
	                    $('.content').append(
							
	                    	'<div class="store">'
	        					+'<div class="store-no">' + (index + (page * pageSize))  + '</div>'
	        					+ '<div class="store-img"><img src= ""></div>'
	        					+ '<div class="store-content">'	
	        						
	        					 	+ '<div class="store-title">'
	        							+ '<div class="store-title-img">'+ '아이콘' + '</div>'
	        							+ '<div class="store-name">' + item[0].companyName + '</div>'
	        							+ '<div class="store-address">'+ item[0].address + '</div>'
	        						+ '</div>'
	        				
	        						+ '<div class="store-goods">'+ item[0] + '</div>'
	
	        						+ '<div class="store-detail">'
	        							+ '<div class="store-star">' + '별이미지' + '</div>'
	        							+ '<div class="store-rating">' + item[2] + '</div>'
	        							+ '<div class="store-review">(' + item[3] + ')</div>'
	        							+ '<div class="store-person">' + '사람이미지' + '</div>'
	        							+ '<div class="store-subscribe">' + item[4] + '</div>'
	        						+ '</div>'
	        					+ '</div>'   
	                    	+'</div>'
	                    	+ '<br><br>'
	                    );
	                             
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
	            
		            <div class="store-filter"></div>
	
				
		        </div>

	        </div>             
        </div>
    </div>

	

</body>
</html>