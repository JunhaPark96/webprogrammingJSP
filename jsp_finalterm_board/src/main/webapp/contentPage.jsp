<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시글 상세</title>
<!-- Bootstrap CSS -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col">
				<h1>게시글 상세</h1>
				<form action="updateBoard.do" method="post">
					<input type="hidden" name="id" value="${board.id}">
					<table class="table">
						<tbody>
							<tr>
								<th>번호</th>
								<td>${board.id}</td>
							</tr>
							<tr>
								<th>작성자</th>
								<td><input type="text" name="writer"
									value="${board.writer}"></td>
							</tr>
							<tr>
								<th>제목</th>
								<td><input type="text" name="title" value="${board.title}"></td>
							</tr>
							<tr>
								<th>내용</th>
								<td><textarea name="content">${board.content}</textarea></td>
							</tr>
							<tr>
								<th>작성일</th>
								<td>${board.writtenDate}</td>
							</tr>
							<tr>
								<th>조회수</th>
								<td>${board.views}</td>
							</tr>
						</tbody>
					</table>
				</form>
				<div>
					<form action="updateBoard.do" method="post"
						style="display: inline-block;">
						<input type="hidden" name="id" value="${board.id}">
						<button type="submit" class="btn btn-primary">수정</button>
					</form>
					<form action="deleteBoard.do" method="post"
						style="display: inline-block;">
						<input type="hidden" name="id" value="${board.id}">
						<button type="submit" class="btn btn-danger">삭제</button>
					</form>
					<%-- <form action="replyBoard.do" method="post"
						style="display: inline-block;">
						<input type="hidden" name="id" value="${board.id}">
						<button type="submit" class="btn btn-success">답변</button>
					</form>  --%>
					<a href="replyPage.jsp?id=${board.id}" class="btn btn-success">답변</a>
					<a href="mainPage.do" class="btn btn-secondary">목록보기</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
