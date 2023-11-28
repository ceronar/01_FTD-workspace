<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의글 작성 페이지</title>
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
</head>
<body>
    <div class="container">
        <h1>게시글 작성</h1>

        <form>
            <label for="title">제목:</label>
            <input type="text" id="title" name="title" required>

            <label for="content">내용:</label>
            <textarea id="content" name="content" rows="6" required></textarea>

            <!-- 파일 선택 버튼 -->

            <input type="file" name="file">

            <div align="center">
                <input type="submit" value="게시글 등록">
            </div>
        </form>
    </div>
</body>
</html>