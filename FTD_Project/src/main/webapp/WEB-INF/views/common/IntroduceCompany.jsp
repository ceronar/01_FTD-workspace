<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회사소개</title>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="${pageContext.request.contextPath}/resources/css/main.css?version=1.2" rel="stylesheet" type="text/css">
    <style>
        .company_intro {
            width: 100%;
            margin: auto;
        }

        .phrases {
            margin: auto;
            text-align: center;
        }

        .introduce {
            width: 80%;
            margin: auto;
            text-align: center;
        }
		
		#subImg {
			width: 300px;
	    	height:400px;
	    	margin: auto;
		}
		
		#subImg1 {
			width: 300px;
	    	height:200px;
	    	margin: auto;
		}
		
		#subImg2 {
			width: 300px;
	    	height:200px;
	    	margin: auto;
		}
		
		#subImg3 {
			width: 300px;
	    	height:200px;
	    	margin: auto;
		}
		
		#subImg4 {
			width: 300px;
	    	height:200px;
	    	margin: auto;
		}
		
		#subImg5 {
			width: 300px;
	    	height:200px;
	    	margin: auto;
		}
		
        
        .body-area {
    text-align: center;
}

.phrases {
    display: inline-block;
    text-align: left;
}
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet" type="text/css">
    
</head>
<body>
<div class="wrapper">
        <div class="center-div">  
	        <jsp:include page="../common/sidebar.jsp" />
	        <div class="main-div">
		        <jsp:include page="../common/header.jsp" />
			        <div class="content">
						<div class="company_intro"> 
						 <div class="body-area">
						        <table id="table">
						        <tr align="center">
						            <th colspan="2">
						            </th>
						        </tr>
						        <tr>
						        <td>
						        <br>
						            <img src="resources/images/sample/FarmToDish.jpg" id="subImg"></img>
						        </td>
						        <td>
						            <span class="phrases">
							                농장에서 중간 유통 없이 바로 우리들의 접시 위로 올라오도록 도와주는
							            <br>우리들의 최고의 직거래 장터 Farm To Dish!!
						            
						            </span>
						
						        </td>
						        </tr>
						        </table>
						    </div>
						    <br><br><br><br><br>
						    <table class="introduce">
						        <tr>
						            <td>
						                <p>
						                    우리의 플렛폼은 직거래 시스템으로 농산물의 가격이 높게 형성되는 <br>
						                    이유인 불필요한 2차, 3차 유통 비용을 축소시키고자 직거래 공간을 마련하였습니다.<br>
						                    생산자는 직접 판매하면서 농산물에 대한 상세하고 신뢰할 수 있는 정보를 제공하고,<br>
						                    소비자에게는 합리적인 가격으로 제공하며,<br> 
						                    후기 시스템을 이용하여 소비자가 더 나은 선택을 할 수 있도록 돕습니다.<br>
						                    판매자는 홍보글과 마켓을 통해 다른 소비자들에게 정보를 제공합니다.
						                </p>
						            </td>
						        </tr>
						    </table>
						    <hr>
						    <br><br><br>
						    <table>
						
								<tr>
									<td><img src="resources/images/sample/cabbage2.jpg" id="subImg1"></img></td>
									<td>김원진 : </td>
								</tr>
								   
								<tr>
								     <td><img src="resources/images/sample/eggplant.jpg" id="subImg2"></img></td>
								     <td>천재영 : </td>
								</tr>
								
								<tr>
								      <td><img src="resources/images/sample/tomato.jpg" id="subImg3"></img></td>
								      <td>김종현 : </td>
								</tr>
								
								<tr>
									  <td><img src="resources/images/sample/avocado.jpg" id="subImg4"></img></td>
									  <td>전희재 : </td>
								</tr>
								
								<tr>
									 <td><img src="resources/images/sample/paprika.jpg" id="subImg5"></img></td>
									 <td>최성광 : </td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
 <jsp:include page="../common/footer.jsp" />
</body>
</html>