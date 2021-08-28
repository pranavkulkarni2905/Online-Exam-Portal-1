package com.exam.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBconnection {
	public static Connection getConnection() {
		Connection con=null;
		try {
			//load drivers
			Class.forName("oracle.jdbc.OracleDriver");
			//connection to data Base

<<<<<<< HEAD
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","pranav2905");
=======
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","12345678");
>>>>>>> def01029b35ea2cbe06187c7138de03594fcd410

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}
}
