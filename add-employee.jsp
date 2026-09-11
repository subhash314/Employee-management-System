<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Employee</title>
</head>
<body style="background-image:url('https://blogimage.vantagecircle.com/content/images/2019/06/Employee-Engagement-Best-Practices.png') ;" >


<center>
<h1>EMPLOYEE MANAGEMENT SYSTEM </h1>
<hr>
<h2> Add employee</h2>
<form action = "./add-employee-controller.jsp">
<table>

<tr>
<td>
<lable>Enter employee name :</lable>
</td>
<td>
<input type ="text" name ="empname">
</td>
</tr>
<tr>
<td>
<lable>Enter Employee Gender:<lable>
</td>
<td>
<input type= "radio" name="gender" value="male">Male
<input type= "radio" name="gender" value="female">Female
</td>
</tr>
<tr>
<td>

<lable> Enter employee salary:</lable>
</td>
<td>
<input type ="number" name="salary">
</td>
</tr>
<tr>
<td>

<lable> Enter employee Age:</lable>
</td>
<td>
<input type ="number" name="age">
</td>
</tr>
<tr>
<td>
<input type ="submit" value ="save Employee">
</td>
<td>
<input type="reset" value ="clear">
</td>
</tr>
</table>

</form>


</center>



</body>
</html>