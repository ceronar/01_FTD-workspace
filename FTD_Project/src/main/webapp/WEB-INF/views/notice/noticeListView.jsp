<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 20px;
        }

        .container {
            max-width: 800px;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px 20px 60px 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            text-align: center;
            border-top : 1px solid #ccc;
            border-bottom : 1px solid #ccc;
        }

        th {
            background-color: #f2f2f2;
        }

        tbody tr:hover {
            background-color: #f9f9f9;
            cursor: pointer;
        }
        .btn button {
            float : right;
            padding: 8px 20px;
            border: none;
            background-color: #2ecc71;
            color: #fff;
            cursor: pointer;
            border-radius: 3px;
            margin: 10px 5px;
        }

        .btn button:hover {
            background-color: #27ae60;
        }
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
</head>
<body>
    <div class="container">
        <h1>게시판</h1>
        <div align="center">
            <table>
                <thead>
                    <tr>
                        <th style="width : 5%;"><input type="checkbox" id="check-all"></th>
                        <th style="width : 7%;">번호</th>
                        <th style="width : 15%;">답변상태</th>
                        <th style="width : 38%;">제목</th>
                        <th style="width : 10%;">문의자</th>
                        <th style="width : 10%">조회수</th>
                        <th style="width : 15%;">등록일</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><input type="checkbox" class="delete"></td>
                        <td name="inqNo">1</td>
                        <td name="">답변 완료</td>
                        <td>집에가고싶어요</td>
                        <td>user01</td>
                        <td>10</td>
                        <td>2023-11-23</td>
                    </tr>
                    
                </tbody>
            </table>
        </div>
        <div class="btn">
            <button onclick="deleteSelected()">삭제</button>
            <button>작성</button>
        </div>
    </div>
    <script>
        // "check-all" 체크박스를 클릭했을 때 모든 "delete" 클래스의 체크박스의 checked 상태 변경
        document.getElementById("check-all").addEventListener("change", function() {
            let deleteCheckboxes = document.querySelectorAll('.delete'); // "delete" 클래스 체크박스들을 가져옴
            let checkAll = this.checked; // "check-all" 체크박스의 상태

            deleteCheckboxes.forEach(function(checkbox) {
                checkbox.checked = checkAll; // "delete" 클래스 체크박스들의 상태를 "check-all"에 맞게 변경
            });
        });

        // "delete" 클래스 체크박스들의 상태가 변경될 때 "check-all" 체크박스의 상태 확인
        document.querySelectorAll('.delete').forEach(function(checkbox) {
            checkbox.addEventListener("change", function() {
                let deleteCheckboxes = document.querySelectorAll('.delete'); // "delete" 클래스 체크박스들을 가져옴
                let checkAll = document.getElementById("check-all"); // "check-all" 체크박스 요소를 가져옴

                let allChecked = true;
                deleteCheckboxes.forEach(function(checkbox) {
                    if (!checkbox.checked) {
                        allChecked = false;
                    }
                });

                checkAll.checked = allChecked; // "check-all" 체크박스의 checked 상태를 변경
            });
        });
        /*
        // "삭제" 버튼 클릭 시 선택된 항목들 삭제하는 함수
        function deleteSelected() {
            let deleteCheckboxes = document.querySelectorAll('.delete'); // "delete" 클래스 체크박스들을 가져옴
            let selectedItems = Array.from(deleteCheckboxes).filter(checkbox => checkbox.checked); // 선택된 체크박스들을 배열로 가져옴

            // 선택된 체크박스들을 처리하는 코드 추가
            selectedItems.forEach(function(item) {
                // 여기에 선택된 체크박스를 삭제하는 로직을 추가하세요.
                console.log("삭제될 아이템: ", item.getElementsByTagName("noticeNo"));
            });
        }
        */
    </script>
</body>
</html>