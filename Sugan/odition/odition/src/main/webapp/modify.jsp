<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@include file="db.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<h2>수정수저웃정수날머니;ㅏ어</h2>
	<form method="post" action="action.jsp">
		<input type="hidden" name="mode" value="modify">
		<table border="1">
		<%
			request.setCharacterEncoding("UTF-8");
				String mod = request.getParameter("mod_artist_id");
				String id = "";
				String name = "";
				Date date;
		%>
			<tr></tr>
		</table>
	</form>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>