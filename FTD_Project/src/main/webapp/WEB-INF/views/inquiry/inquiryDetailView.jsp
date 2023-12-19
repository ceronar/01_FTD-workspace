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
	   .post, .btn, .comment-enroll, .comment_content{
	       border-bottom: 1px solid #ccc;
	       padding-bottom : 10px;
	   }
	   .post-content {
	       margin-top: 20px;
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
					                	<c:if test="${ empty requestScope.i2.responseDate and (not empty sessionScope.loginSeller and sessionScope.loginSeller.sellerNo eq requestScope.i2.sellerNo) }">
							        		<button onclick="responseForm(1)">답글 작성</button>
							        	</c:if>
							        	<c:if test="${ not empty sessionScope.loginUser and sessionScope.loginUser.memberNo eq requestScope.i2.memberNo}">
							            <button onclick="responseForm(2)">글 수정</button>
							            <button onclick="responseForm(3)">글 삭제</button>
							            </c:if>
							        </div>
					            </div>
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
		                	<input type="hidden" id="inqContent" name="inqContent"
		                				value="${requestScope.i2.inqContent }">
		                	<input type="hidden" id="sellerNo" name="sellerNo"
		                				value="${ requestScope.i2.sellerNo }" >
							<c:forEach var="inf" items="${ requestScope.inf }">
			                	<input type="hidden" name="changeName" id="changeName"
			                				value="${ inf.changeName }">
			                	<input type="hidden" name="originName" id="originName"
			                				value="${ inf.originName }">
		                	</c:forEach>
		                	<c:if test="${ not empty requestScope.i2.responseDate  }">
			            	<input type="hidden" name="responseDate" 
			            				value="${ requestScope.i2.responseDate }">
				            <input type="hidden" name="responseContent" 
				            			value="${ requestScope.i2.responseContent }">
				            </c:if>
							
		                </form>
		                
				        
				        
					        <div class="answer-area">
					            
					            <h2>A.</h2>
					                <div>
					                	<p>${ requestScope.i2.responseContent }</p>
					                </div>
					                <p>답변일: ${requestScope.i2.responseDate }</p>
					        </div>
					        <c:if test="${ not empty requestScope.i2.responseDate and (requestScope.i2.sellerNo eq sessionScope.loginSeller.sellerNo)  }">
					        	<div class="btn">
						            <button onclick="responseForm(4)">답글 수정</button>
						            <button onclick="responseForm(5)">답글 삭제</button>
						        </div>
					        </c:if>
				        	<div class="reply-area">
				            <h2>댓글</h2>
				            <!-- 댓글 입력창 -->
				            <div class="comment-enroll">
				            <form class="comment-form" action="insert.rep" method="post">
				            	<c:choose>
					            	<c:when test="${not empty sessionScope.loginUser}">
					                	<textarea placeholder="댓글을 입력하세요" name="replyContent"required></textarea>
					                </c:when>
					                <c:otherwise>
					                	<textarea placeholder="구매자 로그인 후 이용 가능합니다." name="replyContent" disabled ></textarea>
					                </c:otherwise>
				                </c:choose>
				                <button type="submit" class="reply-btn">댓글작성</button>
				                <input type="hidden" id="inqNo" name="inqNo"
		                				value="${ requestScope.i2.inqNo }">
								<input type="hidden" name="memberNo" value="${ sessionScope.loginUser.memberNo }">
								<input type="hidden" id="sellerNo" name="sellerNo" value="${ requestScope.i2.sellerNo }" >
				            </form>
				            <br>
				            <br>
				            </div>
				            <!-- 댓글 목록 -->
				            <div class="comment">
				            	<c:forEach var="ir" items="${requestScope.ir}">
					            	<div class="comment_content">
					            		<c:if test="${ not empty sessionScope.loginUser and (sessionScope.loginUser.memberId eq ir.memberId) }">
					            			<input type="hidden" class="replyNo" value="${ ir.replyNo }">
					            			<button class="modify">수정</button>
						               		<button class="delete">삭제</button>
						               	</c:if>
						                <p class="replyContent">${ir.replyContent}</p>
						                <p class="reply-info">작성자: ${ir.memberId} | 작성일: ${ir.createDate}</p>
					                </div>
					                <br>
				            	</c:forEach>
				            </div>
							<!-- 모달창 -->
					        <div class="replyModal" style="display:none">
								<div class="modalContent">
									<div>
										<textarea class="modal_repCon" name="modal_repCon"></textarea>
									</div>
									<div class="button_option">
										<div><button type="button" class="modal_modify_btn">수정</button></div>
										<div><button type="button" class="modal_cancel">취소</button></div>
									</div>
										    
									</div>
								<div class="modalBackground"></div>
							</div>
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
    
    <!-- 모달(수정) -->
	<script>	
	$(document).on("click", ".modify", function(){
	
		// console.log(this.closest('.comment_content').querySelector('.replyNo').value);
		// console.log(this.closest('.comment_content').querySelector('.replyContent').innerHTML);
		 $(".replyModal").fadeIn(200);
	
		 var repNum = this.closest('.comment_content').querySelector('.replyNo').value;
		 var repCon = this.closest('.comment_content').querySelector('.replyContent').innerHTML;
		 
		 $(".modal_repCon").val(repCon);
		 $(".modal_modify_btn").attr("data-repNum", repNum);
		 
		 
		});
	$(document).on("click", ".modal_cancel", function(){
		 //$(".replyModal").attr("style", "display:block;");
	
		$(".replyModal").fadeOut(200);

		 
		});
	
	</script>
	<script>
	$(document).on("click", ".modal_modify_btn", function(){
		
		   var modifyConfirm = confirm("정말로 수정하시겠습니까?");
		   let memberNo = ${!empty sessionScope.loginUser ? sessionScope.loginUser.memberNo : 0};
		   
		   if(modifyConfirm) {
		    var data = {
		       replyNo: $(this).attr("data-repNum"),
		       replyContent : $(".modal_repCon").val(),
		       inqNo : ${requestScope.i2.inqNo}
		      };  
		    
		    $.ajax({
		     url : "update.rep",
		     type : "post",
		     data : data,
		     success : function(result){
		      console.log(result);
		      if(result == "success") {
		    	alert("수정 성공!");         
		    	location.reload();
		       	$(".replyModal").fadeOut(200);
		       
		      } else {
		       alert("수정에 실패했습니다.");         
		      }
		     },
		     error : function(){
		      console.log("에러")
		     }
		    });
		   }
		   
		});
	</script>
	
	<!-- 댓글 삭제 -->
	<script type="text/javascript">
	$(document).on("click", ".delete", function(){
		
		console.log(this.closest('.comment_content').querySelector('.replyNo').value);
		console.log(this.closest('.comment_content').querySelector('.replyContent').innerHTML);
		
		 var repNum = this.closest('.comment_content').querySelector('.replyNo').value;
		 var repCon = this.closest('.comment_content').querySelector('.replyContent').innerHTML;
		 
		 
		 $.ajax({
		        url: "delete.rep",
		        type: "post",
		        data: {
		            replyNo: repNum
		            inqNo : ${requestScope.i2.inqNo}
		        },
		        success: function(result){
		            console.log(result);
		            alert("삭제 성공!");         
		            location.reload();
		        },
		        error: function(){
		            console.log("에러")
		        }
		    });
		 
	});
	</script>
</body>
</html>