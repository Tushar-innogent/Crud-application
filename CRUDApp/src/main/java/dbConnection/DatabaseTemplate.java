package dbConnection;

import java.sql.Connection;

public interface DatabaseTemplate {

	Connection getConnection() throws Exception;
	
}
