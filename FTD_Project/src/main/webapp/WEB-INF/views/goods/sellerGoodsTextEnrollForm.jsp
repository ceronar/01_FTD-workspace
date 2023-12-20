<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자 상품 글 등록 상세 페이지</title>
<link href="${pageContext.request.contextPath}/resources/css/main.css?version=1.2" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@800&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>


<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/summernote/summernote-bs4.min.css">
<style>

	div {
		/* border: 1px solid black; */
	}

	.main-div {
		margin-left: 140px;
	}
	
	.header {
		display: none;
	}
	
	.goods-header {
		width: 100%;
		height: 50px;
		background-color: #ffffff;
    	box-sizing: border-box;
		position: sticky; /* 스크롤에 고정 */
		top: 0px;
		box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
	}

	.header-back, .header-title, .header-cart {
		float: left;
		height: 100%;
		box-sizing: border-box;
	}

	.header-back {
		width: 10%;
	}

	.header-back > span {
		font-size: 30px;
		line-height: 50px;
		color: rgb(85, 85, 85);
	}

	.header-title {
		line-height: 50px;
		font-size: 30px;
		font-family: 'Noto Sans KR', sans-serif;
		width: 90%;
		padding-right: 80px;
	}

	.header-cart {
		width: 10%;
	}

	.header-cart > span {
		font-size: 35px;
		font-weight: 200;
		line-height: 50px;
		color: rgb(85, 85, 85);
	}

	.header-img {
		width: 100%;
		height: 500px;
		background-color: #ffffff;
    	box-sizing: border-box;
	}

	.goods-title, .goods-price {
		width: 100%;
		height: 70px;
		padding-left: 20px;
		text-align: left;
		font-size: 35px;
		line-height: 70px;
		margin-bottom: 10px;
		box-sizing: border-box;
		font-family: 'Noto Sans KR', sans-serif;
	}
	
	.goods-title > input {
		height: 70px;
		box-sizing: border-box;
	}

	.br-line {
		width: 95%;
		margin: auto;
		border: 1px solid rgba(0, 0, 0, 0.1);
	}

	tr > th {
		width: 120px;
		height: 50px;
		padding-left: 15px;
		font-size: 17px;
		text-align: left;
		font-weight: 500;
		color: rgb(85, 85, 85);
		font-family: 'Noto Sans KR', sans-serif;	
	}

	tr > td {
		width: 300px;
		height: 40px;
		font-size: 17px;
		text-align: left;
		color: rgb(23, 23, 23);
		font-family: 'Noto Sans KR', sans-serif;
	}

	.td-size {
		height: 20px;
		font-size: 12px;
		color: rgb(118, 118, 118);
		font-family: 'Noto Sans KR', sans-serif;
	}
	
	/* sub-content */
	.sub-content {
		width: 100%;
		background-color: #ffffff;
    	box-sizing: border-box;	
	}

	/* br2-line */
	.br2-line {
		width: 100%;
		height: 8px;
		background-color: #ddd;
	}

	.material-symbols-outlined {
	font-variation-settings:
	'FILL' 0,
	'wght' 400,
	'GRAD' 0,
	'opsz' 24
	}

	.sub-menu {
		position: sticky; /* 스크롤에 고정 */
		top: 50px;
		background-color: #ffffff;
		border: 1px solid rgba(0, 0, 0, 0.1);
	}

	/* sub-menu */
	.sub-menu a {
	width: 180px;
    display: inline-block; /* 가로로 나열되도록 변경합니다. */
    text-decoration: none;
    padding: 10px; /* 위아래 좌우 여백 조절 */
    margin: 0 5px; /* 좌우 간격 조절 */
	font-size: 22px;
    color: rgb(85, 85, 85);
    font-family: 'Noto Sans KR', sans-serif;
    /* background-color: #ccc; */
    /* border-radius: 5px; */

	}

	/* 나중에 높이값 수정 필요!!!!! */
	.goods-content {
		width: 100%;
		height: 900px;
	}

	.sub-review {
		width: 100%;
		height: 700px;
	}

	.goods-reply {
		width: 100%;
		height: 700px;
	}
	
	/* sub-header div */
	.sub-header {
		margin: auto;
		margin-top: 10px;
		padding: 20px;
		width: 100%;
		height: 80px;
		box-sizing: border-box;
	}

	.sub-header-title {
		width: 100px;
		height: 50px;
		float: left;
		font-size: 20px;
		line-height: 40px;
		text-align: left;
		font-family: 'Noto Sans KR', sans-serif;
	}

	.sub-header-icon {
		width: 50px;
		height: 50px;
		float: left;
		line-height: 40px;
		text-align: left;
	}

	.sub-header-icon > span {
		line-height: 43px;
		font-size: 22px;
		
	}

	.sub-footer1 {
		width: 100%;
		height: 50px;
		position: sticky; /* 스크롤에 고정 */
		bottom : 0px;
		background-color: #ffffff;
		border-top-left-radius: 4px;
    	border-top-right-radius: 4px;
		box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
		/* padding-top: 5px; */
	}


	.pay-button {
		width: 60%;
		height: 40px;
		margin-top: 5px;
		margin-left: 20px;
		box-sizing: border-box;
		display: inline;
		font-size: 20px;
		font-family: 'Noto Sans KR', sans-serif;
		background-color: #0e9720;
		border-color: #13970e;
		border-radius: 8px;
		color: white;
	}

	.btn-icon {
		margin: auto;
		width: 25px;
		height: 25px;
		font-size: 20px;
		font-family: 'Noto Sans KR', sans-serif;
	}
	
	.summernote {
		box-sizing: border-box;
		width: 100%;
		height: 100%;
		resize: none;
	}
	
	#thumbnail-img {
		display: none;
	}
	
	#thumbnail {
		width: 100%;
		height: 100%;
		box-sizing: border-box;
	}

	#table-div {
		margin: auto;
		width: 850px;
		height: 300px;
		background-color: #edffec;
	}

	.goodsTitle {
		border: 0px;
	}

</style>
<script>
	
	$(document).ready(function () {
		
		ajaxSelectSellerGoodTitle();
				
	});
	
	function ajaxSelectSellerGoodTitle() {
		
		let sellerNo = '${sessionScope.loginSeller.sellerNo}';
	      
	    $.ajax({
	        url : 'ajaxSelectSellerGoodTitle.go',
	        type: 'get',
	        data: { sellerNo : sellerNo },
	        success: function(result) {
	        	          	
				console.log(result);
				
				if(result.length == 0) {
					
					$(".goodsTitle").append("<option>상품을 먼저 등록해주세요.</option>");
										
					$(".pay-button").attr("disabled", "true");
					
				} else {
					
					for(var i = 0; i < result.length; i++) {			
						
						$(".goodsTitle").append(
								"<option value='"+ result[i].goodNo + "'>" 
									+ result[i].goodTitle						
								+ "</option>"
						);
						
						$("#origin").text(result[i].origin);
					}
									
				}
								
			},
			error : function() {
				
				console.log("ajax 통신 실패");
			}
	    });
	}

</script>
</head>
<body>
	<div class="wrapper">
        
        <div class="center-div">  
                 
	        <div class="main-div">
	        
	            <jsp:include page="../common/header.jsp" />
	            
	            <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
   
				<!-- include summernote css/js --> 
				<!-- 서머노트를 위해 추가해야할 부분 -->
				<script src="${pageContext.request.contextPath}/resources/summernote/summernote-bs4.min.js"></script>
				<script src="${pageContext.request.contextPath}/resources/summernote/lang/summernote-ko-KR.js"></script>
	            
	            <div class="goods-header">
					<div class="header-back"><span class="material-symbols-outlined" onClick = "history.back();">arrow_back_ios_new</span></div>
					<div class="header-title">상품 글 등록</div>
	            </div>
	            
	            <form method="post" action="insertSellerGoodsText.go" enctype="multipart/form-data">
	            <input type="hidden" value="${sessionScope.loginSeller.sellerNo}" name="sellerNo">
	            
				<div class="header-img">
					<img id="thumbnail">
					<input type="file" id="thumbnail-img" name="upfile" required onchange="loadImg(this);">
				</div>
	            
	            <div class="content">					
           				
					<div class="goods">

						<div class="goods-title">
							<input type="text" id="" name="sellTitle" required>
						</div>
						<div class="goods-price">
							<select class="goodsTitle" name='goodNo' required>
								
							</select>
						</div>
						
						<div class="br-line"></div>
						<br>

						<table id="table-div">
							<tr>
								<th>배송비</th>
								<td>4,000원</td>
							</tr>
							<tr>
								<th class="td-size"></th>
								<td class="td-size">제주, 도서산간지역 배송 불가</td>
							</tr>
							<tr>
								<th>배송방식</th>
								<td>택배</td>
							</tr>
							<tr>
								<th>원산지</th>
								<td id="origin"></td>
							</tr>
							<tr>
								<th>보관방법</th>
								<td>받으신 후 냉장 보관 해 주세요.</td>
							</tr>
						</table>

					</div>
		        </div>
				
				
				<div class="sub-content">
					
					<div class="br2-line"></div>

					<div class="sub-menu">
						<a href="#goods-content" class="menu1">상품소개</a>
					</div>

					<div class="goods-content" id="goods-content">
						<textarea class="summernote" id="summernote" name="sellContent" required></textarea>    
					</div>
					
					<div class="hidden-content">
					
					</div>					
					
					<div class="sub-footer1">
						<button class="pay-button" type="submit">등록하기</button>
					</div>
								
        		</div>
        		</form>
        		
        		
			</div>
		</div>
	</div>
<script>
       $(document).ready(function() {
       	
       	// 써머 노트 이벤트
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
	     		    ['color', ['color']],
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
       	
       	
       	// 썸네일 클릭 이벤트
       	 $("#thumbnail").click(function() {
            	
            	$("#thumbnail-img").click();
            	     	
            });
       	
	});
       
	// 써머노트 실행 함수
	function uploadSummernoteImageFile(file, el) {
       
		data = new FormData();
		data.append("file", file);
		$.ajax({
			data : data,
			type : "POST",
			url : "uploadFile.go",
			contentType : false,
			enctype : 'multipart/form-data',
			processData : false,
			success : function(data) {
				console.log(data);
				$(el).summernote('editor.insertImage', data);							
			},
			error : function() {
				console.log("ajax 통신 오류")
			}
		});
	}
       
       
	// 썸네일 실행 함수
	function loadImg(inputFile) {

		if(inputFile.files.length == 1) {
   
			let reader = new FileReader();

            reader.readAsDataURL(inputFile.files[0]);

            reader.onload = function(e) {
            	
           		$("#thumbnail").attr("src", e.target.result);	
            };

		} else {
			
			$("#thumbnail").attr("src", null);
		}
	}
      	
</script>
</body>
</html>