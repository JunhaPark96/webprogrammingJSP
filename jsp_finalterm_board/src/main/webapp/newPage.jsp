<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�� �� �ۼ�</title>
<!-- Bootstrap CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">
<style>
body {
	padding: 20px;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col">
				<h1>�� �� �ۼ�</h1>
				<form action="newWriting.do" method="post">
					<div class="form-group">
						<label for="writer">�̸�</label>
						<input type="text" class="form-control" id="writer" name="writer" required>
					</div>
					<div class="form-group">
						<label for="title">����</label>
						<input type="text" class="form-control" id="title" name="title" required>
					</div>
					<div class="form-group">
						<label for="content">����</label>
						<textarea class="form-control" id="content" name="content" rows="3" required></textarea>
					</div>
					<button type="submit" class="btn btn-primary">���ۼ�</button>
					<a href="mainPage.do" class="btn btn-secondary">���</a>
				</form>
			</div>
		</div>
	</div>

<!-- Bootstrap JavaScript -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</body>
</html>
