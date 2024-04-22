package operations;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/add")
public class AddStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static Connection con;
	static final String insertQuery = "insert into innogentStudent values(sequence_1.nextval,?,?,?,?,?)";

	public void init(ServletConfig config) throws ServletException {
		ServletContext sc = config.getServletContext();
		String url = sc.getInitParameter("url");
		String username = sc.getInitParameter("username");
		String password = sc.getInitParameter("password");
		try {
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "mydb", "buddy");
			con = DriverManager.getConnection(url, username, password);
		} catch (SQLException e) {
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

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String studentName = request.getParameter("name");
		String studentAge = request.getParameter("age");
		String studentGender = request.getParameter("gender");
		String studentEmail = request.getParameter("email");
		String studentAddress = request.getParameter("address");
		try {
			PreparedStatement preparedStatement = con.prepareStatement(insertQuery);
			preparedStatement.setString(1, studentName);
			preparedStatement.setString(2, studentAge);
			preparedStatement.setString(3, studentGender);
			preparedStatement.setString(4, studentEmail);
			preparedStatement.setString(5, studentAddress);
			preparedStatement.execute();
			response.sendRedirect("index.jsp");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
