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

        /* 댓글 영역 스타일 */
        .reply-area {
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
            padding: 8px 20px;
            border: none;
            background-color: #2ecc71;
            color: #fff;
            cursor: pointer;
            border-radius: 3px;
        }

        button:hover {
            background-color: #27ae60;
        }

        img {
            width : 100%;
            height : 100%;
        }
        .btn {

            height: 30px;

        }
        .btn button {
            float : right;
            margin: 0px 5px; /* 버튼 사이의 여백 조절 */

        }
        .reply-area button {
            float:right;
        }
    </style>
    
</head>
<body>
    <div class="container">
        <h1>게시글 상세보기</h1>
        <div class="post">
            <h2>[공지사항] 저희 사이트 정상영업합니다</h2>
            <div class="notice-info">
                <p>작성자: admin | 작성일: 2023-11-23</p>
            </div>
            <div class="post-content">
                <p>안녕하세요, 저희 사이트는 현재 정상적으로 운영 중입니다. 추가적인 공지사항이 있으면 알려드리겠습니다.</p>
                <p>감사합니다.</p>
                <img src="resources/pngwing.com (1).png">
            </div>
            <div class="post-img">
                <a href="">
                    originalName.jpg
                </a>
                <br>
                <br>
            </div>
            
        </div>

        <div class="btn">
            <button>수정</button>
            <button>삭제</button>
        </div>
        
        <div class="reply-area">
            <h2>댓글</h2>
            <!-- 댓글 목록 -->
            <div class="comment">
                <button>삭제</button>
                <p>댓글 내용이 여기에 표시됩니다.</p>
                <p class="reply-info">작성자: user01 | 작성일: 2023-11-24</p>
            </div>

            <!-- 댓글 입력창 -->
            <form class="comment-form">
                <textarea placeholder="댓글을 입력하세요" required></textarea>
                <button class="reply-btn">댓글작성</button>
            </form>
        </div>
    </div>
</body>
</html>