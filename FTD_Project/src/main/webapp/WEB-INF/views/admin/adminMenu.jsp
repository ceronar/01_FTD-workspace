<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 페이지</title>
    <!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<!-- jQuery library -->
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
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
	        <p><a href="notice.ad">공지 관리</a></p>
	      </div>
	      <div class="ani-navbar-menu">
	        <span class="material-symbols-outlined ani-navbar-menu__icon">assignment</span>
	        <p><a href="board.ad">게시판 관리</a></p>
	      </div>
	      <div class="ani-navbar-menu">
	        <span class="material-symbols-outlined ani-navbar-menu__icon">store</span>
	        <p><a href="market.ad">마켓 관리</a></p>
	      </div>
	    </nav>
	    
	    <!-- Dashboard -->
	    <div class="cont">
		    <div class="container">
		      <h4 class="my-4">Dashboard</h4>
		      <div class="row">
		        <div class="col-lg-3">
		          <div class="card monthly">
		            <div class="card-body d-flex justify-content-between">
		              <div>
		                <p class="card-text mb-2">전체 회원 수</p>
		                <h4>${ requestScope.totalUser } 명</h4>
		              </div>
		              <span class="material-symbols-outlined"
		              		style="font-size: 30px; margin-top: 20px; color: #6c757d">
		              		group
		              </span>
		            </div>
		          </div>
		        </div>
		        <div class="col-lg-3">
		          <div class="card annual">
		            <div class="card-body d-flex justify-content-between">
		              <div>
		                <p class="card-text mb-2">누적 전체 게시글 수</p>
		                <h4>${ requestScope.totalBoard } 개</h4>
		              </div>
		              <span class="material-symbols-outlined"
		              		style="font-size: 30px; margin-top: 20px; color: #6c757d">
		              		assignment
		              </span>
		            </div>
		          </div>
		        </div>
		        <div class="col-lg-3">
		          <div class="card tasks">
		            <div class="card-body d-flex justify-content-between">
		              <div>
		                <p class="card-text mb-2">전체 매출</p>
		                <h4>${ requestScope.totalSales } 원</h4>
		              </div>
		              <span class="material-symbols-outlined"
		              		style="font-size: 30px; margin-top: 20px; color: #6c757d">
		              		attach_money
		              </span>
		            </div>
		          </div>
		        </div>
		      </div>
		    </div>
		    
		    <!-- chart -->
		    <div class="container mt-3">
		      <div class="row">
		        <div class="col-lg-8">
		          <div class="card-header h5">회원 비율</div>
		          <div class="card-body"><canvas id="userChart"></canvas></div>
		        </div>
		        <div class="col-lg-8">
		          <div class="card-header h5">각 게시판 글 수</div>
		          <div class="card-body"><canvas id="eachBoard"></canvas></div>
		        </div>
		        <div class="col-lg-8">
		          <div class="card-header h5">일주일간 일일 글 작성 수</div>
		          <div class="card-body"><canvas id="weekBoard"></canvas></div>
		        </div>
		        <div class="col-lg-8">
		          <div class="card-header h5">일주일간 일일 매출</div>
		          <div class="card-body"><canvas id="weekSales"></canvas></div>
		        </div>
		      </div>
		    </div>
		</div>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
      var ctx1 = document.getElementById("userChart").getContext("2d");
      var userChart = new Chart(ctx1, {
        type: "pie",
        data: {
          labels: ["January", "February", "March", "April", "May", "June"],
          datasets: [
            {
              label: "Monthly",
              data: [12, 19, 3, 5, 2, 3],
              backgroundColor: "rgba(255, 99, 132, 0.2)",
              borderColor: "rgba(255, 99, 132, 1)",
              borderWidth: 1,
              fill: true,
              tension: 0.2,
            },
          ],
        },
        options: {
          scales: {
            y: {
              beginAtZero: true,
            },
          },
        },
      });
      var ctx2 = document.getElementById("eachBoard").getContext("2d");
      var eachBoard = new Chart(ctx2, {
        type: "bar",
        data: {
          labels: ["January", "February", "March", "April", "May", "June"],
          datasets: [
            {
              label: "Monthly",
              data: [12, 19, 3, 5, 2, 3],
              backgroundColor: "rgba(255, 99, 132, 0.2)",
              borderColor: "rgba(255, 99, 132, 1)",
              borderWidth: 1,
              fill: true,
              tension: 0.2,
            },
          ],
        },
        options: {
          scales: {
            y: {
              beginAtZero: true,
            },
          },
        },
      });
      var ctx3 = document.getElementById("weekBoard").getContext("2d");
      var weekBoard = new Chart(ctx3, {
        type: "line",
        data: {
          labels: ["January", "February", "March", "April", "May", "June"],
          datasets: [
            {
              label: "Monthly",
              data: [12, 19, 3, 5, 2, 3],
              backgroundColor: "rgba(255, 99, 132, 0.2)",
              borderColor: "rgba(255, 99, 132, 1)",
              borderWidth: 1,
              fill: true,
              tension: 0.2,
            },
          ],
        },
        options: {
          scales: {
            y: {
              beginAtZero: true,
            },
          },
        },
      });
      var ctx4 = document.getElementById("weekSales").getContext("2d");
      var weekSales = new Chart(ctx4, {
        type: "line",
        data: {
          labels: ["January", "February", "March", "April", "May", "June"],
          datasets: [
            {
              label: "Monthly",
              data: [12, 19, 3, 5, 2, 3],
              backgroundColor: "rgba(255, 99, 132, 0.2)",
              borderColor: "rgba(255, 99, 132, 1)",
              borderWidth: 1,
              fill: true,
              tension: 0.2,
            },
          ],
        },
        options: {
          scales: {
            y: {
              beginAtZero: true,
            },
          },
        },
      });
    </script>
</body>
</html>