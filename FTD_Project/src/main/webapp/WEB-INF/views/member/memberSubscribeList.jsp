<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>내 찜 목록</title>
    <link href="${pageContext.request.contextPath}/resources/css/main.css?version=1.2" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    <style type="text/css">
    	.subscribe-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            text-align: center;
        }

        .subscribe-table th, .like-table td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }

        .subscribe-table th {
            background-color: #007acc;
            color: #fff;
        }
        
        .subscribe-table>tbody>tr:hover {
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
		        	<h2>내 찜 목록</h2>
		            <table class="subscribe-table">
					    <thead>
					        <tr>
					            <th hidden>판매자 번호</th>
					            <th>가게 사진</th>
					            <th>상호명</th>
					            <th>대표자 이름</th>
					            <th>연락처</th>
						        <th class="nonClick">삭제</th>
					        </tr>
					    </thead>
					    <tbody>
					    	<c:forEach var="s" items="${ requestScope.list }">
						        <tr>
						            <td hidden>${ s.sellerNo }</td>
						            <td><img src="${ s.changeName }" alt="가게 사진"></td>
						            <td>${ s.companyName }</td>
						            <td>${ s.sellerName }</td>
						            <td>${ s.email }<br>${ s.phone }</td>
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
    		$(".subscribe-table>tbody").on("click", "tr", e => {
    			let target = e.target;
    			let parentTrTag = e.target;
		        for(;parentTrTag.nodeName != 'TR' ; parentTrTag=parentTrTag.parentElement);
		        let sellerNo = parentTrTag.children.item(0).innerText;
    			if(target.classList.contains('nonClick') || (target == e.currentTarget.querySelector(".deleteBtn")) || (target == e.currentTarget.querySelector(".material-symbols-outlined"))) {
    				alertify.confirm('', '정말 찜을 삭제하시겠습니까?', 
    						function(){  
    					deleteSubscribe(sellerNo, parentTrTag);
    				}, function(){ alertify.error('취소')});
    			} else {
    				location.href = "sellerDetailPage.se?sno=" + sellerNo;
    			}
			});
		});
    	
    	function deleteSubscribe(sellerNo, parentTrTag) {
			// console.log(goodNo);
			// console.log(parentTrTag);
    		$.ajax({
      			url : "ajaxDeleteSubscribe.me",
      			type : "get",
      			data : {
      				memberNo : ${ sessionScope.loginUser.memberNo },
      				sellerNo : sellerNo
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
