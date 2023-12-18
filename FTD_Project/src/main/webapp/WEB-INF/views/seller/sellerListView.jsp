<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/main.css?version=1.2" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@800&display=swap" rel="stylesheet">
<style>
	
	/* 전체 div */
	.store {
		width: 100%;
		height: 200px;
		box-shadow: 0 0 10px rgba(235, 234, 234, 0.589);
	}

	/* 테스트 */
	.store div {
		/* border: 1px solid black; */
		font-family: 'Noto Sans KR', sans-serif;
	}

	/* store div 공통 css */
	.store-img, .store-content {
		height: 100%;
		float: left;
		box-sizing: border-box;
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
		width: 75%;
	}

	/* store-content 공통 css */
	.store-title, .store-goods, .store-detail {
		width: 100%;
		display: block;
		box-sizing: border-box;
	}
	
	/* store-title 공통 css */
	.store-title > div {
		float: left;
		height: 100%;
		text-align: center;
		line-height: 80px;
		box-sizing: border-box;
	}

	.store-title {
		width: 100%;
		height: 40%;
		font-family: 'Noto Sans KR', sans-serif;
	}

	.store-title-img {
		width: 10%;
		height: 100%;
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
	
	/* navi css */
	#nav1 {
	    display: none !important;
	}
	
	#nav2 {
	    display: block !important;
	}
	
	#nav3 {
	    display: none;
	}
	
	.menu1 {
		font-size: 25px;
		border-bottom: 3px solid black;
		color: black;
	}
	
	.icon3 {
		height: 40px;
		width: 60px;
		line-height: 38px;
		margin-top: 20px;
		margin-left: 15px;
		box-sizing: border-box;
		background-color: rgba(186, 231, 171, 0.966);
		color: rgb(44, 116, 44);
		border-radius: 4px;
		
	}
	
	.icon2 {
		box-sizing: border-box;
		height: 40px;
		width: 40px;
	}
	
	.icon1 {
		margin-top: 1px;
		box-sizing: border-box;
		height: 40px;
		width: 40px;
	}
	

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
	
	// 페이지 로딩시 불러올 리스트 개수 변수 설정
	var page = 0;
	var pageSize = 10; // 초기 로딩 시 20개씩 불러오기
	
	 $(document).ready(function () {

	        $(window).scroll(function () {
	            if ($(window).scrollTop() + $(window).height() >= $(document).height() - 1) {
	                
	            	ajaxSelectSellerList();
	            	page++;	         
	            }
	        });
	    });
	
	 function ajaxSelectSellerList() {
	      
	        $.ajax({
	            url : 'ajaxSelectSellerList.se',
	            type: 'get',
	            data: { page: page, pageSize: pageSize },
	            success: function(result) {
	                      	
	                result.forEach(function (item, index) {
	                    
	                	console.log(item[1].changeName)
	                			
	                    let str = '<div class="store">'
	                    		+ '<input type="hidden" value="' + item[0].sellerNo + '">'
	        					+ '<div class="store-img">';
	        					
	        				
	        						
	        					str += '<img src= "'+ item[1].changeName +'">';
	        				
	                    		
	        					str += '</div>'
		        					+ '<div class="store-content">'	
		        						
		        					 	+ '<div class="store-title">'
		        							+ '<div class="store-title-img"><div class="icon3">판매중</div></div>'
		        							+ '<div class="store-name">' + item[0].companyName + '</div>'
		        							+ '<div class="store-address">'+ item[0].address + '</div>'
		        						+ '</div>'
		        				
		        						+ '<div class="store-goods">'+ item[0] + '</div>'
		
		        						+ '<div class="store-detail">'
		        							+ '<div class="store-star"><img class="icon2" src= "resources/images/sample/star.png"></div>'
		        							+ '<div class="store-rating">' + item[2] + '</div>'
		        							+ '<div class="store-review">(' + item[3] + ')</div>'
		        							+ '<div class="store-person"><img class="icon1" src= "resources/images/sample/person.png"></div>'
		        							+ '<div class="store-subscribe">' + item[4] + '</div>'
		        						+ '</div>'
		        					+ '</div>'   
		                    	+'</div>'
		                    	+ '<br><br>'
	                    	
	                    	$('.content').append(str);
	                             
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

	<script>
    	$(function () {
            	
        	ajaxSelectSellerList();    

            $(".content").on('click', '.store', function (e) {

            	let sno = e.currentTarget.children.item(0).value;

                console.log(sno);

                location.href = "sellerDetailPage.se?sno=" + sno;
                
            });
    	});
	</script>

</body>
</html>