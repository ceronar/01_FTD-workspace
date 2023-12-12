<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회사소개</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <style>
        body {  
            font-family: Arial, sans-serif;
			height: 1600px;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        header {
            background-color: green;
            color: black;
            padding: 1em;
            text-align: center;
        }

        @font-face {
            font-family: 'Pretendard-Regular';
            src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
            font-weight: 400;
            font-style: normal;
        }
        * { font-family: 'Pretendard-Regular'; 
        }

        .company_intro {
            width: 1000px;
            margin: auto;
        }

        .phrases {
            margin: auto;
            text-align: center;
        }

        .adminNameBar { 
        	margin:auto;
	 		color: black(121, 172, 120);
			text-align: center;
	 	}
         #register-title-area{ /* 상단 텍스트 영역 */
            width: 1200px;
            margin: auto;
            margin-top: 5%;
            border-bottom: 3px solid rgb(121, 172, 120);
        }

        #register-title-area>p{ /* 상단 텍스트 */
            font-size: 26px;
            font-weight: bold;
            color: rgb(121, 172, 120);
            letter-spacing: 3px;
        }

        .register-title-menu{ /* 상단슬롯 */
            width: 12%;
            padding: 6px;
            float: right;
            margin-left: 2px;
            margin-top: 20px;
            background-color: rgb(121, 172, 120);
            color: white;
        }

        .introduce {
            width: 70%;
            margin: auto;
            text-align: center;
        }

        footer {
            background-color: green;
            color: black;
            padding: 1em;
            text-align: center;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
        .body-area {
    text-align: center;
}

.phrases {
    display: inline-block;
    text-align: left;
}
    </style>
</head>
<body>
<header>
    <h1>신선한 땅의 맛</h1>
</header>
<div class="company_intro">
    <div class="adminNameBar">
        <br><br>
        <h1>Farm To Dish</h1>
        <hr>
    </div>
    <div id="register-title-area">
        <p>
            회사 소개
        </p>
    </div>
    <div class="body-area">
        <table id="table">
        <tr align="center">
            <th colspan="2">
            </th>
        </tr>
        <tr>
        <td>
        <br>
            
            <img src="bono.jpg" id="subImg"></img>
        </td>
        <td>
            <span class="phrases">
                중간 유통을 삭제하여 좋은 상품을 
                <br>좀 더 빠르고 가깝게 받을 수 있는 직거래!
            </span>

        </td>
        </tr>
        </table>
    </div>
    <br><br><br><br><br>
    <table class="introduce" border="1">
        <tr>
            <td>
                <p>
                    우리의 플렛폼은 직거래 시스템으로 농산물의 가격이 높게 형성되는 <br>
                    이유인 불필요한 2차, 3차 유통 비용을 축소시키고자 직거래 공간을 마련하였습니다.<br>
                    생산자는 직접 판매하면서 농산물에 대한 상세하고 신뢰할 수 있는 정보를 제공하고,<br>
                    소비자에게는 합리적인 가격으로 제공하며,<br> 
                    후기 시스템을 이용하여 소비자가 더 나은 선택을 할 수 있도록 돕습니다.<br>
                    판매자는 홍보글과 마켓을 통해 다른 소비자들에게 정보를 제공합니다.
                </p>
            </td>
        </tr>
    </table>
    <hr>
</div>
<footer>
    <p>&copy; 2023 Farm To Dish. All rights reserved.</p>
</footer>
</body>
</html>