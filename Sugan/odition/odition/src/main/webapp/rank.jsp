<%@page import="java.sql.PreparedStatement"%>
<%@include file="db.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
		<h2>오디션 참가 신ㅊ렁 등수</h2>
		<form style="display: flex;justify-content: center;text-align: center;align-items: center;">
			<table border="1">
				<tr>
					<td>참가번호</td>
					<td>참가자명</td>
					<td>총점</td>
					<td>평균</td>
					<td>점수</td>
				</tr>
				<%
				request.setCharacterEncoding("UTF-8");
				try{
					//String sql = "SELECT art.artist_name, sum(score), round(avg(score),2), rank() over (order by avgscore) desc) from tbl_artist_201905 art, tbl_point_201905 po WHERE art.artist_id = po.artist_id group by art.artist_id, artist_name order by avg(score) desc";
					String sql = "select a.artist_id, artist_name, sum(score), round(avg(score),2), rank() over (order by avg(score) desc) " +
		            "from tbl_artist_201905 a, tbl_point_201905 b " +
		            "where a.artist_id=b.artist_id "+
		            "group by a.artist_id, artist_name "+
		            "order by avg(score) desc";
					PreparedStatement pstmt = conn.prepareStatement(sql);
					ResultSet rs = pstmt.executeQuery(sql);
					while(rs.next()){
						String sr = rs.getString(4);
						if(!sr.contains(".")){
							sr = sr + ".00"; 
						}
					%>
					<tr>
						<td><%=rs.getString(1) %></td>
						<td><%=rs.getString(2) %></td>
						<td><%=rs.getString(3) %></td>
						<td><%=sr %></td>
						<td><%=rs.getString(5) %></td>
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