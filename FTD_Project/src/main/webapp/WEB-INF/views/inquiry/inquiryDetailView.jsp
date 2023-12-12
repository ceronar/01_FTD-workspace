<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	
	   .container {
	       max-width: 800px;
	       margin: 20px auto;
	       background-color: #fff;
	       padding: 20px;
	       border-radius: 5px;
	       box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	       text-align : left;
	   }
	
	   h1 {
	       text-align: center;
	       color: #333;
	   }
	   .post {
	       border-bottom: 1px solid #ccc;
	   }
	   .post-content {
	       margin-top: 20px;
	       border-top: 1px solid #ccc;
	       padding-top: 20px;
	   }
	
	   .post-meta {
	       font-size: 14px;
	       color: #888;
	   }
	
	   /* 댓글 영역 스타일 */
	   .answer-area {
	       margin-top: 30px;
	       padding-top: 20px;
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
	
	   /* 댓글 입력창 스타일 */
	   .comment-form {
	       margin-top: 20px;
	   }
	
	   .comment-form textarea {
	       width: calc(100% - 20px);
	       padding: 8px;
	       margin-bottom: 10px;
	       border-radius: 3px;
	       border: 1px solid #ccc;
	       resize: none;
	       height: 100px;
	   }
	
	   button {
	       float : right;
	       padding: 8px 20px;
	       border: none;
	       background-color: #2ecc71;
	       color: #fff;
	       cursor: pointer;
	       border-radius: 3px;
	       margin: 10px 5px;
	   }
	
	   button:hover {
	       background-color: #27ae60;
	   }
	
	   img {
	       width : 50%;
	       height : 50%;
	   }
	   .btn {
	
	       height: 30px;
	
	   }
	   .btn button {
	       float : right;
	       margin: 0px 5px; /* 버튼 사이의 여백 조절 */
	
	   }
</style>
<link href="${pageContext.request.contextPath}/resources/css/main.css?version=1.2" rel="stylesheet" type="text/css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
   <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
   <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
   <link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet" type="text/css">

<!-- 슬라이드 외부 css -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
</head>
<body>
<div class="wrapper">
        
        <div class="center-div">  
 	        <jsp:include page="../common/sidebar.jsp" />
	        <div class="main-div">
	            
	            <jsp:include page="../common/header.jsp" />
	            
	            <div class="content">
				    <div class="container">
				        <h1>문의글 상세보기</h1>
				        <div class="post">
				        	<h2>Q.${ requestScope.i2.inqTitle }</h2>
					            <div class="notice-info">  
					                <p>작성일: ${requestScope.i2.createDate }</p>
					                <div class="btn">
							        	<button onclick="responseForm(1)">답글 작성</button>
							            <button onclick="responseForm(2)">글 수정</button>
							            <button onclick="responseForm(3)">글 삭제</button>
							        </div>
					            </div>
					            <c:if test="${ not empty sessionScope.loginUser and sessionScope.loginUser.memberNo eq 1}">
						        	<script>
					                	function responseForm(num) {
					                		if(num == 1) {
					                			// 답글 작성 버튼
					                			$("#responseForm").attr("action", "enrollForm.re").submit();
					                		} else if(num == 2) {
					                			// 글 수정 버튼
					                			$("#responseForm").attr("action", "updateForm.in").submit();
					                		} else if(num == 3) {
					                			// 글 삭제 버튼
					                			$("#responseForm").attr("action", "delete.in").submit();
					                			
					                		} else if(num == 4) {
					                			// 답글 수정 버튼
					                			$("#responseForm").attr("action", "updateForm.re").submit();
					                		} else if(num == 5) {
					                			// 답글 삭제 버튼
					                			$("#responseForm").attr("action", "delete.re").submit();
					                		}
					                		
					                	}
					                </script>
					        	</c:if>
				            <div class="post-content">
					            <!-- 슬라이드 화면 -->
					            <section id="cont_center">
					            	<article class="column col4">
					            		<c:if test="${ not empty requestScope.inf }">
							            	<div class="slider">
							            		<c:forEach var="inf" items="${ requestScope.inf }">
													<div  id="img-slider" align="center">
						                                <figure>
						                                    <img src="/ftd/${ inf.changeName }" alt="이미지1">
						                                </figure>
										            </div>
									            </c:forEach>
											</div>	
										</c:if>
										<br><br><br><br>
										<div>${ requestScope.i2.inqContent }</div>
										<br><br><br><br>
									</article>	
								</section>
				            </div>
				        </div>
				        <br>
				        <form action="" id="responseForm" method="post">
		                	<input type="hidden" id="inqNo" name="inqNo"
		                				value="${ requestScope.i2.inqNo }">
		                	<input type="hidden" id="inqTitle" name="inqTitle"
		                				value="${requestScope.i2.inqTitle}">
		                	<input type="hidden" id="sellerNo" name="sellerNo"
		                				value="${ requestScope.i2.sellerNo }" >

		                	<input type="text" id="changeName" name="changeName"
		                				value="${ requestScope.inf }" >
			            	<input type="text" name="responseDate" 
			            				value="${ requestScope.i2.responseDate }">
				            <input type="text" name="responseContent" 
				            			value="${ requestScope.i2.responseContent }">

		                </form>
		                
				        
				        
					        <div class="answer-area">
					            
					            <h2>A.</h2>
					                <div>
					                	<p>${ requestScope.i2.responseContent }</p>
					                </div>
					                <p>답변일: ${requestScope.i2.responseDate }</p>
					        </div>
					        <div class="btn">
					            <button onclick="responseForm(4)">답글 수정</button>
					            <button onclick="responseForm(5)">답글 삭제</button>
					        </div>
				        <div class="reply-area">
				            <h2>댓글</h2>
				            <!-- 댓글 목록 -->
				            <div class="comment">
				                <button>삭제</button>
				                <p>댓글 내용이 여기에 표시됩니다.</p>
				                <p class="reply-info">작성자: user01 | 작성일: 2023-11-24</p>
				            </div>
				
				            <!-- 댓글 입력창 -->
				            <form class="comment-form">
				                <textarea placeholder="댓글을 입력하세요" required></textarea>
				                <button class="reply-btn">댓글작성</button>
				            </form>
				        </div>
				    </div>
			    </div>
		    </div>
	    </div>
    </div>
	<!-- 슬라이드 스크립트 -->
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