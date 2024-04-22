<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title>edit</title>
</head>
<body class=" col">
	<h1 class="text-center bg-info p-3">Edit Data</h1>
	<%!Connection con;
	static String name;
	static int age;
	static String gender;
	static String mail;
	static String address;
	/* Database conectivity inside jsp init */
	public void jspInit() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = java.sql.DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "mydb", "buddy");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}%>
	<!-- The below code goes into service method -->
	<%
	String id = request.getParameter("Id");
	if (id != null) {
		try {
			PreparedStatement pstmt = con.prepareStatement("select * from innogentStudent where studentid = ?");
			pstmt.setInt(1, Integer.parseInt(id));
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
		name = rs.getString(2);
		age = rs.getInt(3);
		gender = rs.getString(4);
		mail = rs.getString(5);
		address = rs.getString(6);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	%>
	<!--  form submit data will pass to EditServlet-->
	<div class="container">
		<div class="row justify-content-center mt-5">
			<!-- Center the row -->
			<div class="col-md-6">
				<h2 class="text-center">Student Profile</h2>
				<form action="edit" method="post">
					<input type="hidden" name="id" value="<%=id%>" />
					<div class="mb-3">
						<label for="name" class="form-label h5">Name</label> <input
							type="text" class="form-control" id="name" name="name"
							value="<%=name%>">
					</div>
					<div class="mb-3">
						<label for="age" class="form-label h5">Age</label> <input type="text"
							class="form-control" id="age" name="age" value="<%=age%>">
					</div>
					<div class="mb-3">
						<label for="gender" class="form-label h5">Gender</label> <input
							type="text" class="form-control" id="gender" name="gender"
							value="<%=gender%>">
					</div>
					<div class="mb-3">
						<label for="email" class="form-label h5">Email</label> <input
							type="email" class="form-control" id="email" name="email"
							value="<%=mail%>">
					</div>
					<div class="mb-3">
						<label for="address" class="form-label h5">Address</label> <input
							type="text" class="form-control" id="address" name="address"
							value="<%=address%>">
					</div>
					<button type="submit" class="btn btn-primary align-center m-2">Update</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>