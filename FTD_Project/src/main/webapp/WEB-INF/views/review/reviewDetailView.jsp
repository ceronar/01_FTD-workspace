<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://kit.fontawesome.com/53a8c415f1.js" crossorigin="anonymous"></script>
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
            max-width: 1000px;
            margin: 0 auto;
        }

        main {
            max-width: 1000px;
            margin: 20px auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            font-size: 18px;
            
        }

        button {
            display: block;
            margin: 20px auto;
            padding: 15px;
            background-color: #2ECC71;
            color: #ffffff;
            text-align: center;
            text-decoration: none;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 18px;
            transition: background-color 0.3s;
            width: 150px; /* Set a fixed width for the button */
        }

        button:hover {
            background-color: #27AE60;
        }

        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        header h1 {
            margin: 0;
        }

        header a {
            padding: 10px;
            text-decoration: none;
            color: #ffffff;
        }

        .profile {
            display: flex;
           
            align-items: center;
        }

        .profile_1 img {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            /* Make it round */
        }

        img {
            max-width: 100%;
            height: auto;
        }

        span {
            display: inline-block;
            margin-right: 10px;
        }

        .comment-section {
            margin-top: 20px;
        }

        .comment-section input{
            margin-top: 20px;
        }

        .comment-section span {
            margin-right: 0;
        }

        input[type="text"] {
            padding: 10px;
            width: calc(100% - 22px); /* Adjusted width, considering padding and margin */
            margin-right: 10px;
            border: 1px solid #ddd; /* Added a border for better visual separation */
            border-radius: 4px;
        }

        #profile_3 {
            margin-left: auto; /* Move to the right */
        }

        #profile_3 button {
            background-color: transparent;
            color: #0c7c4b;
            border: 1px solid #0c7c4b;
            padding: 10px;
            cursor: pointer;
            border-radius: 4px;
            transition: background-color 0.3s, color 0.3s;
            display: inline-block;
        }

        #profile_3 button:hover {
            background-color: #0c7c4b;
            color: #ffffff;
        }
        /*
        상품쪽
        */
        #product {
            border-spacing: 0px;
            border-radius: 10px;
            border-color: lightgray;
        }
        .review {
            border-bottom: 1px solid #ddd;
            padding: 15px 0;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .review #img_2 {
            width: 100px;
            height: 80px;
        }
        #profile_under > div{
            margin-top : 10px;
        }

        .review #img_1 {
            width: 1000px;
            height: 300px;
            border-radius: 5%;

            margin-right: 10px;
        }
        #profile_2_2 > span{
            font-size : 15px;
            color : rgb(143, 143, 143);
        }
        #product #img_2_text_2{
            color: #777;
            font-size : 15px;
        }

    </style>
    <title>홍보(리스트)</title>
</head>
<body>
    <header>
        <h1>상세보기 페이지</h1>
    </header>

    <main align="">
        
        <div class="profile">
            <div class="profile_1">
                <img src="https://placekitten.com/50/50" alt="Profile Image">
            </div>
            <div class="profile_2">
                <span>100년 수산</span>
                <div id="profile_2_2">
                   
                    <span> 17분 전</span>
                    <!-- 몇분전인지-->
                </div>
            </div>
           
        </div>
    <div id="profile_under">
        <div>
            <!-- 별점 -->
            <div>
                <span><i class="fas fa-star" style="color : rgb(255, 225, 0)"></i></span>1
            </div>
        </div>

        <div id="content">

            dasdsadasdafsdfas

        </div>

       

        <!-- 상품 -->
        <div class="review">

            

            <div class="review-content">
               
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
                               <td>></td>
                            </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>

        
        
    </main>

    
    <main class="comment-section">
        <div>
            <span style="margin-right : 20px;">
                <span><i class="far fa-heart" style="color : pink; "></i></span>
                <span>좋아요</span>
            </span>
            <span>
                <span><i class="far fa-comment"></i></span>
                <span>댓글</span>
            </span>
        </div>
        <div>
            <input type="text" value="댓글을 남겨보세요">
            <button>입력</button>
        </div>
    </main>

    <script>
        // ... (unchanged) ...
    </script>
</body>
</html>

<!-- 11/27 성광 후기상세보기페이지 jsp추가 -->