<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${pageContext.request.contextPath}/resources/css/main.css?version=1.2" rel="stylesheet" type="text/css">
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    <style>
        .wrapper {
            display: flex;
            flex-direction: column; /* 섹션을 세로로 정렬 */
            align-items: center;
            min-height: 100vh;
        }

        .content {
            margin: 0 auto;
            padding: 20px;
            width: 100%; /* 컨텐츠를 전체 너비로 확장 */
            box-sizing: border-box;
        }

        table {
        	box-sizing: border-box;
        	text-align: center;
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }
		
		.marketName {
			text-align: left;
			padding-left: 30px;
		}
		
		.quantity-outer>div {
			justify-content : center;
		}
		
        .quantity-buttons {
            display: flex;
            align-items: center;
            height: 204px;
        }
        
        .quantity-buttons>button{
        	box-sizing: border-box;
        	height: 30px;
        	width: 30px;
        	text-align: center;
        }

        .quantity-button {
            cursor: pointer;
        }
        
        .quantity-input {
        	box-sizing: border-box;
            width: 50px;
            height: 30px;
            text-align: center;
        }

        .product-image {
            max-width: 200px;
            height: 200px;
            object-fit: cover;
            border-radius: 5px;
        }

        .total-section {
            display: flex;
            align-items: center;
            margin-top: 20px;
        }
		
		.total-section>div {
			margin: 20px;
		}
		
        .total-section p {
            margin: 5px 0;
        }

        .total-section button {
            background-color: #FEE500;
            color: black;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 20px;
            margin: 10px;
            font-weight: bold;
        }
        
		.material-symbols-outlined {
			color: gray;
		  font-variation-settings:
		  'FILL' 0,
		  'wght' 400,
		  'GRAD' 0,
		  'opsz' 24
		}
		
		.deleteBtn {
			background-color: rgba(0,0,0,0);
			border: none;
			cursor: pointer;
		}
		
		#kakaoModalContainer {
			width: 100%;
			height: 100%;
			position: fixed;
			top: 0;
			left: 0;
			display: flex;
			justify-content: center;
			align-items: center;
			background: rgba(0, 0, 0, 0.5);
		}
		
		.popup {
			position: absolute;
			background-color: #ffffff;
			width: 300px;
			height: 150px;
			padding: 15px;
		}
		
		.popup table {
			border: none;
		}
		
		.total-section img {
			margin: 10px;
			height: 100px;
			width: 150px;
		}
		
		.requestBox {
			width: 300px;
			height: 100px;
			padding: 10px;
			box-sizing: border-box;
			border: solid 2px #1E90FF;
			border-radius: 5px;
			font-size: 16px;
			resize: none;
		}
		
		.price-area {
			width: 150px;
			height: 60px;
		}
		
		.buyAllItems, .buyItem {
			height: 25px;
			width: 25px;
			margin: auto;
			border-radius: 10px;
		}
		
		input[type="checkbox"]{
        	display: none;
	      }
		input[type="checkbox"] + label{
	        display: inline-block;
	        width: 25px;
	        height: 25px;
	        border:3px solid #707070;
	        position: relative;
	        border-radius: 5px; 
	      }
		input[class="buyItem"]:checked + label:after, input[class="buyAllItems"]:checked + label:after{
	        content:'✔';
	        font-size: 20px;
	        width: 25px;
	        height: 25px;
	        text-align: center;
	        position: absolute;
	        left: 0;
	        top: 0;
	      }
		
    </style>
</head>
<body>
    <div class="wrapper">
        <div class="center-div">
	        <jsp:include page="../common/sidebar.jsp" />
	        <div class="main-div">
		        <jsp:include page="../common/header.jsp" />
		        <div class="content">
		        	<form id="payForm" method="post" action="paySuccess">
		        		<input type="hidden" name="memberNo" value="${ sessionScope.loginUser.memberNo }"/>
		        		<input type="hidden" name="orderName" value="${ sessionScope.loginUser.memberName }"/>
						<input type="hidden" name="phone" value="${sessionScope.loginUser.phone }"/>
						<input type="hidden" name="zipCode" value="${ sessionScope.loginUser.zipCode }"/>
						<input type="hidden" name="address" value="${ sessionScope.loginUser.address }"/>
						<input type="hidden" name="detailAddress" value="${sessionScope.loginUser.detailAddress }"/>
			            <!-- 장바구니 내용 -->
			            <h2>장바구니</h2>
			            <table>
			                <thead>
			                    <tr>
			                    	<th><input type="checkbox" id="checkAll" class="buyAllItems" /><label for="checkAll"></label></th>
			                    	<th>이미지</th>
			                        <th>상품명</th>
			                        <th>수량</th>
			                        <th width="150">가격</th>
			                        <th>삭제</th>
			                    </tr>
			                </thead>
			                <tbody>
			                	<!-- 상품반복 -->
			                	<c:forEach var="c" items="${ requestScope.list }">
			                    <tr>
			                    	<td><input type="checkbox" class="buyItem" id="check${ c.goodNo }" name="goodNo" value="${ c.goodNo }" /><label for="check${ c.goodNo }"></label></td>
			                        <td>
			                            <img src="${ c.changeName }" alt="상품사진" class="product-image">
			                        </td>
			                        <td>${ c.goodTitle }</td>
			                        <td class="quantity-outer">
			                        	<div class="quantity-buttons">
			                            	<button type="button" class="quantity-button" value="-1">-</button><input type="text" class="quantity-input" name="goodCount" value="${ c.count }" readonly><button type="button" class="quantity-button" value="1">+</button>
			                            </div>
			                            <input type="hidden" class="price" name="goodPrice" value="${ c.price }">
			                            <input type="hidden" class="stock" name="goodStock" value="${ c.stock }">
			                        </td>
			                        <td>${ c.price * c.count }원</td>
			                        <td><button type="button" class="deleteBtn"><span class="material-symbols-outlined">close</span></button></td>
			                    </tr>
			                    </c:forEach>
			                    <!-- 상품반복 -->
			                </tbody>
			            </table>
			            
			            <!-- 총 배송비 및 총 가격 -->
			            <div class="total-section">
				            <div class="request-area">
				            	<h4>주문시 요청사항</h4>
				            	<textarea class="requestBox" name="request" rows="2" cols="20" placeholder="주문시 요청할 사항 입력"></textarea>
							</div>
			                <div class="price-area">
			                    <p><strong>배송비: <span id="deliver">0</span>원</strong></p>
			                    <p><strong>총 가격: <span id="totalPrice">0</span>원</strong></p>
			                </div>
			                <img src="${pageContext.request.contextPath}/resources/images/sample/kakaoPay02.png" />
			                <!-- 결제 버튼 -->
			                <button class="kakaoPay" type="submit" id="pay" onclick="return false;">카카오페이로<br>결제하기</button>
			            </div>
		            </form>
		        </div>
        
		        <jsp:include page="../common/footer.jsp" />
	        </div> 
	              
        </div>
    </div>


	<script>
		// JavaScript to calculate total price
	    document.addEventListener("DOMContentLoaded", function () {
	        updateTotalPrice();
	
	        // Listen for changes in checkboxes and quantity inputs
	        var checkboxes = document.querySelectorAll('.buyItem, .quantity-input');
	        checkboxes.forEach(function (checkbox) {
	            checkbox.addEventListener('change', updateTotalPrice);
	        });
	    });
	
	    function updateTotalPrice() {
	        var total = 0;
	
	        // Iterate over each checkbox with class 'buyItem'
	        var checkboxes = document.querySelectorAll('.buyItem');
	        checkboxes.forEach(function (checkbox) {
	            if (checkbox.checked) {
	                var quantityInput = checkbox.parentElement.parentElement.querySelector('.quantity-input');
	                var quantity = parseInt(quantityInput.value, 10);
	                var price = parseInt(checkbox.parentElement.parentElement.querySelector('.price').value);
	                total += quantity * price;
	                total += 2500;
	            }
	        });
	
	        // Update the total price display
	        var totalPriceDisplay = document.getElementById('totalPrice');
	        totalPriceDisplay.textContent = total.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
	        $("#deliver").text(($(".buyItem:checked").length * 2500).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","));
	    }
		
     $(function () {
    	 updateTotalPrice();
    	 
		// 전체 상품 선택 함수
		$(".buyAllItems").change(function(){
 			$(".buyItem").prop('checked', $(".buyAllItems").is(":checked"));
 			updateTotalPrice()
 		});
 		
 		$(".buyItem").click(function() {
 			if($(".buyItem:checked").length != $(".buyItem").length){
 				$(".buyAllItems").prop('checked', false);
 			} else {
 				$(".buyAllItems").prop('checked', true);
 			}
 		});
 		
 		var IMP = window.IMP;
         IMP.init('imp48134478'); //가맹점 식별코드
         $('#pay').on('click', function(e) {
        	let buyName = $(".buyItem:checked").eq(0).parent().parent().children('td:eq(2)').text();
        	if(($(".buyItem:checked").length - 1) > 0) {
        		buyName = buyName + " 외 " + ($(".buyItem:checked").length - 1) + "개";
        	}
        	let totalPrice = Number(document.getElementById('totalPrice').innerText.split(',').join(""));
        	console.log(totalPrice);
     		e.preventDefault();
     		if($(".buyItem:checked").length > 0){
    				IMP.request_pay({
    				  pg: "kakaopay",
    				  pay_method: "card", 									// 생략가능
    				  merchant_uid: 'merchant_' + new Date().getTime(), 	// 상점에서 생성한 고유 주문번호
    				  name: buyName,										// 상품명
    				  amount: totalPrice,									// 가격
    				  buyer_email: "${ sessoinScope.loginUser.email }",		// 구매자 이메일
    				  buyer_name: "${ sessionScope.loginUser.memberName }",	// 구매자 이름
    				  buyer_tel: "${ sessionScope.loginUser.phone }",		// 전화번호
    				  buyer_addr: "${ sessionScope.loginUser.address }",	// 주소
    				  buyer_postcode: "${ sessionScope.loginUser.zipCode }"	// 우편번호
    				}, function(rsp) {
    					console.log(rsp);
    					if (rsp.success) {
    						
    						/*
    						var msg = '결제가 완료되었습니다.';
    						msg += '고유ID : ' + rsp.imp_uid;
    						msg += '상점 거래ID : ' + rsp.merchant_uid;
    						msg += '결제 금액 : ' + rsp.paid_amount;
    						msg += '카드 승인번호 : ' + rsp.apply_num;
    						*/
    						
    						var actionForm =$("#payForm");
    						actionForm.append("<input type='hidden' value='" + rsp.pg_tid + "' name='payTid'>");
    						actionForm.append("<input type='hidden' value='" + rsp.paid_amount + "' name='price'>");
    						actionForm.append("<input type='hidden' value='" + rsp.pay_method + "' name='payMethod'>");
    						actionForm.submit();
    					} else {
    						var msg = '결제에 실패하였습니다.';
    						msg += '에러내용 : ' + rsp.error_msg;
    					}
    					// alert(msg);
    				});
     		} else {
     			alert("상품을 하나 이상 선택해주세요.");
     		}
     	});

        // 수량 조절 함수
        $(".quantity-button").on('click', e => {
            let quantityElement = e.target.parentElement.children.item(1); // input 수량 객체
            let currentQuantity = parseInt(quantityElement.value); // 수량
            let newQuantity = currentQuantity + parseInt(e.target.value); // 변경 될 수량
            let goodPrice = e.target.parentElement.nextSibling.nextSibling.value; // 상품의 개별 가격
            let goodStock = e.target.parentElement.nextSibling.nextSibling.nextSibling.nextSibling.value; // 상품의 최대 구매 가능 수량
            let quantityPrice = e.target.parentElement.parentElement.nextSibling.nextSibling; // 변경 후 표시될 가격 위치
            let newPrice = newQuantity * goodPrice; // 변경 후 가격 * 수량
            if (newQuantity < 1) {
            	alertify.alert('수량은 1 이상이어야 합니다.');
            } else if(newQuantity > goodStock ) {
            	alertify.alert('최대 구매 개수입니다.');
            } else {
            	quantityElement.value = newQuantity;
                quantityPrice.innerText = newPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + "원";
                updateTotalPrice();
            }
        });
      	
      	$(".deleteBtn").on('click', e => {
      		alertify.confirm('', '정말 장바구니에서 삭제하시겠습니까?', 
					function(){ 
				// console.log(e);
	      		// let goodNo = e.target.parentElement.parentElement.parentElement.children.item(0).children.item(0).value; // ㄷㄷ
	      		let parentTrTag = e.target;
	      		for(;parentTrTag.nodeName != 'TR' ; parentTrTag=parentTrTag.parentElement);
	      		let goodNo = parentTrTag.children.item(0).children.item(0).value;
	      		console.log(goodNo);
	      		// memberNo, goodNo ajax로 보내고 parentTrTag 제거
	      		$.ajax({
	      			url : "ajaxDeleteCart.me",
	      			type : "get",
	      			data : {
	      				memberNo : ${ sessionScope.loginUser.memberNo },
	      				goodNo : goodNo
	      			},
	      			success : function(result) { 
						if(result == "success") {
							parentTrTag.remove();
							alertify.success('삭제 완료');
						}
					},
					error : function() {
						console.log("ajax 통신 실패")
					}
	      		});
	      		
			}, function(){ alertify.error('취소')});
      	});
      	
      	
      	
     });
    </script>
</body>
</html>
