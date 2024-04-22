package operations;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebServlet("/edit")
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	static Connection con;
	static final String updateQuery = "update innogentStudent set studentName = ?, studentAge = ?,studentGender = ?, email = ?, address = ? where studentid = ? ";

	public EditServlet() {
		super();
	}

	public void init(ServletConfig config) throws ServletException {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = java.sql.DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "mydb", "buddy");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void destroy() {
		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String studentId = request.getParameter("id");
		String studentName = request.getParameter("name");
		String studentAge = request.getParameter("age");
		String studentGender = request.getParameter("gender");
		String studentEmail = request.getParameter("email");
		String studentAddress = request.getParameter("address");
		try {
			PreparedStatement preparedStatement = con.prepareStatement(updateQuery);
			preparedStatement.setString(1, studentName);
			preparedStatement.setInt(2, Integer.parseInt(studentAge));
			preparedStatement.setString(3, studentGender);
			preparedStatement.setString(4, studentEmail);
			preparedStatement.setString(5, studentAddress);
			preparedStatement.setInt(6, Integer.parseInt(studentId));
			preparedStatement.execute();
		} catch (Exception e) {
			e.printStackTrace();
			String message = e.getMessage();
			request.setAttribute("errorMsg", message);
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
		response.sendRedirect("index.jsp");
	}
}
