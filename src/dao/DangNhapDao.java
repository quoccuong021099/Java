package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import bean.DangNhapBean;

public class DangNhapDao {
	public static boolean checkLogin(String un, String pass) {
		boolean isValid = false;
		try { 
			//B1 ket noi
			Dungchung dc =new Dungchung();dc.KetNoi();
			//B2 thiet lap cau lenh
			String sql="select * from KhachHang where tendn=? and pass=?";
			//B3 laays du lieu
			PreparedStatement cmd = dc.cn.prepareStatement(sql);
			cmd.setString(1, un);
			cmd.setString(2, pass);
			
			ResultSet rs = cmd.executeQuery();
			
			if(rs.next()) {
				isValid = true;
			} else { 
				isValid = false;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return isValid;
	}
		
}
