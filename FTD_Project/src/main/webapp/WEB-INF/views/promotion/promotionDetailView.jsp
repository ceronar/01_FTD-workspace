<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
.header{
 display : none;
}


        header {
            
            color: #ffffff;
       		background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
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

        .btn {
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

        .btn:hover {
            background-color: #27AE60;
        }

        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        header span {
            margin-left: 10px;
            color : black;
            font-size : 30px;
        }
        
  

	.icon span {

		font-size: 40px;
	
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
           
        }

        .comment-section {
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


        
        .profile_3 {
       	display :flex;
       	margin-left: auto;
        }

        .profile_3_1 .btn {
            background-color: transparent;
            color: #0c7c4b;
            border: 1px solid #0c7c4b;
            padding: 10px;
            cursor: pointer;
            border-radius: 4px;
            transition: background-color 0.3s, color 0.3s;
            display: inline-block;
            width : 100px;
            margin-right: 10px;
        }

        .profile_3_1 .btn:hover {
            background-color: #0c7c4b;
            color: #ffffff;
        }

        #profile_2_2 > span{
            font-size : 15px;
            color : rgb(143, 143, 143);
        }
            main > .count {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        main > div span:last-child {
            margin-left: auto;
        }
        .content_1{
        	width: 200px;
        }
         /* 댓글 스타일 */
        .comment {
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 1px solid #ccc;
        }

        .comment p {
            margin: 5px 0;
        }
        .comment > hr{
        
        	
        }
        
   .reply-info {
   		display : flex;
   }
   .replyOption {
   		margin-left: auto;
   }
   
   <!-- 댓글수정 모달창 -->
     div.replyModal { position:relative; z-index:1;} 
	 div.modalBackground { position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0, 0, 0, 0.5); z-index:100000; }
	 div.modalContent { position:fixed; top:40%; left:calc(50% - 250px); width:500px; height:250px; padding:20px 10px; background:#fff; border:2px solid #2ECC71; z-index:100001 }
	 div.modalContent textarea { font-size:16px; font-family:'맑은 고딕', verdana; padding:10px; width:475px; height:200px; resize: none;}
	 div.modalContent button { margin : 0px;  width: 100px; height : 40px; padding : 0px;}
	 div.modalContent button.modal_cancel { margin : 0px; width: 100px; height : 40px; padding : 0px;}
	 .button_option div {
    display: inline-block;
    margin-right: 10px; 
  }
     <!-- 구매 모달창-->
     div.replyModal_Buy { position:relative; z-index:1;} 
	 div.modalBackground_Buy { position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0, 0, 0, 0.5); z-index:100000; }
	 div.modalContent_Buy { position:fixed; top:40%; left:calc(50% - 250px); width:500px; height:100%; padding:20px 20px; background:#fff; border:2px solid #2ECC71; z-index:100001 }
	 div.modalContent_Buy textarea { font-size:16px; font-family:'맑은 고딕', verdana; padding:10px; width:475px; height:200px; resize: none;}
	 div.modalContent_Buy a{ margin-left : auto;}
	 div.modalContent_Buy button.modal_cancel_Buy { margin : 0px; width: 100px; height : 40px; padding : 0px;}
	 .button_option_Buy div {
    display: inline-block;
    margin-right: 10px; 
  }
  
  
	.goodSell:hover{
		background : #f2fff6;
	}
	
	
    </style>
    
    <script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    <title>홍보(리스트)</title>
    
     <script>
   
    
 // 찜하기 조회
	function ajaxSelectSubscribe() {
		
		let memberNo = ${!empty sessionScope.loginUser.memberNo ? sessionScope.loginUser.memberNo : 0 };
		
		$.ajax({
			url : 'ajaxSelectSubscribe.se',
			type: 'get',
			data : { memberNo : memberNo, sellerNo : ${requestScope.p.sellerNo}},	
			success: function(result) {

				if (result > 0) {
					
					// console.log(result);

					$("#subscribe").css("background-color", "#388755");

				} else {
					
					// console.log(result);

					$("#subscribe").css("background-color", "lightgray");

				}

			},
			error: function() {

				console.log("ajax 통신 실패");
			}
			
		
		});
	}
 
 $(function() {
	 
 
	let memberNo = ${!empty sessionScope.loginUser.memberNo ? sessionScope.loginUser.memberNo : 0 };
	
	// 찜하기 클릭 이벤트
	$(".profile_3_1").on("click", "#subscribe", () => {
		$.ajax({
			url: "ajaxClickSubscribe.se",
			type: "get",
			data: { memberNo: memberNo, sellerNo: ${ requestScope.p.sellerNo }},
			success : result => {
				
				if(result == "추가") {
					
					$(".profile_3_1 .btn").css("background-color", "red");
					$("#subscribe").html("단골");
					
				} else if(result == "삭제") {
									
					$("#subscribe").css("background-color", "blue");
					$("#subscribe").html("단골맺기");
					
				} else {
					
					location.href = "pdlist.bo?pno=" + ${ requestScope.p.promotionNo };
				}
			},
			error : () => {
				console.log("ajax 통신 실패");
			}
		});
	});
	
 });
</script>
</head>
<body>
    <header>
    <jsp:include page="../common/header.jsp"/>
    
        <div>
       		<a href="plist.bo"><span><i class="fas fa-arrow-left"></i></span></a>
        </div>
        <div class="icon">
        	<a href="${pageContext.request.contextPath}"><span id="home-icon" class="material-symbols-outlined">home</span></a>
        	<a href="basket.me"><span class="material-symbols-outlined">shopping_cart</span></a>
        </div> <!-- 뒤로가기 홈으로가기 장바구니가기 만들기 -->
    </header>
    
   
    <main>
        <div class="count">
        <span>판매</span>
        <span>조회수 ${requestScope.p.count}</span>
        </div>
        <div class="profile">
            <div class="profile_1">
                <c:choose>
			    	<c:when test="${sellerFile.changeName == null}">
			    		<img src="/ftd/resources/uploadFiles/sellerPage/pngwing.com.png">
			    	</c:when>
			    	<c:otherwise>
			    		<img src="${sellerFile.changeName }">
			    	</c:otherwise>
			    </c:choose>
            </div>
            <div class="profile_2">
                <span>${requestScope.seller.companyName}</span>
                    <div id="profile_2_2">
                        <span>${requestScope.seller.address }</span>
                        <!-- 지역 -->
                        <span>${requestScope.p.createDate }</span>
                        <!-- 몇분전인지-->
                    </div>
            </div>
           
           
           <!-- 판매자가 로그인했을때 자기 마켓에만 보기게끔 조건문 -->
              <c:choose>
             <c:when test="${ not empty sessionScope.loginSeller and sessionScope.loginSeller.sellerNo eq requestScope.p.sellerNo}">
           <div class="profile_3">
	             <div class="profile_3_1">
		              <a href="sellerDetailPage.se?sno=${sessionScope.loginSeller.sellerNo}" style="width : 50px"><i class="fas fa-store"></i></a>
		              
		        
		              
	             </div>
	             <div class="profile_3_1">
		              <a onclick="postFormSubmit(1)"> 수정</a>
			          <a onclick="postFormSubmit(2)">삭제</a>
	             </div>
           </div> 
            <form action="" id="postForm" method="post">
               	<input type="hidden" id="pno" name="pno" value="${requestScope.p.promotionNo }">
            </form>

        	<script>
               	function postFormSubmit(num) {
               		
               		// num 값에 따라 위의 form 태그에 action 속성을 부여한 후
               		// submit 시키기
               		
               		if(num == 1) { 
               			// num == 1 일 경우 : 수정하기 버튼을 클릭한 상태
               			
               			$("#postForm").attr("action", "updateEnroll.pr").submit();
               			
               		} else {
               			// num == 2 일 경우 : 삭제하기 버튼을 클릭한 상태
               			
               			$("#postForm").attr("action", "delete.bo").submit();
               			
               			// jQuery 의 submit() 메소드 : 해당 form 의 submit 버튼을 누르는 효과
               		}
               	}
               </script>
               
               <!-- 찜(단골) -->
              
                
               </c:when>
               <c:otherwise>
            <div class="profile_3">
			    <div class="profile_3_1">
			        <a href="sellerDetailPage.se?sno=${requestScope.p.sellerNo}" style="width: 50px; color : green; font-size : 30px;"><i class="fas fa-store"></i></a>
			        	<c:if test="${ !empty sessionScope.loginUser }"> 
			        	
						<button class="btn" id="subscribe">단골맺기</button>
						
						</c:if>
			    </div>
			</div>
           	   </c:otherwise>
           	   </c:choose> 
        </div>
		
        <div id="content" align="center">
            
         
            
				${requestScope.p.promotionContent}
			
         
        </div>


        <button class="modify_Buy btn">구매하기</button>
    </main>

    <main>
        <div class="profile">
            <div class="profile_1">
                <c:choose>
			    	<c:when test="${sellerFile.changeName == null}">
			    		<img src="/ftd/resources/uploadFiles/sellerPage/pngwing.com.png">
			    	</c:when>
			    	<c:otherwise>
			    		<img src="${sellerFile.changeName }">
			    	</c:otherwise>
			    </c:choose>
            </div>
            <div class="profile_2">
                <span>${requestScope.seller.companyName}</span>
                <div>
                    <span>
                        <span><i class="fas fa-star" style="color : rgb(255, 225, 0)"></i>${requestScope.starRating}</span>
                    </span>
                    <span>후기 ${requestScope.reviewCount } <i class="fas fa-chevron-right"></i></span>
                </div>
            </div>
        </div>
    </main>

    <main class="comment-section">
        <div>
            <span>
                <span><i class="far fa-comment"></i></span> 댓글</span>
                <span> ${requestScope.replyList} </span>
            </span>
        </div>
     
        <div>
            <input type="text" id="replyContent" value="로그인 후 이용해주세요." name="replyContent"   disabled="ture">
            <input type="hidden" value="${requestScope.p.promotionNo }" name="promotionNo">
            <input type="hidden" value="${sessionScope.loginUser.memberNo }" name="memberNo">
             <div class="comment">
             
          <!--     
            <c:forEach var="r" items="${ requestScope.prList }">
             	<hr>            	
             		        	
                	<p>${r.replyContent}</p>
               <div>
                <div class="reply-info">
                <input type="hidden" value="${ r.replyNo }">
                	<div>
                	작성자: ${r.memberNo } | 작성일: ${r.createDate }
                	</div>
                	<div class="replyOption">
                	<a class="modify">수정</a>
	                <a class="delete" onclick="postFormReplySubmit(4, ${ r.replyNo })">삭제</a> 
	                </div>
                </div>
	           
	           </div>  
	
					
      </c:forEach>
           -->
           
          <!-- 댓글 로그인관련 조건거는곳 --> 
           <script> 
    
		$(function() {
			if(${not empty sessionScope.loginSeller}){
				$("#replyContent").val("구매자 회원으로 로그인해주세요!!");
			}
			
			if(${not empty sessionScope.loginUser}){
				
				$("#replyContent").val("댓글을 남겨보세요");
				$("#replyContent").attr("disabled",false);
				
				$("#replyContent").focusin(function() {
					
					$("#replyContent").val("");
				});
				
			
			}else{
				
				$("#replyContent").click(function() {
					console.log("gg");
					alert("로그인 해주세요!");
				}); 
			}
			
		})	
			
			</script>
         
           <script>
           
           $(function() {
       		
       		//댓글 리스트 조회용 함수 호출 (화면이 보여지는 순간 최초 1회)
       		selectReplyList();
       	
       		// 추가적으로 1초 간격마다 selectReplyList 함수 실행
       		setInterval(selectReplyList, 3000);
       		
      	 	});
           
           function selectReplyList() {
				
       		
       		$.ajax({
       			url : "selectReplyList.bo",
       			type : "post",
       			data : { 	
       				pno: ${requestScope.p.promotionNo}
       			},
       			success : function(result) { // list 는 자바스크립트 변수
       				
       				console.log(result);
       			//로그인한유저 + 내가쓴 댓글에만 삭제 수정뜨게 만들어야뎀 아직못함
       				
       				let resultStr = "";
       				let result1 = "";
       				
			        for(let i = 0; i < result.length; i++) {
			        	 
			        	resultStr =  	
         		   	'<hr>'    	
		            +   '<div>'
		            +    '<p class="replyContent">'+ result[i].replyContent +'</p>'
		            +    '<div class="reply-info">'
		            +    '<input type="hidden" class="rno" value="'+ result[i].replyNo +'">'
		            +    	'<div>'
		            +    	'작성자: '+ result[i].memberNo +' | 작성일: '+ result[i].createDate +''
		            +    	'</div>'
		            +   	'<div class="replyOption">';
		          
		            	if(${!empty sessionScope.loginUser} && result[i].memberNo == "${sessionScope.loginUser.memberId}"){
          resultStr +=  '<a class="modify"  data-repNum="'+ result[i].replyNo +'">수정 </a>'
			        +        '<a class="delete" onclick="postFormReplySubmit(4, '+ result[i].replyNo +')">삭제</a>';
		            	}   
		   
		            resultStr  +='</div>'
		            +    '</div>'
			           
			        +   '</div>' ;
			        
			   result1 += resultStr;
			        	 
			        }     
			    
						$(".comment").html(result1);
       				
       			},
       			
       			error : function() {
       				console.log("댓글리스트 조회용 ajax 통신 실패!");
       			}
       			
       		});
       	}
           
           function insertReply() {
        	   
        	   
        	   if($("#replyContent").val().trim().length != 0) {
        		   
        		   let memberNo = ${!empty sessionScope.loginUser ? sessionScope.loginUser.memberNo : 0};
        		   
        		   $.ajax({
                       url: 'insertReply.bo',
                       type: 'post',
                       data: { 
                    	    promotionNo: ${requestScope.p.promotionNo},
                    	    memberNo: memberNo,
                    	    replyContent: $("#replyContent").val()
                    	},
    	               success : function(result) {

    	            	   
    	    				if(result == "success"){//등록 성공시
    	    					
    	    					//댓글 작성 성공 시
    	    					selectReplyList();
    	    					//textarea 를 초기화
    	    					$("#replyContent").val("");
    	    					
    	    				}
    	    				
    	    			},
    	    			error : function() {
    	    				
    	    				console.log("댓글 작성용 ajax 통신 실패!");
    	    			}
                   });
        	   }else{
        		   
        		   alertify.alert("Alert", "댓글 작성 후 등록을 요청해주세요", function() {alertify.success('OK'); });
        		   
        		   
        		   
        	   }
        	   
               
           }

           </script>
    	
   
    	<!-- 수정 -->
    		<script>
    		$(document).on("click", ".modal_modify_btn", function(){
    			
    			   var modifyConfirm = confirm("정말로 수정하시겠습니까?");
    			   let memberNo = ${!empty sessionScope.loginUser ? sessionScope.loginUser.memberNo : 0};
    			   
    			   if(modifyConfirm) {
    			    var data = {
    			       replyNo: $(this).attr("data-repNum"),
    			       replyContent : $(".modal_repCon").val(),
    			       memberNo : memberNo,
    			       promotionNo: ${requestScope.p.promotionNo}
    			      };  
    			    
    			    $.ajax({
    			     url : "updateReply.bo",
    			     type : "post",
    			     data : data,
    			     success : function(result){
    			      
    			      if(result == "success") {
    			    	  alert("수정 성공!");         
    			    	  selectReplyList();
    			       $(".replyModal").fadeOut(200);
    			      } else {
    			       alert("작성자 본인만 할 수 있습니다.");         
    			      }
    			     },
    			     error : function(){
    			      console.log("에러")
    			     }
    			    });
    			   }
    			   
    			});
    		</script>
    
   
        </div>
        <!-- 삭제 -->
         	<button class="btn" onclick="insertReply()">입력 </button>
         	
       		 <form action="" id="postFormReply" method="post">
               	<input type="hidden" id="prno" name="replyNo" value="">
               	<input type="hidden" id="pno" name="promotionNo" value="${requestScope.p.promotionNo}">
               
               	<input type="hidden" value="${sessionScope.loginUser.memberNo }" name="memberNo">
            </form>

        	<script>
               	function postFormReplySubmit(num, t) {
               		
               		// num 값에 따라 위의 form 태그에 action 속성을 부여한 후
               		// submit 시키기
               		
               		if(num == 3) { 
               			// num == 3 일 경우 : 수정하기 버튼을 클릭한 상태
               			console.log($(".modal_repCon").val());
               			
               			
               			$("#prno").val(t);
               			$("#prc").val($(".modal_repCon").val());
               			
               			$("#postFormReply").attr("action", "updateReply.bo").submit();
               			
               		} if(num == 4) {
               			// num == 4 일 경우 : 삭제하기 버튼을 클릭한 상태
               			
               			$("#prno").val(t);
               			$("#postFormReply").attr("action", "deleteReply.bo").submit();
               			
               			// jQuery 의 submit() 메소드 : 해당 form 의 submit 버튼을 누르는 효과
               		}
               	}
          </script>
		        <!-- 모달창 -->
		        	  <div class="replyModal" style="display:none">
		
					   <div class="modalContent">
					    
					    <div>
					     <textarea class="modal_repCon" name="modal_repCon"></textarea>
					    </div>
					    
					    <div class="button_option btn">
					    <div><button type="button" class="modal_modify_btn btn">수정</button></div>
					     <div><button type="button" class="modal_cancel btn">취소</button></div>
					    </div>
					    
					   </div>
					
					   <div class="modalBackground"></div>
				   
				   
					</div>
					
					
					  <!-- 모달창 구매 -->
					  <div class="replyModal_Buy" style="display:none">
		
					   <div class="modalContent_Buy">
					    <div> 
					    <i class="fas fa-times modal_cancel_Buy" style="cursor: pointer;"></i>
					    </div>
					    <br>
				    	<div class="goods" style="border: 1px solid #2ECC71; width:100%; height : 6%; border-radius: 5px; display : flex; cursor : pointer;">
					    	<div style="margin-top : 15px; margin-left : 15px;">
								 상품을 선택해주세요
					    	</div>
					    	<div style="margin-top : 17px; margin-left : auto; margin-right : 15px;">
					    	<i class="fas fa-chevron-down"></i>
					    	</div>
					    </div>
					    
					    <div class="goods_1" style="border: 1px solid #2ECC71; width:100%; height : 100%; border-radius: 5px; display : flex; cursor : pointer; display : none; overflow-y: auto; max-height: 400px;"" >
					    
					    	<c:forEach var="g" items="${requestScope.goodSell}">
					    		<div style="display : flex; width :  " class="goodSell">
					    		<input type="hidden" value="${g.sellNo}">
					    		
					    				<div style="width : 90px; height : 90px; margin : 10px 0px 10px 10px;">
					    					<img src="${g.changeName }" style="width : 90px; height : 90px; border-radius: 10px;">
					    				</div>
					    		
					    			<div>
						    			<div style=" line-height: 50px; margin-left : 10px;">
						    			 <fmt:formatNumber type="number" maxFractionDigits="3" value="${g.count}" var="count" />
							    			<div>${g.sellTitle}</div>
							    			<div>${count }원</div>
						    			</div>					    		
					    			</div>
					    			<div style=" margin-left : auto; margin-right : 30px; line-height: 110px;" >
							    		<i class="fas fa-chevron-right"></i>
							    	</div>
					    		</div>
					    		<hr style="margin : 0;">
					    	</c:forEach>
					    		
					    	
					    </div>
					    
					   </div>
					
					   <div class="modalBackground_Buy"></div>
				   
					</div>
		           
            </div>
              <script>
            $(function () {

                $(".goods_1").on('click', '.goodSell', function (e) {

                	// console.log(e.currentTarget.children.item(0).value);
                	 
                    let sno = e.currentTarget.children.item(0).value;

                    //

                    location.href = "goodsDetailPage.go?sno=" + sno;
                });
            });
        </script>
            
            <!-- 모달(구매) -->
			<script>	
			$(document).on("click", ".modify_Buy", function(){
				 //$(".replyModal").attr("style", "display:block;");
			
				 $(".replyModal_Buy").fadeIn(200);
			
				// var repNum = $(this).attr("data-repNum");	  
				
				// var repCon = $(this).parent().parent().parent().children(".replyContent").text();
				 
				// $(".modal_repCon").val(repCon);
				//$(".modal_modify_btn").attr("data-repNum", repNum);
				 
				 
				});
			
			$(document).on("click", ".modal_cancel_Buy", function(){
				 //$(".replyModal").attr("style", "display:block;");
			
				$(".replyModal_Buy").fadeOut(200);
	
				 
				});
			
			$(document).on("click", ".goods", function(){
				 //$(".replyModal").attr("style", "display:block;");
			
			toggle_layer();

			});
			</script>
				
            <script>
				function toggle_layer() {
					
					if($(".goods_1").css("display") == "block"){
						$(".goods_1").hide(200);
					}else {
						$(".goods_1").show(200);
						
					}
				}
			</script>
             <!-- 모달(수정) -->
			<script>	
			$(document).on("click", ".modify", function(){
				 //$(".replyModal").attr("style", "display:block;");
			
				 $(".replyModal").fadeIn(200);
			
				 var repNum = $(this).attr("data-repNum");	  
				
				 var repCon = $(this).parent().parent().parent().children(".replyContent").text();
				 
				 $(".modal_repCon").val(repCon);
				 $(".modal_modify_btn").attr("data-repNum", repNum);
				 
				 
				});
			$(document).on("click", ".modal_cancel", function(){
				 //$(".replyModal").attr("style", "display:block;");
			
				$(".replyModal").fadeOut(200);
	
				 
				});
			
			</script>	
       
    </main>


<!-- 슬라이드 -->
    <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
		            	        <script type="text/javascript">
						        $(".slider").slick({
									dots: true,
									autoplay: true,
									autoplaySpeed: 3000,
									arrows: true,
									responsive: [
									    {
										    breakpoint: 768,
										    settings: {
										        autoplay: false,
									      	}
									    }
									]
								});
						        </script>
						       

</body>

</html>
<!-- 11/27 성광 홍보상세보기페이지 jsp추가 -->

