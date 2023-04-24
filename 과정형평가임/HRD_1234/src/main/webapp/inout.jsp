<%@page import="javax.security.auth.message.callback.PrivateKeyCallback.Request"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="db.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>inout</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
	<h2 style="text-align: center;">입출고내역조회</h2>
		<table border="1">
			<tr>
				<td>입출고 번호</td>
				<td>제품코드</td>
				<td>제품명</td>
				<td>입출고 구분</td>
				<td>수량</td>
				<td>거래처</td>
				<td>거래일자</td>
			</tr>
			<%
				request.setCharacterEncoding("UTF-8");
				try{
					String sql = "SELECT t_no ,p_code ,p_name ,t_type ,t_cnt ,c_name ,t_date FROM tbl_inout_202002 natural join tbl_product_202002 natural join tbl_company_202002";
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
							<td><%=rs.getString(6) %></td>
							<td><%=rs.getString(7) %></td>
						</tr>
						<%
					}
				}catch(Exception e){
					e.printStackTrace();
				}
			%>
		</table>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>