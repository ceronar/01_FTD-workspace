<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://kit.fontawesome.com/53a8c415f1.js" crossorigin="anonymous"></script>
    <link href="${pageContext.request.contextPath}/resources/css/main.css?version=1.2" rel="stylesheet" type="text/css">

    <style>
    
          /* navi css */
	#nav1 {
	    display: none !important;
	}
	
	#nav2 {
	    display: block !important;
	}
	
	#nav3 {
	    display: none ;
	}
    
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
            justify-content: space-between;
            align-items: center;
        }

	

        .review #img_1 {
            width: 860px;
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
            margin:auto;
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
        .goodSell:hover{
        cursor:pointer;
        }
        
        .goods_title{
       	margin-right : 100px;
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
               
                $.ajax({
                    url: 'getReviewLegacyData.bo',
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
							
                       let str  = '<div class="review-content">'
                     +  '<div id="name">'
	                     +  '<div> '+val[0].memberNo+'</div>'
	                     + ' <div><p class="review-date">'+ val[0].createDate +'</p></div>'
                  	 +	'</div>'
				+'<div class="detail">'
                  + '<h2>후기</h2>'
                  + '<p>'+ val[6] +'</p>'
                  + '<input type="hidden" value="' + val[0].revNo + '">'  
                  if(val[5].length >= 1){
             str +=     '<div>'
                  +         '<img src="'+ val[5][0]+'" id="img_1">'
                  +     '</div>'
                  }
             str +='</div>'
                + '<div>'
                  +     '<div id="review_product">'        
                  +         '<table border="1" id="product" class="goodSell">'
                  if(val[4] != null){
             str +=		'<input type="hidden" value="'+ val[4].sellNo +'">'
                  }
             str +=             '<tr>'
                  if(val[2] != null){
             str +=                 '<td><img src="'+ val[2].changeName +'" id="img_2"></td>'
                  }
             str +=                 '<td width="685px;">'
            	   if(val[4] != null){
            		   let count = val[4].count.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
             str +=                     '<div class="goods_title" >'
            	  +						'<div>'+ val[4].sellTitle +'</div>'
                  +                     '<div id="img_2_text_2">'+ count +'원</div>'
                  +						'</div>'
            	   }
             str +=                 '</td>'
                  +                 '<td><i class="fas fa-chevron-right"></i></td>'
                  +             '</tr>'
                  +         '</table>'
                  +     '</div>'

                  +     '<div>'
                        
                  +         '<div id="review_footer">'

                  +             '<div>'
                  +                 '<span>'
                  +                  '<span><i class="fas fa-star" style="color : rgb(255, 225, 0)"></i> '+ val[0].starRating +'</span>'
                  +                 '</span>'
                  +             '</div>'

                  +             '<div id="review_footer_2">'
                  +                 '<span>'
                  +                     '<span> <i class="far fa-comment"></i></span>'
                  +                     '<span>'+ val[3] +'</span>'
                  +                 '</span>'
                  +             '</div>'
                  +         '</div>'
                  +     '</div>'
                 +  '</div>'
              + '</div>'
              + '<hr>';


                                $('.review').append(str);
								
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

                $(".review").on('click', '.goodSell', function (e) {

                	// console.log(e.currentTarget.children.item(0).value);
                	 
                    let sno = e.currentTarget.children.item(0).value;

                    //

                    location.href = "goodsDetailPage.go?sno=" + sno;
                });
            });
        </script>
        
        <script>
          $(function () {

                $(".review").on('click', '.detail', function (e) {

                	//console.log(e.currentTarget.children.item(2).value);
                	
                    let rno = e.currentTarget.children.item(2).value;

                    location.href = "rdlist.bo?rno=" + rno;
                });
            }); 
        </script>
        
     <title>쇼핑몰 후기</title>
</head>
<body>
  
    <div class="wrapper">
        <div class="center-div">  
         
	        <jsp:include page="../common/sidebar.jsp" />
	        
	        <div class="main-div">
		        <jsp:include page="../common/header.jsp" />
	
		           
		        <div class="content">

        <div class="review">

			
           
        </div>
        
         <div id="loading">
             <img src="resources/images/sample/0019.gif" alt="Loading..." />
         </div>

        <!-- 추가적인 리뷰는 위와 같은 구조로 추가 가능 -->


       			</div>
		      
	        </div> 
	              
        </div>
    </div>

</body>
</html>

<!-- 11/27 성광 후기리스트페이지 jsp추가 -->