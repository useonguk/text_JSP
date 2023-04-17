<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="db.jsp" %>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
		<h2 style="text-align:center;">멘토 점수 조회</h2>
		<form style="display: flex; justify-content: center;align-items: center; text-align: center;">
		<table border="1">
			<tr>
				<td>채점번호</td>
				<td>참가번호</td>
				<td>참가자명</td>
				<td>생년월일</td>
				<td>점수</td>
				<td>평점</td>
				<td>멘토명</td>
			</tr>
			<%
				request.setCharacterEncoding("UTF-8");
				try{
					String sql = "SELECT serlal_no, art.artist_id, art.artist_name, art.birth, po.score, me.mento_name FROM tbl_artist_201905 art, tbl_point_201905 po, tbl_mento_201905 me WHERE po.artist_id = art.artist_id AND po.mento_id = me.mento_id";
					PreparedStatement pstst = conn.prepareStatement(sql);
					ResultSet rs = pstst.executeQuery(sql);
					while(rs.next()){
						String date = rs.getString(4);
						int score = rs.getInt(5);
						String grade = score >= 90?"A":score>=80?"B":score>=70?"C":score>=60?"D":"F";
			%>
				<tr>
					<td><%=rs.getString(1) %></td>
					<td><%=rs.getString(2) %></td>
					<td><%=rs.getString(3) %></td>
					<td><%=date.substring(0, 4)%>년<%=date.substring(4, 6)%>월<%=date.substring(6, 8)%>일</td>
					<td><%=rs.getString(5) %></td>
					<td><%=grade %></td>
					<td><%=rs.getString(6) %></td>
				</tr>
			<%
					}
					
				} catch(Exception e){
					e.printStackTrace();
				}
			%>
		</table>
		</form>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>