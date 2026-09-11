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
<title>Update employee</title>
</head>
<body>
<%! private static final String GET_EMPLOYEE_BY_QUERY="select *from employee where employee_id=?"; %> 
<%
String val1=request.getParameter("employeeid");
int employeeID= Integer.parseInt(val1);
String EmployeeName = "";
String Gender ="";
double salary = 0.0;
int Age = 0;


  try{
	  Class.forName("oracle.jdbc.driver.OracleDriver");
	  Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ems","ems");
	  PreparedStatement ps = con.prepareStatement(GET_EMPLOYEE_BY_QUERY);
	  ps.setInt(1,employeeID);
	  ResultSet rs=   ps.executeQuery();
	  if (rs.next()){
		  EmployeeName =rs.getString(2);
		  Gender =rs.getString(3);
		  salary =rs.getDouble(4);
		  Age=rs.getInt(5);
		   }
	  con.close();
}catch(Exception e){
	  e.printStackTrace();
  }
%>
<center>

<h1>EMPLOYEE MANAGEMENT SYSTEM </h1>
<hr>
<h2>  Update Employee </h2>
<form action="./update-employee-controller.jsp">
<table>
<tr>
<td>
<lable>EmployeeId:</lable>
</td>
<td><input type="text" disabled="disabled"  value =<%= employeeID %>>
<input type ="hidden" value="<%=employeeID %>" name ="employeeid"></td>
</tr>
<tr>
<td>
<lable>Employee name:</lable>
</td>
<td><input type="text"  name ="EmployeeName"  value =<%= EmployeeName %>></td>
</tr>
<tr>
<td>
<lable>Employee Gender:</lable>
</td>
<td><input type="text"  name ="Gender"  value =<%= Gender %>></td>
</tr>
<tr>
<td>
<lable>Employee Salary :</lable>
</td>
<td><input type="text"  name ="salary"  value =<%=salary %>></td>
</tr>
<tr>
<td>
<lable>Employee age:</lable>
</td>
<td><input type ="text" name ="Age" value =<%= Age  %>></td>
</tr>
<tr>

<td><input type="submit" value ="Employee update"></td>
<td><input type ="reset" value = "clear"></td>
</tr>
</table>
</form>
</center>
</body>
</html>