<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${pageContext.request.contextPath}/resources/css/main.css?version=1.2" rel="stylesheet" type="text/css">
    <title>Main Administrator Page</title>
    <style>
    /*
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }
        h2 {
            color: #333;
        }
		*/
		.content>div {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            width: 80%;
            max-width: 800px;
            margin: 0;
        }
        
        .statistics-section {
            margin-top: 20px;
        }

        .statistics-item {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
        }

        .statistics-label {
            font-weight: bold;
            width: 150px;
        }

        .statistics-value {
            flex-grow: 1;
            text-align: right;
        }
     
    </style>
</head>
<body>

<!-- Main Administrator Page -->
<div>
	<div class="wrapper">
        <div class="center-div">  
         
	        <jsp:include page="../common/sidebar.jsp" />
	        
	        <div class="main-div">
		        <jsp:include page="../common/header.jsp" />
	
		           
		            		
		        <div class="content">
					<h2>Administrator Dashboard</h2>

				    <div class="statistics-section">
				        <h3>General Statistics</h3>
				
				        <div class="statistics-item">
				            <span class="statistics-label">Total Users:</span>
				            <span class="statistics-value">500</span>
				        </div>
				
				        <div class="statistics-item">
				            <span class="statistics-label">Active Buyers:</span>
				            <span class="statistics-value">250</span>
				        </div>
				
				        <div class="statistics-item">
				            <span class="statistics-label">Active Sellers:</span>
				            <span class="statistics-value">200</span>
				        </div>
				
				        <!-- Add more statistics items as needed -->
				    </div>
				
				    <div class="statistics-section">
				        <h3>Financial Statistics</h3>
				
				        <div class="statistics-item">
				            <span class="statistics-label">Total Revenue:</span>
				            <span class="statistics-value">$1,000,000</span>
				        </div>
				
				        <div class="statistics-item">
				            <span class="statistics-label">Monthly Revenue:</span>
				            <span class="statistics-value">$100,000</span>
				        </div>
				
				        <!-- Add more statistics items as needed -->
				    </div>
				
				    <!-- Add more sections for other types of statistics -->
				
				</div>
		        <jsp:include page="../common/footer.jsp" />
	        </div> 
	              
        </div>
    </div>
    

</body>
</html>