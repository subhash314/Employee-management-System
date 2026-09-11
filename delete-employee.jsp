<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Employee</title>
</head>
<body style="background-image:url('https://www.shutterstock.com/image-vector/woman-standing-account-profile-trash-600nw-2480561075.jpg') ;">
<center>
<h1 style="background-color:red">EMPLOYEE MANAGEMENT SYSTEM </h1>
<hr>
<h2 style="background-color:lightblue"> Delete employee</h2>
<form action = "./delete-employee-controller.jsp">
<lable>Enter employee id:</lable>
<input type ="number" name ="employeeId">

<input type ="submit" value = "  Delete">
<h4><a href ="home.html"> click here </a> to go Home</h4>

</form>
</center>

</body>
</html>