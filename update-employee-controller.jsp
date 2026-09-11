<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.net.ConnectException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Employee Controller</title>
</head>
<body>
<%! private static final String UPDATE_EMPLOYEE_QUERY="update employee set employee_name = ?, gender = ?, salary = ?, age = ? where employee_id = ?"; %>

<%
String val1=request.getParameter("employeeid");
int employeeID= Integer.parseInt(val1);

String empName =request.getParameter("EmployeeName");
String gender =request.getParameter("Gender");
String salary =request.getParameter("salary");
double d = Double.parseDouble(salary);
String age =request.getParameter("Age");
int empage = Integer.parseInt(age);
try{
	  Class.forName("oracle.jdbc.driver.OracleDriver");
	  Connection con =DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ems","ems");
	  PreparedStatement ps =con.prepareStatement(UPDATE_EMPLOYEE_QUERY);
	  ps.setString(1, empName );
	  ps.setString(2, gender );
	  ps.setDouble(3,d);
	  ps.setInt(4, empage);
	  ps.setInt(5,employeeID);
	  int a = ps.executeUpdate();
	  if(a>0){
			System.out.println("Employee upadated succesfully....");
			out.println("<center><font color = green><h1>Employee updated succesfully....</h1></font></center>");
			out.println("<center><font color = pink><a href='home.html'>click here</a> to go Home</font></center>");
			}
		else{
			System.out.println("Failed.Try again");
			out.println("<center><font color = red><h1>Failed.Try again</h1></font></center>");
			out.println("<center><font color = pink><a href='home.html'>click here</a> to go Home</font></center>");
		}
		con.close();	
}catch(Exception e){
	  e.printStackTrace();
}
%> 
</body>
</html>