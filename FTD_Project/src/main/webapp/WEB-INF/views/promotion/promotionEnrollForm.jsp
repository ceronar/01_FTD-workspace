<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/summernote/summernote-bs4.min.css">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	
    
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
        
        .header {
		display: none;
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

	 <jsp:include page="../common/header.jsp" />

	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
	<script src="${pageContext.request.contextPath}/resources/summernote/summernote-bs4.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/summernote/lang/summernote-ko-KR.js"></script>
	
    <main>
        <div class="profile">
            <div class="profile_1">  
            <c:choose>
                <c:when test="${sessionScope.loginSeller.changeName == null}">
		    		<img src="/ftd/resources/uploadFiles/sellerPage/pngwing.com.png">
		    	</c:when>
		    	<c:otherwise>
		    		 <img src="${sessionScope.loginSeller.changeName}" alt="Profile Image">
		    	</c:otherwise>
		    </c:choose>
            </div>
            <div class="profile_2">
                <span>${sessionScope.loginSeller.companyName}</span>
                <div>
                    <span>${sessionScope.loginSeller.address}</span>
                </div>
            </div>
         
        </div>
	<form method="post" action="insertPromotion.pr">
       <div>
       			<input type="hidden" name="" value="">
       
       
       			<input type="hidden" name="sellerNo" value="${sessionScope.loginSeller.sellerNo}">
            	<textarea id="summernote" name="promotionContent" required></textarea> 
            <div align="center">
                <button type="submit">게시글 등록</button>
            </div>
      
       </div>
    </form>   
   </main>

  <script>
        $(document).ready(function() {
        	
        	$('#summernote').summernote({
        		width : 900,
        		disableResizeEditor: true,             // 최소 높이
      		  	maxHeight: null,             // 최대 높이
      			height: 900,
      		  	// 에디터 한글 설정
      		  	lang: "ko-KR",
      		  	// 에디터에 커서 이동 (input창의 autofocus라고 생각하시면 됩니다.)
      		  	focus : true,
		     	toolbar: [
		     		    // 글꼴 설정
		     		    ['fontname', ['fontname']],
		     		    // 글자 크기 설정
		     		    ['fontsize', ['fontsize']],
		     		    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
		     		    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
		     		    // 글자색
		     		    ['color', ['forecolor','color']],
		     		    // 표만들기
		     		    ['table', ['table']],
		     		    // 글머리 기호, 번호매기기, 문단정렬
		     		    ['para', ['ul', 'ol', 'paragraph']],
		     		    // 줄간격
		     		    ['height', ['height']],
		     		    // 그림첨부, 링크만들기, 동영상첨부
		     		    ['insert',['picture','link','video']],
		     		    // 코드보기, 확대해서보기, 도움말
		     		    ['view', ['codeview','fullscreen', 'help']]
			    ],
    		 	// 추가한 글꼴
				fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
    			// 추가한 폰트사이즈
    			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']	,
    			callbacks : {
    				onImageUpload : function(files, editor, welEditable) {
    					
    					uploadSummernoteImageFile(files[0], this);
    				}
    			}
		     });
        	
		});
        

        function uploadSummernoteImageFile(file, el) {
        
			data = new FormData();
			data.append("file", file);
			$.ajax({
				data : data,
				type : "POST",
				url : "uploadFile.pr",
				contentType : false,
				enctype : 'multipart/form-data',
				processData : false,
				success : function(data) {
		
					$(el).summernote('editor.insertImage', data);							
				},
				error : function() {
					console.log("ajax 통신 오류")
				}
			});
		}
    	
    	
    </script>
</body>
</html>
<!-- 11/27 성광 홍보작성페이지 jsp추가 -->