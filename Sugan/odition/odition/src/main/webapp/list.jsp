<%@include file="db.jsp"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
<link href="style.css" rel="stylesheet">
</head>
<body>
<jsp:include page="header.jsp"/>
<section> 
 <h2 style="text-align:center"><b>참가자 목록 조회</b></h2><br>
 
 <form style="display:flex; align-items: center; justify-content:center; text-align: center">
<table border="1">

<tr>
	<td> 참가번호 </td>
	<td> 참가자명 </td>
	<td> 생년월일 </td>
	<td> 성별 </td>
	<td> 특기 </td>
	<td> 소속사 </td>
</tr>

<%
request.setCharacterEncoding("UTF-8");
 try
 {
	 String grade="";
	 String sql = 
	"SELECT * " +
	"FROM TBL_ARTIST_201905";
	 PreparedStatement pstmt = conn.prepareStatement(sql);
	 ResultSet rs = pstmt.executeQuery(sql);
	 while(rs.next())
	 {
	  String gender = rs.getString(4);
	  String talent = rs.getString(5);
	  switch(gender)
	  {
	  	case "F":
			  gender="여";
			  break;
	  	case "M":
			  gender="남";
			  break;
	  }
	  switch(talent)
	  {
	 	 case "1":
		  talent ="보컬";
		  break;
	 	 case "2":
			  talent ="댄스";
			  break;
	 	 case "3":
			  talent ="랩";
			  break;
	  }
	  String hour = rs.getString(3);
	  String birth = hour.substring(0,4) + "년" + hour.substring(4,6) + "월"+ hour.substring(6,8) + "일";
%>
	  <tr>
			<td> 
			<%=rs.getString(1) %>
			</td>
			<td> <%=rs.getString(2) %> </td>
			<td> <%=birth %> </td>
			<td> <%=gender %> </td>
			<td> <%=talent %> </td>
			<td> <%=rs.getString(6) %> </td>
	 </tr>
<% 
 	}
 }
 catch(Exception e)
 {
	 e.printStackTrace();
 }
%>

</table>

 </form>
</section>

<jsp:include page="footer.jsp"/>
</body>
</html>