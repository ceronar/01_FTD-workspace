<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${pageContext.request.contextPath}/resources/css/main.css?version=1.2" rel="stylesheet" type="text/css">
    <title>관리자 페이지</title>
    <link href="${pageContext.request.contextPath}/resources/css/main.css?version=1.2" rel="stylesheet" type="text/css">
    <script src="https://www.gstatic.com/charts/loader.js"></script>
	<script>
	  google.charts.load('current', {packages: ['corechart']});
	  
	  google.charts.setOnLoadCallback(drawUserChart);
	  google.charts.setOnLoadCallback(drawEachBoard);
	  google.charts.setOnLoadCallback(drawWeekBoard);
	  google.charts.setOnLoadCallback(drawWeekSales);
	  
	  
	  
	  
	  
	</script>
    <style>
        h2 {
            text-align: center;
            margin-top: 50px;
        }
        
        .dashboard { height: 150px; }
        
        .dashboard>div { 
            height: 100%;
            width: 33.3%;
            float: left;
        }

        /* dashboard 스타일 */
        
        .dashboard_box { display: flex; } 
        .dashboard_box>div {
            border: 1px solid lightgreen;
            background-color: lawngreen;
            width: 250px; 
            height: 100px; 
            border-radius: 11px; 
            display: flex; 
            margin: auto;
        }
        
        /* dashboard 테두리 */
        .dashboard_box>div>div { 
            background-color: white; 
            width: 255px; 
            border-radius: 10px; 
            margin-left: 5px; 
            display: flex; 
        }
        
        .dashboard_box>div>div>div { height: 45px; width:80%; margin: auto; }
        
        .dash-info {
            font-size: 15px; font-weight: bolder;
        }

        .dash-charts>div {
            float: left
        }

        /* 차트 스타일 */
        .chart { 
            width: 580px;
            height: 580px; 
            display: flex; 
            padding: 10px;
            margin: 5px;
            border: 1px solid lightgray;
            box-sizing: border-box;
        }
        
        .chart>div {
            height: 100%;
            width: 100%;
            float: left;
            background-color: white;
        }
        
        #chartdiv {
            margin: auto;
            width: 80%;
            height: 80%;
        }

        #chartdiv2 {
            margin: auto;
            width: 80%;
            height: 80%;
        }
    </style>
</head>
<body>

<div>
	<div class="wrapper">
        <div class="center-div">  
	        <jsp:include page="adminSidebar.jsp" />
	        <div class="main-div">
		        <jsp:include page="../common/header.jsp" />
                <!-- 컨텐츠 시작 -->
		        <div class="content">
					<h2>관리자 페이지</h2>

				    <div class="dashboard">
				        <div class="dashboard_box">
                            <div>
                                <div>
                                    <div class="dash-info">
                                        총 회원 수 <br>
                                        <output name="totalMember"></output> 명
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="dashboard_box">
                            <div>
                                <div>
                                    <div class="dash-info">
                                        누적 전체 게시글 수 <br>
                                        <output name="totalBoard"></output> 개
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="dashboard_box">
                            <div>
                                <div>
                                    <div class="dash-info">
                                        전체 매출 <br>
                                        <output name="totalSales"></output> 원
                                    </div>
                                </div>
                            </div>
                        </div>
				    </div>
                    <hr>
                    <br>
				    <div class="dash-charts">
				        <div class="chart">
                            <div id="userChart"></div>
                        </div>
                        <div class="chart">
                            <div id="eachBoard"></div>
                        </div>
                        <div class="chart">
                            <div id="weekBoard"></div>
                        </div>
                        <div class="chart">
                            <div id="weekSales"></div>
                        </div>
				    </div>
				
				</div>
                <!-- 컨텐츠 끝 -->
		        <jsp:include page="../common/footer.jsp" />
	        </div> 
        </div>
    </div>
</div>

</body>
</html>