package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class Dungchung {
	public Connection cn;
	public void KetNoi() throws Exception{
		//B1: Xác định HQTCSDL
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		//B2: Kết nối vào CSDL
		String url="jdbc:sqlserver://localhost:1433;databaseName=QlSach;user=sa; password=123;\r\n" + 
				"\r\n" + 
				"";
		cn = DriverManager.getConnection(url);
		System.out.print("Da ket noi");
	}
private final String dbName= "DangNhap";
}