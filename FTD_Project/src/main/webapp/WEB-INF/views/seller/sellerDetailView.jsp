<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/main.css?version=1.2" rel="stylesheet" type="text/css">
<style>
	.main-div {
		margin-left: 140px;
	}

	/* 테스트 */
	.store, .store div {
		border: 1px solid black;
	}

	.store {
		width: 100%;
		height: 300px;
	}

	/* store */
	.store-address-title, .store-title, .store-detail {
		width: 100%;
		display: block;
		box-sizing: border-box;
	}

	.store-address-title {
		height: 15%;
	}
	
	.store-title {
		height: 30%;
	}

	.store-detail {
		height: 55%;
	}

	/* store-address-title */
	.store-address-icon, .store-address {
		float: left;
		height: 100%;
		box-sizing: border-box;
	}

	.store-address-icon {
		width: 8%;
	}

	.store-address {
		width: 40%;
	}

	/* store-title */
	.store-name, .store-subscribe-button {
		float: left;
		height: 100%;
		box-sizing: border-box;
	}

	.store-name {
		width: 70%;
	}

	.store-subscribe-button {
		width: 30%;
	}

	/* store-detail */
	.store-subscribe, .store-rating, .store-review {
		float: left;
		height: 100%;
		box-sizing: border-box;
	}

	.store-subscribe {
		width: 33.4%;
	}

	.store-rating {
		width: 33.3%;
	}

	.store-review {
		width: 33.3%;
	}

	/* store-subscribe */
	.store-subscribe-text, .store-subscribe-count {
		width: 100%;
		display: block;
		box-sizing: border-box;
	}

	.store-subscribe-text {
		height: 50%;
	}

	.store-subscribe-count {
		height: 50%;
	}

	/* store-rating */
	.store-rating-text, .store-rating-count {
		width: 100%;
		display: block;
		box-sizing: border-box;
	}

	.store-rating-text {
		height: 50%;
	}

	.store-rating-count {
		height: 50%;
	}

	/* store-review */
	.store-review-text, .store-review-count {
		width: 100%;
		display: block;
		box-sizing: border-box;
	}

	.store-review-text {
		height: 50%;
	}

	.store-review-count {
		height: 50%;
	}

	.sub-content {
	width: 100%; /* content 영역 크기 조정 */
	height: 800px;
	background-color: #ffffff;
	padding: 20px;
	box-sizing: border-box;
	/* border: 1px solid rgb(85, 85, 85); 위쪽(top)만 0으로 수정 */
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
	margin: 0; /* content의 마진 제거 */
	border-top: 10px solid rgb(232, 235, 237);;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
	
	$(document).ready(function () { 
		
		ajaxSelectSellerMarketList();
		
		ajaxSelectSubscribe();
		
	});
	
	function ajaxSelectSellerMarketList() {
		
		$.ajax({
			
			url : 'ajaxSelectSellerMarketList.se',
            type: 'get',
            data: {sellerNo: ${requestScope.sellerNo}},
            success: function(result) {
			
            	$('.store').append(
            		
            		'<div class="store-address-title">'
						+ '<div class="store-address-icon">아이콘</div>'
						+ '<div class="store-address">'+ result[0].address + '</div>'
					+ '</div>'
					+ '<div class="store-title">'
						+ '<div class="store-name">'+ result[0].companyName + '</div>'
						+ '<div class="store-subscribe-button"><button id="subscribe">단골맺기</button></div>'
					+ '</div>'
					+ '<div class="store-detail">'
						+ '<div class="store-subscribe">'
							+ '<div class="store-subscribe-text">단골</div>'
							+ '<div class="store-subscribe-count">'+ result[3] + '</div>'
						+ '</div>'
						+ '<div class="store-rating">'
							+ '<div class="store-rating-text">평점</div>'
							+ '<div class="store-rating-count">'+ result[1] + '</div>'
						+ '</div>'
						+ '<div class="store-review">'
							+ '<div class="store-review-text">후기</div>'
							+ '<div class="store-review-count">'+ result[2] + '</div>'
						+ '</div>'
					+ '</div>'            	
            	);
	
            },
            error : function() {
            	
            	console.log("ajax 통신 실패");
            }
            
		});
				
	}

	function ajaxSelectSubscribe() {
		
		$.ajax({
			url : 'ajaxSelectSubscribe.se',
			type: 'get',
			data : { memberNo : ${sessionScope.loginUser.memberNo }, sellerNo : ${requestScope.sellerNo}},
			success: function(result) {
				
				console.log(result);
				
				if(result == "btn btn-secondary") {
					
					$("#subscribe").attr('class', result);
					
					$("#subscribe").attr("disabled", true);
					
				} else {
					
					$("#subscribe").attr('class', result);
					
					$("#subscribe").attr("disabled", false);
				}
				
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
         	        
	        <div class="main-div">
	            
	            <jsp:include page="../common/header.jsp" />
	            
	            <div class="content">
	            	
	            	<div class="store">
						
						
					</div>
	
				
		        </div>

				<div class="sub-content">
					
					<div class="sub-menu">
						
					</div>
					
				</div>


	        </div>
			
        </div>
    </div>
    
    <script>
    
    // console.log(document.getElementById("subscribe"))
    
    $(function() {
    	
    	$(".store").on("click", "#subscribe", () => {

    		$.ajax({
    			url : "ajaxClickSubscribe.se",
				type : "get",
				data : { memberNo : ${sessionScope.loginUser.memberNo }, sellerNo : ${requestScope.sellerNo}},
				success : result => {
					
	            	if(result == "btn btn-secondary") {
	            		
	            		$("#subscribe").attr('class', result);
	            		
	            		$("#subscribe").attr("disabled", true);
	            		
	            	} else {
	            		
	            		$("#subscribe").attr('class', result);
	            		
	            		$("#subscribe").attr("disabled", false);
	            	}
					
					
				},
				error : () => {
					
					console.log("ajax 통신 실패");
				}
    			
    		});
    		
    	});
    	
    });
  
    </script>
    
</body>
</html>