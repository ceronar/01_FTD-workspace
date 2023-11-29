<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
            justify-content: space-between;
            align-items: center;
            margin-top: 20px;
        }

        .total-section p {
            margin: 5px 0;
        }

        .total-section button {
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 20px;
            margin: 10px;
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

    </style>
</head>
<body>
    <div class="wrapper">
        
        <jsp:include page="../common/header.jsp" />

        <div class="content">
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
                	<tr>
                		<td colspan="6" class="marketName"><h3>마켓 1</h3></td>
                	</tr>
                    <tr>
                    	<td><input type="checkbox" class="buyItem" /></td>
                        <td>
                            <img src="resources/images/sample/224427_132949_129.jpg" alt="사과 이미지" class="product-image">
                        </td>
                        <td>사과 1.5kg 한박스</td>
                        <td class="quantity-outer">
                        	<div class="quantity-buttons">
                            	<button class="quantity-button" onclick="adjustQuantity(1, -1)">-</button><input type="text" id="quantity1" class="quantity-input" value="1" readonly><button class="quantity-button" onclick="adjustQuantity(1, 1)">+</button>
                            </div>
                        </td>
                        <td>5,000원</td>
                        <td><button class="deleteBtn" onclick="removeItem(1)"><span class="material-symbols-outlined">close</span></button></td>
                    </tr>
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
                    <p><strong>총 배송비: 5,000원</strong></p>
                    <p><strong>총 가격: 20,500원</strong></p>
                </div>
                <!-- 결제 버튼 -->
                <button onclick="openKakaoPayModal();">결제하기</button>
            </div>
        </div>
		
		<!-- ********************************모달 시작****************************** -->
        <div id="kakaoModalContainer" class="hidden">
			<input class="sessionuserID" type="hidden" value="${sessionScope.userId}">
			<input class="amountValue" type="hidden">
			<div class="popup">  <!-- 팝업처럼 하기 위한 배경 -->
				<div class="pwrap">  <!-- 실제 팝업창 -->
					<a class="closeBtn"><span class="material-symbols-outlined">close</span></a> <!-- 팝업창 닫기 버튼 -->
					<div>
						<h1>결제하기</h1>
					</div>
					<table>
						<tr>
							<td><a href="#" onclick="kakaopay()"><img src="/ftd/resources/images/kakaoPay/03_SVG/combination_with_BG.svg"></a></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
						</tr>
					</table>
					<div>
						<h3 class="amount">결제 금액 : 0원</h3>
					</div>		
				</div>
			</div>
			<script src="/ftd/resources/js/api/kakao_payment.js"></script>
		</div>
		<!-- ****************************모달 끝 *******************************-->
		
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
            
            const closeBtn = document.querySelector('.closeBtn');
            const popup = document.querySelector('.popup');
            const amount = document.querySelector('.amount');
            const modal = document.querySelector('#kakaoModalContainer');

            function openKakaoPayModal() {
                modal.style.display = 'block';
            }
            closeBtn.on('click', function(){
            	modal.style.display = 'none';
            });
        </script>
    </div>
</body>
</html>
