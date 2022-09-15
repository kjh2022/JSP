<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
th {
	width: 150px;
}

td {
	text-align: center;
}

#info:hover {
	background-color: yellow;
}
</style>
</head>
<body>
	<div align="center">
		<div>
			<h1>멤버 전체 목록</h1>
		</div>
		<div>
			<table border="1">
				<tr>
					<th>아이디</th>
					<th id="name">이름</th>
					<th>전화번호</th>
					<th id="aut">권한</th>
				</tr>
				<c:forEach items="${members}" var="m">
					<tr id="info" onclick="selectMember('${m.memberId}')">
						<td>${m.memberId}</td>
						<td>${m.memberName}</td>
						<td>${m.memberTel}</td>
						<td>${m.memberAuthor}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<br>
		<div>
			<button type="button" onclick="location.href='memberJoinForm.do'">멤버 추가</button>
			&nbsp;&nbsp;
			<button type="button" onclick="location.href='main.do'">홈으로</button>
		</div>
		<div>
			<form id="frm" action="MemberSelect" method="post">
				<input type="hidden" id="id" name="id">
			</form>
		</div>
	</div>
	<script type="text/javascript">
		function selectMember(id) {
			frm.id.value = id;
			frm.action="MemberSelect.do";
			frm.submit();
		}
	</script>
</body>
</html>