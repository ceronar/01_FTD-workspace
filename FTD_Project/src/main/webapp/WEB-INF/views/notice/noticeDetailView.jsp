<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
		body {
			height : 100%;
		}
		
		
        .container {
            max-width: 800px;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px 20px 50px 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
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

        .notice-info, .reply-info {
            font-size: 14px;
            color: #888;
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

        .btn a {
            padding: 8px 20px;
            border: none;
            background-color: #2ecc71;
            color: #fff;
            cursor: pointer;
            border-radius: 3px;
        }

        .btn a:hover {
            background-color: #27ae60;
        }

        img {
            width : 100%;
        }
        .btn {

            height: 30px;

        }
        .btn a {
            float : right;
            margin: 0px 5px; /* 버튼 사이의 여백 조절 */
            text-decoration: none;

        }
		.slider img {
			height : 480px;
			width : 480px;
		}
		
    </style>
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
					        <h1>공지사항</h1>
					        <div class="post">
					            <h2>${ requestScope.n.noticeTitle }</h2>
					            <div class="notice-info">  
					                <p>작성일: ${requestScope.n.createDate }</p>
					            </div>
					            <c:if test="${ not empty sessionScope.loginUser and sessionScope.loginUser.memberNo eq 1}">

					        	<div class="btn">
						            <a onclick="postFormSubmit(1)">수정</a>
						            <a onclick="postFormSubmit(2)">삭제</a>
					        	</div>
						        	

						        	<form action="" id="postForm" method="post">
					                	<input type="hidden" id="nno" name="nno"
					                				value="${ requestScope.n.noticeNo }">
										<c:forEach var="f" items="${ requestScope.nf }">
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
					                			
					                			$("#postForm").attr("action", "updateForm.no").submit();
					                			
					                		} else {
					                			// num == 2 일 경우 : 삭제하기 버튼을 클릭한 상태
					                			
					                			$("#postForm").attr("action", "delete.no").submit();
					                			
					                			// jQuery 의 submit() 메소드 : 해당 form 의 submit 버튼을 누르는 효과
					                		}
					                	}
					                </script>
					        	</c:if>
					            <div class="post-content">
					            <!-- 슬라이드 화면 -->
					            <section id="cont_center">
					            	<article class="column col4">
					            		<c:if test="${ not empty requestScope.nf }">
							            	<div class="slider">
							            		<c:forEach var="nf" items="${ requestScope.nf }">
													<div id="img-slider" align="center">
						                                <figure>
						                                    <img src="/ftd/${ nf.changeName }" alt="이미지1">
						                                </figure>
										            </div>
									            </c:forEach>
											</div>	
										</c:if>
										<br><br><br><br>
										<div>${ requestScope.n.noticeContent }</div>
										<br><br><br><br>
									</article>	
								</section>
					            </div>
					            <!-- 
					            <div class="post-img">
					                <a href="">
					                    originalName.jpg
					                </a>
					                <br>
					                <br>
					            </div>
					             -->
					            
					        </div>
					        
					    </div>
			        <br>
		        </div>
		        <jsp:include page="../common/footer.jsp" />
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