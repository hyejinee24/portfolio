package db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBCon {
	public static Connection getConnection() throws Exception {
		Class.forName("org.mariadb.jdbc.Driver");
		String url = "jdbc:mariadb://localhost:3306/musicprogram";
		String uid = "root";
		String upw = "1234";
		Connection con = DriverManager.getConnection(url, uid, upw);
		
		return con;
	}
}
