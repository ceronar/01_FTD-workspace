<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>내 좋아요 목록</title>
    <link href="${pageContext.request.contextPath}/resources/css/main.css?version=1.2" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    <style type="text/css">
    	.like-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            text-align: center;
        }

        .like-table th, .like-table td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }

        .like-table th {
            background-color: #007acc;
            color: #fff;
        }
        
        .like-table>tbody>tr:hover {
			background-color: lightgray;
			cursor: pointer;
		}
		
		.deleteBtn {
			background-color: rgba(0,0,0,0);
			border: none;
			cursor: pointer;
		}
		
		/* navi css */
		#nav1 {
		    display: none !important;
		}
		
		#nav2 {
		    display: none !important;
		}
		
		#nav3 {
		    display: none !important;
		}
		
		#nav4 {
		    display: block !important;
		}
		
		#nav5 {
		    display: none !important;
		}
        
    </style>
</head>
<body>
    <div class="wrapper">
        <div class="center-div">
	        <jsp:include page="../common/sidebar.jsp" />
	        <div class="main-div">
		        <jsp:include page="../common/header.jsp" />
		        <div class="content">
		        	<h2>내 좋아요 목록</h2>
		            <table class="like-table">
					    <thead>
					        <tr>
					            <th hidden>상품 번호</th>
					            <th>상품 사진</th>
					            <th>상품명</th>
					            <th>가격</th>
					            <th>재고</th>
					            <th hidden>판매 번호</th>
						        <th class="nonClick">삭제</th>
					        </tr>
					    </thead>
					    <tbody>
					    	<c:forEach var="l" items="${ requestScope.list }">
						        <tr>
						            <td hidden>${ l.goodNo }</td>
						            <td><img src="${ l.changeName }" alt="제품 사진"></td>
						            <td>${ l.goodTitle }</td>
						            <td>${ l.price }</td>
						            <td>${ l.stock }</td>
						            <td hidden>${ l.sellNo }</td>
						            <td class="nonClick"><button type="button" class="deleteBtn"><span class="material-symbols-outlined">close</span></button></td>
						        </tr>
					        </c:forEach>
					    </tbody>
					</table>
		        </div>
		        <jsp:include page="../common/footer.jsp" />
	        </div>
        </div>
    </div>
    
    <script type="text/javascript">
    	$(function() {
    		$(".like-table>tbody").on("click", "tr", e => {
    			let target = e.target;
    			let parentTrTag = e.target;
		        for(;parentTrTag.nodeName != 'TR' ; parentTrTag=parentTrTag.parentElement);
		        let goodNo = parentTrTag.children.item(0).innerText;
    			if(target.classList.contains('nonClick') || (target == e.currentTarget.querySelector(".deleteBtn")) || (target == e.currentTarget.querySelector(".material-symbols-outlined"))) {
    				alertify.confirm('', '정말 좋아요를 삭제하시겠습니까?', 
    						function(){  
    					deleteLike(goodNo, parentTrTag);
    				}, function(){ alertify.error('취소')});
    			} else {
    				let sellNo = parentTrTag.children.item(5).innerText;
    				location.href = "goodsDetailPage.go?gno=" + sellNo;
    			}
			});
		});
    	
    	function deleteLike(goodNo, parentTrTag) {
			// console.log(goodNo);
			// console.log(parentTrTag);
    		$.ajax({
      			url : "ajaxDeleteLike.me",
      			type : "get",
      			data : {
      				memberNo : ${ sessionScope.loginUser.memberNo },
      				goodNo : goodNo
      			},
      			success : function(result) { 
					if(result == "Y") {
						parentTrTag.remove();
						alertify.success('완료');
					} else {
						alertify.error('실패');
					}
				},
				error : function() {
					console.log("ajax 통신 실패")
				}
      		});
		}
    	
    </script>
    
</body>
</html>
