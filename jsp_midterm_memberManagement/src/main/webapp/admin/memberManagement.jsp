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

#go-main-page {
    border: none;
	border-radius: 4px;
	padding: 10px 20px;
	cursor: pointer;
	margin-top: 10px;
	background-color: #008CBA;
	color: white;
	text-align: center;
	display: block;
	width: 100%;
}

#go-main-page:hover {
    background-color: #007B9A;
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
		// Ż�� ó�� ����. ��ư�� Ŭ���ϸ� DB���� ȸ�� ����
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
			window.location.href = "modifyAdmin.jsp?id=" + userId;
		});
		// ���� �������� �̵��ϴ� ��ư�� Ŭ�� �̺�Ʈ�� ����
    	$("#go-main-page").click(function() {
        	window.location.href = "../common/main.jsp";
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
			<button id="go-main-page">���� �������� �̵�</button>
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
					<div class="action-buttons">
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
