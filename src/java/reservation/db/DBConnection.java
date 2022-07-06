package reservation.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

	private static DBConnection dBConnection;
	private Connection conn;

	private DBConnection() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost/hotelspro", "root", "mysql");
	}

	public static DBConnection getDBConnection() throws ClassNotFoundException, SQLException {
		if (dBConnection == null) {
			dBConnection = new DBConnection();
		}
		return dBConnection;
	}

	public Connection getConnection() {
		return conn;
	}

}
