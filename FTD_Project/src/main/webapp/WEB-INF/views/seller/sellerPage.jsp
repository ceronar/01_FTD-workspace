<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Seller Information</title>
    <link href="${pageContext.request.contextPath}/resources/css/main.css?version=1.2" rel="stylesheet" type="text/css">
    <style>
    <%--
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
        .center-div {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            width: 1080px;
            margin: auto;
        }
        
        .main-div {
        	width: 800px;
        	margin: auto;
        }
        
        h2 {
            color: #333;
        }

        form {
            display: grid;
            gap: 10px;
        }
      --%>
      .content {
		height: 1100px;
      }
      
      label {
          font-weight: bold;
          color: #555;
          font-size: 18px; 
      }
      
      input {
          width: 100%;
          padding: 8px;
          box-sizing: border-box;
          border: 1px solid #ccc;
          border-radius: 4px;
          font-size: 20px;
      }
      
      button {
          background-color: #4caf50;
          color: white;
          padding: 10px;
          border: none;
          border-radius: 4px;
          cursor: pointer;
          font-size: 16px;
      }
      button:hover {
          background-color: #45a049;
      }
      /* Style for modal overlay */
      .overlay {
          display: none;
          position: fixed;
          top: 0;
          left: 0;
          width: 100%;
          height: 100%;
          background-color: rgba(0, 0, 0, 0.5);
          align-items: center;
          justify-content: center;
      }

      /* Style for modal content */
      .modal {
          background-color: #fff;
          padding: 20px;
          border-radius: 5px;
          box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      }
      
    </style>
</head>
<body>

<!-- Seller Information Section -->
	<div class="wrapper">
        <div class="center-div">  
         
	        <jsp:include page="../common/sidebar.jsp" />
	        
	        <div class="main-div">
		        <jsp:include page="../common/header.jsp" />
	
		           
		            		
		        <div class="content">
			    <h1>판매자 정보</h1>
				    <form action="update.se" method="post">
				    	<input type="hidden" name="sellerNo" value="${ sessionScope.loginSeller.sellerNo }">
				    	
				        <label for="companyName">상호명:</label>
				        <input type="text" id="companyName" name="companyName" value="${ sessionScope.loginSeller.companyName }" readonly required>
						<br><br>
				        <label for="sellerId">아이디:</label>
				        <input type="text" id="sellerId" name="sellerId" value="${ sessionScope.loginSeller.sellerId }" readonly required>
						<br><br>
				        <label for="sellerName">대표자 이름:</label>
				        <input type="text" id="sellerName" name="sellerName" value="${ sessionScope.loginSeller.sellerName }" required>
						<br><br>
				        <label for="companyNo">사업자 등록 번호:</label>
				        <input type="text" id="companyNo" name="companyNo" value="${ sessionScope.loginSeller.companyNo }" readonly required>
						<br><br>
				        <label for="businessNo">통신 판매 번호:</label>
				        <input type="text" id="businessNo" name="businessNo" value="${ sessionScope.loginSeller.businessNo }" readonly required>
						<br><br>
				        <label for="address">소재지:</label>
				        <input type="text" id="address" name="address" value="${ sessionScope.loginSeller.address }" required>
						<br><br>
				        <label for="email">메일 주소:</label>
				        <input type="email" id="email" name="email" value="${ sessionScope.loginSeller.email }" required>
						<br><br>
				        <label for="phone">전화 번호 ( - 포함):</label>
				        <input type="tel" id="phone" name="phone" value="${ sessionScope.loginSeller.phone }" required>
						<br><br>
				        <label for="accountNo">계좌 번호 ( - 포함):</label>
				        <input type="text" id="accountNo" name="accountNo" value="${ sessionScope.loginSeller.accountNo }" required>
						<br><br>
				        <label for="enrollDate">가입일:</label>
				        <input type="text" id="enrollDate" name="enrollDate" value="${ sessionScope.loginSeller.enrollDate }"readonly required>
				        <br><br>
						<button type="submit">정보 변경</button>
				        <button type="button" onclick="openModal('passwordModal')">비밀번호 변경</button><br><br>
				        <button type="button" onclick="openModal('withdrawalModal')">탈퇴하기</button>
				    </form>
			    </div>
		        <jsp:include page="../common/footer.jsp" />
	        </div> 
	              
        </div>
    </div>
	

<!-- Change Password Modal -->
<div id="passwordModal" class="overlay">
    <div class="modal">
        <h2>Change Password</h2>
        <!-- Add form or content for changing password -->
        <button onclick="closeModal('passwordModal')">Close</button>
    </div>
</div>

<!-- Withdrawal Modal -->
<div id="withdrawalModal" class="overlay">
    <div class="modal">
        <h2>Withdrawal</h2>
        <!-- Add form or content for withdrawal -->
        <button onclick="closeModal('withdrawalModal')">Close</button>
    </div>
</div>

<script>
    // JavaScript functions to open and close modals
    function openModal(modalId) {
        document.getElementById(modalId).style.display = 'flex';
    }

    function closeModal(modalId) {
        document.getElementById(modalId).style.display = 'none';
    }
</script>

</body>
</html>
