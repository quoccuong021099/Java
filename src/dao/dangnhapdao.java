package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.dangnhapbean;

public class dangnhapdao {
	Dungchung dc = new Dungchung();
	public ArrayList<dangnhapbean> getSach() throws Exception
	{
		ArrayList<dangnhapbean> ds = new ArrayList<dangnhapbean>();
		dc.KetNoi();
		//B2: thiêìt lâòp câu lêònh sql
		String sql = "select * from DangNhap ";
		//B3: lay du lieu ve
		PreparedStatement cmd = dc.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		//B4: duyet qua cac don vi
		while(rs.next()) {
			String tendangnhap = rs.getString("TenDangNhap");
			String matkhau = rs.getString("MatKhau");
			boolean quyen = rs.getBoolean("Quyen");
			dangnhapbean dangnhap = new dangnhapbean(tendangnhap, matkhau, quyen);
			ds.add(dangnhap);
		}
		rs.close();
		dc.cn.close();
		return ds; 
	}
}
