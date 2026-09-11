<%@page import="java.sql.ResultSet"%>
<%@page import="java.awt.image.RescaleOp"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Employee Controller</title>
</head>
<body>
<%!private static final String GET_EMPLOYEE_BY_NAME="select * from employee where employee_name=?"; %>

<%   
String empName =request.getParameter("employeeName");
int empid = 0;
String empGender = "";
double empSalary =0.0;
int empage= 0;
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ems","ems");
	PreparedStatement ps = con.prepareStatement(GET_EMPLOYEE_BY_NAME);
	ps.setString(1,empName);
	ResultSet rs = ps.executeQuery();%>
	<center>
	<h1>EMPLOYEE MANAGEMENT SYSTEM </h1>
	<hr>
	<h2> Search Employee Result</h2>
	<% while (rs.next()){
		empid = rs.getInt(1);
		empName=rs.getString(2);
		empGender = rs.getString(3);
		empSalary = rs.getDouble(4);
		empage =rs.getInt(5);
		%>
		
		<fieldset style="width : 50%">
		<legand>
		<%=empName %>
		</legand>
		<h3 style="text-alin: left">Employe Id    :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=empid %></h3>
		<h3 style="text-alin: left">Employe Name  :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=empName %></h3>
		<h3 style="text-alin: left">Employe Gender:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=empGender %></h3>
		<h3 style="text-alin: left">Employe Salary:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=empSalary%></h3>
		<h3 style="text-alin: left">Employe Age   :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=empage %></h3>
		</fieldset>
<% }	
	
	con.close();
}catch(Exception e){
e.printStackTrace()	;
}
%>

<h4> <a href="home.html">Home</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="search-employee.jsp">Back</a></h4>
	</center>
</body>
</html>