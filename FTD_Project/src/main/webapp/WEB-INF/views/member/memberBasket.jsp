<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>장바구니 - FTD</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<link rel="stylesheet" href="/resources/css/common/pay_modal.css">
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
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        button {
            padding: 10px;
            cursor: pointer;
        }

        .quantity-buttons {
            display: flex;
            align-items: center;
        }

        .quantity-button {
            padding: 5px;
            margin: 0 5px;
            cursor: pointer;
        }
        
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.7);
            justify-content: center;
            align-items: center;
        }

        .modal-content {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .product-image {
            width: 100%;
            max-height: 200px;
            object-fit: cover;
            border-radius: 5px;
            margin-bottom: 10px;
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
                        <th>상품명</th>
                        <th>수량</th>
                        <th>가격</th>
                        <th>배송비</th>
                        <th>판매자</th>
                        <th>삭제</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <img src="사과이미지주소.jpg" alt="사과 이미지" class="product-image">
                            사과
                        </td>
                        <td class="quantity-buttons">
                            <button class="quantity-button" onclick="adjustQuantity(1, -1)">-</button>
                            <span id="quantity1">2</span>
                            <button class="quantity-button" onclick="adjustQuantity(1, 1)">+</button>
                        </td>
                        <td>5,000원</td>
                        <td>2,000원</td>
                        <td rowspan="2">
                            <div class="market-header">마켓 1</div>
                            <!-- 판매자 마켓 1에 해당하는 상품 목록 -->
                            <ul>
                                <li>사과</li>
                                <li>배</li>
                            </ul>
                        </td>
                        <td><button onclick="removeItem(1)">삭제</button></td>
                    </tr>
                    <tr>
                        <td>
                            <img src="배이미지주소.jpg" alt="배 이미지" class="product-image">
                            배
                        </td>
                        <td class="quantity-buttons">
                            <button class="quantity-button" onclick="adjustQuantity(2, -1)">-</button>
                            <span id="quantity2">3</span>
                            <button class="quantity-button" onclick="adjustQuantity(2, 1)">+</button>
                        </td>
                        <td>7,500원</td>
                        <td>3,000원</td>
                        <td><button onclick="removeItem(2)">삭제</button></td>
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
                <button onclick="openKakaoPayModal()">결제하기</button>
            </div>
        </div>

        <!-- ********************************모달 시작****************************** -->
		<input class="inputMonthH" type="hidden">
		<input class="sessionuserID" type="hidden" value="${sessionScope.user_id}">
		<input class="amountValue" type="text">
		<div class="popup">  <!-- 팝업처럼 하기 위한 배경 -->
			<div class="pwrap">  <!-- 실제 팝업창 -->
				<a class="closebtn">X</a> <!-- 비밀번호 변경창 닫기 버튼 -->
				<div>
					<h1>결제하기</h1>
				</div>
				<table>
					<tr>
						<td><a href="#" onclick="kakaopay()"><img src="/resources/images/kakaoPay/03_SVG/카카오페이_CI_combination_with_BG.svg"></a></td>
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
		<!-- ****************************모달 끝 *******************************-->
		<script src="/resources/js/common/pay_modal.js"></script>
		<script src="/resources/js/api/kakao_payment.js"></script>

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
                var currentQuantity = parseInt(quantityElement.innerText);
                var newQuantity = currentQuantity + change;
                
                if (newQuantity >= 1) {
                    quantityElement.innerText = newQuantity;
                    // 여기에 수량 변경 로직을 추가하세요.
                } else {
                    alert('수량은 1 이상이어야 합니다.');
                }
            }
        </script>
    </div>
</body>
</html>