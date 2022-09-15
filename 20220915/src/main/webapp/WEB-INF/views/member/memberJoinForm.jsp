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
			<h1>멤버 추가</h1>
		</div>
		<div>
			<form id="frm" action="memberInsert.do" onsubmit="return formCheck()" method="post">
				<div>
					<table border="1">
						<tr>
							<th width="150px">아이디</th>
							<td width="280px">
								<input type="text" id="memberId" name="memberId" required="required" > &nbsp;
								<button type="button" id="btn" value="No" onclick="idCheck()">중복 확인</button>
							</td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td>
								<input type="password" id="memberPassword" name="memberPassword" required="required" placeholder="4자리 이상 입력">
							</td>
						</tr>
						<tr>
							<th>비밀번호 확인</th>
							<td>
								<input type="password" id="pwc" name="pwc" required="required">
							</td>
						</tr>
						<tr>
						<th>이 름</th>
							<td>
								<input type="text" id="memberName" name="memberName" required="required">
							</td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td>
								<input type="tel" id="memberTel" name="memberTel" placeholder="010-0000-0000">
							</td>
						</tr>
					</table>
				</div><br>
				<div>
					<input type="hidden" name="memberAuthor" value="USER">
					<input type="submit" value="등록" >&nbsp;&nbsp;
					<input type="reset" value="취소" >&nbsp;&nbsp;
					<input type="button" value="목록" onclick="location.href='memberSelectList.do'">
				</div>
			</form>
		</div>
	</div>
	<script>
	function formCheck(){
		let pass1 = document.getElementById('memberPassword').value;
		let pass2 = document.getElementById('pwc').value;
		let idChecked = document.getElementById('btn').value;
		
		if(idChecked == 'No'){
			alert("아이디 중복체크를 해주세요.")
			return false;
		}
		//frm.memberPassword.value로 해도 똑같은 표현식
		if(pass1 != pass2){
			alert("비밀번호가 일치하지 않습니다.");
			document.getElementById('memberPassword').value = "";
			document.getElementById('pwc').value = "";
			document.getElementById('memberPassword').focus();
			return false;
		}
		return true;
	}
	function idCheck(){ //ajax를 이용하여 id 중복체크를 해야함
		let id = document.getElementById('memberId').value;
		const xhttp = new XMLHttpRequest();
		xhttp.onload = function(){
			//성공했을때, 실패했을때
//			if(this.readyState == 4 && this.status == 200){
				if(this.responseText == '1');
				alert("사용 가능한 아이디 입니다.");
				document.getElementById('btn').value = "YES"; 
				document.getElementById('memberPassword').focus();
			}else{
				alert("중복된 아이디 입니다.")
				document.getElementById('memberId').value = "";
				document.getElementById('memberId').focus();
				
			}
		//}
		xhttp.open("GET", "ajaxMemberIdCheck.do?id="+id);
		xhttp.send();
		
	}
	</script>
</body>
</html>