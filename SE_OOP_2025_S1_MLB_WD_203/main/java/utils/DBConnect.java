package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {

	public static Connection getConnection () throws ClassNotFoundException, SQLException {
		
		
		String username = "root";
		String password = "0505";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/creator_hub?characterEncoding = utf8",username,password) ; 
		
		
		return con ;
		
	}
	
}
