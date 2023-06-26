<%@page import="jsp_midterm_memberManagement.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="jsp_midterm_memberManagement.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>회원 관리</title>
<style>
table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	padding: 8px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

th {
	background-color: #f2f2f2;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
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
		// row 클릭 시 해당 user의 정보를 수정할 수 있도록 페이지 전환
		/*
		$("tr.member-row").click(function() {
	        var userId = $(this).data("id");
	        window.location.href = "modify.jsp?id=" + userId;
	    });*/
	});
	

</script>
</head>
<body>
	<%
	MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");
	MemberDAO memberDAO = new MemberDAO();
	ArrayList<MemberDTO> dtos = memberDAO.memberSelectAll();
	%>
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
			</td>
		</tr>
		<%
		}
		%>
	</table>
</body>
</html>
