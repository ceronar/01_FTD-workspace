<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lato:wght@400;700&display=swap">
    <script src="https://kit.fontawesome.com/53a8c415f1.js" crossorigin="anonymous"></script>
    <style>
        
        
        body {
            font-family: 'Lato', sans-serif;
            font-weight: 400; /* Normal font weight */
            margin: 0;
            padding: 0;
            background-color: #f8f9fa;
        }

        header {
            background-color: #343a40;
            color: #ffffff;
            text-align: center;
            padding: 1em;
            position: relative;
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
            font-size : 20px;
        }

        footer {
            text-align: center;
            position: fixed;
            bottom: 0;
            left: 0;
            width: 100%;
            background-color: #343a40;
            padding: 15px;
            max-width: 1000px;
            margin: 0 auto;
        }

        .checkout-btn {
            display: block;
            max-width: 1000px;
            margin: 20px auto;
            padding: 15px;
            background-color: #007bff;
            color: #ffffff;
            text-align: center;
            text-decoration: none;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 18px;
            transition: background-color 0.3s;
        }

        .checkout-btn:hover {
            background-color: #0056b3;
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

        .cart {
            width: 100%;
        }

        .market {
            margin-bottom: 20px;
        }

        .item-info img {
            max-width: 100%;
            max-height: 100%;
            margin-right: 10px;
        }

        .item-details {
            flex: 1;
            display: flex;
            flex-direction: column;
        }

        .item-quantity label {
            margin-bottom: 5px;
        }

        .subtotal {
            text-align: right;
            font-weight: bold;
            font-size: 18px;
            margin-top: 10px;
        }

        /* content 홍보리스트쪽 */
        .promotion {
            list-style: none;
        }

        .promotion a {
            text-decoration: none;
            color: black;
        }

        #profile> #profile_1,
        #profile_2 {
            display: inline-block;
            vertical-align: top; /* Align to the top */
        }

        #profile_1 img {
            width: 50px;
            height: 50px;
            border-radius: 50%; /* Make it round */
        }

        .product span {
            display: block;
        }

        .product {
            display: inline-block;
            border: 1px solid black;
            margin-right: 10px; /* Add some spacing between products */
            box-sizing: border-box;
            border-radius: 8px; /* Rounded border */
            cursor: pointer; /* Change cursor on hover */
            transition: background-color 0.3s;
        }

        .product:hover {
            background-color: #f5f5f5; /* Change background color on hover */
        }

        .product_options {
            margin-top: 10px;
        }

        .product_image {
            margin-top: 10px;
            width: 710px;
            height: 310px;
        }

        .product_image div {
            box-sizing: border-box;
        }

        ul {
            padding-left: 0px;
        }

        #product_image_1{
            height: 300px;
            width: 400px;
            
            border-radius: 50px 0px 0px 50px;
        }

        #product_image_1 > img{
            width : 100%;
            height : 100%;
            border-radius: 50px 0px 0px 50px;
            
        }

        #product_image_2{
            height: 300px;
            width: 294px;
            
        }

        #product_image_2 > div{
            height: 50%;
            width: 100%;
          
        
        }

        #product_image_2 >  #product_image_2_1{ border-radius: 0px 50px 0px 0px; }
         #product_image_2 >  #product_image_2_1 > img { border-radius: 0px 50px 0px 0px; }

        #product_image_2 >  #product_image_2_2{ border-radius: 0px 0px 50px 0px; }
        #product_image_2 >  #product_image_2_2 > img { border-radius: 0px 0px 50px 0px; }


        #product_image_2 img{
            width : 100%;
             height : 100%;
        }
        #profile_2_2 > span{
            font-size : 15px;
            color : rgb(143, 143, 143);
        }

        .product_image #product_image_1,
        #product_image_2 {
            display: inline-block;
        }
        h2 {
            margin: 0;
            font-size: 18px;
            color: #007bff;
        }

        #filter > a{
            text-decoration: none;
            font-size: 20px;
            padding: 8px;
            margin-right: 20px;
            border-radius: 20px;
            background-color: rgba(220, 220, 220, 0.561);
            color: black;
            transition: background-color 0.3s, border-color 0.3s; /* Add transition effect */
            border: 1px solid transparent; /* Add border */


        }
               #loading {
            display: none;
            text-align: center;
            padding: 10px;
            border: 1px solid #ddd;
            background-color: #f9f9f9;
            position: fixed;
            bottom: 0;
            width: 100%;
        }

        .skeleton {
            background: #f0f0f0;
            animation: loading 1.5s infinite ease-in-out;
            border-radius: 4px;
            margin-bottom: 10px;
        }

        @keyframes loading {
            0% {
                opacity: 0.3;
            }
            50% {
                opacity: 0.6;
            }
            100% {
                opacity: 0.3;
            }
        }
        
    </style>
    <script>
    var page = 0;
    var pageSize = 5; // 초기 로딩 시 20개씩 불러오기

    $(document).ready(function () {
        loadLegacyData();

        $(window).scroll(function () {
            if ($(window).scrollTop() + $(window).height() >= $(document).height() - 100) {
                page++;
                loadLegacyData();
            }
        });
    });

    function loadLegacyData() {
        // Skeleton UI 추가
        $('#promotion').append('<div class="skeleton"></div>'.repeat(pageSize));

        $.ajax({
            url : 'getLegacyData.bo',
            type: 'get',
            data: { page: page, size: pageSize },
            beforeSend: function (data) {
            	//console.log(data);
                // Ajax 요청 전에 로딩 애니메이션 표시
                
                $('#loading').show();
                
              
            },
            success: function (data) {
            	
            	console.log("통신성공!!!");
            	console.log(data);
            	
            	
     
            	
                // Remove skeleton UI
                $('.skeleton').remove();
                
                // Append legacy data to the container
              
                // 프로필사진, 홍보사진 정도남았고 로딩, 프론트좀더깍고 ㄹㅇ여유되면 ui클릭시 상품구매로이동까지
                
                data.forEach(function (val) {
                	
                    $('.promotion').append(
                    		
                   
                  	 '<div>'
                   +  '<div id="profile">'
                   +	'<div id="profile_1" style="width : 50px; height : 50px;">'
                   +	  '<img src="" alt="">'
                   +	'</div>'
                   +	'<div id="profile_2">'
                   +	  '<span>'
                   +		val[1].companyName
                   +	  '</span>'
                   +	  '<div id="profile_2_2">'
                   +		'<span>'
                   +		val[1].address
                   +		'</span>'
                   +		'<span>* 17분 전</span>'
                   +	  '</div>'
                   +	'</div>'
                   +  '</div>'
                   +  '<a href="pdlist.bo">'
                   +	'<div style="margin-left : 35px">'
                   +	   '<h2>판매</h2>'
                   +		val[0].promotionContent
                   +  '</a>'
                   + '</div>'
                   
	               +  '<div>'
	               +    '<div class="product_image">'
	               +        '<a href="pdlist.bo">'
	               +            '<div>'
	               +                '<div id="product_image_1">'
	               +                    '<img src="" >'
	               +                '</div>'
	               +                '<div id="product_image_2">'
	               +                    '<div id="product_image_2_1">'
	               +                        '<img src="">'
	               +                    '</div>'
	               +                    '<div id="product_image_2_2">'
	               +                        '<img src="">'
	               +                    '</div>'
	               +                '</div>'
	               +            '</div>'
	               +        '</a>'
	               +    '</div>'
	               +    '<div class="product_options">'
	               +        '<div>'
	               +            '<div class="swiper-wrapper">'
	               +                '<div class="product" id="product_1">'    
	               +                    '<div>'
	               +                        '<span>해녀 채취 말똥성게</span>'
	               +                        '<span>12,500원~</span>'
	               +                    '</div>'
	               +                '</div>'
	               +                '<div class="product" id="product_2">'                   
	               +                    '<div>'
	               +                        '<span>홍새우 (단새우)급냉</span>'
	               +                        '<span>23,000원~</span>'
	               +                    '</div>'
	               +                '</div>'
	               +            '</div>'
	               +        '</div>'
	               +    '</div>'
	               +'</div>'
                   
			       + '<div align="left" style="width : 710px">'
		           +        '<span><i class="far fa-comment"></i></span>' 
		           +        '<span>'
		           +			val[4]
		           +		'</span>'
		           + '</div>'
		           
		           + '<hr>'
                    
                   
                    
                    
                    
                    
                    
                    );
                    
                });

                
                

            },
            complete: function () {
                // Ajax 요청이 완료되면 로딩 애니메이션 숨기기
                $('#loading').hide();
            },
            error : function() {
            	console.log("통신실패!");
            }
        });
    }

    </script>
    <title>홍보(리스트)</title>
</head>
<body>
    <main>
    
   

<div id="loading">
    <img src="resources/images/sample/0019.gif" alt="Loading..."/>
</div>
    
    
        <!-- 내용은 여전히 동일하게 유지 -->
        <div id="filter">
            <a href="">필터</a>
            <a href="">필터</a>
            <!-- Ajax처리 -->
            <a href="">필터</a>
            <a href="">필터</a>
        </div>
        <div align="center">
            <ul>
                
                <li class="promotion">
    	
				</li>
				
                
            </ul>
        </div>
    </main>

</body>
</html>

<!-- 11/27 성광 홍보리스트페이지 jsp추가 -->