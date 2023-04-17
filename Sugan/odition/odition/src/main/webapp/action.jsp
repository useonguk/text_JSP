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
String id = request.getParameter("id");
String name = request.getParameter("name");
String ybirth = request.getParameter("ybirth");
String mbirth = request.getParameter("mbirth");
String dbirth = request.getParameter("dbirth");
String gender = request.getParameter("gender");
String talent = request.getParameter("talent");
String agency = request.getParameter("agency");
try
{
	String sql = String.format("insert into tbl_artist_201905 values('%s', '%s', '%s', '%s', '%s', '%s')", id, name, ybirth+mbirth+dbirth, gender, talent, agency);
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery(sql);
}
catch(Exception e)
{
	e.printStackTrace();
}
%>
<jsp:include page="list.jsp"></jsp:include>
</body>
</html>