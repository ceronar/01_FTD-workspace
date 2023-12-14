<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>내가 쓴 글</title>
	<link href="${pageContext.request.contextPath}/resources/css/main.css?version=1.2" rel="stylesheet" type="text/css">
	<style type="text/css">
		.content_1 {
            display: none;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            border-radius: 5px;
            margin: 20px auto;
            max-width: 800px;
            overflow-x: auto;
        }

        .active {
            display: block !important;
        }

        .content>button {
            margin: 10px;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            background-color: #4caf50;
            color: #fff;
            border: none;
            border-radius: 5px;
        }

        .content>button:hover {
            background-color: #45a049;
        }

        .content>button:disabled {
            margin: 10px;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            background-color: #406141;
            color: #fff;
            border: none;
            border-radius: 5px;
        }

        .content>button:disabled:hover {
            background-color: #2c362d;
        }

        .content_1>table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        
        .content_1>table>tbody>tr:hover {
        	background-color: lightgrey;
        	cursor: pointer;
        }

        .content_1 th, .content_1 td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }

        .content_1 th {
            background-color: #4caf50;
            color: #fff;
        }

        /* Pagination controls */
        .pagination {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .pagination button {
            background-color: #ddd;
            color: #333;
            border: none;
            padding: 10px 15px;
            margin: 0 5px;
            cursor: pointer;
            border-radius: 5px;
        }

        .pagination button.active {
            background-color: #4caf50;
            color: #fff;
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
					<h1>내가 쓴 글</h1>
					
					<button id="reviewsBtn" onclick="showContent('reviews')" disabled>리뷰 보기</button>
					<button id="inquiriesBtn" onclick="showContent('inquiries')">문의 보기</button>
					
					<div id="reviews" class="content_1 active">
					    <h2>내 리뷰</h2>
					    <table class="review-table">
					        <thead>
					            <tr>
					                <th hidden>후기 번호</th>
					                <th>상품명</th>
					                <th>후기 제목</th>
					                <th>등록일</th>
					            </tr>
					        </thead>
					        <tbody id="reviewsList">
					        </tbody>
					    </table>
					    <div id="reviewsPagination" class="pagination">
					    </div>
					</div>
					
					<div id="inquiries" class="content_1">
					    <h2>내 문의</h2>
					    <table class="inquiry-table">
					        <thead>
					            <tr>
					                <th hidden>문의 번호</th>
					                <th>상호명</th>
					                <th>문의 제목</th>
					                <th>등록일</th>
					                <th>답변 상태</th>
					            </tr>
					        </thead>
					        <tbody id="inquiriesList">
					        </tbody>
					    </table>
					    <div id="inquiriesPagination" class="pagination">
					    </div>
					</div>
					
					<script>
					    let reviewsData = [];
					    <c:forEach var="innerList" items="${requestScope.reviewList}">
					    	var innerArray = [${innerList.revNo},"${innerList.goodTitle}","${innerList.revTitle}","${innerList.createDate}"];
					    	reviewsData.push(innerArray);
					    </c:forEach>
					    let inquiriesData = [];
					    <c:forEach var="innerList" items="${requestScope.inquiryList}">
					    	var innerArray = [${innerList.inqNo},"${innerList.companyName}","${innerList.inqTitle}","${innerList.createDate}","${empty innerList.responseDate ? '답변 전' : '답변 완료'}",${innerList.sellerNo}];
					    	inquiriesData.push(innerArray);
					    </c:forEach>
						const itemsPerPage = 5;
						function generatePaginationControls(totalPages, contentId, currentPage = 1) {
					        const paginationDiv = document.getElementById(contentId+"Pagination");
					        paginationDiv.innerHTML = "";
					
					        for (let i = 1; i <= totalPages; i++) {
					            const button = document.createElement("button");
					            button.textContent = i;
					            button.onclick = function() {
					                showContent(contentId, i);
					            };
					
					            if (i === currentPage) {
					                button.classList.add('active');
					            }
					
					            paginationDiv.appendChild(button);
					        }
					    }
						
					    function showContent(contentId, currentPage = 1) {
					        const contents = document.getElementsByClassName('content_1');
					        for (let i = 0; i < contents.length; i++) {
					            contents[i].classList.remove('active');
					        }
					
					        const content = document.getElementById(contentId);
					        const dataList = document.getElementById(contentId+"List");
					        const startIndex = (currentPage - 1) * itemsPerPage;
					        const endIndex = startIndex + itemsPerPage;
					        dataList.replaceChildren();
					        const data = contentId === "reviews" ? reviewsData : inquiriesData;
					        for (let i = startIndex; i < endIndex && i < data.length; i++) {
					            const row = document.createElement("tr");
					            // td 반복
					            for(let j = 0; j < data[i].length; j++){
					                let cell = document.createElement("td");
					                cell.textContent = data[i][j];
					                if(j == 0){
					                    cell.style.display = "none";
					                }
					                row.appendChild(cell);
					            }
					            dataList.appendChild(row);
					        }
							
					        const totalPages = Math.ceil(data.length / itemsPerPage);
					        generatePaginationControls(totalPages, contentId, currentPage);
							
					        content.classList.add('active');
					        document.getElementById(contentId+'Btn').disabled = true;
					        if(contentId == "reviews") {
					            document.getElementById('inquiriesBtn').disabled = false;
					        } else {
					            document.getElementById('reviewsBtn').disabled = false;
					        }
					    }
					    showContent('reviews');
					    
					    $(function() {
							$(".content_1>.review-table>tbody").on("click", "tr", e => {
								let rno = e.target.parentElement.children.item(0).innerText;
								location.href = "rdlist.bo?rno="+rno;
							});
							$(".content_1>.inquiry-table>tbody").on("click", "tr", e => {
								let ino = e.target.parentElement.children.item(0).innerText;
								let sno = e.target.parentElement.children.item(5).innerText;
								location.href = "detail.in?sno="+sno+"&ino="+ino;
							});
						});
					    
					</script>
				</div>
				<jsp:include page="../common/footer.jsp" />
			</div>  
		</div>
	</div>
</body>
</html>