<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/main.css?version=1.2" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/promotion.css?version=1.2" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/review.css?version=1.2" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/inquiry.css?version=1.2" rel="stylesheet" type="text/css">
<style>



	.main-div {
		margin-left: 140px;
	}

	/* 테스트 */
	.store, .store div {
		border: 1px solid black;
	}

	.store {
		width: 100%;
		height: 300px;
	}

	/* store */
	.store-address-title, .store-title, .store-detail {
		width: 100%;
		display: block;
		box-sizing: border-box;
	}

	.store-address-title {
		height: 15%;
	}
	
	.store-title {
		height: 30%;
	}

	.store-detail {
		height: 55%;
	}

	/* store-address-title */
	.store-address-icon, .store-address {
		float: left;
		height: 100%;
		box-sizing: border-box;
	}

	.store-address-icon {
		width: 8%;
	}

	.store-address {
		width: 40%;
	}

	/* store-title */
	.store-name, .store-subscribe-button {
		float: left;
		height: 100%;
		box-sizing: border-box;
	}

	.store-name {
		width: 70%;
	}

	.store-subscribe-button {
		width: 30%;
	}

	/* store-detail */
	.store-subscribe, .store-rating, .store-review {
		float: left;
		height: 100%;
		box-sizing: border-box;
	}

	.store-subscribe {
		width: 33.4%;
	}

	.store-rating {
		width: 33.3%;
	}

	.store-review {
		width: 33.3%;
	}

	/* store-subscribe */
	.store-subscribe-text, .store-subscribe-count {
		width: 100%;
		display: block;
		box-sizing: border-box;
	}

	.store-subscribe-text {
		height: 50%;
	}

	.store-subscribe-count {
		height: 50%;
	}

	/* store-rating */
	.store-rating-text, .store-rating-count {
		width: 100%;
		display: block;
		box-sizing: border-box;
	}

	.store-rating-text {
		height: 50%;
	}

	.store-rating-count {
		height: 50%;
	}

	/* store-review */
	.store-review-text, .store-review-count {
		width: 100%;
		display: block;
		box-sizing: border-box;
	}

	.store-review-text {
		height: 50%;
	}

	.store-review-count {
		height: 50%;
	}
	
	.inquiry {
		display : none;
	}
	
	.sub-content {
	width: 100%; /* content 영역 크기 조정 */
	height: 800px;
	background-color: #ffffff;
	padding: 20px;
	box-sizing: border-box;
	/* border: 1px solid rgb(85, 85, 85); 위쪽(top)만 0으로 수정 */
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
	margin: 0; /* content의 마진 제거 */
	border-top: 10px solid rgb(232, 235, 237);;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
 <script src="https://kit.fontawesome.com/53a8c415f1.js" crossorigin="anonymous"></script>
<script>
	
	$(document).ready(function () { 
		
		ajaxSelectSellerMarketList();
		console.log(${requestScope.sellerNo});
		ajaxSelectSubscribe();
		
	});
	
	function ajaxSelectSellerMarketList() {
		
		$.ajax({
			
			url : 'ajaxSelectSellerMarketList.se',
            type: 'get',
            data: {sellerNo: ${requestScope.sellerNo}},
            success: function(result) {
			
            	$('.store').append(
            		
            		'<div class="store-address-title">'
						+ '<div class="store-address-icon">아이콘</div>'
						+ '<div class="store-address">'+ result[0].address + '</div>'
					+ '</div>'
					+ '<div class="store-title">'
						+ '<div class="store-name">'+ result[0].companyName + '</div>'
						+ '<div class="store-subscribe-button"><button id="subscribe">단골맺기</button><form action="list.in"><button type="submit">문의</button><input type="hidden" name="sellerNo" id="sellerNo" value="${ requestScope.sellerNo }"></form></div>'
					+ '</div>'
					+ '<div class="store-detail">'
						+ '<div class="store-subscribe">'
							+ '<div class="store-subscribe-text">단골</div>'
							+ '<div class="store-subscribe-count">'+ result[3] + '</div>'
						+ '</div>'
						+ '<div class="store-rating">'
							+ '<div class="store-rating-text">평점</div>'
							+ '<div class="store-rating-count">'+ result[1] + '</div>'
						+ '</div>'
						+ '<div class="store-review">'
							+ '<div class="store-review-text">후기</div>'
							+ '<div class="store-review-count">'+ result[2] + '</div>'
						+ '</div>'
					+ '</div>'
            	);
	
            },
            error : function() {
            	
            	console.log("ajax 통신 실패");
            }
            
		});
				
	}

	function ajaxSelectSubscribe() {
		
		$.ajax({
			url : 'ajaxSelectSubscribe.se',
			type: 'get',
			data : { memberNo : ${sessionScope.loginUser.memberNo }, sellerNo : ${requestScope.sellerNo}},
			success: function(result) {
				
				console.log(result);
				
				if(result == "btn btn-secondary") {
					
					$("#subscribe").attr('class', result);
					
					$("#subscribe").attr("disabled", true);
					
				} else {
					
					$("#subscribe").attr('class', result);
					
					$("#subscribe").attr("disabled", false);
				}
				
			},
			error : function() {
				
				console.log("ajax 통신 실패");
			}
			
		
		});
	}
	
	

</script>
</head>
<body>
	<div class="wrapper">
        
        <div class="center-div">  
         	        
	        <div class="main-div">
	            
	            <jsp:include page="../common/header.jsp" />
	            
	            <div class="content">
	            	
	            	<div class="store">
						
						
					</div>
	
				
		        </div>

				<div class="content">
					
					<div class="sub-menu">
					
					</div>
				
					
				<button onclick="selectSellerPromotion()">홍보</button>
				<button onclick="selectSellerReview()">후기</button>
				<button class="inquiry-btn" onclick="selectSellerInquiry()">문의</button>
				
			<script>
				function toggle_layer() {
					if($(".promotion").css("display") == "none"){
						$(".promotion").show();
					}
				}
			</script>
				
			<script>
			
			
			
			 var page = 0;
	         var pageSize = 5; // 초기 로딩 시 20개씩 불러오기

				 function selectSellerPromotion() {
	        	 
					 $(function() {
		 					
						 toggle_layer();
						 
						
	 				  
	 				 });
	        	   
					  $(window).scroll(function () {
		                    if ($(window).scrollTop() + $(window).height() >= $(document).height() - 100) {
		                        page++;
		                        selectSellerPromotion();
		                    }
		                });
					 
	        		   $.ajax({
	                       url: 'list.pr',
	                       type: 'post',
	                       data: { 
	                    	   	sno: ${ requestScope.sellerNo },
	        		  			page: page,
	        		  			size: pageSize
	                    	},
	                        success: function (data) {

	                            console.log("통신성공!!!");
	                            console.log(data);


	                            // Remove skeleton UI
	                            $('.skeleton').remove();

	                            // Append legacy data to the container

	                            // 프로필사진, 홍보사진 정도남았고 로딩, 프론트좀더깍고 ㄹㅇ여유되면 ui클릭시 상품구매로이동까지

	                            data.forEach(function (val) {
	                            	
	               let marketImg = (val[2] == null) ? "/ftd/resources/uploadFiles/sellerPage/pngwing.com.png" : "${pageContext.request.contextPath}"+val[2].changeName;			

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
	                                    + '<span>>&nbsp('+val[0].createDate+')</span>'
	                                    + '</div>'
	                                    + '</div>'
	                                    + '</div>'
	                                    + '</div>'

	                                    + '<div>'
	                                    + '<div >'
	                                    + '<div class="detail" style="margin-left : 35px">'
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
	                                    + '<div>'
	                                    + '<div class="swiper-wrapper">'
	                                    + '<div class="product" id="product_1">'
	                                    + '<div>'  
	                                    + '<span>해</span>'
	                                    + '<span>12,500원~</span>'
	                                    + '</div>'
	                                    + '</div>'
	                                    + '<div class="product" id="product_2">'
	                                    + '<div>'
	                                    + '<span>홍새우 (단새우)급냉</span>'
	                                    + '<span>23,000원~</span>'
	                                    + '</div>'
	                                    + '</div>'
	                                    + '</div>'
	                                    + '</div>'
	                                    + '</div>'
	                                    + '</div>'

	                                    + '<div align="left" style="width : 710px">'
	                                    + '<span><i class="far fa-comment"></i></span>'
	                                    + '<span>'
	                                    + val[4]
	                                    + '</span>'
	                                    + '</div>'

	                                    + '<hr>';


	                                    $('.promotion').append(str);
	    								
	                            });




	                        },
	    	    			error : function() {
	    	    				
	    	    				console.log("댓글 작성용 ajax 통신 실패!");
	    	    			}
	                   });
	        	
	           }
		 </script>
		 
		  <script>
            var page = 0;
            var pageSize = 5; // 초기 로딩 시 20개씩 불러오기

          
             
   

            function selectSellerReview() {
               
            	 $(function() {
 					
 					 $(".promotion").hide();
 					 $(".inquiry").hide();
 				  
 				 });
            	
           	   $(window).scroll(function () {
                      if ($(window).scrollTop() + $(window).height() >= $(document).height() - 100) {
                          page++;
                          selectSellerReview();
                      }
               });
           	
                $.ajax({
                    url: 'list.re',
                    type: 'get',
                    data: { page: page, size: pageSize, sno: ${ requestScope.sellerNo } },
                 
                    success: function (data) {

                        console.log("통신성공!!!");
                        console.log(data);


                        data.forEach(function (val) {
							

                       let str  = '<div class="review-content">'
                     +  '<div id="name">'
	                     +  '<div> '+val[0].memberNo+'</div>'
	                     + ' <div><p class="review-date">xx 시간전</p></div>'
                  	 +	'</div>'
				+'<div class="detail">'
                  + '<h2>후기</h2>'
                  + '<p>'+ val[0].revContent +'</p>'
                  + '<input type="hidden" value="' + val[0].revNo + '">'  
                  +     '<div>'
                  +         '<img src="'+ val[1][0].changeName +'" id="img_1">'
                  +     '</div>'
				+'</div>'
                + '<div>'
                  +     '<div id="review_product">'        
                  +         '<table border="1" id="product">'
                  +             '<tr>'
                  +                 '<td><img src="" id="img_2"></td>'
                  +                 '<td width="685px;">'
                  +                    '<div>A급 러시아 대게(선어,자숙)</div>'
                  +                     '<div id="img_2_text_2">3kg (3미 내외)</div>'
                  +                 '</td>'
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
                  
                    error: function () {
                        console.log("통신실패!");
                    }
                });
            }

        </script>
		 
		<script>
		
		    var page = 0;
		    var pageSize = 20;
		
		    
		    function selectSellerInquiry() {
		   		$(function () {
					$(".promotion").hide();
					$(".review").hide();
					if ($(".inquiry").css("display") === "none") {
				        $(".inquiry").css("display", "block");
				        
				    }
					$(".inquiry-btn").attr("disabled", true);
		        })
				
		        
		     
		
		        $(window).scroll(function () {
                    if ($(window).scrollTop() + $(window).height() >= $(document).height() - 100) {
                        page++;
                        selectSellerInquiry();
                    }
            	});
			       
			   
		
		        $.ajax({
		            url: 'ajaxSelectList.in',
		            type: 'get',
		            data: { page: page, size: pageSize, sellerNo: '${requestScope.sellerNo}' },
		            success: function (result) {
		                result.forEach(function (item) {
		                    // responseDate의 값에 따라 answer에 '미답변' 또는 '답변완료'를 할당합니다.
		                    let answer = item.responseDate ? '답변완료' : '미답변';
		
		                    // 각 객체의 속성을 추출하여 테이블에 추가합니다.
		                    var row = '<tr>';
		                    row += '<td name="inqNo" class="inqNo">' + item.inqNo + '</td>' +
		                        '<td name="answer" class="answer">' + answer + '</td>' +
		                        '<td name="inqTitle" class="inqTitle">' + item.inqTitle + '</td>' +
		                        '<td name="memberId" class="memberId">' + item.memberId + '</td>' +
		                        '<td name="count" class="count">' + item.count + '</td>' +
		                        '<td name="createDate" class="createDate">' + item.createDate + '</td>' +
		                        '</tr>';
		
		                    $('.list-tbody').append(row);
		                });
		            },
		            error: function () {
		                console.log("ajax 통신 실패!");
		            }
		        });
		    }
				
		    $(document).ready(function() {
		 	   $('.list-area tbody').on('click', 'tr', function() {
		 	       // 클릭된 행에서 번호를 가져와서 ino 변수에 할당합니다.
		 	       var ino = $(this).find('.inqNo').text();
		 	       
		 	       // 현재 위치한 페이지에서 문의 번호(ino)를 가지고 detail.in 페이지로 이동합니다.
		 	       window.location.href = 'detail.in?ino=' + ino + '&sno=${requestScope.sellerNo}';
		 	   });
		 	});
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
        
        <script>
          $(function () {

                $(".review").on('click', '.detail', function (e) {

                	//console.log(e.currentTarget.children.item(2).value);
                	
                    let rno = e.currentTarget.children.item(2).value;

                    location.href = "rdlist.bo?rno=" + rno;
                });
            }); 
        </script>
        
        
        
        
        
		  <div align="center">
              <ul>
                  <li class="promotion">

                  </li>
              </ul>
              
               <div class="review">

        	  </div>
        	  
        	  <div class="inquiry">
        	  		<table class="list-area">
	                  <thead>
	                      <tr>
	                          <th class="inqNo" style="width : 7%;">번호</th>
	                          <th style="width : 15%;">답변여부</th>
	                          <th style="width : 38%;">제목</th>
	                          <th style="width : 10%;">문의자</th>
	                          <th style="width : 10%">조회수</th>
	                          <th style="width : 15%;">등록일</th>
	                      </tr>
	                  </thead>
	                  <tbody class="list-tbody">
	                  </tbody>
	              </table>
        	  </div>
          </div>	
					
					
				</div>


	        </div>
			
        </div>
    </div>
    
    <script>
    
    // console.log(document.getElementById("subscribe"))
    
    	
    $(function() {
    
    	$(".store").on("click", "#subscribe", () => {
    		
    		$.ajax({
    			url : "ajaxClickSubscribe.se",
				type : "get",
				data : { memberNo : memberNo, sellerNo : ${requestScope.sellerNo}},
				success : result => {
					
	            	if(result == "btn btn-secondary") {
	            		
	            		$("#subscribe").attr('class', result);
	            		
	            		$("#subscribe").attr("disabled", true);
	            		
	            	} else {
	            		
	            		$("#subscribe").attr('class', result);
	            		
	            		$("#subscribe").attr("disabled", false);
	            	}
					
					
				},
				error : () => {
					
					console.log("ajax 통신 실패");
				}
    			
    		});
    		
    	});
    	
    });
  
    </script>
    
</body>
</html>