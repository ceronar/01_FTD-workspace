<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta http-equiv="Cache-Control" content="no-cache" />
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/main.css?version=1.2" rel="stylesheet" type="text/css">


<link href="${pageContext.request.contextPath}/resources/css/inquiry.css?version=1.2" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/53a8c415f1.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@800&display=swap" rel="stylesheet">
<style>
	.main-div {
		margin-left: 140px;
	}

	/* 테스트 */
	.store,
	.store * {
		/* border: 1px solid black; */
		font-family: 'Noto Sans KR', sans-serif;
	}

	.store {
		width: 100%;
		height: 300px;
	}
	
	.store > div {
		text-align: center;
	}

	/* store */
	.store-address-title,
	.store-title,
	.store-detail {
		width: 100%;
		display: block;
		box-sizing: border-box;
	}

	.store-address-title {
		height: 15%;
		line-height: 45px;
	}

	.store-title {
		height: 30%;
		line-height: 90px;
		margin-bottom: 15px;
	}

	.store-detail {
		border-top: 3px solid rgba(235, 234, 234, 0.589);
		height: 55%;
	}
	
	.store-detail > div {
		font-size: 30px;
	}

	/* store-address-title */
	.store-address-icon,
	.store-address {
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
	.store-name,
	.store-subscribe-button {
		float: left;
		box-sizing: border-box;
	}

	.store-name {
		padding-left: 20px;
		text-align: left;
		width: 70%;
		height: 100%;
		font-size: 60px;
	}

	.store-subscribe-button {
		width: 30%;
		height: 100%;
	}

	/* store-detail */
	.store-subscribe,
	.store-rating,
	.store-review {
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
	.store-subscribe-text,
	.store-subscribe-count {
		width: 100%;
		display: block;
		box-sizing: border-box;
	}

	.store-subscribe-text {
		color: rgb(85, 85, 85);
		line-height: 82.5px;
		height: 50%;
	}

	.store-subscribe-count {
		font-size: 50px;
		line-height: 82.5px;
		height: 50%;
	}

	/* store-rating */
	.store-rating-text,
	.store-rating-count {
		width: 100%;
		display: block;
		box-sizing: border-box;
	}

	.store-rating-text {
		color: rgb(85, 85, 85);
		line-height: 82.5px;
		height: 50%;
	}

	.store-rating-count {
		font-size: 50px;
		line-height: 82.5px;
		height: 50%;
	}

	/* store-review */
	.store-review-text,
	.store-review-count {
		width: 100%;
		display: block;
		box-sizing: border-box;
	}

	.store-review-text {
		color: rgb(85, 85, 85);
		line-height: 82.5px;
		height: 50%;
	}

	.store-review-count {
		font-size: 50px;
		line-height: 82.5px;
		height: 50%;
	}

	.inquiry {
		display: none;
	}

	.sub-content {
		width: 100%;
		/* content 영역 크기 조정 */
		min-height: 800px;
		background-color: #ffffff;
		padding: 20px;
		box-sizing: border-box;
		/* border: 1px solid rgb(85, 85, 85); 위쪽(top)만 0으로 수정 */
		box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
		margin: 0;
		/* content의 마진 제거 */
		border-top: 10px solid rgb(232, 235, 237);
		
	}

	/* 네비게이션 메뉴 스타일 */
	.sub-menu button {
		width: 180px;
		display: inline-block;
		/* 가로로 나열되도록 변경합니다. */
		text-decoration: none;
		padding: 10px;
		/* 위아래 좌우 여백 조절 */
		margin: 0 5px;
		/* 좌우 간격 조절 */
		font-size: 22px;
		color: rgb(85, 85, 85);
		font-family: 'Noto Sans KR', sans-serif;
		/* background-color: #ccc; */
		/* border-radius: 5px; */
	}

	.enrollForm-btn {
		width: 100%;
	}

	.list-area>thead>tr>td {
		background-color: #4dcf42;
		color: white;
		text-decoration: double;
		font-weight: bold;
		font-size: 20px;
	}

	.list-area>thead>tr>td:hover {
		cursor: pointer;
		background-color: #27ae60;
	}
	
	.header {
		display: none;
	}
	
		
	/* 스타일 고침  */
	.goods-header {
		width: 100%;
		height: 50px;
		background-color: #ffffff;
    	box-sizing: border-box;
		position: sticky; /* 스크롤에 고정 */
		top: 0px;
		box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
	}

	.header-back, .header-title, .header-cart {
		float: left;
		height: 100%;
		box-sizing: border-box;
	}

	.header-back {
		width: 10%;
	}

	.header-back > span {
		font-size: 30px;
		line-height: 50px;
		color: rgb(85, 85, 85);
	}

	.header-title {
		line-height: 50px;
		font-size: 30px;
		font-family: 'Noto Sans KR', sans-serif;
		width: 80%;
	}

	.header-cart {
		width: 10%;
	}

	.header-cart > span {
		font-size: 35px;
		font-weight: 200;
		line-height: 50px;
		color: rgb(85, 85, 85);
	}
	
	.header-img {
		width: 100%;
		height: 720px;
		background-color: #ffffff;
    	box-sizing: border-box;
	}
	
	#thumbnail {
		width: 100%;
		height: 100%;
		box-sizing: border-box;
	}
	
	/* sub-content */
	.sub-content {
		width: 100%;
		background-color: #ffffff;
    	box-sizing: border-box;	
	}
	
	.sub-menu {
		position: sticky; /* 스크롤에 고정 */
		top: 50px;
		background-color: #ffffff;
		border-bottom: 1px solid rgba(0, 0, 0, 0.1);
		padding-bottom: 10px;
	}
	
	/* sub-menu */
	.sub-menu a {
	width: 180px;
    display: inline-block; /* 가로로 나열되도록 변경합니다. */
    text-decoration: none;
    padding: 10px; /* 위아래 좌우 여백 조절 */
    margin: 0 5px; /* 좌우 간격 조절 */
	font-size: 22px;
    color: rgb(85, 85, 85);
    font-family: 'Noto Sans KR', sans-serif;
    /* background-color: #ccc; */
    /* border-radius: 5px; */

	}
	
	.icon1 {
		width: 40px;
		height: 40px;
		box-sizing: border-box;
	}

	.icon2 {
		margin-right: 10px;
		width: 40px;
		height: 40px;
		box-sizing: border-box;
	}

	#subscribe {
		width: 150px;
		height: 60px;
		box-sizing: border-box;
		font-size: 25px;
		border-radius: 5px;
		box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
	}
	
	.sub-menu:hover{
		cursor: pointer;
	}
	
	
/*----------------홍보---------------------------------------------------*/
  .checkout-btn {
                display: block;
                max-width: 1000px;
                margin: 20px auto;
                padding: 15px;
                background-color: #007bff;
                color: #ffffff;
                text-align: center;
                text-decoration: none;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 18px;
                transition: background-color 0.3s;
            }
	 .cart {
                width: 100%;
            }

            .market {
                margin-bottom: 20px;
            }

            .item-info img {
                max-width: 100%;
                max-height: 100%;
                margin-right: 10px;
            }

            .item-details {
                flex: 1;
                display: flex;
                flex-direction: column;
            }

            .item-quantity label {
                margin-bottom: 5px;
            }

            .subtotal {
                text-align: right;
                font-weight: bold;
                font-size: 18px;
                margin-top: 10px;
            }

            /* content 홍보리스트쪽 */
            .promotion {
                list-style: none;
            }

            .promotion a {
                text-decoration: none;
                color: black;
            }
            
            .profile{
            	margin-right : 35px;
            }
            

            .profile>#profile_1,
            #profile_2 {
                display: inline-block;
                vertical-align: top;
                /* Align to the top */
            }

            #profile_1 img {
                width: 50px;
                height: 50px;
                border-radius: 50%;
                /* Make it round */
            }

            .product span {
                display: block;
            }

			#product{
			margin: auto;
			}
			
            .product {
                display: inline-block;
                border: 1px solid black;
                margin-right: 10px;
                /* Add some spacing between products */
                box-sizing: border-box;
                border-radius: 8px;
                /* Rounded border */
                cursor: pointer;
                /* Change cursor on hover */
                transition: background-color 0.3s;
                
            }

            .product:hover {
                background-color: #f5f5f5;
                /* Change background color on hover */
            }

            .product_options {
                margin-top: 10px;
            }

            .product_image {
                margin-top: 10px;
                width: 710px;
                height: 310px;
            }

            .product_image div {
                box-sizing: border-box;
            }

            ul {
                padding-left: 0px;
            }

            .product_image_1 {
                height: 300px;
                width: 400px;

                border-radius: 50px 0px 0px 50px;
            }

            .product_image_1>img {
                width: 100%;
                height: 100%;
                border-radius: 50px 0px 0px 50px;
     

            }

            .product_image_2 {
                height: 300px;
                width: 294px;
                  border: 2px solid white;

            }

            .product_image_2>div {
                height: 50%;
                width: 100%;


            }

            .product_image_2>.product_image_2_1 {
                border-radius: 0px 50px 0px 0px;
            }

            .product_image_2>.product_image_2_1>img {
                border-radius: 0px 50px 0px 0px;
                  border: 2px solid white;
                
            }

            .product_image_2>.product_image_2_2 {
                border-radius: 0px 0px 50px 0px;
            }

            .product_image_2>.product_image_2_2>img {
                border-radius: 0px 0px 50px 0px;
                  border: 2px solid white;
            }


            .product_image_2 img {
                width: 100%;
                height: 100%;
            }

            #profile_2_2>span {
                font-size: 15px;
                color: rgb(143, 143, 143);
            }

            .product_image .product_image_1,
            .product_image_2 {
                display: inline-block;
            }

            h2 {
                margin: 0;
                font-size: 18px;
                color: #007bff;
            }

            #filter>a {
                text-decoration: none;
                font-size: 20px;
                padding: 8px;
                margin-right: 20px;
                border-radius: 20px;
                background-color: rgba(220, 220, 220, 0.561);
                color: black;
                transition: background-color 0.3s, border-color 0.3s;
                /* Add transition effect */
                border: 1px solid transparent;
                /* Add border */


            }

            #loading {
                display: none;
                text-align: center;
                padding: 10px;
                border: 1px solid #ddd;
                background-color: #f9f9f9;
                position: fixed;
                bottom: 0;
                width: 100%;
            }

            .skeleton {
                background: #f0f0f0;
                animation: loading 1.5s infinite ease-in-out;
                border-radius: 4px;
                margin-bottom: 10px;
            }

            @keyframes loading {
                0% {
                    opacity: 0.3;
                }

                50% {
                    opacity: 0.6;
                }

                100% {
                    opacity: 0.3;
                }
            }

            .top {
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .top a {
                margin-right: 10px;
                /* Adjust the margin as needed */
            }
            
            	.detail:hover{
				cursor: pointer;
			}
	
            
            /* 파일 두개일때 */
/*--------------------------------------------------------*/
            .product2_image_1 {
                height: 300px;
                width: 350px; 
                border-radius: 50px 0px 0px 50px;
                 border: 2px solid white;
            }

            .product2_image_1>img {
                width: 100%;
                height: 100%;
                border-radius: 50px 0px 0px 50px;
                
            }

            .product2_image_2 {
                height: 300px;
                width: 350px;
                border-radius: 0px 50px 50px 0px;
                 border: 2px solid white;
            }
            .product2_image_2>img {
                width: 100%;
                height: 100%;
                border-radius: 0px 50px 50px 0px;
            }
            
           
/*--------------------------------------------------------*/

/* 파일 한개일때 */
            .product1_image_1 {
                height: 300px;
                width: 650px;
                
                border-radius: 50px 50px 50px 50px;
            }

            .product1_image_1>img {
                width: 100%;
                height: 100%;
                border-radius: 50px 50px 50px 50px;
         
            }
/*-------------------후기------------------------------------------------------------------------*/

.review {
            border-bottom: 1px solid #ddd;
            padding: 15px 0;
            justify-content: space-between;
            align-items: center;
        }

	

        .review #img_1 {
            width: 860px;
            height: 300px;
            border-radius: 5%;

            margin-right: 10px;
        }

        .review #img_2 {
            width: 120px;
            height: 80px;
        }

        .review-content {
            flex: 1;
        }

        .review-content h2 {
            margin: 0;
            font-size: 18px;
            color: #007bff;
        }

        .review-content p {
            margin: 10px 0;
        }

        .review-date {
            color: #777;
            font-size : 15px;
        }	
         #name > div {
            display: inline-block;
        }

        #product {
            border-spacing: 0px;
            border-radius: 10px;
            border-color: lightgray;
            margin:auto;
        }

        #review_footer > div {
            display: inline-block;
        }

        #review_footer {
            margin-top: 15px;
            display: flex;
            justify-content: space-between;
        }

        #review_product {
            margin-top: 15px;
        }

        #review_footer_2 {
            text-align: right;
            margin-right: 20px;
        }

        #product #img_2_text_2{
            color: #777;
            font-size : 15px;
        }
        .goodSell:hover{
        cursor:pointer;
        }
        
        .goods_title{
       	text-align: center;
       	margin-right : 100px;
        }
        
</style>
<script>

	$(function () {

		ajaxSelectSellerMarketList();
		// console.log(${ requestScope.sellerNo });
		ajaxSelectSubscribe();

	});

	// 마켓 정보 조회
	function ajaxSelectSellerMarketList() {

		$.ajax({

			url: 'ajaxSelectSellerMarketList.se',
			type: 'get',
			data: { sellerNo: ${ requestScope.sellerNo }},
			success: function(result) {

				let str	= '<div class="store-address-title">'
					+ '<div class="store-address-icon"><img class="icon1" src="resources/images/sample/map.png"></img></div>'
					+ '<div class="store-address">' + result[0].address + '</div>'
					+ '</div>'
					+ '<div class="store-title">'
					+ '<div class="store-name">' + result[0].companyName + '</div>'
					+ '<div class="store-subscribe-button">';
					
					if(${ !empty sessionScope.loginUser }) {
						str += '<button id="subscribe">단골맺기</button>'
						} 
			
				str += '</div>'
					+ '</div>'
					+ '<div class="store-detail">'
					+ '<div class="store-subscribe">'
					+ '<div class="store-subscribe-text">단골</div>'
					+ '<div class="store-subscribe-count"><img class="icon2" src="resources/images/sample/person.png">' + result[3] + '</div>'
					+ '</div>'
					+ '<div class="store-rating">'
					+ '<div class="store-rating-text">평점</div>'
					+ '<div class="store-rating-count"><img class="icon2" src="resources/images/sample/star.png">' + result[1] + '</div>'
					+ '</div>'
					+ '<div class="store-review">'
					+ '<div class="store-review-text">후기</div>'
					+ '<div class="store-review-count">' + result[2] + '</div>'
					+ '</div>'
					+ '</div>';
					
					$('.store').append(str);
					
					$('.header-title').text(result[0].companyName);
					
					$('#thumbnail').attr('src', result[4].changeName);
			},
			error: function() {

				console.log("ajax 통신 실패");
			}
            
		});
				
	}
	
	// 찜하기 조회
	function ajaxSelectSubscribe() {
		
		let memberNo = ${!empty sessionScope.loginUser.memberNo ? sessionScope.loginUser.memberNo : 0 };
		
		$.ajax({
			url : 'ajaxSelectSubscribe.se',
			type: 'get',
			data : { memberNo : memberNo, sellerNo : ${requestScope.sellerNo}},	
			success: function(result) {

				if (result > 0) {
					
					// console.log(result);

					$("#subscribe").css("background-color", "#388755");

				} else {
					
					// console.log(result);

					$("#subscribe").css("background-color", "lightgray");

				}

			},
			error: function() {

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
				
				<div class="goods-header">
					<div class="header-back"><span class="material-symbols-outlined" onClick = "history.back();">arrow_back_ios_new</span></div>
					<div class="header-title">${ requestScope.goodsSell.sellTitle }</div>
					<div class="header-cart" onclick="location.href='basket.me';"><span class="material-symbols-outlined">shopping_cart</span></div>
	            </div>
	            
				<div class="header-img">
					<img id="thumbnail" src="${sessionScope.loginSeller.changeName }">
				</div>

				<div class="content">
					<div class="store"></div>
				</div>

				<div class="sub-content">
				
					<div class="sub-menu">
						<button onclick="selectSellerPromotion()" 				class="promotion-btn">홍보</button>
						<button onclick="selectSellerReview()" 					class="review-btn">후기</button>
						<button onclick="selectSellerInquiry()"					class="inquiry-btn">문의</button>
					</div>
					
					<div align="center">
						<ul>
							<li class="promotion"></li>
						</ul>
						
						<div class="review"></div>
						
						<div class="inquiry">
							<table class="list-area">
								<thead>
									<tr>
										<td colspan="6">문의 작성 하기</td>
									</tr>
									<tr>
										<th class="inqNo" style="width : 7%;">번호</th>
										<th style="width : 15%;">답변여부</th>
										<th style="width : 38%;">제목</th>
										<th style="width : 10%;">문의자</th>
										<th style="width : 10%">조회수</th>
										<th style="width : 15%;">등록일</th>
									</tr>

								</thead>
								<tbody class="list-tbody">

								</tbody>
							</table>	
						</div>
						
					</div>
				</div>
					
					
					
					
					
				</div>
			</div>
		</div>
<script>
		
	$(function () {
		
		let memberNo = ${!empty sessionScope.loginUser.memberNo ? sessionScope.loginUser.memberNo : 0 };
		
		// 찜하기 클릭 이벤트
		$(".store").on("click", "#subscribe", () => {
			$.ajax({
				url: "ajaxClickSubscribe.se",
				type: "get",
				data: { memberNo: memberNo, sellerNo: ${ requestScope.sellerNo }},
				success : result => {
					
					if(result == "추가") {
						
						$("#subscribe").css("background-color", "#388755");
						
					} else if(result == "삭제") {
										
						$("#subscribe").css("background-color", "lightgray");
						
					} else {
						
						location.href = "sellerDetailPage.se?sno=" + ${ requestScope.sellerNo };
					}
				},
				error : () => {
					console.log("ajax 통신 실패");
				}
    		});
    	});
		
		//
		$(".review").on('click', '.detail', function (e) {
			//console.log(e.currentTarget.children.item(2).value);
			let rno = e.currentTarget.children.item(2).value;
			location.href = "rdlist.bo?rno=" + rno;
		});
		
		//
		$(".promotion").on('click', '.detail', function (e) {
			//console.log(e.currentTarget.children.value);
			let pno = e.currentTarget.children.item(0).value;
			location.href = "pdlist.bo?pno=" + pno;
		});
		
		//
		$('.list-area>thead>tr>td').on('click', function () {
			location.href = 'enrollForm.in?sno=' + ${ requestScope.sellerNo };
		});
		
		//
		$('.list-area tbody').on('click', 'tr', function () {
			// 클릭된 행에서 번호를 가져와서 ino 변수에 할당합니다.
			var ino = $(this).find('.inqNo').text();

			// 현재 위치한 페이지에서 문의 번호(ino)를 가지고 detail.in 페이지로 이동합니다.
			window.location.href = 'detail.in?ino=' + ino + '&sno=${requestScope.sellerNo}';
		});
		
    });
</script>

						<script>

							var page = 0;
							var pageSize = 20;

							$(document).ready(function () {
								 
								selectSellerInquiry();

				                $(window).scroll(function () {
				                    if ($(window).scrollTop() + $(window).height() > $(document).height() - 10) {
				                        page++;
				                        selectSellerInquiry();
				                    }
				                });
				            });
							
						

							function selectSellerInquiry() {
							
								
									$(".promotion").hide();
									$(".promotion").addClass("stop-scrolling");
									$(".review").hide();
									$(".review").addClass("stop-scrolling");
									$(".inquiry").show();
									$(".inquiry").removeClass("stop-scrolling");
									if ($(".inquiry").css("display") === "none") {
										$(".inquiry").css("display", "block");
									}
									$(".inquiry-btn").attr("disabled", true);
									$(".review-btn").attr("disabled", false);
									$(".promotion-btn").attr("disabled", false);
			

						
								$.ajax({
									url: 'ajaxSelectList.in',
									type: 'get',
									data: { page: page, size: pageSize, sellerNo: '${requestScope.sellerNo}' },
									success: function (result) {
										result.forEach(function (item) {
											// responseDate의 값에 따라 answer에 '미답변' 또는 '답변완료'를 할당합니다.
											let answer = item.responseDate ? '답변완료' : '미답변';

											// 각 객체의 속성을 추출하여 테이블에 추가합니다.
											var row = '<tr>';
											row += '<td name="inqNo" class="inqNo">' + item.inqNo + '</td>' +
												'<td name="answer" class="answer">' + answer + '</td>' +
												'<td name="inqTitle" class="inqTitle">' + item.inqTitle + '</td>' +
												'<td name="memberId" class="memberId">' + item.memberId + '</td>' +
												'<td name="count" class="count">' + item.count + '</td>' +
												'<td name="createDate" class="createDate">' + item.createDate + '</td>' +
												'</tr>';

											$('.list-tbody').append(row);
										});
									},
									error: function () {
										console.log("ajax 통신 실패!");
									}
								});
							}

</script>		

<script>
							var page = 0;
							var pageSize = 5; // 초기 로딩 시 20개씩 불러오기
							


	 							$(document).ready(function () {
								 
	 								selectSellerReview();

					                $(window).scroll(function () {
					                    if ($(window).scrollTop() + $(window).height() > $(document).height() - 10) {
					                        page++;
					                        selectSellerReview();
					                    }
					                });
					            });


							function selectSellerReview() {
								promotionNum = 0;
								reviewNum = 1;
								inquiryNum = 0;
									$(".promotion").hide();
									$(".promotion").addClass("stop-scrolling");
									$(".inquiry").hide();
									$(".inquiry").addClass("stop-scrolling");
									$(".review").show();
									$(".review").removeClass("stop-scrolling");
									$(".review-btn").attr("disabled", true);
									$(".promotion-btn").attr("disabled", false);
									$(".inquiry-btn").attr("disabled", false);
									
								$(window).scroll(function () {
									if ($(window).scrollTop() + $(window).height() > $(document).height() - 10) {
										page++;
										selectSellerReview();
									}
								});

								$.ajax({
									url: 'list.re',
									type: 'get',
									data: { page: page, size: pageSize, sno: ${ requestScope.sellerNo } },

									beforeSend: function () {
			                            setTimeout(5000);
			                        },
									success: function (data) {

								console.log("통신성공!!!");
								console.log(data);


								data.forEach(function (val) {


									let str = '<div class="review-content">'
										+ '<div id="name">'
										+ '<div> ' + val[0].memberNo + '</div>'
										+ ' <div><p class="review-date">'+ val[0].createDate +'</p></div>'
										+ '</div>'
										+ '<div class="detail">'
										+ '<h2>후기</h2>'
										+ '<p>'+ val[6] +'</p>'
										+ '<input type="hidden" value="' + val[0].revNo + '">'
										if(val[5].length >= 1){
									str +=  '<div>'
										+ '<img src="' + val[5][0]+ '" id="img_1">'
										+ '</div>'
										}
									str += '</div>'
										+ '<div>'
										+ '<div id="review_product">'
										+ '<table border="1" id="product" class="goodSell">'
										  if(val[4] != null){
									str +=		'<input type="hidden" value="'+ val[4].sellNo +'">'		  
										  }
									str += 		'<tr>'
										 if(val[2] != null){
									str += '<td><img src="'+ val[2].changeName +'" id="img_2"></td>'
										 }
									str += '<td width="685px;">'
										 if(val[4] != null){
											  let count = val[4].count.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
								  str += 	'<div class="goods_title" >'	  
										+ '<div>'+ val[4].sellTitle +'</div>'
										+ '<div id="img_2_text_2">'+ count +'원</div>'
										+ '</div>'
										 }
									str += '</td>'
										+ '<td><i class="fas fa-chevron-right"></i></td>'
										+ '</tr>'
										+ '</table>'
										+ '</div>'

										+ '<div>'

										+ '<div id="review_footer">'

										+ '<div>'
										+ '<span>'
										+ '<span><i class="fas fa-star" style="color : rgb(255, 225, 0)"></i> ' + val[0].starRating + '</span>'
										+ '</span>'
										+ '</div>'

										+ '<div id="review_footer_2">'
										+ '<span>'
										+ '<span> <i class="far fa-comment"></i></span>'
										+ '<span>' + val[3] + '</span>'
										+ '</span>'
										+ '</div>'
										+ '</div>'
										+ '</div>'
										+ '</div>'
										+ '</div>'
										+ '<hr>';


									$('.review').append(str);
								});
							},

							error: function () {
								console.log("통신실패!");
							}
                });
            }

						</script>

				<script>
		           $(function () {
		
		               $(".review").on('click', '.goodSell', function (e) {
		
		               	// console.log(e.currentTarget.children.item(0).value);
		               	 
		                   let sno = e.currentTarget.children.item(0).value;
		
		                   //
		
		                   location.href = "goodsDetailPage.go?sno=" + sno;
		               });
		           });
		       </script>


	<script>


				
							var page = 0;
							var pageSize = 5; // 초기 로딩 시 20개씩 불러오기

							 $(document).ready(function () {
								 
								 selectSellerPromotion();

					                $(window).scroll(function () {
					                    if ($(window).scrollTop() + $(window).height() > $(document).height() - 10) {
					                        page++;
					                        selectSellerPromotion();
					                    }
					                });
					            });
							
							function selectSellerPromotion() {
								promotionNum = 1;
								reviewNum = 0;
								inquiryNum = 0;
									$(".inquiry").hide();
									$(".inquiry").addClass("stop-scrolling");
									$(".review").hide();
									$(".review").addClass("stop-scrolling");
									$(".promotion").show();
									$(".promotion").removeClass("stop-scrolling");

									$(".inquiry-btn").attr("disabled", false);
									$(".review-btn").attr("disabled", false);
									$(".promotion-btn").attr("disabled", true);
	
								$.ajax({
									url: 'list.pr',
									type: 'post',
									data: {
										sno: ${ requestScope.sellerNo },
									page: page,
									size: pageSize
	                    	},
	                    	beforeSend: function () {
	                            setTimeout(5000);
	                        },
							success: function (data) {

								console.log("통신성공!!!");
								console.log(data);


								// Remove skeleton UI
								$('.skeleton').remove();

								// Append legacy data to the container

								// 프로필사진, 홍보사진 정도남았고 로딩, 프론트좀더깍고 ㄹㅇ여유되면 ui클릭시 상품구매로이동까지

								data.forEach(function (val) {

									let marketImg = (val[2] == null) ? "/ftd/resources/uploadFiles/sellerPage/pngwing.com.png" :  val[2].changeName;
									let str = '<div>'
										+ '<div class="profile">'
										+ '<div id="profile_1" style="width : 50px; height : 50px;">'

										+ '<img src="' + marketImg + '" alt="">'

										+ '</div>'
										+ '<div id="profile_2">'
										+ '<span>'
										+ val[1].companyName

										+ '</span>'
										+ '<div id="profile_2_2">'
										+ '<span>'
										+ val[1].address
										+ '</span>'
										+ '<span>('+val[0].createDate+')</span>'
										+ '</div>'
										+ '</div>'
										+ '</div>'
										+ '</div>'

										+ '<div>'
										+ '<div >'
										+ '<div class="detail">'
										+ '<input type="hidden" value="' + val[0].promotionNo + '">'
										+ '<h2>판매</h2>'
										+ val[6];

									if (val[5].length == 3) {
										str += '<div class="product_image" >'
											+ '<div style="display : flex; justify-content: center; align-items: center; ">'
											+ '<div class="product_image_1">'
											+ '<img src="' + val[5][0] + '" >'
											+ '</div>'
											+ '<div class="product_image_2">'
											+ '<div class="product_image_2_1">'
											+ '<img src="' + val[5][1] + '">'  <!-- 체인지네임이 널일때는 기본사진이들어가게해야뎀 -->
											+ '</div>'
											+ '<div class="product_image_2_2">'
											+ '<img src="' + val[5][2] + '">'
											+ '</div>'
											+ '</div>'
											+ '</div>'
											+ '</div>';
									} else if (val[5].length == 2) {

										str += '<div class="product_image">'
											+ '<div style="display : flex; justify-content: center; align-items: center; ">'
											+ '<div class="product2_image_1">'
											+ '<img src="' + val[5][0] + '" >'
											+ '</div>'
											+ '<div class="product2_image_2">'
											+ '<img src="' + val[5][1] + '">'
											+ '</div>'
											+ '</div>'
											+ '</div>'

									} else if (val[5].length == 1) {

										str += '<div class="product_image">'
											+ '<div>'
											+ '<div class="product1_image_1">'
											+ '<img src="' + val[5][0] + '" >'
											+ '</div>'
											+ '</div>'
											+ '</div>'

									} else {


									}

									str += '</div>'
										+ '<div class="product_options">'
										+ '<div>'
										+ '<div class="swiper-wrapper">'
										+ '<div class="product" id="product_1">'
										+ '<div>'
										+ '<span>해녀 채취 말똥성게</span>'
										+ '<span>12,500원~</span>'
										+ '</div>'
										+ '</div>'
										+ '<div class="product" id="product_2">'
										+ '<div>'
										+ '<span>홍새우 (단새우)급냉</span>'
										+ '<span>23,000원~</span>'
										+ '</div>'
										+ '</div>'
										+ '</div>'
										+ '</div>'
										+ '</div>'
										+ '</div>'

										+ '<div align="left" style="width : 780px">'
										+ '<span><i class="far fa-comment"></i></span>'
										+ '<span>'
										+ val[4]
										+ '</span>'
										+ '</div>'

										+ '<hr>';


									$('.promotion').append(str);

								});

									return false;


							},
							error: function() {

								console.log("댓글 작성용 ajax 통신 실패!");
							}
	                   });
	        	
	           }
						</script>

</body>
</html>