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

        .btn button {
            padding: 8px 20px;
            border: none;
            background-color: #2ecc71;
            color: #fff;
            cursor: pointer;
            border-radius: 3px;
        }

        .btn button:hover {
            background-color: #27ae60;
        }

        img {
            width : 100%;
        }
        .btn {

            height: 30px;

        }
        .btn button {
            float : right;
            margin: 0px 5px; /* 버튼 사이의 여백 조절 */

        }

    </style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slick.css">
	<script src="${pageContext.request.contextPath}/resources/js/slick.min.js"></script>

</head>
<body>
	<div class="wrapper">
        <div class="center-div">  
	        <jsp:include page="../common/sidebar.jsp" />
	        <div class="main-div">
		        <jsp:include page="../common/header.jsp" />
			        <div class="content">
				        <div class="container">
					        <h1>게시글 상세보기</h1>
					        <div class="post">
					            <h2>${ requestScope.n.noticeTitle }</h2>
					            <div class="notice-info">  
					                <p>작성자: admin | 작성일: 2023-11-23</p>
					            </div>
					            
					            <div class="post-content">
					            	<article class="column col4">
						            	<div class="slider">
						            		<c:forEach var="nf" items="${ requestScope.nf }">
												<div>
					                                <figure>
					                                    <img src="/ftd/${ nf.changeName }" alt="이미지1">
					                                </figure>
									            </div>
								            </c:forEach>
								            <div>"${ requestScope.nf }"</div>
										</div>	
									</article>	                
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
					
					        <div class="btn">
					            <button>수정</button>
					            <button>삭제</button>
					        </div>
					    </div>
			        <br>
		        </div>
		        <jsp:include page="../common/footer.jsp" />
	        </div> 
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
	              
        </div>
    </div>
    

</body>
</html>