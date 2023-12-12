<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>member Information</title>
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
        .Gender {
        display: flex;
        align-items: center;
        justify-content: center;
        margin-top: 20px; /* Adjust as needed */
    }

    .Gender label {
        margin-right: 10px; /* Adjust as needed for spacing between labels and radio buttons */
        font-size: 18px;
        color: #555;
    }

    .Gender input {
        margin-right: 5px; /* Adjust as needed for spacing between radio buttons */
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
	    display: block !important;
	}
	
	#nav5 {
	    display: none !important;
	}
	
    </style>
</head>
<body>

<!-- member Information Section -->
	<div class="wrapper">
        <div class="center-div">
	        <jsp:include page="../common/sidebar.jsp" />
	        <div class="main-div">
		        <jsp:include page="../common/header.jsp" />
		        <div class="content">
			    <h1>구매자 정보</h1>
				    <form action="update.me" method="post" >
				    	<input type="hidden" name="memberNo" value="${ sessionScope.loginUser.memberNo }">
				    	
				        <label for="memberId">* 아이디 : </label>
                        <input type="text" class="form-control" id="memberId" value="${ sessionScope.loginUser.memberId }" name="memberId" readonly> <br>
                        <br><br>
                        <label for="memberName">* 이름 : </label>
                        <input type="text" class="form-control" id="memberName" value="${ sessionScope.loginUser.memberName }" name="memberName" required> <br>
                        <br><br>
                        <label for="email"> &nbsp; 이메일 : </label>
                        <input type="text" class="form-control" id="email" value="${ sessionScope.loginUser.email }" name="email"> <br>
                        <br><br>
                        <label for="phone"> &nbsp; 폰번호 : </label>
                        <input type="tel" class="form-control" id="phone" value="${ sessionScope.loginUser.phone }" name="phone"> <br>
                        <br><br>
                        <label for="zipCode"> &nbsp; 우편번호 : </label>
                        <input type="text" class="form-control" id="zipCode" value="${ sessionScope.loginUser.zipCode }" name="zipCode"> <br>
                        <br><br>
                        <label for="address"> &nbsp; 주소 : </label>
                        <input type="text" class="form-control" id="address" value="${ sessionScope.loginUser.address }" name="address"> <br>
                        <br><br>
                        <label for="detailAddress"> &nbsp; 상세주소 : </label>
                        <input type="text" class="form-control" id="detailAddress" value="${ sessionScope.loginUser.detailAddress }" name="detailAddress"> <br>
                        <br><br>
                    <div class="Gender">
                        <label for=""> &nbsp; Gender : </label>
                        <label for="Male">남자</label><input type="radio" id="Male" value="M" name="gender">
                        <label for="Female">여자</label><input type="radio" id="Female" value="F" name="gender">
                    </div>    
                        <script>
                    	$(function() {
                    		
                    		
                    		if("${ sessionScope.loginUser.gender }" != "") {
                    		
                    			$("input[value=${ sessionScope.loginUser.gender }]")
                    											.attr("checked", true);
                    		}
                    	});
                    	</script>
                        
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
	            <form action="updatePwd.me" method="post" onsubmit="return validatePwd();"">
	                 <input type="hidden" name="memberNo" value="${ sessionScope.loginUser.memberNo }">
	                 
	                <table>
	                    <tr>
	                        <td>현재 비밀번호</td>
	                        <td>
	                            <input type="password" name="memberPwd" required>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>변경할 비밀번호</td>
	                        <td>
	                        	<input type="password" name="updatePwd" required>
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
	                <button type="submit" class="btn btn-secondary btn-sm">비밀번호 변경</button>
	            </form>
	            
	            <script>
	                function validatePwd() {
	                    if($("input[name=updatePwd]").val() != $("input[name=checkPwd]").val()) {
	                        alert("비밀번호가 일치하지 않습니다1.");
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
          <form action="delete.me" method="post">
              <!-- 탈퇴 시 : 비밀번호 확인 -->
              <table>
                  <tr>
                      <td>비밀번호</td>
                      <td>
                            <input type="password" class="form-control mb-2 mr-sm-2" placeholder="Enter Password" id="memberPwd" name="memberPwd"> <br>
                            <input type="hidden" name="memberId" value="${ sessionScope.loginUser.memberId }">
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
