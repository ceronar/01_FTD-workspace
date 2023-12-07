<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
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
            margin-right: 10px;
        }

        .comment-section {
            margin-top: 20px;
        }

        .comment-section span {
            margin-right: 0;
        }

        textarea {
            padding: 10px;
            width: calc(100% - 22px); /* Adjusted width, considering padding and margin */
            margin-bottom: 10px;
            border: 1px solid #ddd; /* Added a border for better visual separation */
            border-radius: 4px;
            resize: vertical; /* Allow vertical resizing */
        }


        <!-- a태그 버튼 -->
         .btn > a {
            float : right;
            padding: 8px 20px;
            border: none;
            background-color: #2ecc71;
            color: #fff;
            cursor: pointer;
            border-radius: 3px;
            margin: 10px 5px;
            text-decoration: none;
        }

        .btn a:hover {
            background-color: #27ae60;        
         }
    </style>
    <title>글 작성</title>
</head>
<body>
    <header>
        <h1>글 수정 페이지</h1>
    </header>

    <main>
        <div class="profile">
            <div class="profile_1">
                <img src="${requestScope.sellerFile.changeName}" alt="Profile Image">
            </div>
            <div class="profile_2">
                <span>${requestScope.seller.companyName}</span>
                <div>
                    <span>${requestScope.seller.address}</span>*
                    <span>17분전</span>
                </div>
            </div>
         
        </div>

       <div>
         <form id="enrollForm" method="post" action="update.bo" enctype="multipart/form-data">
         	
         	<input type="hidden" name="sellerNo" value="${requestScope.seller.sellerNo}">
         	<input type="hidden" name="promotionNo" value="${requestScope.p.promotionNo}">
            <label for="content">내용:</label>
            <textarea id="promotionContent" name="promotionContent"  required>${requestScope.p.promotionContent}
            </textarea>
            <!-- summernote용 textarea 
            	textarea id="summernote" name="editordata"></textarea> 
            -->

            <!-- 파일 선택 버튼 -->

            <input type="file" id="upfile" class="upfile" name="reupfile" multiple>
				<c:if test="${ not empty requestScope.pf }">
	                현재 업로드된 파일 : 
	                <br>
	                <c:forEach var="pf" items="${ requestScope.pf }">
		                <a href="${ pf.changeName }" 
		                   download="${ pf.originalName }">
						${ pf.originalName }
						</a>&nbsp
						<!-- 기존의 첨부파일이 있다라는 뜻 -->
						<input type="text" name="originalName" value="${ pf.originalName }">
						<input type="text" name="changeName" value="${ pf.changeName }">
	                </c:forEach>
	            </c:if>
            <div align="center">
                <input type="submit" value="게시글 등록">
            </div>
        </form>
       </div>
       
    </main>

    <script>
        // ... (unchanged) ...
    </script>
</body>
</html>
<!-- 11/27 성광 홍보작성페이지 jsp추가 -->