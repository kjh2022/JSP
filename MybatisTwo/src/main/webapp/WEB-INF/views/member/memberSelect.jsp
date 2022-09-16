<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<div>
			<h1>멤버 상세 정보</h1>
		</div>
		<div>
			<table border="1">
				<tr>
					<th width="150px">아이디</th>
					<td width="200px">${m.memberId}</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>${m.memberPassword}</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>${m.memberName}</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>${m.memberTel}</td>
				</tr>
				<tr>
					<th>권한</th>
					<td>${m.memberAuthor}</td>
				</tr>
			</table>
		</div>
		<br>
		<div>
			<form id="frm" method="post">
				<input type="hidden" id="memberId" name="memberId">
				<button type="button" onclick="actionForm('E')">수정</button>
				&nbsp;&nbsp;
				<button type="button" onclick="actionForm('D')">삭제</button>
				&nbsp;&nbsp;
				<button type="button" onclick="actionForm('L')">목록</button>
			</form>
		</div>
	</div>
	<script type="text/javascript">
		function actionForm(str){
			case 'E': //수정
			frm.action="memberEdit.do";
			frm.submit();
			break;
			case 'D': //삭제
			frm.action="memberDelete.do";
			frm.submit();
			break;
			default: //목록
			location.href="memberSelectList.do";
		}
	</script>
</body>
</html>