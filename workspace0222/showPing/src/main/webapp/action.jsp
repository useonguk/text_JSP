<%@page import="java.sql.*"%>
<%@include file="db.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>action</title>
</head>
<body>

<%
request.setCharacterEncoding("UTF-8"); 
String mode = request.getParameter("mode");
String custno = request.getParameter("custno");
String custname = request.getParameter("custname");
String phone = request.getParameter("phone");
String address = request.getParameter("address");
String joindate = request.getParameter("joindate");
String grade = request.getParameter("grade");
String city = request.getParameter("city");
try
{
	String sql=" ";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	switch(mode)
	{
		case "insert":
			sql = String.format("insert into member_tbl_02 values('%s', '%s', '%s', '%s', TO_DATE('%s', 'yyyy-MM-dd'), '%s', '%s')"
					,custno, custname, phone, address, joindate, grade, city);
		    pstmt.executeUpdate(sql);
%>
				<jsp:forward page="list.jsp"></jsp:forward>
<% 
			
			break;
		case "modify":
			sql = String.format("update member_tbl_02 set custname='%s', phone='%s', address='%s', joindate=TO_DATE('%s', 'yyyy-MM-dd'), grade='%s', city='%s' where custno='%s' ",custname, phone, address, joindate, grade, city, custno);
		    pstmt.executeUpdate(sql);
%>
			    <jsp:forward page="modify.jsp"></jsp:forward>
<%
			    break;
	}
}
catch(Exception e)
{
	e.printStackTrace();
}
%>

</body>
</html>