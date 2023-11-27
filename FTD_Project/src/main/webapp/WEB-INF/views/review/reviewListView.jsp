<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/53a8c415f1.js" crossorigin="anonymous"></script>
    <title>쇼핑몰 후기</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f9fa;
        }

    
        header {
            background-color: #343a40;
            color: #ffffff;
            text-align: center;
            padding: 1em;
        }

        main {
            max-width: 1000px;
            margin: 20px auto;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            font-size: 20px;
        }

        .review {
            border-bottom: 1px solid #ddd;
            padding: 15px 0;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .review #img_1 {
            width: 1000px;
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

        footer {
            text-align: center;
            padding: 1em;
            background-color: #343a40;
            color: #ffffff;
        }

        #name > div {
            display: inline-block;
        }

        #product {
            border-spacing: 0px;
            border-radius: 10px;
            border-color: lightgray;
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
   
    </style>
</head>
<body>
    <header>
        <h1>쇼핑몰 후기</h1>
    </header>

    <main>
        <div class="review">

            <div class="review-content">
                <div id="name">
                    <div> xxx님</div>
                    <div><p class="review-date">xx 시간전</p></div>
                </div>

                <h2>후기</h2>
                <p>상품 받았습니다. 정말 만족스럽고 배송도 빨랐어요. 다음에 또 이용하겠습니다.</p>
                <div>
                    <div>
                        <!-- 사진 -->
                        <img src="" id="img_1">
                    </div>

                    <div id="review_product">
                        <!-- 상품 -->
                        <table border="1" id="product">
                            <tr>
                                <td><img src="" id="img_2"></td>
                                <td width="685px;">
                                    <div>A급 러시아 대게(선어,자숙)</div>
                                    <div id="img_2_text_2">3kg (3미 내외)</div>
                                </td>
                                <td><i class="fas fa-chevron-right"></i></td>
                            </tr>
                        </table>
                    </div>

                    <div>
                        <!-- 별점 + 채팅-->
                        <div id="review_footer">

                            <div>
                                <span>
                                    <span><i class="fas fa-star" style="color : rgb(255, 225, 0)"></i> 5</span>
                                </span>
                            </div>

                            <div id="review_footer_2">
                                <span style="margin-right : 20px;">
                                    <span><i class="far fa-heart" style="color : pink; "></i></span>
                                    <span>0</span>
                                </span>

                                <span>
                                    <span> <i class="far fa-comment"></i></span>
                                    <span>0</span>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <!-- 추가적인 리뷰는 위와 같은 구조로 추가 가능 -->

    </main>

    <footer>
        &copy; 2023 쇼핑몰 후기. All rights reserved.
    </footer>
</body>
</html>

<!-- 11/27 성광 후기리스트페이지 jsp추가 -->