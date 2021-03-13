package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
public class ConnectionDb {
	private static final String url="jdbc:oracle:thin:@localhost:1521:xe";
	private static final String uname="system";
	private static final String password="system";
	public static Connection getConn(){
		Connection con=null;
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con=DriverManager.getConnection(url,uname,password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
}
