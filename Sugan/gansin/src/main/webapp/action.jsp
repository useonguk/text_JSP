<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page  import="java.sql.*" %>
<%@include file="db.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>action</title>
</head>
<body>
	<% 
		request.setCharacterEncoding("UTF-8");
		String mode =request.getParameter("mode");
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String credit = request.getParameter("credit");
		String lecturer = request.getParameter("lecturer");
		String week = request.getParameter("week");
		String start_hour = request.getParameter("start_hour");
		String end_hour = request.getParameter("end_hour");
		try{
			String sql=" ";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			switch(mode)
			{
				case "insert":
					sql = String.format("insert into course_tbl values('%s', '%s', '%s', '%s', '%s', '%s', '%s')"
							,id,name,credit,lecturer,week,start_hour,end_hour);
				    pstmt.executeUpdate(sql);
		%>
						<jsp:forward page="list.jsp"></jsp:forward>
		<% 
					
					break;
			case "modify":
				sql = String.format("UPDATE course_tbl SET name='%s', credit='credit', lecturer='lecturer', week='week', start_hour='start_hour',end_hour='end_hour'");
				pstmt.executeUpdate(sql);
				%>
				<jsp:forward page="list.jsp" />
				<%
				sql = String.format("DELETE FROM course_tbl WHERE id='%s", id);
				pstmt.executeUpdate(sql);
				%>
					<jsp:forward page="list.jsp"></jsp:forward>
				<%
				break;
			case "delete":
				sql=String.format("DELETE FROM couse_tbl WHERE id='%s'",id);
				pstmt.executeUpdate(sql);%>
				<jsp:forward page="list.jsp" />
				<% 
				break;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	%>
</body>
</html>