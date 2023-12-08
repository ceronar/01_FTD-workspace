<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

        .profile_3_1 button {
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

        .profile_3_1 button:hover {
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

		
    </style>
    
    <script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
    <title>홍보(리스트)</title>
</head>
<body>
    <header>
        <h1>상세보기 페이지</h1>
    </header>

    <main>
        <div class="count">
        <span>판매</span>
        <span>조회수 ${requestScope.p.count}</span>
        </div>
        <div class="profile">
            <div class="profile_1">
                <img src="${sellerFile.changeName }" alt="Profile Image">
            </div>
            <div class="profile_2">
                <span>${requestScope.seller.companyName}</span>
                    <div id="profile_2_2">
                        <span>${requestScope.seller.address }</span>
                        <!-- 지역 -->
                        <span>* 17분 전</span>
                        <!-- 몇분전인지-->
                    </div>
            </div>
            
            <div class="profile_3">
	             <div class="profile_3_1">
	             <a style="width : 50px"><i class="fas fa-store"></i></a>
	             <a>마켓 찜</a>
	             </div>
           </div> 
           
           <!-- 판매자가 로그인했을때 자기 마켓에만 보기게끔 조건문 -->
           
             <c:if test="${ not empty sessionScope.loginSeller and sessionScope.loginSeller.sellerNo eq requestScope.p.sellerNo}">
           <div class="profile_3">
	             <div class="profile_3_1">
	             <a style="width : 50px"><i class="fas fa-store"></i></a>
	             <a>마켓 찜</a>
	             </div>
	             <div class="profile_3_1">
	               
	                <a onclick="postFormSubmit(1)">수정</a>
		            <a onclick="postFormSubmit(2)">삭제</a>
	             </div>
           </div> 
            <form action="" id="postForm" method="post">
               	<input type="hidden" id="pno" name="pno"
               				value="${ requestScope.p.promotionNo }">
				<c:forEach var="f" items="${ requestScope.pfList }">
                	<input type="hidden" name="filePath" id="filePath"
                				value="${ f.changeName }">
               	</c:forEach>
            </form>

        	<script>
               	function postFormSubmit(num) {
               		
               		// num 값에 따라 위의 form 태그에 action 속성을 부여한 후
               		// submit 시키기
               		
               		if(num == 1) { 
               			// num == 1 일 경우 : 수정하기 버튼을 클릭한 상태
               			
               			$("#postForm").attr("action", "updateForm.bo").submit();
               			
               		} else {
               			// num == 2 일 경우 : 삭제하기 버튼을 클릭한 상태
               			
               			$("#postForm").attr("action", "delete.bo").submit();
               			
               			// jQuery 의 submit() 메소드 : 해당 form 의 submit 버튼을 누르는 효과
               		}
               	}
               </script>
               </c:if>
        </div>


        <div id="content">
            
          <section id="cont_center">
          		<!-- 슬라이드 사진들 -->
            	<article class="column col4">
            		<c:if test="${ not empty requestScope.pfList }">
		            	<div class="slider">
		            		<c:forEach var="pf" items="${ requestScope.pfList }">
								<div id="img-slider" align="center">
	                                <figure>
	                                    <img src="/ftd/${ pf.changeName }" >
	                                </figure>
					            </div>
				            </c:forEach>
						</div>	
					</c:if>
					<br><br>
					
					<!-- 내용 -->
					<div align="center"> ${requestScope.p.promotionContent}</div>
					
					<br><br><br><br>
				</article>	
				
			</section>
            
           
			

        </div>


        <button>구매하기</button>
    </main>

    <main>
        <div class="profile">
            <div class="profile_1">
                <img src="${sellerFile.changeName }" alt="Profile Image">
            </div>
            <div class="profile_2">
                <span>100년 수산</span>
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
        	<form action="insertReply.bo" method="post">
            <input type="text" value="댓글을 남겨보세요" name="replyContent">
            <input type="hidden" value="${requestScope.p.promotionNo }" name="promotionNo">
            <input type="hidden" value="${sessionScope.loginUser.memberNo }" name="memberNo">
             <div class="comment">
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
                	<a class="update" onclick="postFormReplySubmit(3, ${ r.replyNo })">수정</a>
	                <a class="delete" onclick="postFormReplySubmit(4, ${ r.replyNo })">삭제</a> 
	                </div>
                </div>
	           
	           </div>        
             </c:forEach>
            </div>
            <button type="submit">입력</button>
            </form>
        </div>
        
       		 <form action="" id="postFormReply" method="post">
               	<input type="hidden" id="prno" name="prno" value="">
				<c:forEach var="f" items="${ requestScope.pfList }">
                	<input type="hidden" name="filePath" id="filePath"
                				value="${ f.changeName }">
               	</c:forEach>
            </form>

        	<script>
               	function postFormReplySubmit(num, t) {
               		
               		// num 값에 따라 위의 form 태그에 action 속성을 부여한 후
               		// submit 시키기
               		
               		if(num == 3) { 
               			// num == 3 일 경우 : 수정하기 버튼을 클릭한 상태
               			$("#prno").val(t);
               			$("#postForm").attr("action", "updateReplyForm.bo").submit();
               			
               		} if(num == 4) {
               			// num == 4 일 경우 : 삭제하기 버튼을 클릭한 상태
               			$("#prno").val(t);
               			$("#postForm").attr("action", "delete.bo").submit();
               			
               			// jQuery 의 submit() 메소드 : 해당 form 의 submit 버튼을 누르는 효과
               		}
               	}
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

