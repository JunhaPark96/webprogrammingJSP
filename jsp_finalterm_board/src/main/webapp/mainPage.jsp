<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시글 리스트</title>
<!-- Bootstrap CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">

<style>
body {
	padding: 20px;
}
.table-bordered {
	width: 100%;
	max-width: 100%;
	margin-bottom: 1rem;
	border: 1px solid #dee2e6;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col">
				<h1>게시글 리스트</h1>
				<table class="table table-striped table-bordered">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col">이름</th>
							<th scope="col">제목</th>
							<th scope="col">날짜</th>
							<th scope="col">조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="board" items="${boardList}">
							<tr>
								<th scope="row">${board.id}</th>
								<td>${board.writer}</td>
								<td><a href="contentPage.do?id=${board.id}">${board.title}</a></td>
								<td>${board.writtenDate}</td>
								<td>${board.views}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<a href="newPage.jsp" class="btn btn-primary">새 글작성</a>
			</div>
		</div>
	</div>

<!-- Bootstrap JavaScript -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</body>
</html>
