package dbConnection.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import dbConnection.DatabaseTemplate;

public class OracleDatabaseImpl implements DatabaseTemplate{
	private static String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	private static String username = "mydb";
	private static String password = "buddy";
	private static OracleDatabaseImpl object = new OracleDatabaseImpl();
	
	private OracleDatabaseImpl() {}
	
	public static DatabaseTemplate getOracleDatabaseImpl() {
		return object;
	}

	@Override
	public Connection getConnection() throws Exception{
		Connection con = null;
		try {
			con = DriverManager.getConnection(url, username, password);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new SQLException(e);
		}
		return con;
	}

}
