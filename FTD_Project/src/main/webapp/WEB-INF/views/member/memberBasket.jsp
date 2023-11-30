<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
            margin-top: 100px;
            padding: 20px;
            width: 100%; /* 컨텐츠를 전체 너비로 확장 */
            box-sizing: border-box;
            width: 1080px;
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
            justify-content: flex-end;
            align-items: center;
            margin-top: 20px;
        }
		
		.total-section>div {
			margin: 10px;
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
		
		#kakaoModalContainer {
			display: none;
		}
		
		.total-section img {
			height: 100px;
			width: 150px;
		}

    </style>
</head>
<body>
    <div class="wrapper">
        
        <jsp:include page="../common/header.jsp" />

        <div class="content">
        	<form id="payForm" method="post" action="">
        		<input type="hidden" name="memberNo" value="">
	            <!-- 장바구니 내용 -->
	            <h2>장바구니</h2>
	            <table>
	                <thead>
	                    <tr>
	                    	<th><input type="checkbox" class="buyAllItems" onclick="selectAllItems(this)" /></th>
	                    	<th>이미지</th>
	                        <th>상품명</th>
	                        <th>수량</th>
	                        <th>가격</th>
	                        <th>삭제</th>
	                    </tr>
	                </thead>
	                <tbody>
	                	<!-- 마켓반복 -->
	                	<tr>
	                		<td colspan="6" class="marketName"><h3>마켓 1</h3></td>
	                	</tr>
	                	<!-- 상품반복 -->
	                    <tr>
	                    	<td><input type="checkbox" class="buyItem" name="goodNo" value="상품코드" /></td>
	                        <td>
	                            <img src="resources/images/sample/224427_132949_129.jpg" alt="사과 이미지" class="product-image">
	                        </td>
	                        <td>사과 1.5kg 한박스</td>
	                        <td class="quantity-outer">
	                        	<div class="quantity-buttons">
	                            	<button class="quantity-button" onclick="adjustQuantity(1, -1)">-</button><input type="text" id="quantity1" class="quantity-input" name="count" value="1" readonly><button class="quantity-button" onclick="adjustQuantity(1, 1)">+</button>
	                            </div>
	                        </td>
	                        <td>5,000원</td>
	                        <td><button class="deleteBtn" onclick="removeItem(1)"><span class="material-symbols-outlined">close</span></button></td>
	                    </tr>
	                    <!-- 상품반복 -->
	                    <tr>
	                    	<td><input type="checkbox" class="buyItem" /></td>
	                        <td>
	                            <img src="resources/images/sample/202005072145_500.jpg" alt="배 이미지" class="product-image">
	                        </td>
	                        <td>배 1.5kg 한박스</td>
	                        <td class="quantity-outer">
	                        	<div class="quantity-buttons">
	                            	<button class="quantity-button" onclick="adjustQuantity(2, -1)">-</button><input type="text" id="quantity2" class="quantity-input" value="1" readonly><button class="quantity-button" onclick="adjustQuantity(2, 1)">+</button>
	                            </div>
	                        </td>
	                        <td>7,500원</td>
	                        <td><button class="deleteBtn" onclick="removeItem(2)"><span class="material-symbols-outlined">close</span></button></td>
	                    </tr>
	                    <!-- 여기에 더 많은 상품 정보가 들어갈 수 있습니다. -->
	                </tbody>
	            </table>
	
	            <!-- 총 배송비 및 총 가격 -->
	            <div class="total-section">
	                <div>
	                    <p><strong class="deliver">배송비: 5,000원</strong></p>
	                    <p><strong class="amount">총 가격: 20,500원</strong></p>
	                </div>
	                <label for="kakaoPay">
	                	<img src="/ftd/resources/images/sample/kakaoPay02.png" />
	                </label>
	                <!-- 결제 버튼 -->
	                <button class="kakaoPay" id="pay">카카오페이 결제하기</button>
	            </div>
            </form>
        </div>
		
        <jsp:include page="../common/footer.jsp" />

        <script>
            // 가상의 상품 삭제 함수
            function removeItem(itemId) {
                // 여기에 상품 삭제 로직을 추가하세요.
                alert('상품이 장바구니에서 삭제되었습니다.');
            }

            // 수량 조절 함수
            function adjustQuantity(itemId, change) {
                var quantityElement = document.getElementById('quantity' + itemId);
                var currentQuantity = parseInt(quantityElement.value);
                var newQuantity = currentQuantity + change;
                
                if (newQuantity >= 1) {
                    quantityElement.value = newQuantity;
                    // 여기에 수량 변경 로직을 추가하세요.
                } else {
                    alert('수량은 1 이상이어야 합니다.');
                }
            }

            // 전체 상품 선택 함수
            function selectAllItems(checkbox) {
                var buyItems = document.getElementsByClassName('buyItem');
                for (var i = 0; i < buyItems.length; i++) {
                    buyItems[i].checked = checkbox.checked;
                }
            }
            var IMP = window.IMP;
            IMP.init('imp48134478'); //가맹점 식별코드
            $('#pay').on('click', function(e) {
        		e.preventDefault();
        		if($(".buyItem:checked").length > 0){
       				IMP.request_pay({
       				  pg: "kakaopay",
       				  pay_method: "card", // 생략가능
       				  merchant_uid: 'merchant_' + new Date().getTime(), // 상점에서 생성한 고유 주문번호
       				  name: "주문명:결제테스트",
       				  amount: 1004,
       				  buyer_email: "test@portone.io",
       				  buyer_name: "구매자이름",
       				  buyer_tel: "010-1234-5678",
       				  buyer_addr: "서울특별시 강남구 삼성동",
       				  buyer_postcode: "123-456"
       				}, function(rsp) {
       					console.log(rsp);
       					if (rsp.success) {
       						var msg = '결제가 완료되었습니다.';
       						msg += '고유ID : ' + rsp.imp_uid;
       						msg += '상점 거래ID : ' + rsp.merchant_uid;
       						msg += '결제 금액 : ' + rsp.paid_amount;
       						msg += '카드 승인번호 : ' + rsp.apply_num;
       						var actionForm =$("#payForm");
       						const aCompleted = $("<input type='hidden' value='T' name='aCompleted'>");
       						actionForm.append(aCompleted);
       						console.log(actionForm);
       						// actionForm.find("input[name='memberNo']").val($(this).attr("href"));
       						// actionForm.submit();
       					} else {
       						var msg = '결제에 실패하였습니다.';
       						msg += '에러내용 : ' + rsp.error_msg;
       					}
       					alert(msg);
       				});
        		} else {
        			alert("상품을 하나 이상 선택해주세요.");
        		}
        	});
        </script>
    </div>
</body>
</html>
