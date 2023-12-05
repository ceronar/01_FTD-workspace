<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Seller Registration</title>
    <!-- You can link your CSS stylesheet here -->
    <!-- <link rel="stylesheet" href="styles.css"> -->
</head>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    form {
        background-color: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    h2 {
        text-align: center;
        color: #333;
    }

    label {
        display: block;
        margin-bottom: 8px;
        color: #555;
    }

    input {
        width: 100%;
        padding: 8px;
        margin-bottom: 16px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    button {
        background-color: #4caf50;
        color: #fff;
        padding: 10px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    button:hover {
        background-color: #45a049;
    }
</style>
<body>

<h2>Seller Registration</h2>

<form action=insertSeller.se method="post">
    <!-- Replace "process_registration.php" with the actual server-side script to handle form submission -->

    <!-- COMPANY_NAME -->
    <label for="company_name">상호명 :</label>
    <input type="text" id="companyName" name="companyName" required><br>

    <!-- SELLSER_ID -->
    <label for="seller_id">판매자 아이디 :</label>
    <input type="text" id="sellerId" name="sellerId" required><br>

    <!-- SELLER_PWD -->
    <label for="seller_pwd">비밀번호 :</label>
    <input type="password" id="sellerPwd" name="sellerPwd" required><br>

    <!-- SELLER_NAME -->
    <label for="seller_name">대표자 이름 :</label>
    <input type="text" id="sellerName" name="sellerName" required><br>

    <!-- COMPANY_NO -->
    <label for="company_no">사업자 등록 번호 :</label>
    <input type="text" id="companyNo" name="companyNo" required><br>

    <!-- BUSINESS_NO -->
    <label for="business_no">통신 판매 번호 :</label>
    <input type="text" id="businessNo" name="businessNo" required><br>

    <!-- ADDRESS -->
    <label for="address">소재지 :</label>
    <input type="text" id="address" name="address" required><br>

    <!-- EMAIL -->
    <label for="email">이메일 :</label>
    <input type="email" id="email" name="email" required><br>

    <!-- PHONE -->
    <label for="phone">전화 번호 :</label>
    <input type="text" id="phone" name="phone" required><br>

    <!-- ACCOUNT_NO -->
    <label for="account_no">계좌 번호 :</label>
    <input type="text" id="accountNo" name="accountNo" required><br>

    <!-- DELETE_DATE, ENROLL_DATE, ACCEPT_DATE, REFUSE_REASON can be set on the server side -->

    <!-- Submit Button -->
    <button type="submit">확인</button>
</form>

</body>
</html>