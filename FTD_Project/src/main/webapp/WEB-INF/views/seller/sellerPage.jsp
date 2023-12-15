<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Seller Information</title>
    <link href="${pageContext.request.contextPath}/resources/css/main.css?version=1.2" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
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
		height: 1400px;
      }
      
      label {
          font-weight: bold;
          color: #555;
          font-size: 18px; 
      }
      
      input {
         
          padding: 8px;
          box-sizing: border-box;
          border: 1px solid #ccc;
          border-radius: 4px;
          font-size: 20px;
      }
      
      button {
          background-color: #388755;
          color: white;
          padding: 10px;
          border: none;
          border-radius: 4px;
          cursor: pointer;
          font-size: 16px;
      }
      button:hover {
          background-color: #388755;
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
      
      #previewImage {
      	width: 300px;
      	height: 300px;
      }
      
      .profile-table {
		width: 100%;
		box-sizing: border-box;
		border: 1px solid gray;
 	 	border-collapse: collapse;
 	 	border-radius: 4px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        padding: 8px;
	  }
	  
	  .modal-header {
	  	display: flex;
	  	justify-content: space-between;
	  	align-items: center;
	  }
	  .modal-header>button {
	  	background-color: rgba(0,0,0,0);
		border: none;
		cursor: pointer;
	  }
	  
	  .material-symbols-outlined {
		color: gray;
		font-variation-settings:
		  'FILL' 0,
		  'wght' 400,
		  'GRAD' 0,
		  'opsz' 24
		}
		
		/* navi css */
		#nav1 {
		    display: none !important;
		}
		
		#nav2 {
		    display: none !important;
		}
		
		#nav3 {
		    display: none !important;
		}
		
		#nav4 {
		    display: none !important;
		}
		
		#nav5 {
		    display: block !important;
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
				    <form action="update.se" method="post" enctype="multipart/form-data">
				    	<input type="hidden" name="sellerNo" value="${ sessionScope.loginSeller.sellerNo }">
				    	
				    	<label for="profilePicture">프로필 이미지:</label>
				        <div class="profile-picture">
				        	<table class="profile-table">
				        		<tr height="300px">
				        			<td width="50%">
				        				<img id="previewImage" alt="Preview" src="${pageContext.request.contextPath}${ sessionScope.profileImage.changeName }" onError="this.src='${pageContext.request.contextPath}/resources/images/sample/default.png'">
				        			</td>
				        			<td width="50%"><input type="file" name="upFile" id="profilePicture" accept="image/*"></td>
				        		</tr>
				        	</table>
				        </div>
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
				        <button type="button" onclick="openModal('deleteModal')">탈퇴하기</button>
				    </form>
			    </div>
		        <jsp:include page="../common/footer.jsp" />
	        </div> 
	              
        </div>
    </div>
	

<!-- Change Password Modal -->
<div id="passwordModal" class="overlay">
    <div class="modal">
        <!-- Modal Header -->
	          <div class="modal-header">
	            <h4 class="modal-title">비밀번호 변경</h4>
	            <button type="button" class="close" data-dismiss="modal" onclick="closeModal('passwordModal')"><span class="material-symbols-outlined">close</span></button>
	          </div>
	    
	          <!-- Modal body -->
	          <div class="modal-body">
	            <form action="updateSellerPwd.se" method="post">
	                 <input type="hidden" name="sellerNo" value="${ sessionScope.loginSeller.sellerNo }">
	                 
	                <table>
	                    <tr>
	                        <td>현재 비밀번호</td>
	                        <td>
	                            <input type="password" name="sellerPwd" required>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>변경할 비밀번호</td>
	                        <td>
	                        	<input type="password" name="updateSellerPwd" required>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>변경할 비밀번호 재입력</td>
	                        <td>
	                            <input type="password" name="checkPwd" required>
	                        </td>
	                    </tr>
	                </table>
	                <br>
	                <button type="submit" class="btn btn-secondary btn-sm" onclick="return validatePwd();">비밀번호 변경</button>
	            </form>
	            
	            <script>
	                function validatePwd() {
	                    if($("input[name=updateSellerPwd]").val() != $("input[name=checkPwd]").val()) {
	                        alert("비밀번호가 일치하지 않습니다.");
	                        return false;
	                    }
	                    return true;
	                }
	            </script>
	          </div>
    </div>
</div>

<!-- 탈퇴 Modal -->
<div id="deleteModal" class="overlay">
    <div class="modal">
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">회원탈퇴</h4>
          <button type="button" class="close" data-dismiss="modal" onclick="closeModal('deleteModal')"><span class="material-symbols-outlined">close</span></button>
        </div>
        <!-- Modal body -->
        <div class="modal-body">
          <b>
              탈퇴 후 복구가 불가능합니다. <br>
              정말로 탈퇴하시겠습니까? <br><br>
          </b>
          <form action="delete.se" method="post">
              <!-- 탈퇴 시 : 비밀번호 확인 -->
              <table>
                  <tr>
                      <td>비밀번호</td>
                      <td>
                         <input type="password" class="form-control mb-2 mr-sm-2" placeholder="Enter Password" id="sellerPwd" name="sellerPwd"> <br>
                         <input type="hidden" name="sellerId" value="${ sessionScope.loginSeller.sellerId }">
                      </td>
              </table>
              <br>
              <button type="submit" class="btn btn-secondary btn-sm">탈퇴하기</button>
          </form>
        </div>
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
    
 	// Preview profile picture
    document.getElementById('profilePicture').addEventListener('change', function (event) {
        const previewImage = document.getElementById('previewImage');
        const fileInput = event.target;
        const file = fileInput.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function (e) {
                previewImage.src = e.target.result;
            };
            reader.readAsDataURL(file);
        } else {
            previewImage.src = '';
        }
    });
</script>

</body>
</html>
