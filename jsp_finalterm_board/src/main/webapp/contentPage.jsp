<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խñ� ��</title>
<!-- Bootstrap CSS -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col">
				<h1>�Խñ� ��</h1>
				<form action="updateBoard.do" method="post">
					<input type="hidden" name="id" value="${board.id}">
					<table class="table">
						<tbody>
							<tr>
								<th>��ȣ</th>
								<td>${board.id}</td>
							</tr>
							<tr>
								<th>�ۼ���</th>
								<td><input type="text" name="writer"
									value="${board.writer}"></td>
							</tr>
							<tr>
								<th>����</th>
								<td><input type="text" name="title" value="${board.title}"></td>
							</tr>
							<tr>
								<th>����</th>
								<td><textarea name="content">${board.content}</textarea></td>
							</tr>
							<tr>
								<th>�ۼ���</th>
								<td>${board.writtenDate}</td>
							</tr>
							<tr>
								<th>��ȸ��</th>
								<td>${board.views}</td>
							</tr>
						</tbody>
					</table>
				</form>
				<div>
					<form action="updateBoard.do" method="post"
						style="display: inline-block;">
						<input type="hidden" name="id" value="${board.id}">
						<button type="submit" class="btn btn-primary">����</button>
					</form>
					<form action="deleteBoard.do" method="post"
						style="display: inline-block;">
						<input type="hidden" name="id" value="${board.id}">
						<button type="submit" class="btn btn-danger">����</button>
					</form>
					<form action="replyBoard.do" method="post"
						style="display: inline-block;">
						<input type="hidden" name="id" value="${board.id}">
						<button type="submit" class="btn btn-success">�亯</button>
					</form>
					<a href="mainPage.do" class="btn btn-secondary">��Ϻ���</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
