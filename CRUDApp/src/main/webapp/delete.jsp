<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!Connection con;
	private static String deleteQuery = "delete from innogentStudent where studentid = ?";

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
		PreparedStatement pstmt = con.prepareStatement(deleteQuery);
		pstmt.setInt(1, Integer.parseInt(request.getParameter("Id")));
		ResultSet rs = pstmt.executeQuery();
	} catch (Exception e) {
		e.printStackTrace();
		String message = e.getMessage();
		request.setAttribute("errorMsg", message);
		request.getRequestDispatcher("error.jsp").forward(request, response);
	}
	response.sendRedirect("index.jsp");
	%>
</body>
</html>