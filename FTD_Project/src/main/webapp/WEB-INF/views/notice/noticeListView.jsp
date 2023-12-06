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
					<div class="container">
				        <h1>공지사항</h1>
				        <div align="center">
				            <table id="noticeList">
				                <thead>
				                    <tr>
				                        <th style="width: 5%"><input type="checkbox" id="check-all"></th>
				                        <th style="width: 8%;">번호</th>
				                        <th style="width: 50%;">제목</th>
				                        <th style="width: 7%;">조회수</th>
				                        <th style="width: 15%;">등록일</th>
				                    </tr>
				                </thead>
				                <tbody>
				                    <c:forEach var="n" items="${ requestScope.list }">
				                    <tr>
				                        <td><input type="checkbox" class="delete"></td>
				                        <td class="noticeNo">${n.noticeNo}</td>
				                        <td class="noticeName">${ n.noticeTitle }</td>
				                        <td class="count">${ n.count }</td>
				                        <td class="createDate">${ n.createDate }</td>
				                    </tr>
				                    </c:forEach>
				                </tbody>
				            </table>
				        </div>
					        <div class="btn">
					            <a onclick="deleteSelected()">삭제</a>
					            <a href="enrollForm.no">작성</a>
					        </div>
				    </div>
				    <script>
				    	// 공지사항 번호를 nno 로 받아 해당 상세 페이지로 넘어가는 스크립트
					    $(function() {
							
							$("#noticeList>tbody>tr").click(function() {
				
								let nno = $(this).children(".noticeNo").text();
								console.log(nno);
								location.href = "detail.no?nno=" + nno;
							});
						});
				    
				        // "check-all" 체크박스를 클릭했을 때 모든 "delete" 클래스의 체크박스의 checked 상태 변경
				        document.getElementById("check-all").addEventListener("change", function() {
				            let deleteCheckboxes = document.querySelectorAll('.delete'); // "delete" 클래스 체크박스들을 가져옴
				            let checkAll = this.checked; // "check-all" 체크박스의 상태
							
				            deleteCheckboxes.forEach(function(checkbox) {
				                checkbox.checked = checkAll; // "delete" 클래스 체크박스들의 상태를 "check-all"에 맞게 변경
				            });
				        });
				
				        // "delete" 클래스 체크박스들의 상태가 변경될 때 "check-all" 체크박스의 상태 확인
				        document.querySelectorAll('.delete').forEach(function(checkbox) {
				            checkbox.addEventListener("change", function() {
				                let deleteCheckboxes = document.querySelectorAll('.delete'); // "delete" 클래스 체크박스들을 가져옴
				                let checkAll = document.getElementById("check-all"); // "check-all" 체크박스 요소를 가져옴
				
				                let allChecked = true;
				                deleteCheckboxes.forEach(function(checkbox) {
				                    if (!checkbox.checked) {
				                        allChecked = false;
				                    }
				                });
				
				                checkAll.checked = allChecked; // "check-all" 체크박스의 checked 상태를 변경
				            });
				        });
				        /*
				        // "삭제" 버튼 클릭 시 선택된 항목들 삭제하는 함수
				        function deleteSelected() {
				            let deleteCheckboxes = document.querySelectorAll('.delete'); // "delete" 클래스 체크박스들을 가져옴
				            let selectedItems = Array.from(deleteCheckboxes).filter(checkbox => checkbox.checked); // 선택된 체크박스들을 배열로 가져옴
				
				            // 선택된 체크박스들을 처리하는 코드 추가
				            selectedItems.forEach(function(item) {
				                // 여기에 선택된 체크박스를 삭제하는 로직을 추가하세요.
				                console.log("삭제될 아이템: ", item.getElementsByTagName("noticeNo"));
				            });
				        }
				        */
				    </script>
				</div>
	            <jsp:include page="../common/footer.jsp" />
	        </div> 
	              
        </div>
    </div>
    
</body>
</html>