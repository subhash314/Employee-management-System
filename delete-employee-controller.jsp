<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Employee</title>
</head>
<body>
<%! private static final String DELETE_EMPLOYEE_QUERY="delete employee where employee_id= ?"; %>
<% 
String val =request.getParameter("employeeId");
int a = Integer.parseInt(val);

try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ems","ems");
	PreparedStatement ps = con.prepareStatement(DELETE_EMPLOYEE_QUERY);
	ps.setInt(1,a );
	int i = ps.executeUpdate();
	if(i >0){
		System.out.println("Deleted successfully......");
		out.println("<center><font color = green><h1>Deleted sucessfully....</h1></font></center>");
		
	}else{
		System.out.println("Failed.Try again.....");
		out.println("<center><font color = green><h1>...</h1></font></center>");
		
	}
	
}catch(Exception e){
	e.printStackTrace();
	System.out.println("Failed.Try again.....");
	out.println("<center><font color = green><h1>...</h1></font></center>");
	
}




%>

</body>
</html>