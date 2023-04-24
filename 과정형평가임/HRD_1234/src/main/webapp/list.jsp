<%@page import="javax.security.auth.message.callback.PrivateKeyCallback.Request"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="db.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
		<form name="frm" style="position: fixed; justify-content: center; align-items: center;">
		<table border="1">
			<tr>
				<td>제품코드</td>
				<td>제품명</td>
				<td>사이즈</td>
				<td>매입단가</td>
				<td>중고단가</td>
			</tr>
				<%
					request.setCharacterEncoding("UTF-8");
					try{
						String sql="SELECT * FROM TBL_PRODUCT_202002";
						PreparedStatement pstmt = conn.prepareStatement(sql);
						ResultSet rs = pstmt.executeQuery(sql);
						while(rs.next()){
							%>
								<tr>
									<td><%=rs.getString(1) %></td>
									<td><%=rs.getString(2) %></td>
									<td><%=rs.getString(3) %></td>
									<td><%=rs.getString(4) %></td>
									<td><%=rs.getString(5) %></td>
								</tr>
							<%
						}	
					}catch(Exception e){
						e.printStackTrace();
					}
				%>
		</table>
	</form>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>