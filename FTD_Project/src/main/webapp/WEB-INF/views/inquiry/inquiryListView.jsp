<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/main.css?version=1.2" rel="stylesheet" type="text/css">
<style>
	.main-div {
		margin-left: 140px;
	}

	/* 테스트 */
	.store, .store div {
		border: 1px solid black;
	}

	.store {
		width: 100%;
		height: 300px;
	}

	/* store */
	.store-address-title, .store-title, .store-detail {
		width: 100%;
		display: block;
		box-sizing: border-box;
	}

	.store-address-title {
		height: 15%;
	}
	
	.store-title {
		height: 30%;
	}

	.store-detail {
		height: 55%;
	}

	/* store-address-title */
	.store-address-icon, .store-address {
		float: left;
		height: 100%;
		box-sizing: border-box;
	}

	.store-address-icon {
		width: 8%;
	}

	.store-address {
		width: 40%;
	}

	/* store-title */
	.store-name, .store-subscribe-button {
		float: left;
		height: 100%;
		box-sizing: border-box;
	}

	.store-name {
		width: 70%;
	}

	.store-subscribe-button {
		width: 30%;
	}

	/* store-detail */
	.store-subscribe, .store-rating, .store-review {
		float: left;
		height: 100%;
		box-sizing: border-box;
	}

	.store-subscribe {
		width: 33.4%;
	}

	.store-rating {
		width: 33.3%;
	}

	.store-review {
		width: 33.3%;
	}

	/* store-subscribe */
	.store-subscribe-text, .store-subscribe-count {
		width: 100%;
		display: block;
		box-sizing: border-box;
	}

	.store-subscribe-text {
		height: 50%;
	}

	.store-subscribe-count {
		height: 50%;
	}

	/* store-rating */
	.store-rating-text, .store-rating-count {
		width: 100%;
		display: block;
		box-sizing: border-box;
	}

	.store-rating-text {
		height: 50%;
	}

	.store-rating-count {
		height: 50%;
	}

	/* store-review */
	.store-review-text, .store-review-count {
		width: 100%;
		display: block;
		box-sizing: border-box;
	}

	.store-review-text {
		height: 50%;
	}

	.store-review-count {
		height: 50%;
	}

	.sub-content {
	width: 100%; /* content 영역 크기 조정 */
	height: 800px;
	background-color: #ffffff;
	padding: 20px;
	box-sizing: border-box;
	/* border: 1px solid rgb(85, 85, 85); 위쪽(top)만 0으로 수정 */
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
	margin: 0; /* content의 마진 제거 */
	border-top: 10px solid rgb(232, 235, 237);;
	}
	
	/* 문의게시글 상세조회 스타일 */
	
	.content {
		padding : 20px
	}
	
	h1 {
                    text-align: center;
                    color: #333;
                }

                table {
                    width: 100%;
                    border-collapse: collapse;
                }

                th,
                td {
                    padding: 10px;
                    text-align: center;
                    border-top: 1px solid #ccc;
                    border-bottom: 1px solid #ccc;
                }

                th {
                    background-color: #f2f2f2;
                }

                tbody tr:hover {
                    background-color: #f9f9f9;
                    cursor: pointer;
                }

                .btn button {
                    float: right;
                    padding: 8px 20px;
                    border: none;
                    background-color: #2ecc71;
                    color: #fff;
                    cursor: pointer;
                    border-radius: 3px;
                    margin: 10px 5px;
                }

                .btn button:hover {
                    background-color: #27ae60;
                }

                .material-symbols-outlined {
                    font-variation-settings:
                        'FILL' 0,
                        'wght' 400,
                        'GRAD' 0,
                        'opsz' 24
                }
	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
	
	$(document).ready(function () { 
		
		ajaxSelectSellerMarketList();
		
		ajaxSelectSubscribe();
		
		ajaxSelectInquiryList();
	});
	
	
	function ajaxSelectSellerMarketList() {
		
		$.ajax({
			
			url : 'ajaxSelectSellerMarketList.se',
            type: 'get',
            data: {sellerNo: ${requestScope.sellerNo}},
            success: function(result) {
			
            	$('.store').append(
            		
            		'<div class="store-address-title">'
						+ '<div class="store-address-icon">아이콘</div>'
						+ '<div class="store-address">'+ result[0].address + '</div>'
					+ '</div>'
					+ '<div class="store-title">'
						+ '<div class="store-name">'+ result[0].companyName + '</div>'
						+ '<div class="store-subscribe-button"><button id="subscribe">단골맺기</button></div>'
					+ '</div>'
					+ '<div class="store-detail">'
						+ '<div class="store-subscribe">'
							+ '<div class="store-subscribe-text">단골</div>'
							+ '<div class="store-subscribe-count">'+ result[3] + '</div>'
						+ '</div>'
						+ '<div class="store-rating">'
							+ '<div class="store-rating-text">평점</div>'
							+ '<div class="store-rating-count">'+ result[1] + '</div>'
						+ '</div>'
						+ '<div class="store-review">'
							+ '<div class="store-review-text">후기</div>'
							+ '<div class="store-review-count">'+ result[2] + '</div>'
						+ '</div>'
					+ '</div>'            	
            	);
	
            },
            error : function() {
            	
            	console.log("ajax 통신 실패");
            }
            
		});
				
	}
	
	var page = 0;
    var pageSize = 10;
	
	$(document).ready(function () {

        $(window).scroll(function () {
            if ($(window).scrollTop() + $(window).height() >= $(document).height() - 1) {
                
            	ajaxSelectSellerList();
            	page++;	         
            }
        });
    });

	function ajaxSelectInquiryList() {
		
		
		$.ajax({
		    url: 'ajaxSelectList.in',
		    type: 'get',
		    data: { sellerNo: '${requestScope.sellerNo}', pageSize: pageSize, page: page },
		    success: function(result) {
		        console.log(result);
		        
		        result.forEach(function(item) {
		            // responseDate의 값에 따라 answer에 '미답변' 또는 '답변완료'를 할당합니다.
		            let answer = item.responseDate ? '답변완료' : '미답변';
		            
		            // 각 객체의 속성을 추출하여 테이블에 추가합니다.
		            var row = '<tr>';
		            
		            // 조건부로 체크박스를 추가합니다.
		            <c:if test="(${sessionScope.loginUser.memberId} eq admin)"> {
		                row += '<td><input type="checkbox" class="delete"></td>';
		            }
		            </c:if>
		            row += '<td name="inqNo">' + item.inqNo + '</td>' +
		                '<td name="answer">' + answer + '</td>' +
		                '<td name="inqTitle">' + item.inqTitle + '</td>' +
		                '<td name="memberId">' + item.memberId + '</td>' +
		                '<td name="count">' + item.count + '</td>' +
		                '<td name="createDate">' + item.createDate + '</td>' +
		                '</tr>';
		                
		            $('.list-tbody').append(row);
		        });
		    },
		    error: function() {
		        console.log("ajax 통신 실패!");
		    }
		});
	}

	function ajaxSelectSubscribe() {
		
		$.ajax({
			url : 'ajaxSelectSubscribe.se',
			type: 'get',
			data : { memberNo : ${sessionScope.loginUser.memberNo }, sellerNo : ${requestScope.sellerNo}},
			success: function(result) {
				
				console.log(result);
				
				if(result == "btn btn-secondary") {
					
					$("#subscribe").attr('class', result);
					
					$("#subscribe").attr("disabled", true);
					
				} else {
					
					$("#subscribe").attr('class', result);
					
					$("#subscribe").attr("disabled", false);
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
	            
	            <div class="content">
	            	
	            	<div class="store">
						
						
					</div>
	
				
		        </div>

				<div class="sub-content">
					
					<div class="sub-menu">
					<form action="list.in">
						<button type="submit">테스트용</button>
						<input type="text" name="sellerNo" id="sellerNo" value="${ requestScope.sellerNo }">
					</form>
					</div>
					<div class="content">
						<div align="center">
                                <table class="list-area">
                                    <thead>
                                        <tr>
                                        	<c:if test="(${sessionScope.loginUser.memberId} eq admin)">
                                            	<th style="width : 5%;"><input type="checkbox" id="check-all"></th>
                                            </c:if>
                                            <th style="width : 7%;">번호</th>
                                            <th style="width : 15%;">답변여부</th>
                                            <th style="width : 38%;">제목</th>
                                            <th style="width : 10%;">문의자</th>
                                            <th style="width : 10%">조회수</th>
                                            <th style="width : 15%;">등록일</th>
                                        </tr>
                                    </thead>
                                    <tbody class="list-tbody">
                                    </tbody>
                                </table>
                                
                            </div>
                            <div class="btn">
                                <button onclick="deleteSelected()">삭제</button>
                                <a href="enrollForm.in?sno=${ requestScope.sellerNo }">작성</a>
                            </div>
					</div>
					
				</div>


	        </div>
			
        </div>
    </div>
    
    <script>
    // 문의글 상세조회 페이지 이동 스크립트
    
    // console.log(document.getElementById("subscribe"))
    
    $(function() {
    	
    	$(".store").on("click", "#subscribe", () => {

    		$.ajax({
    			url : "ajaxClickSubscribe.se",
				type : "get",
				data : { memberNo : ${sessionScope.loginUser.memberNo }, sellerNo : ${requestScope.sellerNo}},
				success : result => {
					
	            	if(result == "btn btn-secondary") {
	            		
	            		$("#subscribe").attr('class', result);
	            		
	            		$("#subscribe").attr("disabled", true);
	            		
	            	} else {
	            		
	            		$("#subscribe").attr('class', result);
	            		
	            		$("#subscribe").attr("disabled", false);
	            	}
					
					
				},
				error : () => {
					
					console.log("ajax 통신 실패");
				}
    			
    		});
    		
    	});
    	
    });
    
  
    </script>
    
</body>
</html>