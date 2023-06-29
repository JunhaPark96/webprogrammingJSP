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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col">
				<h1>게시글 리스트</h1>
				<form id="boardForm" action="deleteBoardAll.do" method="post">
					<table class="table table-striped table-bordered">
						<thead>
							<tr>
								<th scope="col"><input type="checkbox" id="selectAll"></th>
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
									<th scope="row"><input type="checkbox" name="boardId" value="${board.id}"></th>
									<td>${board.id}</td>
									<td>${board.writer}</td>
									<td><a href="contentPage.do?id=${board.id}">${board.title}</a></td>
									<td>${board.writtenDate}</td>
									<td>${board.views}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<input type="submit" class="btn btn-danger" value="선택 삭제">
					<a href="newPage.jsp" class="btn btn-primary">새 글작성</a>
				</form>
			</div>
		</div>
	</div>

<script>
$(document).ready(function(){
    //전체 선택 체크박스 클릭 
    $("#selectAll").click(function(){
        //만약 전체 선택 체크박스가 체크된상태일경우 
        if($("#selectAll").prop("checked")) {
            //해당화면에 전체 checkbox들을 체크해준다 
            $("input[type=checkbox]").prop("checked",true);
        // 전체선택 체크박스가 해제된 경우 
        } else {
            //해당화면에 모든 checkbox들의 체크를해제시킨다. 
            $("input[type=checkbox]").prop("checked",false);
        }
    })
})
</script>

<!-- Bootstrap JavaScript -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</body>
</html>
