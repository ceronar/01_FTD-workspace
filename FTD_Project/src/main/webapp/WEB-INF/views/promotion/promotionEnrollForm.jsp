<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
    <!-- include summernote css/js --> 
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
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
        <h1>글 작성 페이지</h1>
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
         <form id="enrollForm" method="post" action="insert.bo" enctype="multipart/form-data">
         	
         	<input type="hidden" name="sellerNo" value="${requestScope.seller.sellerNo}">
            <label for="content">내용:</label>
            <textarea id="promotionContent" name="promotionContent" required></textarea>
            <!-- summernote용 textarea 
            	textarea id="summernote" name="editordata"></textarea> 
            -->

            <!-- 파일 선택 버튼 -->

            <input type="file" id="upfile" class="upfile" name="upfile" multiple>

            <div align="center">
                <input type="submit" value="게시글 등록">
            </div>
        </form>
       </div>
       
    </main>

    <script>
        // ... (unchanged) ...
        
        $(document).ready(function() {
        	$('#promotionContent').summernote({
                placeholder: 'Hello Bootstrap 4',
                tabsize: 2,
                height: 100
              });
		});
    </script>
</body>
</html>
<!-- 11/27 성광 홍보작성페이지 jsp추가 -->