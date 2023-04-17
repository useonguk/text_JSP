<%@include file="db.jsp"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>salary</title>
<link href="style.css" rel="stylesheet">
</head>
<body>
<jsp:include page="header.jsp"/>
<section> 
 <h2 style="text-align:center"><b>회원매출조회</b></h2><br>
 
 <form name="frm" style="display:flex; align-items: center; justify-content:center;
 text-align: center">
 <table border="1">
 
 <tr>
 	<td> 회원번호 </td>
 	<td> 회원성명 </td>
 	<td> 고객등급 </td>
 	<td> 매출 </td>
 </tr>
 
 <%
 String grade="";
 try
 {
	 String sql="SELECT me.custno, custname, grade, sum(price)" + // 별명을 지어주는것
	 			"FROM member_tbl_02 me, money_tbl_02 mo " +
	 			"WHERE me.custno = mo.custno " +
	 			"GROUP BY me.custno, custname, grade " +
	 			"ORDER BY sum(price) desc ";
	 PreparedStatement pstmt = conn.prepareStatement(sql);
	 ResultSet rs = pstmt.executeQuery(sql);
	 while(rs.next())
	 {
		 grade = rs.getString(3);
		 switch(grade)
		 {
		 case "A" :
			 grade="VIP";
			 break;
		 case "B" :
			 grade="일반";
			 break;
		 case "C" :
			 grade="직원";
			 break;
		 }
 %>
 <tr>
 	<td> <%=rs.getString(1) %> </td>
 	<td> <%=rs.getString(2) %> </td>
 	<td> <%=grade %> </td>
 	<td> <%=rs.getString(4) %> </td>
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