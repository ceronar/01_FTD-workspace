<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Complete</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }

        div {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        h2 {
            color: #333;
        }

        button {
            background-color: #4caf50;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 20px;
        }

        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

<!-- Payment Complete Page -->
<div>
    <h2>주문완료</h2>
    <hr>
    <br>
    <h3>주문이 정상적으로 완료 되었습니다.</h3> 
    <p>
    	고객님의 주문 번호는 <span>${ requestScope.orderNo }</span>번 입니다.<br>
    	주문하신 내역은 마이페이지 - 주문내역 조회 에서 확인하실 수 있습니다.
    </p>
    
    <br>
    <hr>
    <br>
    
    <p>
    	결제 내역 : <span>${ requestScope.price }</span>원
    	결제 수단 : KakaoPay
    </p>

    <!-- Button to go home -->
    <button onclick="goHome()">메인으로</button>
    <button onclick="goMyOrderList()">결제 내역 확인</button>
</div>

<script>
    function goHome() {
        window.location.href = "${pageContext.request.contextPath}";
    }
    function goMyOrderList() {
        window.location.href = "orderList.me";
    }
</script>

</body>
</html>
