<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<title>join</title>
</head>
<body>
	<script type="text/javascript" src="check.js"> </script>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
	<h2 style="text-align:center;">오디션 등록</h2>
	<form method = "post" action="action.jsp" name="frm" style="display:flex; text-alalign-items: center; justify-content:center;">
		<input type="hidden" name="mode" value="insert" />
		<table border="1">
			<tr>
				<td>참가번호</td>
				<td><input type="text" name="id">*참가자번호는(AOOO)4자리 입니다</td>
			</tr>
			<tr>
				<td>참가자명</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><input type="number" name="yyyy">년<input type="number"name="mm">월<input type="number" name="dd">일</td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<input type="radio" name="sex" value="1">남
					<input type="radio" name="sex" value="2">여
				</td>
			</tr>
			<tr>
				<td>특기</td>
				<td>
					<select name="telant">
						<option value="1">특기 선택</option>
						<option value="2">춤</option>
						<option value="3">노래</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>소속사</td>
				<td><input type="text" name="com"></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;">
					<input type="button" onclick="return joinCheck()" value="오디션 등록">
					<input type="button" onclick="return res()" value="다시쓰기">
				</td>
			</tr>
		</table>
	</form>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>