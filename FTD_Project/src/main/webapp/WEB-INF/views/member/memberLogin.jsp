<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FTD</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
<style>

	body {  
        font-family: Arial, sans-serif;
		height: auto;
        margin: 0;
        padding: 0;
        background-color: rgb(240, 243, 246);
	}
	
	#login-form { /* 로그인 폼 영역 */
		margin-top: 6%;
        text-align: center;
	}
	
    #login-area {
    	background-color: white;
    	margin: auto;
    	margin-top : 100px;
    	width: 900px;
    	height: 700px;
    	padding: 50px;
    	border-radius: 50px;
    	box-shadow: 5px 5px 5px 5px lightgray;
    }

    .form-group { /* 폼 안쪽 요소들 */
	    width: 500px;
	    text-align: left;
	    margin : auto;
   }

    #loginTitle { /* 로그인 타이틀 */
        font-size: 30px;
        font-weight: bold;
        color: #388755;
        text-align: center;
        margin-top: 5%;
        margin-bottom: 5%;
    }

    #login-form input, #login-form button { /* 입력칸, 로그인 버튼 공통 사이즈 */
        height : 45px;
        box-sizing : border-box;
        font-size : 20px;
        margin-bottom : 20px;
    }

    .form-group label { /* ID: PW: */
        font-size: 20px;
        text-align: center;
    }

    #login-btn { /* 로그인 버튼 */
        margin-top: 20px;
        width: 100%;
        background-color: #388755;
    }

    #login-form div a { /* 회원가입 / 아이디비번찾기 연결링크 */
        text-decoration: none;  
        margin-left: 10px;                     
        margin-right: 10px;
        font-size: 16px;
        color : gray;
        font-weight: 500;
	}
	
	.changeBtn {
		font-size: 24px !important;
		font-weight: 400;
		background-color: #388755;
		color: white;
		border: none;
		border-radius: 5px;
		padding: 5px;
		text-align: center;
	}
	
	.changeBtn>span {
		margin: 5px;
	}
	
	.material-symbols-outlined {
	font-variation-settings:
		'FILL' 0,
		'wght' 400,
		'GRAD' 0,
		'opsz' 24
	}
	
</style>

</head>
<body>
	<div id="login-area">       
		<form id="login-form" action="login.me" method="post">

            <h2 align="center" id="loginTitle">구매자 회원 로그인</h2>
				<button class="changeBtn" type="button" onclick="location.href='loginForm.se'" ><span class="material-symbols-outlined">autorenew</span> 판매자 전환</button>
                <div class="form-group">                   
                    <label id="id-label" for="userId">아이디</label>
                    <input type="text" class="form-control" id="userId"  name="memberId" required>
                  </div>

                  <div class="form-group">
                    <label for="userPwd">비밀번호</label>
                    <input type="password" class="form-control" id="userPwd" name="memberPwd" required>
                  </div> 

                  <div class="form-group">
                    <button type="submit" class="btn btn-success btn-lg" id="login-btn">로그인</button>
                  </div> 

                  <br>

                  <div class="form-group-etc">
                    <a href="insertForm.me">회원가입</a> | 
                    <a href="find-id">아이디 찾기</a>
                  </div>
        </form>
	</div>
</body>
</html>