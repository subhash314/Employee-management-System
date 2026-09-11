<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View All Employee</title>
</head>
<body style="background-image:url('https://images.ctfassets.net/pdf29us7flmy/6suGfD4ZEnpLgwOwBogOpp/7b70f6915742eaa260f52e09358377c9/qualities-of-a-good-employee-D1-Social.png') ;">
<center>
<h1>EMPLOYEE MANAGEMENT SYSTEM </h1>
<hr>
<h2> View All Employee</h2>
<%! private static final String VIEW_ALL_EMPLOYEE = "select * from employee"; %>
<%
try{ 
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ems","ems");
	PreparedStatement ps =con.prepareStatement(VIEW_ALL_EMPLOYEE);
	ResultSet rs=ps.executeQuery();%>
	  
	   <table border="1px" style="border-collapse: collapse;">
	   <tr>
	   <th>Employee_ID</th>
	   <th>Employee_Name</th>
	   <th>Employee_Gender</th>
	   <th>Employee_salary</th>
	   <th>Employee_Age</th>
	   </tr>
	  
	  
	  
	<% while(rs.next()) {%>
		
		<tr>
		<td><%=rs.getInt(1)%></td>
		<td><%=rs.getString(2)%></td>
		<td><%=rs.getString(3)%></td>
		<td><%=rs.getInt(4)%></td>
		<td><%=rs.getInt(5)%></td>
		
		
		
		</tr>
		
	<%}%>
	
	
	</table>
	
	<h4> <a href ="home.html">click here</a> to go Home</h4>
	
	
	
	<% 
}catch(Exception e){
	
	e.printStackTrace();
}









%>




</center>
</body>
</html>