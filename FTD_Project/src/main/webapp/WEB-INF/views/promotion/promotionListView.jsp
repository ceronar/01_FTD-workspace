<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lato:wght@400;700&display=swap">
         <link href="${pageContext.request.contextPath}/resources/css/main.css?version=1.2" rel="stylesheet" type="text/css">
        <script src="https://kit.fontawesome.com/53a8c415f1.js" crossorigin="anonymous"></script>
        <style>
        
        /* navi css */
	#nav1 {
	    display: none !important;
	}
	
	#nav2 {
	    display: block !important;
	}
	
	.menu4 {
		font-size: 25px;
		border-bottom: 3px solid black;
		color: black;
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
            
            .profile{
            	margin-right : 35px;
            }
            

            .profile>#profile_1,
            #profile_2 {
                display: inline-block;
                vertical-align: top;
                /* Align to the top */
            }

            #profile_1 img {
                width: 50px;
                height: 50px;
                border-radius: 50%;
                /* Make it round */
            }

            .product span {
                display: block;
            }

			#product{
			margin: auto;
			}
			
            .product {
                display: inline-block;
                border: 1px solid black;
                margin-right: 10px;
                /* Add some spacing between products */
                box-sizing: border-box;
                border-radius: 8px;
                /* Rounded border */
                cursor: pointer;
                /* Change cursor on hover */
                transition: background-color 0.3s;
                
            }

            .product:hover {
                background-color: #f5f5f5;
                /* Change background color on hover */
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

            .product_image_1 {
                height: 300px;
                width: 400px;

                border-radius: 50px 0px 0px 50px;
            }

            .product_image_1>img {
                width: 100%;
                height: 100%;
                border-radius: 50px 0px 0px 50px;
     

            }

            .product_image_2 {
                height: 300px;
                width: 294px;
                  border: 2px solid white;

            }

            .product_image_2>div {
                height: 50%;
                width: 100%;


            }

            .product_image_2>.product_image_2_1 {
                border-radius: 0px 50px 0px 0px;
            }

            .product_image_2>.product_image_2_1>img {
                border-radius: 0px 50px 0px 0px;
                  border: 2px solid white;
                
            }

            .product_image_2>.product_image_2_2 {
                border-radius: 0px 0px 50px 0px;
            }

            .product_image_2>.product_image_2_2>img {
                border-radius: 0px 0px 50px 0px;
                  border: 2px solid white;
            }


            .product_image_2 img {
                width: 100%;
                height: 100%;
            }

            #profile_2_2>span {
                font-size: 15px;
                color: rgb(143, 143, 143);
            }

            .product_image .product_image_1,
            .product_image_2 {
                display: inline-block;
            }

            h2 {
                margin: 0;
                font-size: 18px;
                color: #007bff;
            }

            #filter>a {
                text-decoration: none;
                font-size: 20px;
                padding: 8px;
                margin-right: 20px;
                border-radius: 20px;
                background-color: rgba(220, 220, 220, 0.561);
                color: black;
                transition: background-color 0.3s, border-color 0.3s;
                /* Add transition effect */
                border: 1px solid transparent;
                /* Add border */


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

            .top {
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .top a {
                margin-right: 10px;
                /* Adjust the margin as needed */
            }
            
            /* 파일 두개일때 */
/*--------------------------------------------------------*/
            .product2_image_1 {
                height: 300px;
                width: 350px; 
                border-radius: 50px 0px 0px 50px;
                 border: 2px solid white;
            }

            .product2_image_1>img {
                width: 100%;
                height: 100%;
                border-radius: 50px 0px 0px 50px;
                
            }

            .product2_image_2 {
                height: 300px;
                width: 350px;
                border-radius: 0px 50px 50px 0px;
                 border: 2px solid white;
            }
            .product2_image_2>img {
                width: 100%;
                height: 100%;
                border-radius: 0px 50px 50px 0px;
            }
            
           
/*--------------------------------------------------------*/

/* 파일 한개일때 */
            .product1_image_1 {
                height: 300px;
                width: 650px;
                
                border-radius: 50px 50px 50px 50px;
            }

            .product1_image_1>img {
                width: 100%;
                height: 100%;
                border-radius: 50px 50px 50px 50px;
         
            }
            
            #enrollForm {
		  color: green;
		  text-decoration: underline lightgreen;
		  font-size : 20px;
		  margin-right: auto;
		}
		
		#enrollForm:focus,
		#enrollForm:hover {
		  display: inline-block;
		  color: lightgreen;
		  transform: translateY(-2px);
		  transition: 1s;
		  
	
		}
		
			 .goods-eroll-btn {
		float: right;

		width: 100px;
		height: 50px;
		font-size: 20px;
		font-family: 'Noto Sans KR', sans-serif;
		background-color: rgba(223, 240, 217, 0.966);
		color: rgb(21, 71, 21);
		border-radius: 8px;
		line-height: 50px;
		text-decoration: none;
		

	}
	
	.goods-eroll {
		box-sizing: border-box;
		width: 100%;
		height: 70px;
		margin-bottom: 30px;
	
	}
	.detail:hover{
		cursor: pointer;
	}
	
	
	.hrClass {
    background:lightgray;
    height:1px;
    border:0;
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
                    url: 'getLegacyData.bo',
                    type: 'get',
                    data: { page: page, size: pageSize },
                 
                    success: function (data) {

                        console.log("통신성공!!!");
                        console.log(data);


                        // Remove skeleton UI
                        $('.skeleton').remove();

                        // Append legacy data to the container

                        // 프로필사진, 홍보사진 정도남았고 로딩, 프론트좀더깍고 ㄹㅇ여유되면 ui클릭시 상품구매로이동까지

                        data.forEach(function (val) {
                        	
           let marketImg = (val[2] == null) ? "/ftd/resources/uploadFiles/sellerPage/pngwing.com.png" : val[2].changeName;			

                       let str  ='<div>'
                                + '<div class="profile">'
                                + '<div id="profile_1" style="width : 50px; height : 50px;">'

                                + '<img src="'+ marketImg +'" alt="">'

                                + '</div>'
                                + '<div id="profile_2">'
                                + '<span>'
                                + val[1].companyName

                                + '</span>'
                                + '<div id="profile_2_2">'
                                + '<span>'
                                + val[1].address
                                + '</span>'
                                + '<span>&nbsp('+val[0].createDate+')</span>'
                                + '</div>'
                                + '</div>'
                                + '</div>'
                                + '</div>'

                                + '<div>'
                                + '<div >'
                                + '<div class="detail" ">'
                                + '<input type="hidden" value="' + val[0].promotionNo + '">'
                                + '<h2>판매</h2>'
                                + val[6];
                                
                            if(val[5].length == 3){
                            	  str += '<div class="product_image" >'
  	                                + '<div style="display : flex; justify-content: center; align-items: center; ">'
  	                                + '<div class="product_image_1">'
  	                                + '<img src="'+ val[5][0] +'" >'
  	                                + '</div>'
  	                                + '<div class="product_image_2">'
  	                                + '<div class="product_image_2_1">'
  	                                + '<img src="'+ val[5][1] +'">'  <!-- 체인지네임이 널일때는 기본사진이들어가게해야뎀 -->
  	                                + '</div>'
  	                                + '<div class="product_image_2_2">'
  	                                + '<img src="'+ val[5][2]+'">'
  	                                + '</div>'
  	                                + '</div>'
  	                                + '</div>'
  	                                + '</div>';
                            }else if(val[5].length == 2){
                            	
                            str +=	'<div class="product_image">'
                                + '<div style="display : flex; justify-content: center; align-items: center; ">'
                                    + '<div class="product2_image_1">'
                                       +  '<img src="'+ val[5][0] +'" >'
                                    + '</div>'
                                   + '<div class="product2_image_2">'
                                        + '<img src="'+ val[5][1] +'">'
                                     +'</div>'
                                 +'</div>'
                      			+  '</div>'
                    		        	  
                            }else if(val[5].length == 1){
                            	
                            str += '<div class="product_image">'
                                +'<div>'
                                    +'<div class="product1_image_1">'
                                       + '<img src="'+ val[5][0] +'" >'
                                   + '</div>'
                               + '</div>'
                       + '</div>'
                            	
                            }else{
                            	
                            	
                            }
                    
                                str += '</div>'
                                + '<div class="product_options">'
                                + '</div>'
                                + '</div>'

                                + '<div align="left" style="width : 780px">'
                                + '<span><i class="far fa-comment"></i></span>'
                                + '<span>'
                                + val[4]
                                + '</span>'
                                + '</div>'

                                + '<hr class="hrClass">';


                                $('.promotion').append(str);
								
                        });




                    },
                    complete: function () {
                        // Ajax 요청이 완료되면 로딩 애니메이션 숨기기
                        $('#loading').hide();
                    },
                    error: function () {
                        console.log("통신실패!");
                    }
                });
            }

        </script>

        <script>
            $(function () {

                $(".promotion").on('click', '.detail', function (e) {

                	 //console.log(e.currentTarget.children.value);
                	 
                    let pno = e.currentTarget.children.item(0).value;

                    //

                    location.href = "pdlist.bo?pno=" + pno;
                });
            });
        </script>
        <title>홍보(리스트)</title>
    </head>

    <body>
		<div class="wrapper">
		        <div class="center-div">  
		         
			        <jsp:include page="../common/sidebar.jsp" />
			        
			        <div class="main-div">
				        <jsp:include page="../common/header.jsp" />
			
				           
				            		
				        <div class="content" >
				        
		   
                    <!-- 내용은 여전히 동일하게 유지 -->


                    <div class="top">
                       <!--  필터지움 -->
					<!--  로그인한 판매자만 글작성할수있게 조건문 -->
					 <c:if test="${ not empty sessionScope.loginSeller }"> 
                        <div >
                          <div class="goods-eroll" >
                            <a class="goods-eroll-btn" href="promoptionEnrollForm.bo"><i class="fas fa-edit"></i></a>
                           </div>
                        </div>
                     </c:if>
                        <!-- post 방식으로 바꿔야델듯 -->
                    </div>
                    <div align="center">
                        <ul>

                            <li class="promotion">

                            </li>


                        </ul>
                    </div>
                  

				
				        </div>
				        
			        </div> 
			              
		        </div>
		</div>
    </body>

    </html>

    <!-- 11/27 성광 홍보리스트페이지 jsp추가 -->