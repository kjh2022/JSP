<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	아이디 : ${member.memberId}
	<br> 비밀번호 : ${member.memberPassword}
	<br> 이름 : ${member.memberName}
	<br>
	<button type="button" onclick="location.href='20220915/memberList.jsp'">돌아가기</button>

</body>
</html>