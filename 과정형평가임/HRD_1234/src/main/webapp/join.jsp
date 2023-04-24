<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="db.jsp" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
		<form name="frm">
			<input type="hidden" action="action">
			<table border="1">
			<%
				request.setCharacterEncoding("UTF-8");
				try{
					String sql = "SECECT MAX(t_no)+1 FROM tbl_inout_202002";
					PreparedStatement pstmt = conn.prepareStatement(sql);
					ResultSet rs = pstmt.executeQuery(sql);
					while(rs.next()){
					%>
					
					<%	
					}
				}catch(Exception e){
					e.printStackTrace();
				}
			%>
				<tr>
					<td>입출고번호<td>
					<td><input type="text" readonly></td>
				</tr>
				<tr>
					<td>제품코드<td>
					<td><input type="text" name="code"></td>
				</tr>
				<tr>
					<td>입출고구분<td>
					<td>
						<input type="radio"name="inout" value="in">입고
						<input type="radio"name="inout" value="out">출고
					</td>
				</tr>
				<tr>
					<td>수량<td>
					<td><input type="number" name="count"></td>
				</tr>
				<tr>
					<td>거래일자<td>
					<td><input type="date" name="date"></td>
				</tr>
				<tr>
					<td>거래처<td>
					<td>
						<select>
							<option value="1">거래처선택</option>
							<option value="2">서울</option>
							<option value="3">부산</option>
							<option value="4">울산</option>
							<option value="5">대전</option>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="1">
						<button name="insert" onclick="insert()">입출고등록</button>
						<button name="reword" onclick="reword()">다시쓰기</button>
					<td>
				</tr>
			</table>
		</form>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>