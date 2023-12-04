<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 20px;
        }

        .container {
            max-width: 800px;   
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #333;
        }

        form {
            margin-top: 20px;
        }



        input[type="text"],
        textarea {
            width: calc(100% - 22px); /* 오른쪽 여백 20px + border 1px = 22px */
            padding: 8px;
            margin-bottom: 10px;
            border-radius: 3px;
            border: 1px solid #ccc;
        }

        input[type="submit"] {
            padding: 10px 20px;
            border: none;
            background-color: #3498db;
            color: #fff;
            cursor: pointer;
            border-radius: 3px;
        }

        input[type="submit"]:hover {
            background-color: #2980b9;
        }

        textarea {
            resize: none;
            height: 500px;
        }
    </style>
	<!-- summernote 사용시 활성화 
    <script src="${pageContext.request.contextPath}/resources/js/summernote/summernote-lite.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/summernote/lang/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/summernote/summernote-lite.css">
	 -->
</head>
<body>
    <div class="container">
        <h1>공지사항 작성</h1>
	
        <form id="enrollForm" method="post" action="insert.no" enctype="multipart/form-data">
            <label for="title">제목:</label>
            <input type="text" id="title" name="title" required>

            <label for="content">내용:</label>
            <textarea id="content" name="content" required></textarea>
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
    <!-- summernote 사용시 활성화
    <script type="text/javascript">
	    $(document).ready(function() {
	    	//여기 아래 부분
	    	$('#summernote').summernote({
	    		  height: 300,                 // 에디터 높이
	    		  minHeight: null,             // 최소 높이
	    		  maxHeight: null,             // 최대 높이
	    		  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
	    		  lang: "ko-KR",					// 한글 설정
	    		  placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
	              
	    	});
	    });
    </script>
     -->
</body>
</html>