<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>read</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body class="m-0">
	<h1 class="bg-success text-center p-3">Students Data</h1>
	<table class="table active table-bordered m-2 table-hover">
		<tr class="bg-secondary p-1">
			<th>Id</th>
			<th>Name</th>
			<th>Age</th>
			<th>Gender</th>
			<th>Email</th>
			<th>Address</th>
			<th></th>
			<th></th>
		</tr>
	<%!
	Connection con;
	private static String selectQuery = "select * from innogentStudent order by studentId ";
	public void jspInit() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = java.sql.DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "mydb", "buddy");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}%>
	<%
		try {
			PreparedStatement pstmt = con.prepareStatement(selectQuery);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				int id = rs.getInt(1);
	%>
		<tr class="p-1">
			<td><%=id%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getInt(3)%></td>
			<td><%=rs.getString(4)%></td>
			<td><%=rs.getString(5)%></td>
			<td><%=rs.getString(6)%></td>
			<td><a href="edit.jsp?Id=<%=rs.getInt(1)%>" class="btn btn-primary">Edit</a></td>
			<td><a href="delete.jsp?Id=<%=rs.getInt(1)%>" class="btn btn-danger">Delete</a></td>
		<%} 
		} catch (Exception e) {
			e.printStackTrace();
			String message = e.getMessage();
			request.setAttribute("errorMsg", message);
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}%>
	</table>
	<div class="row justify-content-center">
	<a href="register.html" class="btn btn-primary center">Add new student to the list.</a>
	</div>
</body>
</html>
<%!
public void jspDestroy() {
		try {
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
}%>