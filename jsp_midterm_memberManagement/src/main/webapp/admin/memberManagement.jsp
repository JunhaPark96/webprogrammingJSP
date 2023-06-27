<%@page import="jsp_midterm_memberManagement.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="jsp_midterm_memberManagement.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원 관리</title>
<style>
.table-container {
	max-width: 800px;
	margin: 0 auto;
	padding: 20px;
	background-color: #f8f8f8;
	border: 1px solid #eaeaea;
	border-radius: 4px;
}

.table-container table {
	width: 100%;
	border-collapse: collapse;
}

.table-container th, .table-container td {
	padding: 8px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

.table-container th {
	background-color: #f2f2f2;
}

.table-container tr.member-row:hover {
	background-color: #f9f9f9;
}

.action-buttons {
	display: flex;
	gap: 5px;
}

.action-buttons button {
	border: none;
	border-radius: 4px;
	padding: 5px 10px;
	cursor: pointer;
}

.action-buttons .approve-button {
	background-color: #4CAF50;
	color: white;
}

.action-buttons .approve-button:hover {
	background-color: #45a049;
}

.action-buttons .delete-button {
	background-color: #f44336;
	color: white;
}

.action-buttons .delete-button:hover {
	background-color: #d32f2f;
}

.member-row td {
	cursor: pointer;
}

</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
</script>
	
<script>
	$(document).ready(function() {
		// 승인 처리 로직. 버튼을 클릭하면 가입 승인 처리
		$(".approve-button").click(function() {
			var userId = $(this).data("id");
			$.post("approveOk.jsp", {
				id : userId
			}, function(data) {
				data = data.trim(); // 공백을 제거하여 문자열 에러 차단
				if (data == "success") {
					alert("승인 처리하였습니다");
					location.reload();
				} else {
					alert("승인 처리에 실패하였습니다. 다시 시도해주세요.");
				}
			});
		});
		// 탈퇴 처리 로직. 버튼을 클릭하면 DB에서 회원 삭제
		$(".delete-button").click(function() {
            var userId = $(this).data("id");
            $.post("deleteOk.jsp", {
                id : userId
            }, function(data) {
                data = data.trim(); // 공백을 제거하여 문자열 에러 차단
                if (data == "success") {
                    alert("삭제 처리하였습니다");
                    location.reload();
                } else {
                    alert("삭제 처리에 실패하였습니다. 다시 시도해주세요.");
                }
            });
        });
		// 회원 row를 클릭 시, 회원 정보 수정 페이지로 이동
		$(".member-row").click(function() {
			var userId = $(this).data("id");
			window.location.href = "modifyAdmin.jsp?id=" + userId;
		});
	});
	

</script>
</head>
<body>
	<%
	MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");
	MemberDAO memberDAO = new MemberDAO();
	ArrayList<MemberDTO> dtos = memberDAO.memberSelectAll();
	%>
	<div class="table-container">
		<table>
			<tr>
				<th>이름</th>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>전화번호</th>
				<th>이메일</th>
				<th>회원상태</th>
				<th>회원권한</th>
				<th></th>
			</tr>
			<%
			for (int i = 0; i < dtos.size(); i++) {
				MemberDTO dto = dtos.get(i);
			%>
			<tr class="member-row" data-id="<%=dto.getId()%>">
				<td><%=dto.getName()%></td>
				<td><%=dto.getId()%></td>
				<td><%=dto.getPw()%></td>
				<!--  관리자 본인의 전화번호만 보이고, 나머지는 가림 -->
				<td><%=(loginUser.getId().equals(dto.getId()) ? dto.getPhone() : "010-XXXX-XXXX")%></td>
				<td><%=dto.getEmail()%></td>
				<td><%=dto.getMemberStatus()%></td>
				<td><%=dto.getMemberRole()%></td>
				<td>
					<div class="action-buttons">
						<%
						if (dto.getMemberStatus().equals("pending")) {
						%>
						<button class="approve-button" data-id="<%=dto.getId()%>">승인</button>
						<%
						}
						%>
						<%
	       			 if (dto.getMemberStatus().equals("pause")) {
	        		%>
	        		<button class="delete-button" data-id="<%=dto.getId()%>">삭제</button>
	        		<%
	        		}
	        		%>
					</div>
				</td>
			</tr>
			<%
			}
			%>
		</table>
	</div>
</body>
</html>
