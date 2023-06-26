<%@page import="jsp_midterm_memberManagement.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="jsp_midterm_memberManagement.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�� ����</title>
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
tr.member-row:hover {
    background-color: #f9f9f9;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
<script>
	$(document).ready(function() {
		// ���� ó�� ����. ��ư�� Ŭ���ϸ� ���� ���� ó��
		$(".approve-button").click(function() {
			var userId = $(this).data("id");
			$.post("approveOk.jsp", {
				id : userId
			}, function(data) {
				data = data.trim(); // ������ �����Ͽ� ���ڿ� ���� ����
				if (data == "success") {
					alert("���� ó���Ͽ����ϴ�");
					location.reload();
				} else {
					alert("���� ó���� �����Ͽ����ϴ�. �ٽ� �õ����ּ���.");
				}
			});
		});
		// Ż�� ó�� ����. ��ư�� ���ϸ� DB���� ȸ�� ����
		$(".delete-button").click(function() {
            var userId = $(this).data("id");
            $.post("deleteOk.jsp", {
                id : userId
            }, function(data) {
                data = data.trim(); // ������ �����Ͽ� ���ڿ� ���� ����
                if (data == "success") {
                    alert("���� ó���Ͽ����ϴ�");
                    location.reload();
                } else {
                    alert("���� ó���� �����Ͽ����ϴ�. �ٽ� �õ����ּ���.");
                }
            });
        });
		// ȸ�� row�� Ŭ�� ��, ȸ�� ���� ���� �������� �̵�
		$(".member-row").click(function() {
			var userId = $(this).data("id");
			window.location.href = "modify.jsp?id=" + userId;
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
	<table>
		<tr>
			<th>�̸�</th>
			<th>���̵�</th>
			<th>��й�ȣ</th>
			<th>��ȭ��ȣ</th>
			<th>�̸���</th>
			<th>ȸ������</th>
			<th>ȸ������</th>
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
			<!--  ������ ������ ��ȭ��ȣ�� ���̰�, �������� ���� -->
			<td><%=(loginUser.getId().equals(dto.getId()) ? dto.getPhone() : "010-XXXX-XXXX")%></td>
			<td><%=dto.getEmail()%></td>
			<td><%=dto.getMemberStatus()%></td>
			<td><%=dto.getMemberRole()%></td>
			<td>
				<%
				if (dto.getMemberStatus().equals("pending")) {
				%>
				<button class="approve-button" data-id="<%=dto.getId()%>">����</button>
				<%
				}
				%>
				<%
       			 if (dto.getMemberStatus().equals("pause")) {
        		%>
        		<button class="delete-button" data-id="<%=dto.getId()%>">����</button>
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
