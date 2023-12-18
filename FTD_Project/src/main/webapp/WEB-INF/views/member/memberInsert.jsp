<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    
    <style>
    	.header {
    		display: none;
    	}
    
        body {  
            font-family: Arial, sans-serif;
			height: 1600px;
            margin: 0;
            padding: 0;
            background-color: rgb(240, 243, 246);
        }

        header {
            background-color: #388755;
            color: black;
            padding: 1em;
            text-align: center;
        }
        
        @font-face {
            font-family: 'Pretendard-Regular';
            src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
            font-weight: 400;
            font-style: normal;
        }
        * { font-family: 'Pretendard-Regular'; }

        .adminNameBar { 
        	margin:auto;
	 		color: black(121, 172, 120);
			text-align: center;
	 	}

        #register-title-area{ /* 회원가입 텍스트 영역 */
            width: 900px;
            margin: auto;
            margin-top: 5%;
            border-bottom: 3px solid #388755;
        }

        #register-title-area>p{ /* 회원가입 텍스트 */
            font-size: 26px;
            font-weight: bold;
            color: #388755;
            letter-spacing: 3px;
        }

        .register-title-menu{ /* 상단 슬롯 */
            width: 12%;
            padding: 6px;
            float: right;
            margin-left: 2px;
            margin-top: 20px;
            background-color: #388755;
            color: white;
        }
        .register-title-menu:hover{ /* 상단슬롯 호버효과제거 */
            width: 12%;
            padding: 6px;
            float: right;
            margin-left: 2px;
            margin-top: 20px;
            background-color: #388755;
            color: white;
        }

        #table-area-default>p{ /* "기본정보입력" */
            padding: 10px;
            font-size: 22px;
            font-weight: 700;
            text-align: center;
            color: #388755;
            letter-spacing: 2px;
        }

        #register-form-table{ /* 테이블 */
            width: 1000px;
            margin: auto;
        }
        #register-form-table th{ /* 테이블 제목열 */
            width: 300px;
            text-align: right;
            font-size: 18px;
            color: dimgray;
            padding-bottom: 3%;
        }
        #register-form-table td{ /* 테이블 입력칸들 */
            width: 700px;
            text-align: left;
            font-size: 16px;
            padding-left: 5%;
            padding-bottom: 3%;
        }

        #memberName{ width: 300px; }  /* 성명 입력칸 */
       
        
        
        #domain{ width: 140px; } /* 이메일 계정명 */
        #domainText{ width: 140px; }
        #email1{ width: 140px; }

        /* 휴대폰번호 입력칸 */
        #phone{ width: 90px;
        }
        .phone{
        width: 300px;
        }
        #address, #zipCode, #detailAddress{ /* 주소입력칸 */
            width: 300px;
        }

        #account-title{ /* "아이디/비밀번호 설정" */
            padding: 10px;
            font-size: 22px;
            font-weight: 700;
            text-align: center;
            color: #388755;
            letter-spacing: 2px;
            display: block;
        }

        #table-area-account { /* 테이블 영역 */
            padding: 10px;
            text-align: left;
            margin-top: 7%;
            margin-bottom: 10%;
        }

        #account-form-table{ /* 아이디 비번설정 테이블 */
            width: 1000px;
            margin: auto;
        }

        #account-form-table th{ /* 테이블 제목열 */
            width: 300px;
            text-align: right;
            font-size: 18px;
            color: dimgray;
            padding-bottom: 30px;
            
        }
        #account-form-table td{ /* 테이블 입력칸 영역 */
            width: 700px;
            text-align: left;
            font-size: 16px;
            padding-left: 5%;
        }

        #account-form-table input{ /* 테이블 INPUT 태그 */
            width: 300px;
            display: inline-block;
        }

        #duplicate-check{ /* 아이디 중복확인 버튼 */
            margin-left: 20px;
            border: 0px;
            background-color: #388755;
            color: white;
            border-radius: 25px;
            width: 100px;
        }
        #duplicate-check:hover{
            background-color: #388755;
        }

        #account-form-table p{ /* ID/PWD 조건텍스트 */
            font-size: 12px;
        }

        #reset-form, #submit-form{ /* 초기화, 다음버튼 공통 */
            width: 120px;
            height: 50px;
            border: 0px;
            border-radius: 10px;
            font-size: 18px;
            margin: 0px 0px 20px 20px;
        }

        #reset-form{
            background-color: rgb(240, 217, 12);
        }
        #submit-form{
            background-color: rgb(121, 172, 120);
            color: white;
        }
        
        #requireDuplicateText{
        	font-size: 14px;
        	color: red;
        	margin-left: 25px;
        }	
        #possible-text{
        	font-size: 14px
        }

        footer {
            background-color: #388755;
            color: black;
            padding: 1em;
            text-align: center;
            position: fixed;
            bottom: 0;
            width: 100%;
        }

    </style>
</head>
<body>
    <jsp:include page="../common/header.jsp" />

    <div id="register-title-area">
        <p>
            구매자 회원가입
        </p>
        
    </div>
 
    <form action="insert.me" method="post" id="register-form">
        <br>
        <div id="table-area-default">
            <p>기본정보입력</p>
            <br>
            <table id="register-form-table" align="center">
                <tr>
                    <th><span class="nessesary"></span> 성명 : </th>
                    <td colspan="3">
                        <input type="text" id="memberName" name="memberName" required class="form-control form-control">
                    </td>
                </tr>
                <tr>
                    <th><span class="nessesary"></span> 휴대폰번호</th>
                    <td>
                        <div style="display:flex; width: 300px;">                
                            <input type="text" name="phone" 
                                   class="phone form-control form-control" 
                                   required oninput="addHyphen(this)">                     
                        </div>
                        <small style="color: grey;">(예: 010-1234-5678)</small>
                    </td>
                </tr>
                <tr>
                    <th><span class="nessesary"></span> 이메일</th>
                    <td colspan="3">
                    <div style="display:flex; width: 500px;">
                    	<input type="hidden" id="email"  name="email">
                        <input type="text" id="email1" name="email1" required class="form-control form-control">@
                        <input type="text"  id="domainText" name="domain" class="email form-control form-control" required>
                        <select id="domain" class="email form-control form-control">
                            <option selected>직접입력</option>
                            <option>naver.com</option>
                            <option>daum.net</option>
                            <option>gmail.com</option>
                        </select>
                    </div>
                    </td>
                </tr>

                <tr>
                    <th><span class="nessesary"></span>우편번호</th>
                    <td colspan="3">
                        <div style="display: flex;">
                            <input type="text" id="zipCode" name="zipCode" required class="postcodify_postcode5 form-control form-control" value="" />
                            <button type="button" id="postcodify_search_button" style="border-radius: 10px; width: 70px;">검색</button>
                        </div>
                    </td>
                </tr>
                
                <tr>
                    <th><span class="nessesary"></span>주소</th>
                    <td colspan="3">
                        <input type="text" id="address" name="address" required class="postcodify_address form-control form-control">
                    </td>
                </tr>

                <tr>
                    <th><span class="nessesary"></span>상세주소</th>
                    <td colspan="3">
                        <input type="text" id="detailAddress" name="detailAddress" required class="postcodify_details form-control form-control" value="" />
                    </td>
                </tr>


                <tr>
                    <th><span class="nessesary"></span> 성별</th>
                    <td colspan="3">
                        <input type="radio" id="Male" value="M" name="gender" checked>
                        <label for="Male">남자</label> &nbsp;&nbsp;
                        <input type="radio" id="Female" value="F" name="gender">
                        <label for="Female">여자</label> &nbsp;&nbsp;
                    </td>
                </tr>
            </table>
        </div>

        <div id="table-area-account">
            <span id="account-title">아이디 / 비밀번호 설정</span>
            <br>
            <table id="account-form-table" align="center">
                <tr>
                    <th>아이디</th>
                    <td>
                        <input type="text" id="memberId" name="memberId" required class="form-control form-control"
                        minlength="5" maxlength="15">
                        <button type="button" id="duplicate-check" onclick="duplicateCheck();">
                            중복확인
                        </button> <span id="possible-text"></span>
                        <p>영문, 숫자 포함 5-15자</p>
                    </td>
                </tr>
                <tr>
                    <th>비밀번호</th>
                    <td>
                        <input type="password" id="memberPwd" name="memberPwd" required class="form-control form-control"
                        minlength="8" maxlength="20">
                        <p>영문, 숫자, 특수기호 포함 8-20자</p>
                    </td>
                </tr>
                <tr>
                    <th>비밀번호 확인</th>
                    <td>
                        <input type="password" id="checkPwd" required class="form-control form-control">
                        <p>영문, 숫자, 특수기호 포함 8-20자</p>
                    </td>
                </tr>
            </table>
            <br><br>
            <div align="center">
                <p id="requireDuplicateText">아이디 중복체크를 진행해주세요</p>
                <button type="submit" id="submit-form"  disabled onclick="return validate();">확인</button>
            </div>
        </div>

       

    </form>
        <!-- jQuery와 Postcodify를 로딩한다 -->
    <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
        <!-- "검색" 단추를 누르면 팝업 레이어가 열리도록 설정한다 -->
    <script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
    
    <script>
    function addHyphen(element) {
        // 사용자가 입력한 값에서 숫자만 추출
        var inputValue = element.value.replace(/[^0-9]/g, '');

        // 숫자를 하이픈(-)으로 나누어서 조합
        var formattedValue = formatPhoneNumber(inputValue);

        // 입력란에 포맷된 값 적용
        element.value = formattedValue;
    }

    function formatPhoneNumber(value) {
        // 입력받은 숫자를 하이픈(-)으로 나누어서 조합
        var formattedValue = '';
        if (value.length > 2) {
            formattedValue += value.substr(0, 3) + '-';
            value = value.substr(3);
        }
        if (value.length > 3) {
            formattedValue += value.substr(0, 4) + '-';
            value = value.substr(4);
        }
        formattedValue += value;
        return formattedValue;
    }
</script>

    <script>
        function addHyphen(element) {
            // 사용자가 입력한 값에서 숫자만 추출
            var inputValue = element.value.replace(/[^0-9]/g, '');
    
            // 숫자를 하이픈(-)으로 나누어서 조합
            var formattedValue = formatPhoneNumber(inputValue);
    
            // 입력란에 포맷된 값 적용
            element.value = formattedValue;
        }
    
        function formatPhoneNumber(value) {
            // 입력받은 숫자를 하이픈(-)으로 나누어서 조합
            var formattedValue = '';
            if (value.length > 2) {
                formattedValue += value.substr(0, 3) + '-';
                value = value.substr(3);
            }
            if (value.length > 3) {
                formattedValue += value.substr(0, 4) + '-';
                value = value.substr(4);
            }
            formattedValue += value;
            return formattedValue;
        }
    </script>

    <script> // 아이디 중복체크
    	function duplicateCheck() {
    		
    		let $memberId = $("#memberId");
    		let pText = $("#possible-text");
    		let dText = $("#requireDuplicateText");
    		
    		let regExp = /^[a-z][a-z\d]{5,15}$/;
    		
    		$.ajax({
    		url : "idCheck.me",
    		type : "get",
    		data : { checkId : $memberId.val() },
    		success : function(result) {
    			
    			if(result == "NNNNN"){		// 사용불가
    				pText.text("이미 사용중인 아이디입니다.").css("color", "red", "");
    				$memberId.focus();
    			} else {		// 사용가능 				
    				if(!regExp.test($memberId.val())){ // 아이디 조건이 맞지 않는다면
    					alert("유효한 아이디값이 아닙니다. 영문 소문자, 숫자 포함 5~15자");
    					$memberId.focus();
    				} else if(confirm($memberId.val() + " 아이디로 사용하시겠습니까?")) { // 확인창 띄움
    					$("#submit-form").removeAttr("disabled");
    					$("#submit-form").hover(
    						function(){
    							$(this).css("font-weight", "bold");
    					},
    						function(){
    							$(this).css("font-weight", "500");
    					}
    					)
    					pText.text("사용 가능한 아이디입니다.").css("color", "green");
    					dText.text("");
    					$memberId.attr("readonly", true);
    				} else {
    					$memberId.focus();
    				}
    				
    			}
    			
    		},
    		error : function(){
    			alert("통신실패. 관리자에게 문의하세요");
    		}
    			
    		});
    		
    	}
    </script>
    	
    	<script type="text/javascript">
    		function name() {
				
			}
    	</script>
    	
    <script> // 유효성 검사
    		function validate () {
        		
        		let memberName = $("#memberName").val();
        		const memberPwd = $("#memberPwd").val();
            	const checkPwd = $("#checkPwd").val();
            	
            	regExp = /^[a-zA-Z\d!@#$%^&*]{8,20}$/i;
        		
            	if(!regExp.test(memberPwd)){
            		alert("비밀번호가 유효하지 않습니다" + "8~20자리 영문대소문자, 숫자, 특수문자");
            		$("#memberPwd").focus();
                    return false;
            	}
            	
        		if(memberPwd != checkPwd){
        			alert("비밀번호가 일치하지 않습니다. 다시 확인해주세요");
        			$("#checkPwd").focus();
        			return false;
        		}       	
        		
        		regExp = /^[가-힣]{2,}$/;
        		
        		if(!regExp.test(memberName)) {
        			alert("잘못된 이름을 입력했습니다. (2글자 이상 한글)");
        			$("memberName").select();
        			return false;
        		}
        		
        		let email1 = $("#email1").val();
        		let email2 = $("#domainText").val();
        		let email = email1 + "@" + email2;
        		$("#email").val(email);
        		
        		
        		return true;
        		
        	}
	
    </script>
    
    <script> // 이메일 직접입력 안할 시 input 요소숨김
    
    	$(function (){
    		$("#domain").change(function() {
    			
    			let selectDomain = $(this).val();
    			
    			if(selectDomain == "직접입력"){
    				$("#domainText").val("");
    			} else {
    				$("#domainText").val($("#domain").val());
    			}
    			
    		})
    	})
    
    </script>

    <br><br>

    <jsp:include page="../common/footer.jsp" />
</body>
</html>