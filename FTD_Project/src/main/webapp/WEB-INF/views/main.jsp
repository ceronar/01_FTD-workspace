<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FTD</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f2f2f2;
        }

        .wrapper {
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
        }

        .header {
            background-color: #4CAF50;
            padding: 10px;
            text-align: center;
            color: white;
            width: 100%;
            position: fixed; /* 헤더를 화면 상단에 고정 */
            top: 0; /* 헤더가 화면 상단에 고정될 때의 위치 */
            z-index: 1000; /* 다른 요소들보다 위에 나타나도록 z-index 설정 */
        }

        .nav-menu {
            display: flex;
            justify-content: space-around;
            margin-top: 10px;
        }

        .nav-menu a {
            color: white;
            text-decoration: none;
            padding: 10px;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .nav-menu a:hover {
            background-color: #45a049;
        }

        .content {
            margin: 0 auto;
            margin-top: 100px;
            padding: 20px;
            padding-top: 100px;
            width: 100%;
            box-sizing: border-box;
            width: 1080px;
        }

        .footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 10px;
            position: fixed;
            bottom: 0;
            width: 100%;
        }

        .recommendation {
            margin-top: 20px;
        }

        .recommendation h2 {
            font-size: 24px;
            margin-bottom: 10px;
        }

        .recommendation-list {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
        }

        .recommendation-item {
            background-color: white;
            padding: 10px;
            margin: 10px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: calc(30% - 20px); /* 최대 넓이에서 여백을 제외한 넓이 계산 */
        }

        .recommendation-item img {
            width: 100%;
            height: 150px;
            object-fit: cover;
            border-radius: 5px;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <div class="wrapper">
        <div class="header">
            <h1>FTD - Farm to Dish</h1>
            <div class="nav-menu">
                <a href="#">홈</a>
                <a href="#">가게 찾기</a>
                <a href="#">상품 찾기</a>
                <a href="#">회원 가입</a>
                <a href="#">로그인</a>
            </div>
        </div>

        <div class="content">
            <div class="recommendation">
                <h2>추천 가게</h2>
                <div class="recommendation-list">
                    <div class="recommendation-item">
                        <img src="가게1이미지주소.jpg" alt="가게 1 이미지">
                        <h3>가게 1</h3>
                        <p>가게 1 소개 및 정보</p>
                    </div>
                    <div class="recommendation-item">
                        <img src="가게2이미지주소.jpg" alt="가게 2 이미지">
                        <h3>가게 2</h3>
                        <p>가게 2 소개 및 정보</p>
                    </div>
                    <div class="recommendation-item">
                        <img src="가게3이미지주소.jpg" alt="가게 3 이미지">
                        <h3>가게 3</h3>
                        <p>가게 3 소개 및 정보</p>
                    </div>
                    <!-- 추가적인 가게 정보는 필요에 따라 더 추가할 수 있습니다. -->
                </div>
            </div>

            <div class="recommendation">
                <h2>추천 상품</h2>
                <div class="recommendation-list">
                    <div class="recommendation-item">
                        <img src="상품1이미지주소.jpg" alt="상품 1 이미지">
                        <h3>상품 1</h3>
                        <p>상품 1 소개 및 정보</p>
                    </div>
                    <div class="recommendation-item">
                        <img src="상품2이미지주소.jpg" alt="상품 2 이미지">
                        <h3>상품 2</h3>
                        <p>상품 2 소개 및 정보</p>
                    </div>
                    <div class="recommendation-item">
                        <img src="상품3이미지주소.jpg" alt="상품 3 이미지">
                        <h3>상품 3</h3>
                        <p>상품 3 소개 및 정보</p>
                    </div>
                    <!-- 추가적인 상품 정보는 필요에 따라 더 추가할 수 있습니다. -->
                </div>
            </div>
        </div>

        <div class="footer">
            <p>&copy; FTD - Farm to Dish</p>
        </div>
    </div>
</body>
</html>
