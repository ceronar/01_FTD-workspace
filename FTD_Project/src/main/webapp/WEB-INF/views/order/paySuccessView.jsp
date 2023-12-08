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
    <h2>결제 완료</h2>
    <p>
    	귀하의 결제가 성공적으로 처리되었습니다. <br> 
    	구입 주셔서 감사합니다!
    </p>

    <!-- Button to go home -->
    <button onclick="goHome()">메인으로</button>
    <button onclick="goMyPay()">결제 내역 확인</button>
</div>

<script>
    function goHome() {
        window.location.href = "/";
    }
    function goMyPay() {
        window.location.href = "/myPay.me";
    }
</script>

</body>
</html>
