package co.micol.prj.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DataSource { //DAO Class
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String user = "test";
	private String password = "1234";
	public Connection conn;

	public DataSource() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
			System.out.println("연결 성공~");
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			System.out.println("연결 실패~~");
		}
	}
}
