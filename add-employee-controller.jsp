<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Employee Controller</title>
</head>
<body>
<%!  private static final String ADD_EMPLOYEE_QUERY= "insert into employee values( employee_sequence.nextval,?,?,?,?)"; %>
<%
 String val = request.getParameter("empname");
String val2 = request.getParameter("gender");
String val3 = request.getParameter("salary");
double d = Double.parseDouble(val3);
String val4 = request.getParameter("age");
int i =Integer.parseInt(val4);


try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ems","ems");
	PreparedStatement ps = con.prepareStatement(ADD_EMPLOYEE_QUERY);
	
	ps.setString(1,val);
	ps.setString(2,val2);
	ps.setDouble(3,d);
	ps.setInt(4,i);
	int a =ps.executeUpdate();
	if(a>0){
		System.out.println("Employee added succesfully....");
		out.println("<center><font color = green><h1>Employee added succesfully....</h1></font></center>");
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
	System.out.println("Failed.Try again");
	out.println("<center><font color = red><h1>Failed.Try again</h1></font></center>");
	out.println("<center><font color = pink><a href='home.html'>click here</a> to go Home</font></center>");
	
}





%>

</body>
</html>