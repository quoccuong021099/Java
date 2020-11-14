package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.loaibean;

public class loaidao {
	Dungchung dc = new Dungchung();
	public ArrayList<loaibean> getLoai() throws Exception
	{
		ArrayList<loaibean> ds = new ArrayList<loaibean>();
		/*
		 * ds .add(new loaibean("toan", "Toan")); ds .add(new loaibean("tin", "Tin"));
		 * ds .add(new loaibean("ly", "Ly"));
		 */
		//B1: ket noi
		dc.KetNoi();
		//B2: thiêìt lâòp câu lêònh sql
		String sql = "select * from loai ";
		//B3: lay du lieu ve
		PreparedStatement cmd = dc.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		//B4: duyet qua cac don vi
		while(rs.next()) {
			String maloai = rs.getString("maloai");
			String tenloai = rs.getString("tenloai");
			loaibean loai = new loaibean(maloai, tenloai);
			ds.add(loai);
		}
		rs.close();
		dc.cn.close();
		return ds; 
	}
}
