<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>


        h1 {
            text-align: center;
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            text-align: center;
            border-top : 1px solid #ccc;
            border-bottom : 1px solid #ccc;
        }

        th {
            background-color: #f2f2f2;
        }

        tbody tr:hover {
            background-color: #f9f9f9;
            cursor : pointer;
        }

        .btn a {
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
		
		#pagingArea {width:fit-content; margin:auto;}
		
		.pagination {
		  display: inline-block;
		  margin-top: 20px;
		  border-radius: 5px;
		}
		
		.pagination li {
		  display: inline-block;
		  margin: 0 3px;
		}
		
		.pagination li a {
		  color: #000;
		  padding: 8px 12px;
		  text-decoration: none;
		  border: 1px solid #ddd;
		  border-radius: 3px;
		}
		
		.pagination li a:hover {
		  background-color: #f5f5f5;
		}
		
		
        .btn a:hover {
            background-color: #27ae60;
        }
    </style>
    <link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="wrapper">
        <div class="center-div">  
         
	        <jsp:include page="../common/sidebar.jsp" />
	        <div class="main-div">
	            <jsp:include page="../common/header.jsp" />
	            <div class="content">
	            <form id="postForm" action="" method="post">
					<div class="container">
				        <h1>공지사항</h1>
				        <div align="center">
				        
				            <table id="noticeList">
				            
				                <thead>
				                    <tr>
				                    	<th style="width: 5%"><input type="checkbox" name="check-all" id="check-all"></th>
				                        <th style="width: 10%;">번호</th>
				                        <th style="width: 50%;">제목</th>
				                        <th style="width: 10%;">조회수</th>
				                        <th style="width: 20%;">등록일</th>
				                    </tr>
				                </thead>
				                <tbody>
				                    <c:forEach var="n" items="${ requestScope.list }">
				                    <tr>
				                    	<td><input type="checkbox" id="delete" name="delete" value="${ requestScope.n.noticeNo }"></td>
				                        <td class="noticeNo" >${n.noticeNo}</td>
				                        <td class="noticeName" >${ n.noticeTitle }</td>
				                        <td class="count" >${ n.count }</td>
				                        <td class="createDate" >${ n.createDate }</td>
				                    </tr>
				                    </c:forEach>
				                </tbody>
				            </table>
				            <input type="hidden" id="nnoList" name="nnoList" value="">
				            <div id="pagingArea">
			                <ul class="pagination">
			                
			                	<c:choose>
			                		<c:when test="${ requestScope.pi.currentPage eq 1 }">
				                    	<li class="page-item disabled">
				                    		<a class="page-link" href="#">Previous</a>
				                    	</li>
			                    	</c:when>
			                    	<c:otherwise>
				                    	<li class="page-item">
				                    		<a class="page-link" href="list.no?npage=${ requestScope.pi.currentPage - 1 }">&lt;</a>
				                    	</li>
			                    	</c:otherwise>
			                    </c:choose>
			                    
			                    <c:forEach var="p" begin="${ requestScope.pi.startPage }" 
			                    					 end="${ requestScope.pi.endPage }"
			                    					step="1">
			                    	<li class="page-item">
			                    		<a class="page-link" href="list.no?npage=${ p }">${ p }</a>
			                    	</li>
			                    </c:forEach>
			                    
			                    <c:choose>
			                    	<c:when test="${ requestScope.pi.currentPage eq requestScope.pi.maxPage }">
					                    <li class="page-item disabled">
					                    	<a class="page-link" href="#">Next</a>
					                    </li>
					                </c:when>
					                <c:otherwise>
					                    <li class="page-item">
					                    	<a class="page-link" href="list.no?npage=${ requestScope.pi.currentPage + 1 }">&gt;</a>
					                    </li>
					                </c:otherwise>
			                	</c:choose>
			                
		                	</ul>
           					</div>
				        </div>
					        <div class="btn">
					            <a onclick="deleteSelected()">삭제</a>
					            <a href="enrollForm.no">작성</a>
					        </div>
				    </div>
				</form>
			    <script>
			    
				    // 공지사항 번호를 nno 로 받아 해당 상세 페이지로 넘어가는 스크립트
				   $(function() {
				        $("#noticeList>tbody>tr td:not(:first-child)").click(function() {
				            let nno = $(this).siblings(".noticeNo").text();
				            console.log(nno);
				            location.href = "detail.no?nno=" + nno;
				        });
				    });
				   $(document).ready(function() {
					    // 'check-all' 체크박스 클릭 시 'delete' 체크박스들을 함께 체크 또는 해제
					    $('#check-all').click(function() {
					        $('input[name="delete"]').prop('checked', this.checked);
					    });

					    // 'delete' 체크박스 중 하나라도 체크가 해제될 때 'check-all'도 함께 해제
					    $('input[name="delete"]').click(function() {
					        if (!$(this).prop('checked')) {
					            $('#check-all').prop('checked', false);
					        } else {
					            // 모든 'delete' 체크박스가 체크되었는지 확인 후 'check-all' 체크 여부 결정
					            let allChecked = true;
					            $('input[name="delete"]').each(function() {
					                if (!$(this).prop('checked')) {
					                    allChecked = false;
					                }
					            });
					            $('#check-all').prop('checked', allChecked);
					        }
					    });
					});
				    

				   
				   function deleteSelected() {
					   let selectedNnos = []; // 선택된 공지사항 번호를 담을 배열

					    // 'delete' 체크박스 중 체크된 것들의 noticeNo 값을 배열에 추가
					    $('input[name="delete"]:checked').each(function() {
					        let noticeNo = $(this).closest('tr').find('.noticeNo').text();
					        selectedNnos.push(noticeNo);
					    });

					    // 배열을 쉼표로 구분된 문자열로 변환하여 hidden input에 설정
					    $('#nnoList').val(selectedNnos.join(', '));

					    // 확인을 위한 콘솔 출력
					    console.log($('#nnoList').val());
					    
					   	$("#postForm").attr("action", "delete.li").submit();
					}
				</script>
				</div>
	            <jsp:include page="../common/footer.jsp" />
	        </div> 
	              
        </div>
    </div>
    
</body>
</html>