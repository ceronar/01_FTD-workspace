<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 페이지</title>
    <!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<!-- JavaScript -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<!-- alertify 라이브러리 -->
	<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
	<!-- CSS -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
	<!-- Default theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
	<!-- Semantic UI theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
	<!-- Popper JS -->
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<!-- Latest compiled JavaScript -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	
	<!-- 아이콘 관련 -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />

	
    <style>
    	/* 상단 nav바 */
    	.nav-container {
			background-color: white;
			width: 100%;
			height: 60px;
			box-shadow: 0px 2px 2px 2px #eee;
			display: flex;
			justify-content: space-between;
		}
		
		.search-box {
			display: inline-flex;
			align-items: center;
			margin-left: 100px;
		}
		
		.search-box-input {
			padding: 5px;
			border-radius: 5px 0px 0px 5px;
			border: 1px solid lightgrey;
			width: 150px;
			transition: width 1s;
		}
		
		.search-box-input:focus {
			width:300px;
		}
		
		.search-box-btn {
			background-color: #343940;
			color: white;
			border: none;
			border-radius: 0px 5px 5px 0px;
			height: 36px;
			width: 40px;
			padding: 5px;
		}
		
		.notification {
			display: flex;
			margin-right: 20px;
			align-items: center;
		}
		
		.notification-icon {
			font-size: x-large;
			margin-left: 60px;
			color: #808080;
			margin-bottom: 20px;
		}
		
		.notification-badge {
			position: relative;
			left: 15px;
			top: 16px;
			background-color: #DC3545;
			width: 20px;
			height: 20px;
			border-radius: 5px;
			display: flex;
			justify-content: center;
			align-items: center;
			color: white;
			font-size: small;
			font-weight: 600;
		}
		
		#notification-name {
			margin-left: 40px;
			color: grey;
		}
		
		.home-btn > a{
			text-decoration: none;
			font-size: 40px;
			font-weight: bold;
			margin-left: 50px;
			color: black;
		}
		
		/* 좌측 메뉴 */
		.ani-navbar {
			background-color: #494CB4;
			color: white;
			width: 220px;
			height: 100%;
			padding: 25px;
			position: fixed;
			z-index: 5;
			transition: all 1s;
			text-align: center;
			transform: translateX(-170px);
		}
		
		.ani-navbar:hover {
			transform: translateX(0px);
			transition: all 0.5s;
		}
		
		.ani-navbar-menu {
			display: flex;
			align-items: center;
			padding: 15px;
		}
		
		.ani-navbar-menu p {
			margin: 0;
			margin-left: 10px;
			font-size: 18px;
		}
		
		.ani-navbar-menu p a {
			color: white;
			font-weight: bold;
		}
		
		.ani-navbar .ani-navbar-menu__icon {
			transition: all 0.6s;
			transform: translateX(140px);
		}
		
		.ani-navbar:hover .ani-navbar-menu__icon {
			transform: translateX(0px);
		}
		
		/* 아이콘 관련 */
		.material-symbols-outlined {
		  font-variation-settings:
		  'FILL' 0,
		  'wght' 400,
		  'GRAD' 0,
		  'opsz' 24
		}
		
		.cont {
			margin-left: 100px;
		}
		
		/* 회원 페이지 모달 css */
		/* Style for the modal container */
        .modal-container {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            align-items: center;
            justify-content: center;
        }

        /* Style for the modal content */
        .modal-content {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            width: 80%;
            max-width: 600px;
        }

        /* Close button style */
        .close-button {
            background-color: #ddd;
            color: #333;
            border: none;
            padding: 8px 12px;
            border-radius: 4px;
            cursor: pointer;
        }
        
        .container {
        	margin: 20px;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
        }
        
        .container>h4 {
        	color: #494CB4;
            display: inline-block;
            margin-right: 10px;
        }
        
        .sellerPageButton {
            background-color: #494CB4;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            display: inline-block;
        }
		
		.userTable {
			border-collapse: collapse;
			text-align: center;
		}
		
		.userTable, .userTable th, .userTable td {
			border: 1px solid lightgray;
			padding: 8px;
			text-align: center;
		}
		
		.userTable th {
			background-color: #f2f2f2;
			color: #333;
			}

		.userTable td {
			background-color: #fff;
			color: #555;
		}
		
		.userTable>tbody:hover {
			cursor: pointer;
		}
		
		.statusBtn {
			height: 20px;
			width: 20px;
			border-radius: 10px;
			border: 1 solid black;
		}
		
		.inactive {
			background-color: red;
		}
		
		.active {
			background-color: green;
		}
		
		/* ----- 페이지네이션 -----*/
		#pagingArea {
			width:fit-content; 
			margin:auto;
		}
		
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
		  font-weight: bold;
		}
		
		.pagination li a:hover {
		  background-color: #f5f5f5;
		}
		
		.pagination .disabled {
			background-color: lightgray
		}
		
    </style>
</head>
<body>
	<div class="wrapper">
		<!-- 상단 nav 바 -->
		<nav class="nav-container">
			
			<div class="home-btn">
				<a href="${pageContext.request.contextPath}">FTD</a>
			</div>
			
	    	<div class="search-box">
	        	<input type="text" class="search-box-input" placeholder="Search" />
	        	<button class="search-box-btn">
	        		<span class="material-symbols-outlined">search</span>
	        	</button>
	      	</div>
	
	      	<div class="notification">
	        	<span id="notification-name">관리자</span>
	      	</div>
	    </nav>
	
		<!-- 좌측 메뉴 -->
		<nav class="ani-navbar">
	      <div class="ani-navbar-menu">
	      	<span class="material-symbols-outlined ani-navbar-menu__icon">dashboard</span>
	        <p><a href="menu.ad">대시보드</a></p>
	      </div>
	      <div class="ani-navbar-menu">
	        <span class="material-symbols-outlined ani-navbar-menu__icon">group</span>
	        <p><a href="user.ad">회원 관리</a></p>
	      </div>
	      <div class="ani-navbar-menu">
	        <span class="material-symbols-outlined ani-navbar-menu__icon">campaign</span>
	        <p><a href="list.no">공지 관리</a></p>
	      </div>
	      <div class="ani-navbar-menu">
	        <span class="material-symbols-outlined ani-navbar-menu__icon">assignment</span>
	        <p><a><s>게시판 관리</s></a></p>
	      </div>
	      <div class="ani-navbar-menu">
	        <span class="material-symbols-outlined ani-navbar-menu__icon">store</span>
	        <p><a><s>마켓 관리</s></a></p>
	      </div>
	    </nav>
	    
	    <!-- userList -->
	    <div class="cont">
			<div class="container">
		      	<h4 class="my-4">회원 목록</h4>
		      	<button class="sellerPageButton" onclick="goToSellerAdminPage()">판매자 목록 전환</button>
		      	<div class="table-area">
		      		<table class="userTable">
		      			<thead>
		      				<tr>
		      					<th hidden>번호</th>
		      					<th width="150">아이디</th>
		      					<th width="120">이름</th>
		      					<th width="200">이메일</th>
		      					<th width="150">번호</th>
		      					<th width="280">주소</th>
		      					<th width="70">정지</th>
		      				</tr>
		      			</thead>
		      			<tbody>
		      				<c:forEach var="m" items="${ requestScope.list }">
								<tr>
									<td hidden>${ m.memberNo }</td>
			      					<td>${ m.memberId }</td>
			      					<td>${ m.memberName }</td>
			      					<td>${ m.email }</td>
			      					<td>${ m.phone }</td>
			      					<td>${ m.address }</td>
			      					<td class="nonClick"><button type='button' class='statusBtn ${empty m.status ? "active" : "inactive" }' /></td>
								</tr>
							</c:forEach>
		      			</tbody>
		      		</table>
		      		<div id="pagingArea">
						<ul class="pagination">
							<c:choose>
								<c:when test="${ requestScope.pi.currentPage le 1 }">
			                    </c:when>
								<c:otherwise>
								<li class="page-item">
									<a class="page-link" href="user.ad?cpage=1">&lt;&lt;</a>
								</li>
								<li class="page-item">
									<a class="page-link" href="user.ad?cpage=${ requestScope.pi.currentPage - 1 }">&lt;</a>
								</li>
								</c:otherwise>
							</c:choose>
							<c:forEach var="p" begin="${ requestScope.pi.startPage }" end="${ requestScope.pi.endPage }" step="1">
			                    <c:choose>
								<c:when test="${ requestScope.pi.currentPage eq p }">
									<li class="page-item">
			                    		<a class="page-link disabled" >${ p }</a>
			                    	</li>
			                    </c:when>
								<c:otherwise>
									<li class="page-item">
			                    		<a class="page-link" href="user.ad?cpage=${ p }">${ p }</a>
			                    	</li>
								</c:otherwise>
							</c:choose>
							</c:forEach>
							<c:choose>
								<c:when test="${ requestScope.pi.currentPage ge requestScope.pi.maxPage }">
								</c:when>
								<c:otherwise>
								<li class="page-item">
									<a class="page-link" href="user.ad?cpage=${ requestScope.pi.currentPage + 1 }">&gt;</a>
								</li>
								<li class="page-item">
									<a class="page-link" href="user.ad?cpage=${ requestScope.pi.maxPage }">&gt;&gt;</a>
								</li>
								</c:otherwise>
							</c:choose>
						</ul>
           			</div>
		      	</div>
		    </div>
		</div>
	</div>
	<br><br>
	<!-- Modal container -->
	<div class="modal-container detailModal" id="userDetailsModal">
		<div class="modal-content" id="userDetailsContent">
			<div style="display: flex; justify-content: space-between; align-items: center;">
		        <h2>상세 정보</h2>
		        <button type="button" class="close-button" onclick="closeModal()"><span class="material-symbols-outlined">close</span></button>
	    	</div>
	    	<!-- Modal content -->
	    
	        <!-- User details will be loaded here -->
	    </div>
	</div>
	
	<script>
		$(function() {
			$(".userTable>tbody>tr").on('click', e => {
				let target = e.target;
				let memberNo = target.parentElement.children.item(0).innerText;
				if(target == e.currentTarget.querySelector(".nonClick")) {
					// 유저 상태값 변경
					alertify.confirm('', '정말 상태를 변경 하시겠습니까?', function(){
						memberStatusChange(memberNo, target);
					}, function(){ alertify.error('취소')});
				} else if(target == e.currentTarget.querySelector(".statusBtn")) {
					target = target.parentElement;
					memberNo = target.parentElement.children.item(0).innerText;
					alertify.confirm('', '구매자의 상태를 변경 하시겠습니까?', function(){
						memberStatusChange(memberNo, target);
					}, function(){ alertify.error('취소')});
				} else {
					openUserDetails(memberNo);
				}
			});
		});
		// 이거 안됨 잘 모르겠음
		/*
		$('html').click(function(e){
			if(document.getElementById('userDetailsModal').style.display == 'flex'){
				if($(e.target).parents('.modal-container').length < 1){
					
					// closeModal();
			    }
			}
		});
		*/
	    function openModal() {
	        var modal = document.getElementById('userDetailsModal');
	        modal.style.display = 'flex';
	    }
	    
	    function closeModal() {
	        var modal = document.getElementById('userDetailsModal');
	        modal.style.display = 'none';
	    }
	    
	    function openUserDetails(memberNo) {
	    	$.ajax({
	            url: "userDetails.ad",
	            method: 'get',
	            data: {
	            	memberNo : memberNo
	            },
	            success: function (data) {
	                // Populate modal content with user details
	                populateModal(data);
	                // Open the modal
	                openModal();
	            },
	            error: function () {
	            	console.log('사용자 상세 정보 조회 ajax 통신 실패');
	            }
	        });
	    }
	    
	    function populateModal(userDetails) {
	        let modalContent = $('#userDetailsContent');
	        // Clear previous content
	        modalContent.html('');
	        modalContent.append('<div style="display: flex; justify-content: space-between; align-items: center;"><h2>상세 정보</h2><button type="button" class="close-button" onclick="closeModal()"><span class="material-symbols-outlined">close</span></button></div>');
	        // Add user details to modal content
	        for (var key in userDetails) {
	            if (userDetails.hasOwnProperty(key)) {
	                var pElement = document.createElement('p');
	                pElement.innerHTML = '<strong>' + key + ' :</strong> ' + userDetails[key];
	                modalContent.append(pElement);
	            }
	        }
	    }
	    
	    function memberStatusChange(memberNo, target) {
	    	
	    	let targetClassList = target.children.item(0).classList;
	    	// target 의 button이 class active 를 포함하고 있는지 확인
	    	let status = "";
	    	if(targetClassList.contains('active')){
	    		status = "active";
	    	} else {
	    		status = "inactive";
	    	}
	    	
	    	$.ajax({
	            url: "memberStatusChange.ad",
	            method: 'get',
	            data: {
	            	memberNo : memberNo,
	            	status : status
	            },
	            success: function (data) {
	            	// 'Y' or 'N' 넘어오는지 확인
	            	if(data == "Y") {
		                if(status == "active") {
		                	// 성공했으니 active 제거후 inactive 부여
		                	targetClassList.remove('active');
		                	targetClassList.add('inactive');
				    	} else {
				    		// 성공했으니 inactive 제거후 active 부여
				    		targetClassList.remove('inactive');
				    		targetClassList.add('active');
				    	}
	            	} else {
	            		console.log('사용자 상태 변경 실패');
	            	}
	            },
	            error: function () {
	                console.log('사용자 상태 변경 ajax 통신 실패');
	            }
	        });
		}
	    
	    function goToSellerAdminPage() {
	    	location.href = "seller.ad";
		}
	    
	</script>
	
</body>
</html>